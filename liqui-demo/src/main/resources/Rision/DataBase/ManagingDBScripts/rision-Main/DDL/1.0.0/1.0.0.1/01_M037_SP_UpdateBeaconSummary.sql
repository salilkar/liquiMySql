DROP PROCEDURE IF EXISTS `UpdateBeaconSummary`;
DELIMITER |
CREATE  PROCEDURE `UpdateBeaconSummary`(
 IN beacon_Id BIGINT(20)
, IN GPSLocationDisparity_Count BIGINT(20)
, IN clockOn_Count  BIGINT(20)
, IN manualSubmittedTimesheet_Count BIGINT(20)
, IN reset_Count BIT(1)
, IN shiftOffer_Id BIGINT(20)
, IN user_Id BIGINT(20)

)
BEGIN

/*
 Author: Sravanthi M
 Date  : 16/05/2016
 Description : Insert Update Beacon Summary
 call est_skillsconnect_dev.UpdateBeaconSummary(6, 1, 0, 0, 0, 0, 136);
*/
	DECLARE status_value bit(1);
    SET status_value = 0;
    SET SQL_SAFE_UPDATES = 0;
    SET GPSLocationDisparity_Count = coalesce(GPSLocationDisparity_Count,0);
    SET clockOn_Count = coalesce(clockOn_Count,0);
    SET manualSubmittedTimesheet_Count = coalesce(manualSubmittedTimesheet_Count,0);
    
    IF reset_Count = 0 THEN
		IF coalesce(beacon_Id,0)<>0 THEN
				
			UPDATE beaconSummary SET GPSLocationDisparityCount = GPSLocationDisparityCount + GPSLocationDisparity_Count,
				clockOnCount = clockOnCount + clockOn_Count,
				manualSubmittedTimesheets = manualSubmittedTimesheets + manualSubmittedTimesheet_Count,
				updatedBy = user_Id,
				updatedOn = utc_timestamp()
				WHERE beaconId = beacon_Id;
                
			IF ROW_COUNT() > 0 THEN
				set status_value = 1;
			END IF;
        
		ELSEIF coalesce(shiftOffer_Id,0)<>0 THEN

				UPDATE  candidateShiftOffer  so  
					inner join businessSite bs on bs.businessSiteId=so.businessSiteId and bs.isDeleted=0
					inner join beacon b on b.businessId=bs.businessId
					inner join beaconBusinessSite bbs on bbs.beaconId=b.beaconId and coalesce(bbs.businessSiteId,bs.businessSiteId)=bs.businessSiteId
					inner join beaconDepartment bd on bd.beaconId=b.beaconId and coalesce(bd.departmentId,so.departmentId)
					inner join beaconSubClassification bsc on bsc.beaconId=b.beaconId and coalesce(bsc.subClassificationId,so.subClassificationId)
					inner join beaconSummary bss ON bss.beaconId=b.beaconId
					SET bss.GPSLocationDisparityCount=bss.GPSLocationDisparityCount + GPSLocationDisparity_Count
						,bss.clockOnCount=bss.clockOnCount + clockOn_Count
						,bss.manualSubmittedTimesheets = bss.manualSubmittedTimesheets + manualSubmittedTimesheet_Count
						,bss.updatedBy = user_Id
						,bss.updatedOn = utc_timestamp()
				where shiftOfferId=shiftOffer_Id  ;
			
            IF ROW_COUNT() > 0 THEN
				set status_value = 1;
			END IF;
                
		END IF;
        
	ELSE
		IF EXISTS (SELECT 1 FROM beaconSummary WHERE beaconId = beacon_Id) THEN
        
			UPDATE beaconSummary SET GPSLocationDisparityCount = 0,
				clockOnCount = 0,
				manualSubmittedTimesheets = 0,
				updatedBy = user_Id,
				updatedOn = utc_timestamp()
				WHERE beaconId = beacon_Id;
                
			IF ROW_COUNT() > 0 THEN
				set status_value = 1;
			END IF;
            
		END IF;
	END IF;
    select status_value ; 
 
    SET SQL_SAFE_UPDATES=1;
END