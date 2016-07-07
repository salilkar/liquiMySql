CREATE FUNCTION `CheckCandidateAvailability`(candidate_Id BIGINT(20), shift_offerId BIGINT(20), shift_StartDateTime datetime, shift_EndDateTime datetime) RETURNS bit(1)
BEGIN
/*
 Author: Raghu
 Date  : 18/06/2015
 Description : Check if candidate has any shifts or declared unvailable for the given start and end time  
*/
    DECLARE isAvailable BIT;
    DECLARE iCount INT;
    
    SET isAvailable=1;
    
    SELECT COUNT(candidateId) INTO iCount FROM (
    SELECT candidateId
    FROM candidateShiftOffer
    WHERE shiftOfferId<>shift_offerId AND candidateId=candidate_Id AND shiftEndDateTime>shift_StartDateTime AND shiftStartDateTime<shift_EndDateTime AND STATUS NOT IN (3,10,19,33,36) AND isDeleted=0 -- and status<>1;
    UNION
    SELECT cg.candidateId
    FROM candidateGiveAwayRequests cg
    INNER JOIN candidateShiftOffer so ON cg.shiftOfferId=so.shiftOfferId
    WHERE cg.shiftOfferId<>shift_offerId AND cg.candidateId=candidate_Id AND so.shiftEndDateTime>shift_StartDateTime AND so.shiftStartDateTime<shift_EndDateTime AND so.status NOT IN (3,10,19,33,36) AND cg.status NOT IN (3,6,12,42,41,18,39,21,47) AND so.isDeleted=0
    ) AS t1;
    
    IF iCount>0 THEN 
	SET isAvailable=0;
    ELSE
	SELECT COUNT(candidateId) INTO iCount 
	FROM candidateUnavailability
	WHERE candidateId=candidate_Id AND CONCAT(unavailableDate,' ',endTime)>shift_StartDateTime AND CONCAT(unavailableDate,' ',startTime)<shift_EndDateTime AND isDeleted=0;
	
	IF iCount>0 THEN 
		SET isAvailable=0;
	END IF;
    END IF;
    
    RETURN isAvailable;
END