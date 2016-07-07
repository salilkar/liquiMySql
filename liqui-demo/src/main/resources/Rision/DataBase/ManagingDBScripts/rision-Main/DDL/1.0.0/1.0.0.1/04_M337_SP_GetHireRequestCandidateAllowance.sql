DROP PROCEDURE IF EXISTS `GetHireRequestCandidateAllowance`;
DELIMITER |
CREATE PROCEDURE `GetHireRequestCandidateAllowance`(
in  hireRequest_CandidateId  varchar(5000)
,in language_Id bigint(20)
)
BEGIN
/*
 Author: James
 Date  : 23/05/2016
 Description :  Get hire Request candidate Allowance  
 call est_skillsconnect_dev.GetHireRequestCandidateAllowance('2966', 264);

*/ 
select   hrca.hireRequestCandidateId
		,hrca.allowanceId
		,al.allowanceName 
        ,hrc.candidateUserId
from hireRequestCandidateAllowance hrca
inner join hireRequestCandidate hrc on hrc.hireRequestCandidateId=hrca.hireRequestCandidateId and hrc.isDeleted=0
left join allowanceLocale al on al.allowanceId=hrca.allowanceId and al.languageId=language_Id
where find_in_set(hrca.hireRequestCandidateId,hireRequest_CandidateId)
;


END