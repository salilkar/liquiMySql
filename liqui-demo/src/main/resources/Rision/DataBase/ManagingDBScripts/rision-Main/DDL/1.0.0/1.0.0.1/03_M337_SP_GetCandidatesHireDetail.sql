
DROP PROCEDURE IF EXISTS `GetCandidatesHireDetail`;
DELIMITER |
CREATE PROCEDURE `GetCandidatesHireDetail`(
 in  businessSite_Id bigint(20)
,in  department_Id bigint(20)
,in  subClassification_Id bigint(20)
,in  language_Id bigint(20)
,in  start_Date date
,in  end_Date date
,in  manager_Id bigint(20)
)
BEGIN
/*
 Author: James
 Date  : 18/06/2015
 Description : Get candidates for Hire Details for Roster
*/ 

select GetWeekStartDate(start_Date,manager_Id) into @week_StartDate;
set @week_EndDate=DATE_ADD(@week_StartDate, INTERVAL 6 DAY);

SELECT DISTINCT crd.candidateId   
        ,jp.jobClassificationId
        ,jcl.jobClassification
        ,jp.jobSubClassificationId
        ,jsl.jobSubClassification
        ,jp.employmentTypeId
        ,etl.employmentType
        ,crd.empStartDate
        ,crd.empEndDate
        ,jp.awardId
		,al.awardName
		,jp.gradeLevelId
		,gl.gradeLevel 
		,hrc.agreedHours 
        ,cd.dob
        ,scu.encryptionKey
        ,ROUND(GetCandidateTotalExperience(crd.candidateId),1) AS seniority  
        ,cd.studentTypeId
        ,stl.studentType
        ,hrc.hireRequestCandidateId
        ,coalesce(elevenHourShiftCountForWeek,0) as elevenHourShiftCountForWeek
FROM vwCandidateRosterDetails crd
INNER JOIN scUser scu ON crd.candidateId=scu.userId AND scu.isDeleted=0 
INNER JOIN jobProfile jp ON crd.jobProfileId=jp.jobProfileId 
inner join businessSite bs on bs.businessSiteId=crd.businessSiteId and bs.isDeleted=0
inner join hireRequestCandidate hrc on hrc.jobProfileHireRequestId=crd.jobProfileHireRequestId and hrc.candidateUserId=crd.candidateId and hrc.isDeleted=0
-- left join hireRequestCandidateAllowance hra on hra.hireRequestCandidateId=hrc.hireRequestCandidateId and hra.isDeleted=0
-- left join allowanceLocale awl on hra.allowanceId=awl.allowanceId and awl.languageId=language_Id
left join jobClassificationLocale jcl on jcl.jobClassificationId=jp.jobClassificationId and jcl.languageId=language_Id 
left join jobSubClassificationLocale jsl on jsl.jobSubClassificationId=jp.jobSubClassificationId and jsl.languageId=language_Id
LEFT JOIN employmentTypeLocale etl ON jp.employmentTypeId=etl.employmentTypeId AND etl.languageId=language_Id 
left join awardLocale al on jp.awardId=al.awardId and al.languageId =language_Id
left join gradeLevelLocale gl on jp.gradeLevelId=gl.gradeLevelId and gl.languageId=language_Id
left join candidateDetail cd on cd.candidateUserId=crd.candidateId 
left join studentTypeLocale stl on stl.studentTypeId=cd.studentTypeId and stl.languageId=language_Id
left join (
		select candidateId,count(1) as elevenHourShiftCountForWeek from (
				select shiftOfferId,so.candidateId
				FROM candidateShiftOffer so  
				inner join vwCandidateRosterDetails crd on so.candidateId=crd.candidateId
				where crd.businessSiteId=businessSite_Id
				and crd.departmentId=department_Id  and crd.jobSubClassificationId=coalesce(subClassification_Id,crd.jobSubClassificationId)
				and ((crd.empStartDate <= start_Date and crd.empEndDate>=start_Date ) or (crd.empStartDate <= end_Date and crd.empEndDate>=end_Date )) 
				and (date(shiftStartDateTime) >= date(@week_StartDate)
				and date(shiftStartDateTime) <= date(@week_EndDate)) and so.isDeleted=0
				and STATUS IN (1,2,3,4,5,7,8,9,14,15,16,17,20,21,22,24,25,26,27,28,29,30,31,32,46,48,60,61,62,63)
				and HOUR(TIMEDIFF(shiftEndDateTime,shiftStartDateTime)) >=11
			union 
				select cg.shiftOfferId,cg.candidateId
				FROM candidateShiftOffer so 
				inner join candidateGiveAwayRequests cg on so.shiftOfferId=cg.shiftOfferId and cg.status in(1,48,49,39,11,60,61,62,63)
				and so.isDeleted=0 
				inner join vwCandidateRosterDetails crd on cg.candidateId=crd.candidateId
				where crd.businessSiteId=businessSite_Id
				and crd.departmentId=department_Id  and crd.jobSubClassificationId=coalesce(subClassification_Id,crd.jobSubClassificationId)
				and ((crd.empStartDate <= start_Date and crd.empEndDate>=start_Date ) or (crd.empStartDate <= end_Date and crd.empEndDate>=end_Date )) 
				and (date(so.shiftStartDateTime) >= date(@week_StartDate)
				and date(so.shiftStartDateTime) <= date(@week_EndDate))  
				and HOUR(TIMEDIFF(shiftEndDateTime,shiftStartDateTime)) >=11 
		)a  group by candidateId ) shc
on crd.candidateId=shc.candidateId
WHERE  crd.businessSiteId=businessSite_Id
	  AND crd.departmentId=department_Id  AND crd.jobSubClassificationId=coalesce(subClassification_Id,crd.jobSubClassificationId)
	  AND ((crd.empStartDate <= start_Date and crd.empEndDate>=start_Date ) or (crd.empStartDate <= end_Date and crd.empEndDate>=end_Date ))
      ;
END