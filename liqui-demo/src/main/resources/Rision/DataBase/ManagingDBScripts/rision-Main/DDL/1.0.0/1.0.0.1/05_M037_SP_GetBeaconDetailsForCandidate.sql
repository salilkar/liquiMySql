DROP PROCEDURE IF EXISTS `GetBeaconDetailsForCandidate`;
DELIMITER |
CREATE  PROCEDURE `GetBeaconDetailsForCandidate`(
 in candidate_UserId bigint(20)
,in start_Date date
,in end_Date  date
)
BEGIN

/*
 Author: James
 Date  : 08/06/2016
 Description : Get Beacon details for candidate 
 call est_skillsconnect_dev.GetBeaconDetailsForCandidate(2242, '2016-06-10', '2016-06-20');
*/

	select 
		 b.beaconId
		,so.businessSiteId
		,so.departmentId
		,so.subClassificationId 
		,b.UUID
		,b.beaconName
		,b.major
		,b.minor
		,b.isEnabled
		,b.isRegistered
		,beas.proximityOfTouchPoint
		,beas.isEnabledBeaconGPS
		,beas.resetGPSPosition
		,beas.isEnabledStaffGPS
		,beas.staffGPSCheckPoints
		,beas.isAutoClockOffStaff
		,beas.isTimeSheetApprovalRequired
		,beas.isAllowEarlyStart
		,beas.allowMinTimeBeforeShiftStart
		,beas.allowMaxTimeBeforeShiftStart
		,beas.isAllowLateStart
		,beas.allowMinTimeAfterShiftStart
		,beas.allowMaxTimeAfterShiftStart
	from (
			select distinct  businessSiteId,departmentId,subClassificationId from candidateShiftOffer 
			where candidateId=candidate_UserId and isDeleted=0 and date(shiftStartDateTime) between start_Date and end_Date and status NOT IN (10,19,33,36)
			union 
			select distinct  businessSiteId,departmentId,subClassificationId from candidateShiftOffer so inner join candidateGiveAwayRequests cg 
			on so.shiftOfferId=cg.shiftOfferId and so.isDeleted=0
			where cg.candidateId=candidate_UserId and date(shiftStartDateTime) between start_Date and end_Date and so.status NOT IN (10,19,33,36)
	)so inner join businessSite bs on so.businessSiteId=bs.businessSiteId and bs.isDeleted=0
	inner join beacon b on b.businessId=bs.businessId and b.isDeleted=0
	inner join beaconBusinessSite bbs on bbs.beaconId=b.beaconId and  so.businessSiteId=coalesce(bbs.businessSiteId ,so.businessSiteId)
	inner join beaconDepartment bd  on bbs.beaconId=bd.beaconId and so.departmentId=coalesce(bd.departmentId ,so.departmentId)
	inner join beaconSubClassification bsc on bsc.beaconId=bd.beaconId and so.subClassificationId=coalesce(bsc.subClassificationId,so.subClassificationId)
	inner join beaconSettings beas on beas.beaconId=b.beaconId
    where b.isRegistered=1 and b.isEnabled=1
	order by b.beaconId
	;

END