CREATE PROCEDURE `ActivateDeactivateBusinessFeatures`(
)
BEGIN

/*
 Author			: Tijo
 Date  			: 29/04/2015
 Description 	: Activating and Deactivating Business Features like Job Profile, Hire Request
				  Server will run schecduler which will call this service every half hour.
*/
	 SET SQL_SAFE_UPDATES = 0;
    
    /* ACTIVATING JOB PROFIE */
	update  jobProfileBusinessSite jpbs   
	inner join jobProfile jp  
	on jpbs.jobProfileId=jp.jobProfileId
	inner join businessSite bs on bs.businessSiteId=jpbs.businessSiteId
	left join timeZone tz on bs.timeZoneId=tz.timeZoneId 
	set jpbs.status = 2  , isProvisional =0
	where isProvisional =1 
    and DATEDIFF(DATE_ADD(utc_timestamp(),INTERVAL coalesce(tz.timeDiffInMinutes,0) minute), activeDate) =0 
	and status =1;
    
    
    /* DEACTIVATING JOB PROFIE */
    update  jobProfileBusinessSite jpbs   
    inner join jobProfile jp  on jpbs.jobProfileId=jp.jobProfileId
	inner join businessSite bs on bs.businessSiteId=jpbs.businessSiteId
	left join timeZone tz on bs.timeZoneId=tz.timeZoneId 
	set jpbs.status = 1   
	where isProvisional =0 
    and DATEDIFF(DATE_ADD(DATE_ADD(utc_timestamp(),INTERVAL -1 Day),INTERVAL coalesce(tz.timeDiffInMinutes,0) minute), expiryDate) =0 and status =2;
    
    /* EXPIRE HIRE REQUEST */
    update jobProfileHireRequest jphr inner join hireRequestDetail hrd 
	on jphr.jobProfileHireRequestId=hrd.jobProfileHireRequestId
	inner join jobProfileBusinessSite jpbs on jpbs.jobProfileBusinessSiteId=jphr.jobProfileBusinessSiteId
	inner join businessSite bs on bs.businessSiteId=jpbs.businessSiteId
	left join timeZone tz on bs.timeZoneId=tz.timeZoneId 
	set jphr.status=7
	where datediff(hrd.empEndDate,DATE_ADD(DATE_ADD(utc_timestamp(),INTERVAL -1 Day),INTERVAL coalesce(tz.timeDiffInMinutes,0) minute)) <=0 and jphr.status<>7;


	SET SQL_SAFE_UPDATES = 1;
END