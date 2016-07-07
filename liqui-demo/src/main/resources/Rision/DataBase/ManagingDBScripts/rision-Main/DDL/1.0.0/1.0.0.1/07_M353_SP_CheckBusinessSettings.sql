DROP PROCEDURE IF EXISTS `CheckBusinessSettings`;
DELIMITER |
CREATE DEFINER=`sc.root`@`%` PROCEDURE `CheckBusinessSettings`(
in jobProfile_Id bigint(20)
)
BEGIN
/*
 Author			: James
 Date  			: 24/06/2016
 Description 	: To get the list of business settings are not available for specific job profile
 call CheckBusinessSettings(1085);

*/
 

select jpbs.businessSiteId,jp.departmentId  from jobProfile jp
inner join jobProfileBusinessSite jpbs on jp.jobProfileId=jpbs.jobProfileId and jp.isDeleted=0 and jpbs.isDeleted=0
left join businessSettings bs on bs.businessSiteId=jpbs.businessSiteId and bs.departmentId=jp.departmentId  
where jp.jobProfileId=jobProfile_Id and bs.businessSiteId is null ;

END