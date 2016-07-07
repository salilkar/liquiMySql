SET FOREIGN_KEY_CHECKS=0;

ALTER TABLE `businessShiftTemplate` MODIFY COLUMN `departmentId`  bigint(20) NOT NULL AFTER `businessSiteId`;

ALTER TABLE `businessShiftTemplate` MODIFY COLUMN `subClassificationId`  int(11) NOT NULL AFTER `departmentId`;

ALTER TABLE `businessShiftTemplate` ADD COLUMN `weekDayId`  tinyint(4) NOT NULL AFTER `subClassificationId`;

ALTER TABLE `businessShiftTemplate` MODIFY COLUMN `weekDayName`  varchar(20) NOT NULL ;

ALTER TABLE `businessShiftTemplate` MODIFY COLUMN `shiftStartTime`  time NOT NULL AFTER `weekDayName`;

ALTER TABLE `businessShiftTemplate` MODIFY COLUMN `shiftEndTime`  time NOT NULL AFTER `shiftStartTime`;

ALTER TABLE `businessShiftTemplate` ADD COLUMN `isFlexibleShiftTime`  bit(1) NOT NULL DEFAULT b'0' AFTER `shiftEndTime`;

ALTER TABLE `businessShiftTemplate` ADD COLUMN `shiftEndTimeType`  tinyint(4) NULL DEFAULT NULL AFTER `isFlexibleShiftTime`;

ALTER TABLE `businessShiftTemplate` ADD COLUMN `shiftEndTimeValue`  varchar(30) NULL DEFAULT NULL AFTER `shiftEndTimeType`;

ALTER TABLE `businessShiftTemplate` MODIFY COLUMN `longBreak1Start`  time NULL DEFAULT NULL ;

ALTER TABLE `businessShiftTemplate` ADD CONSTRAINT `businessShiftTemplate_weekDayId` FOREIGN KEY (`weekDayId`) REFERENCES `weekDay` (`weekDayId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `candidateShiftOffer` ADD COLUMN `isFlexibleShiftTime`  bit(1) NOT NULL DEFAULT b'0' AFTER `actualShiftEndDateTime`;

ALTER TABLE `candidateShiftOffer` ADD COLUMN `shiftEndTimeType`  tinyint(4) NULL DEFAULT NULL AFTER `isFlexibleShiftTime`;

ALTER TABLE `candidateShiftOffer` ADD COLUMN `shiftEndTimeValue`  varchar(30) NULL DEFAULT NULL AFTER `shiftEndTimeType`;

ALTER TABLE `candidateShiftOffer` MODIFY COLUMN `status`  tinyint(4) NOT NULL ;

ALTER TABLE `candidateTimesheetComments` ADD COLUMN `isUnread`  bit(1) NULL DEFAULT b'0' AFTER `createdDate`;

ALTER TABLE `notificationRequest` ADD COLUMN `notificationSubject`  varchar(200) NULL DEFAULT NULL AFTER `managerId`;

ALTER TABLE `notificationRequest` MODIFY COLUMN `notificationMessage`  varchar(5000) NOT NULL ;

ALTER TABLE `notificationRequestDetail` ADD COLUMN `notificationRequestDetailGUID`  varchar(100) NULL DEFAULT NULL AFTER `mobileNo`;

ALTER TABLE `notificationRequestDetail` MODIFY COLUMN `status`  tinyint(4) NOT NULL ;

ALTER TABLE `notificationRequestDetail` DROP COLUMN `notificationGUID`;

ALTER TABLE `rosterCurrentWeekShift` ADD COLUMN `isFlexibleShiftTime`  bit(1) NULL DEFAULT NULL AFTER `shiftTemplateId`;

ALTER TABLE `userDevice` ADD COLUMN `isForceLogOut`  bit(1) NULL DEFAULT b'0' AFTER `deviceId`;

ALTER TABLE `userDevice` ADD COLUMN `shiftOfferNFSentTime`  datetime NULL DEFAULT NULL AFTER `isForceLogOut`;

ALTER TABLE `userDevice` ADD COLUMN `viewShiftOffers`  bit(1) NULL DEFAULT b'1' AFTER `shiftOfferNFSentTime`;

ALTER TABLE `userDevice` DROP COLUMN `languageId`;

SET FOREIGN_KEY_CHECKS=1;

