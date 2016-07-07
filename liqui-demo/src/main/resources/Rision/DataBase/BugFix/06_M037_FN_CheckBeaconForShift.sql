DROP FUNCTION IF EXISTS `CheckBeaconForShift`;
DELIMITER |
CREATE  FUNCTION `CheckBeaconForShift`(
shift_offerId BIGINT(20)
) RETURNS bit(1)
BEGIN

declare beaconExists bit(1);

set beaconExists=0;

if exists(
		select b.beaconId from candidateShiftOffer so 
		inner join businessSite bs on so.businessSiteId=bs.businessSiteId
		inner join beacon b on b.businessId=bs.businessId and b.isDeleted=0
		inner join beaconBusinessSite bbs on bbs.beaconId=b.beaconId and so.businessSiteId=coalesce(bbs.businessSiteId,so.businessSiteId)
		inner join beaconDepartment bbd on bbd.beaconId=b.beaconId and so.departmentId=coalesce(bbd.departmentId,so.departmentId)
		inner join beaconSubClassification bsc on bsc.beaconId=b.beaconId and so.subClassificationId=coalesce(bsc.subClassificationId,so.subClassificationId)
		where so.shiftOfferId=shift_offerId and isEnabled=1 and isRegistered=1
        limit 1) then
        
        set beaconExists=1;
else 
		set beaconExists=0;
end if;

RETURN beaconExists;
END