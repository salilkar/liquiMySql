
DROP PROCEDURE IF EXISTS `GetRosterLocation`;
DELIMITER |
CREATE PROCEDURE `GetRosterLocation`(
IN manager_Id bigint
,in language_Id bigint 
, in time_stamp datetime
)
BEGIN
/*
 Author: James
 Date  : 23/01/2016
 Description : Get Roster location & department
 */ 

select distinct
bs.businessSiteId
,bs.siteName
,bs.timeZoneName
,bs.timeOffset
,bd.departmentId
,bd.departmentName
,jobSubClassificationId
,jobSubClassification
,jobClassificationId
,jobClassification
 ,countryId,countryName,stateId,stateName
 ,awardId,awardName
 from (
	SELECT DISTINCT bs.businessSiteId,bs.siteName,tzl.timeZoneName,tz.timeDiffInMinutes  AS timeOffset 
    ,case when (ucs.createdOn>time_stamp or coalesce(cbs.updatedOn,cbs.createdOn)>time_stamp or coalesce(bs.updatedOn,bs.createdOn)>time_stamp ) then 1 else 0 end isWithinTime
     ,bs.countryId,cl.countryName,bs.stateId,sl.stateName
    FROM userRole ucs 
	INNER JOIN userRoleBusinessSite cbs ON cbs.userRoleId = ucs.userRoleId AND ucs.RoleCategoryId = 3 AND cbs.isDeleted =0
	INNER JOIN businessSite bs ON bs.businessSiteId = cbs.businessSiteId  
	INNER JOIN timeZone tz ON bs.timeZoneId = tz.timeZoneId
	INNER JOIN timeZoneLocale tzl ON tzl.timeZoneId = tz.timeZoneId AND tzl.languageId=language_Id
    left join countryLocale cl on cl.countryId=bs.countryId and cl.languageId=language_Id
	left join stateLocale sl on sl.stateId=bs.stateId and sl.languageId=language_Id
	WHERE ucs.userId = manager_Id AND ucs.RoleCategoryId = 3  AND ucs.isDeleted = 0 AND cbs.isDeleted = 0 AND bs.isDeleted =0 
)bs left join ( 
	SELECT DISTINCT bd.departmentId,bd.departmentName,cbs.businessSiteId,jcl.jobSubClassificationId,jcl.jobSubClassification
     ,case when (coalesce(jp.updatedOn ,jp.createdOn)>time_stamp or coalesce(bd.updatedOn,bd.createdOn)>time_stamp)  then 1 else 0 end as isWithinTime
     ,jp.jobClassificationId
     ,jl.jobClassification
     ,jp.awardId,al.awardName
    FROM userRole ucs 
	INNER JOIN userRoleBusinessSite cbs ON cbs.userRoleId = ucs.userRoleId
	INNER JOIN jobProfileBusinessSite jpbs ON cbs.businessSiteId=jpbs.businessSiteId
	INNER JOIN jobProfile jp ON jpbs.jobProfileId=jp.jobProfileId
	INNER JOIN businessDepartment bd ON jp.departmentId=bd.departmentId 
	inner join jobSubClassificationLocale jcl on jp.jobSubClassificationId=jcl.jobSubClassificationId and jcl.languageId=language_Id
    inner join jobClassificationLocale jl on jp.jobClassificationId=jl.jobClassificationId and jl.languageId=language_Id
	left join awardLocale al on al.awardId=jp.awardId and al.languageId=language_Id
    WHERE ucs.userId = manager_Id AND ucs.RoleCategoryId = 3 AND ucs.isDeleted = 0 AND cbs.isDeleted = 0  and  jpbs.isDeleted = 0   and jp.isDeleted=0 and bd.isDeleted=0 
)bd on bs.businessSiteId=bd.businessSiteId
where (bs.isWithinTime =1 or bd.isWithinTime=1)
order by ltrim(siteName), ltrim(departmentName),ltrim(jobSubClassification); 

  -- Business Site Delete or User Role change
select bs.businessSiteId  FROM userRole ucs 
INNER JOIN userRoleBusinessSite cbs ON cbs.userRoleId = ucs.userRoleId AND ucs.RoleCategoryId = 3 AND cbs.isDeleted =0
INNER JOIN businessSite bs ON bs.businessSiteId = cbs.businessSiteId 
where ucs.userId = manager_Id AND ucs.RoleCategoryId = 3 
and  (ucs.createdOn>time_stamp or coalesce(cbs.updatedOn,cbs.createdOn)>time_stamp or coalesce(bs.updatedOn,bs.createdOn)>time_stamp )
and (bs.isDeleted=1 or cbs.isDeleted=1 or ucs.isDeleted=1 ) ;

/* Job Profile Delete for offline sync (when 2 or more job profile with same location, dept & subclassification 
then  one of jobprofile is  deleted and remaining not deleted then we are not showing as deleted  )*/

select a.businessSiteId,a.departmentId,a.jobSubClassificationId  from (
	select distinct  jpbs.businessSiteId,jp.departmentId,jp.jobSubClassificationId   FROM userRole ucs 
	INNER JOIN userRoleBusinessSite cbs ON cbs.userRoleId = ucs.userRoleId
	INNER JOIN jobProfileBusinessSite jpbs ON cbs.businessSiteId=jpbs.businessSiteId
	INNER JOIN jobProfile jp ON jpbs.jobProfileId=jp.jobProfileId
	where ucs.userId = manager_Id AND ucs.RoleCategoryId = 3 
	and  ( coalesce(jpbs.updatedOn,jpbs.createdOn)>time_stamp or coalesce(jp.updatedOn,jp.createdOn)>time_stamp )
	and (jpbs.isDeleted=1 or jp.isDeleted=1 ) 
)a left join (
	select distinct  jpbs.businessSiteId,jp.departmentId,jp.jobSubClassificationId   FROM userRole ucs 
	INNER JOIN userRoleBusinessSite cbs ON cbs.userRoleId = ucs.userRoleId
	INNER JOIN jobProfileBusinessSite jpbs ON cbs.businessSiteId=jpbs.businessSiteId
	INNER JOIN jobProfile jp ON jpbs.jobProfileId=jp.jobProfileId
	where ucs.userId = manager_Id AND ucs.RoleCategoryId = 3 AND ucs.isDeleted = 0 
    AND cbs.isDeleted = 0  and  jpbs.isDeleted = 0   and jp.isDeleted=0 
    )b on a.businessSiteId=b.businessSiteId and a.departmentId=b.departmentId and a.jobSubClassificationId=b.jobSubClassificationId
where b.businessSiteId is null 
; 

END