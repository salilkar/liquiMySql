/*
   Release Version 1
*/
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: risionsingaporetest.cykdfzyiuw9n.ap-southeast-1.rds.amazonaws.com    Database: risionSingapore
-- ------------------------------------------------------
-- Server version	5.6.22-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `agency`
--
DROP TABLE IF EXISTS `agency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agency` (
  `agencyId` bigint(20) NOT NULL AUTO_INCREMENT,
  `agencyRegId` varchar(30) NOT NULL,
  `agencyName` varchar(100) NOT NULL,
  `groupNameId` tinyint(4) DEFAULT NULL,
  `isOtherGroupName` bit(1) DEFAULT NULL,
  `otherGroupName` varchar(100) DEFAULT NULL,
  `areaOfExpertiseId` int(11) DEFAULT NULL,
  `timeSheetWeekEndDayId` tinyint(4) DEFAULT NULL,
  `countryId` bigint(20) DEFAULT NULL,
  `stateId` bigint(20) DEFAULT NULL,
  `cityId` bigint(20) DEFAULT NULL,
  `zipcode` varchar(10) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `addressLine1` varchar(250) DEFAULT NULL,
  `addressLine2` varchar(250) DEFAULT NULL,
  `privacyPolicy` text,
  `termsAndCondition` text,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT NULL,
  `agencyUrl` varchar(150) DEFAULT NULL,
  `agencyDescription` varchar(1200) DEFAULT NULL,
  `haveSite` bit(1) DEFAULT NULL,
  `workFlowId` tinyint(4) DEFAULT NULL,
  `latitude` decimal(21,17) DEFAULT NULL,
  `longitude` decimal(21,17) DEFAULT NULL,
  `timeZoneId` int(11) DEFAULT NULL,
  PRIMARY KEY (`agencyId`),
  KEY `agency_groupNameId` (`groupNameId`) USING BTREE,
  KEY `agency_areaOfExpertiseId` (`areaOfExpertiseId`) USING BTREE,
  KEY `agency_timeSheetWeekEndDayId` (`timeSheetWeekEndDayId`) USING BTREE,
  KEY `agency_cityId` (`cityId`) USING BTREE,
  KEY `agency_countryId` (`countryId`) USING BTREE,
  KEY `agency_stateId` (`stateId`) USING BTREE,
  KEY `agency_timeZoneId` (`timeZoneId`) USING BTREE,
  CONSTRAINT `agency_areaOfExpertiseId` FOREIGN KEY (`areaOfExpertiseId`) REFERENCES `areaOfExpertise` (`areaOfExpertiseId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `agency_cityId` FOREIGN KEY (`cityId`) REFERENCES `city` (`cityId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `agency_countryId` FOREIGN KEY (`countryId`) REFERENCES `country` (`countryId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `agency_groupNameId` FOREIGN KEY (`groupNameId`) REFERENCES `groupName` (`groupNameId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `agency_stateId` FOREIGN KEY (`stateId`) REFERENCES `state` (`stateId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `agency_timeSheetWeekEndDayId` FOREIGN KEY (`timeSheetWeekEndDayId`) REFERENCES `timeSheetweekEnd` (`weekEndDayId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `agency_timeZoneId` FOREIGN KEY (`timeZoneId`) REFERENCES `timeZone` (`timeZoneId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `agencyCandidate`
--

DROP TABLE IF EXISTS `agencyCandidate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agencyCandidate` (
  `agencyCandidateId` bigint(20) NOT NULL AUTO_INCREMENT,
  `agencyId` bigint(20) NOT NULL,
  `agencySiteId` bigint(20) NOT NULL,
  `candidateUserId` bigint(20) NOT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  PRIMARY KEY (`agencyCandidateId`),
  KEY `agencyCandidate_agencySiteId` (`agencySiteId`) USING BTREE,
  KEY `agencyCandidate_agencyId` (`agencyId`) USING BTREE,
  KEY `agencyCandidate_candidateUserId` (`candidateUserId`) USING BTREE,
  CONSTRAINT `agencyCandidate_agencyId` FOREIGN KEY (`agencyId`) REFERENCES `agency` (`agencyId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `agencyCandidate_agencySiteId` FOREIGN KEY (`agencySiteId`) REFERENCES `agencySite` (`agencySiteId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `agencyCandidate_candidateUserId` FOREIGN KEY (`candidateUserId`) REFERENCES `candidateUser` (`candidateUserId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agencyDocument`
--

DROP TABLE IF EXISTS `agencyDocument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agencyDocument` (
  `agencyDocumentId` bigint(20) NOT NULL AUTO_INCREMENT,
  `agencyId` bigint(20) DEFAULT NULL,
  `documentTypeId` smallint(6) DEFAULT NULL,
  `fileName` varchar(1000) DEFAULT NULL,
  `fileMimeType` varchar(10) DEFAULT NULL,
  `fileETag` varchar(1000) DEFAULT NULL,
  `fileUrl` varchar(1000) DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `fileStatus` tinyint(4) DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`agencyDocumentId`),
  KEY `agencyDocument_agencyId` (`agencyId`) USING BTREE,
  KEY `agencyDocument_documentTypeId` (`documentTypeId`) USING BTREE,
  CONSTRAINT `agencyDocument_agencyId` FOREIGN KEY (`agencyId`) REFERENCES `agency` (`agencyId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `agencyDocument_documentTypeId` FOREIGN KEY (`documentTypeId`) REFERENCES `documentType` (`documentTypeId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agencyIndustry`
--

DROP TABLE IF EXISTS `agencyIndustry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agencyIndustry` (
  `agencyIndustryID` bigint(20) NOT NULL AUTO_INCREMENT,
  `agencyId` bigint(20) DEFAULT NULL,
  `industryId` bigint(20) DEFAULT NULL,
  `isOther` bit(1) DEFAULT NULL,
  `otherIndustrydesc` varchar(300) DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`agencyIndustryID`),
  KEY `agencyIndustry_industryId` (`industryId`) USING BTREE,
  KEY `agencyIndustry_agencyId` (`agencyId`) USING BTREE,
  CONSTRAINT `agencyIndustry_agencyId` FOREIGN KEY (`agencyId`) REFERENCES `agency` (`agencyId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `agencyIndustry_industryId` FOREIGN KEY (`industryId`) REFERENCES `industry` (`industryID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agencyPaymentMethod`
--

DROP TABLE IF EXISTS `agencyPaymentMethod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agencyPaymentMethod` (
  `agencyID` bigint(20) NOT NULL,
  `paymentMethodId` tinyint(4) NOT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  PRIMARY KEY (`agencyID`,`paymentMethodId`),
  KEY `agencyPaymentMethod_paymentMethodId` (`paymentMethodId`) USING BTREE,
  CONSTRAINT `agencyPaymentMethod_agencyID` FOREIGN KEY (`agencyID`) REFERENCES `agency` (`agencyId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `agencyPaymentMethod_paymentMethodId` FOREIGN KEY (`paymentMethodId`) REFERENCES `paymentMethod` (`paymentMethodId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agencyPublicLiability`
--

DROP TABLE IF EXISTS `agencyPublicLiability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agencyPublicLiability` (
  `agencyPublicLiabilityId` bigint(20) NOT NULL AUTO_INCREMENT,
  `agencyId` bigint(20) DEFAULT NULL,
  `policyProvider` varchar(100) DEFAULT NULL,
  `coverageAmt` decimal(18,2) DEFAULT NULL,
  `policyNo` varchar(100) DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`agencyPublicLiabilityId`),
  KEY `agencyPublicLiability_agencyId` (`agencyId`) USING BTREE,
  CONSTRAINT `agencyPublicLiability_agencyId` FOREIGN KEY (`agencyId`) REFERENCES `agency` (`agencyId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agencySite`
--

DROP TABLE IF EXISTS `agencySite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agencySite` (
  `agencySiteId` bigint(20) NOT NULL AUTO_INCREMENT,
  `agencyId` bigint(20) DEFAULT NULL,
  `parentAgencySiteId` bigint(20) DEFAULT NULL,
  `siteName` varchar(100) NOT NULL,
  `siteDescription` varchar(1200) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `addressLine1` varchar(250) DEFAULT NULL,
  `addressLine2` varchar(250) DEFAULT NULL,
  `cityId` bigint(20) DEFAULT NULL,
  `stateId` bigint(20) DEFAULT NULL,
  `countryId` bigint(20) DEFAULT NULL,
  `zipcode` varchar(10) DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT b'0',
  `latitude` decimal(21,17) DEFAULT NULL,
  `longitude` decimal(21,17) DEFAULT NULL,
  `timeZoneId` int(11) DEFAULT NULL,
  PRIMARY KEY (`agencySiteId`),
  KEY `agencySite_agencyId` (`agencyId`) USING BTREE,
  KEY `agencySite_countryId` (`countryId`) USING BTREE,
  KEY `agencySite_cityId` (`cityId`) USING BTREE,
  KEY `agencySite_stateId` (`stateId`) USING BTREE,
  CONSTRAINT `agencySite_agencyId` FOREIGN KEY (`agencyId`) REFERENCES `agency` (`agencyId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `agencySite_cityId` FOREIGN KEY (`cityId`) REFERENCES `city` (`cityId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `agencySite_countryId` FOREIGN KEY (`countryId`) REFERENCES `country` (`countryId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `agencySite_stateId` FOREIGN KEY (`stateId`) REFERENCES `state` (`stateId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agencyStepCompletion`
--

DROP TABLE IF EXISTS `agencyStepCompletion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agencyStepCompletion` (
  `agencyId` bigint(20) NOT NULL,
  `stepNo` tinyint(4) NOT NULL,
  `isCompleted` bit(1) DEFAULT b'0',
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`agencyId`,`stepNo`),
  CONSTRAINT `agencyStepCompletion_agencyId` FOREIGN KEY (`agencyId`) REFERENCES `agency` (`agencyId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agencyWorkerCompensation`
--

DROP TABLE IF EXISTS `agencyWorkerCompensation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agencyWorkerCompensation` (
  `agencyWorkerCompId` bigint(20) NOT NULL AUTO_INCREMENT,
  `agencyId` bigint(20) NOT NULL,
  `policyProvider` varchar(100) DEFAULT NULL,
  `coverageAmt` decimal(18,2) DEFAULT NULL,
  `policyNo` varchar(50) DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`agencyWorkerCompId`),
  KEY `agencyWorkerCompensation_agencyId` (`agencyId`) USING BTREE,
  CONSTRAINT `agencyWorkerCompensation_agencyId` FOREIGN KEY (`agencyId`) REFERENCES `agency` (`agencyId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `allowance`
--

DROP TABLE IF EXISTS `allowance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `allowance` (
  `allowanceId` smallint(6) NOT NULL AUTO_INCREMENT,
  `defaultLanguageId` int(11) NOT NULL,
  PRIMARY KEY (`allowanceId`),
  KEY `allowance_languageId_idx` (`defaultLanguageId`) USING BTREE,
  CONSTRAINT `allowance_languageId` FOREIGN KEY (`defaultLanguageId`) REFERENCES `language` (`languageId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `allowanceLocale`
--

DROP TABLE IF EXISTS `allowanceLocale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `allowanceLocale` (
  `allowanceId` smallint(6) NOT NULL,
  `languageId` int(11) NOT NULL,
  `allowanceName` varchar(100) NOT NULL,
  PRIMARY KEY (`allowanceId`,`languageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `allowancePaidType`
--

DROP TABLE IF EXISTS `allowancePaidType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `allowancePaidType` (
  `allowancePaidTypeId` smallint(6) NOT NULL AUTO_INCREMENT,
  `defaultLanguageId` int(11) DEFAULT NULL,
  PRIMARY KEY (`allowancePaidTypeId`),
  KEY `allowancePaidType_defaultLanguageId` (`defaultLanguageId`) USING BTREE,
  CONSTRAINT `allowancePaidType_defaultLanguageId` FOREIGN KEY (`defaultLanguageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `allowancePaidTypeLocale`
--

DROP TABLE IF EXISTS `allowancePaidTypeLocale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `allowancePaidTypeLocale` (
  `allowancePaidTypeId` smallint(6) NOT NULL,
  `allowancePaidType` varchar(100) DEFAULT NULL,
  `languageId` int(11) NOT NULL,
  PRIMARY KEY (`allowancePaidTypeId`,`languageId`),
  KEY `allowancePaidTypeLocale_languageId` (`languageId`) USING BTREE,
  CONSTRAINT `allowancePaidTypeLocale_allowancePaidTypeId` FOREIGN KEY (`allowancePaidTypeId`) REFERENCES `allowancePaidType` (`allowancePaidTypeId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `allowancePaidTypeLocale_languageId` FOREIGN KEY (`languageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `applicationDocument`
--

DROP TABLE IF EXISTS `applicationDocument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `applicationDocument` (
  `applicationDocumentId` bigint(20) NOT NULL AUTO_INCREMENT,
  `documentName` varchar(200) DEFAULT NULL,
  `documentPath` varchar(1000) DEFAULT NULL,
  `documentMimeType` varchar(6) DEFAULT NULL,
  `documentTypeId` smallint(6) DEFAULT NULL,
  `eTag` varchar(1000) DEFAULT NULL,
  `fileStatus` tinyint(4) DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`applicationDocumentId`),
  KEY `applicationDocument_documentTypeId` (`documentTypeId`) USING BTREE,
  CONSTRAINT `applicationDocument_documentTypeId` FOREIGN KEY (`documentTypeId`) REFERENCES `documentType` (`documentTypeId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `areaOfExpertise`
--

DROP TABLE IF EXISTS `areaOfExpertise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `areaOfExpertise` (
  `areaOfExpertiseId` int(11) NOT NULL AUTO_INCREMENT,
  `defaultLanguageId` int(11) DEFAULT NULL,
  PRIMARY KEY (`areaOfExpertiseId`),
  KEY `areaOfExpertise_defaultLanguageId` (`defaultLanguageId`) USING BTREE,
  CONSTRAINT `areaOfExpertise_defaultLanguageId` FOREIGN KEY (`defaultLanguageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `areaOfExpertiseLocale`
--

DROP TABLE IF EXISTS `areaOfExpertiseLocale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `areaOfExpertiseLocale` (
  `areaOfExpertiseId` int(11) NOT NULL,
  `areaOfExpertise` varchar(100) DEFAULT NULL,
  `languageId` int(11) NOT NULL,
  PRIMARY KEY (`areaOfExpertiseId`,`languageId`),
  KEY `areaOfExpertiseLocale_languageId` (`languageId`) USING BTREE,
  CONSTRAINT `areaOfExpertiseLocale_areaOfExpertiseId` FOREIGN KEY (`areaOfExpertiseId`) REFERENCES `areaOfExpertise` (`areaOfExpertiseId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `areaOfExpertiseLocale_languageId` FOREIGN KEY (`languageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `award`
--

DROP TABLE IF EXISTS `award`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `award` (
  `awardId` int(11) NOT NULL AUTO_INCREMENT,
  `defaultLanguageId` int(11) NOT NULL,
  PRIMARY KEY (`awardId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `awardAllowance`
--

DROP TABLE IF EXISTS `awardAllowance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `awardAllowance` (
  `awardId` int(11) NOT NULL,
  `allowanceId` smallint(6) NOT NULL,
  PRIMARY KEY (`awardId`,`allowanceId`),
  KEY `awardAllowance_allowanceId_idx` (`allowanceId`) USING BTREE,
  CONSTRAINT `awardAllowance_allowanceId` FOREIGN KEY (`allowanceId`) REFERENCES `allowance` (`allowanceId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `awardAllowance_awardId` FOREIGN KEY (`awardId`) REFERENCES `award` (`awardId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `awardGradeLevel`
--

DROP TABLE IF EXISTS `awardGradeLevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `awardGradeLevel` (
  `awardId` int(11) NOT NULL,
  `gradeLevelId` int(11) NOT NULL,
  PRIMARY KEY (`awardId`,`gradeLevelId`),
  KEY `awardGradeLevel_levelId_idx` (`gradeLevelId`) USING BTREE,
  CONSTRAINT `awardGradeLevel_awardId` FOREIGN KEY (`awardId`) REFERENCES `award` (`awardId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `awardGradeLevel_levelId` FOREIGN KEY (`gradeLevelId`) REFERENCES `gradeLevel` (`gradeLevelId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `awardLocale`
--

DROP TABLE IF EXISTS `awardLocale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `awardLocale` (
  `awardId` int(11) NOT NULL,
  `languageId` int(11) NOT NULL,
  `awardName` varchar(100) NOT NULL,
  PRIMARY KEY (`awardId`,`languageId`),
  KEY `awardLocale_languageId_idx` (`languageId`) USING BTREE,
  CONSTRAINT `awardLocale_awardId` FOREIGN KEY (`awardId`) REFERENCES `award` (`awardId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `awardLocale_languageId` FOREIGN KEY (`languageId`) REFERENCES `language` (`languageId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `beacon`
--

DROP TABLE IF EXISTS `beacon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beacon` (
  `beaconId` bigint(20) NOT NULL AUTO_INCREMENT,
  `businessId` bigint(20) NOT NULL,
  `UUID` varchar(200) NOT NULL,
  `beaconName` varchar(200) DEFAULT NULL,
  `major` bigint(20) DEFAULT NULL,
  `minor` bigint(20) DEFAULT NULL,
  `isEnabled` bit(1) DEFAULT b'0',
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `isRegistered` bit(1) DEFAULT b'0',
  `isDeleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`beaconId`),
  KEY `beacon_businessId` (`businessId`),
  CONSTRAINT `beacon_businessId` FOREIGN KEY (`businessId`) REFERENCES `business` (`businessId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `beaconBusinessSite`
--

DROP TABLE IF EXISTS `beaconBusinessSite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beaconBusinessSite` (
  `beaconId` bigint(20) NOT NULL,
  `businessSiteId` bigint(20) DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  KEY `beaconBusinessSite_beaconId_Idx` (`beaconId`),
  KEY `beaconBusinessSite_businessSiteId_Idx` (`businessSiteId`),
  CONSTRAINT `beaconBusinessSite_beaconId_Idx` FOREIGN KEY (`beaconId`) REFERENCES `beacon` (`beaconId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `beaconBusinessSite_businessSiteId_Idx` FOREIGN KEY (`businessSiteId`) REFERENCES `businessSite` (`businessSiteId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `beaconDepartment`
--

DROP TABLE IF EXISTS `beaconDepartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beaconDepartment` (
  `beaconId` bigint(20) NOT NULL,
  `departmentId` bigint(20) DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  KEY `beaconDepartment_beaconId` (`beaconId`),
  KEY `beaconDepartment_departmentId` (`departmentId`),
  CONSTRAINT `beaconDepartment_beaconId` FOREIGN KEY (`beaconId`) REFERENCES `beacon` (`beaconId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `beaconDepartment_departmentId` FOREIGN KEY (`departmentId`) REFERENCES `businessDepartment` (`departmentId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `beaconGPSLocation`
--

DROP TABLE IF EXISTS `beaconGPSLocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beaconGPSLocation` (
  `beaconGPSLocationId` bigint(20) NOT NULL AUTO_INCREMENT,
  `beaconId` bigint(20) DEFAULT NULL,
  `latitude` decimal(21,17) DEFAULT NULL,
  `longitude` decimal(21,17) DEFAULT NULL,
  `preference` tinyint(1) DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  PRIMARY KEY (`beaconGPSLocationId`),
  KEY `beaconGPSLocation_beaconId` (`beaconId`),
  CONSTRAINT `beaconGPSLocation_beaconId` FOREIGN KEY (`beaconId`) REFERENCES `beacon` (`beaconId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `beaconProximityTouchPoint`
--

DROP TABLE IF EXISTS `beaconProximityTouchPoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beaconProximityTouchPoint` (
  `proximityTouchPointId` tinyint(4) NOT NULL,
  `proximityTouchPoint` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `beaconSettings`
--

DROP TABLE IF EXISTS `beaconSettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beaconSettings` (
  `beaconId` bigint(20) NOT NULL,
  `proximityOfTouchPoint` tinyint(4) NOT NULL DEFAULT '1',
  `isEnabledBeaconGPS` bit(1) NOT NULL DEFAULT b'1',
  `resetGPSPosition` bit(1) NOT NULL DEFAULT b'0',
  `isEnabledStaffGPS` bit(1) NOT NULL DEFAULT b'1',
  `staffGPSCheckPoints` int(11) DEFAULT NULL,
  `isAutoClockOffStaff` bit(1) NOT NULL DEFAULT b'1',
  `isTimeSheetApprovalRequired` bit(1) NOT NULL DEFAULT b'1',
  `isAllowEarlyStart` bit(1) NOT NULL DEFAULT b'1',
  `allowMinTimeBeforeShiftStart` tinyint(4) DEFAULT NULL,
  `allowMaxTimeBeforeShiftStart` tinyint(4) DEFAULT NULL,
  `isAllowLateStart` bit(1) NOT NULL DEFAULT b'1',
  `allowMinTimeAfterShiftStart` tinyint(4) DEFAULT NULL,
  `allowMaxTimeAfterShiftStart` tinyint(4) DEFAULT NULL,
  `createdBy` bigint(20) NOT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `isDeleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`beaconId`),
  CONSTRAINT `beaconSettings_beaconId` FOREIGN KEY (`beaconId`) REFERENCES `beacon` (`beaconId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `beaconSubClassification`
--

DROP TABLE IF EXISTS `beaconSubClassification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beaconSubClassification` (
  `beaconId` bigint(20) NOT NULL,
  `subClassificationId` int(11) DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  KEY `beaconSubClassification_subClassificationId` (`subClassificationId`),
  KEY `beaconSubClassification_beaconId` (`beaconId`),
  CONSTRAINT `beaconSubClassification_beaconId` FOREIGN KEY (`beaconId`) REFERENCES `beacon` (`beaconId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `beaconSubClassification_subClassificationId` FOREIGN KEY (`subClassificationId`) REFERENCES `jobSubClassification` (`jobSubClassificationId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `beaconSummary`
--

DROP TABLE IF EXISTS `beaconSummary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beaconSummary` (
  `beaconId` bigint(20) NOT NULL,
  `GPSLocationDisparityCount` bigint(20) DEFAULT NULL,
  `clockOnCount` bigint(20) DEFAULT NULL,
  `manualSubmittedTimesheets` bigint(20) DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  KEY `beaconSummary_beaconId` (`beaconId`),
  CONSTRAINT `beaconSummary_beaconId` FOREIGN KEY (`beaconId`) REFERENCES `beacon` (`beaconId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `business`
--

DROP TABLE IF EXISTS `business`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business` (
  `businessId` bigint(20) NOT NULL AUTO_INCREMENT,
  `businessRegId` varchar(30) NOT NULL,
  `businessName` varchar(300) NOT NULL,
  `groupNameId` tinyint(4) DEFAULT NULL,
  `isOtherGroupName` bit(1) DEFAULT NULL,
  `otherGroupName` varchar(100) DEFAULT NULL,
  `areaOfExpertiseId` int(11) DEFAULT NULL,
  `timeSheetWeekEndDayId` tinyint(4) DEFAULT NULL,
  `countryId` bigint(20) DEFAULT NULL,
  `stateId` bigint(20) DEFAULT NULL,
  `cityId` bigint(20) DEFAULT NULL,
  `zipcode` varchar(10) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `addressLine1` varchar(250) DEFAULT NULL,
  `addressLine2` varchar(250) DEFAULT NULL,
  `privacyPolicy` text,
  `termsAndCondition` text,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `isDeleted` bit(1) NOT NULL DEFAULT b'0',
  `workFlowId` tinyint(4) DEFAULT NULL,
  `businessUrl` varchar(200) DEFAULT NULL,
  `businessDescription` varchar(1200) DEFAULT NULL,
  `haveSite` bit(1) DEFAULT NULL,
  `latitude` decimal(21,17) DEFAULT NULL,
  `longitude` decimal(21,17) DEFAULT NULL,
  `timeZoneId` int(11) DEFAULT NULL,
  `departmentGroupNameId` tinyint(4) NOT NULL DEFAULT '1',
  `jobClassificationId` int(11) DEFAULT NULL,
  `otherJobClassification` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`businessId`),
  KEY `business_areaOfExpertiseId` (`areaOfExpertiseId`) USING BTREE,
  KEY `business_timeSheetWeekEndDayId` (`timeSheetWeekEndDayId`) USING BTREE,
  KEY `business_workFlowId` (`workFlowId`) USING BTREE,
  KEY `business_groupNameId` (`groupNameId`) USING BTREE,
  KEY `business_cityId` (`cityId`) USING BTREE,
  KEY `business_countryId` (`countryId`) USING BTREE,
  KEY `business_stateId` (`stateId`) USING BTREE,
  KEY `business_timeZoneId` (`timeZoneId`) USING BTREE,
  KEY `business_departmentGroupNameId` (`departmentGroupNameId`),
  KEY `business_jobClassificationId` (`jobClassificationId`),
  CONSTRAINT `business_areaOfExpertiseId` FOREIGN KEY (`areaOfExpertiseId`) REFERENCES `areaOfExpertise` (`areaOfExpertiseId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `business_cityId` FOREIGN KEY (`cityId`) REFERENCES `city` (`cityId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `business_countryId` FOREIGN KEY (`countryId`) REFERENCES `country` (`countryId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `business_departmentGroupNameId` FOREIGN KEY (`departmentGroupNameId`) REFERENCES `departmentGroupName` (`departmentGroupNameId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `business_groupNameId` FOREIGN KEY (`groupNameId`) REFERENCES `groupName` (`groupNameId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `business_jobClassificationId` FOREIGN KEY (`jobClassificationId`) REFERENCES `jobClassification` (`jobClassificationId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `business_stateId` FOREIGN KEY (`stateId`) REFERENCES `state` (`stateId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `business_timeSheetWeekEndDayId` FOREIGN KEY (`timeSheetWeekEndDayId`) REFERENCES `timeSheetweekEnd` (`weekEndDayId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `business_timeZoneId` FOREIGN KEY (`timeZoneId`) REFERENCES `timeZone` (`timeZoneId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `business_workFlowId` FOREIGN KEY (`workFlowId`) REFERENCES `businessWorkFlow` (`workFlowId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3869 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `businessAllowance`
--

DROP TABLE IF EXISTS `businessAllowance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `businessAllowance` (
  `allowanceId` bigint(20) NOT NULL AUTO_INCREMENT,
  `allowanceName` varchar(100) DEFAULT NULL,
  `businessId` bigint(20) DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`allowanceId`),
  KEY `businessAllowance_businessId` (`businessId`) USING BTREE,
  CONSTRAINT `businessAllowance_businessId` FOREIGN KEY (`businessId`) REFERENCES `business` (`businessId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1783 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `businessCandidate`
--

DROP TABLE IF EXISTS `businessCandidate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `businessCandidate` (
  `businessCandidateId` bigint(20) NOT NULL AUTO_INCREMENT,
  `businessId` bigint(20) NOT NULL,
  `businessSiteId` bigint(20) NOT NULL,
  `candidateUserId` bigint(20) NOT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  PRIMARY KEY (`businessCandidateId`),
  KEY `businessCandidate_candidateUserId` (`candidateUserId`) USING BTREE,
  KEY `businessCandidate_businessId` (`businessId`) USING BTREE,
  KEY `businessCandidate_businessSiteId` (`businessSiteId`) USING BTREE,
  CONSTRAINT `businessCandidate_businessId` FOREIGN KEY (`businessId`) REFERENCES `business` (`businessId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `businessCandidate_businessSiteId` FOREIGN KEY (`businessSiteId`) REFERENCES `businessSite` (`businessSiteId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `businessCandidate_candidateUserId` FOREIGN KEY (`candidateUserId`) REFERENCES `candidateUser` (`candidateUserId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11509 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `businessCandidateSettings`
--

DROP TABLE IF EXISTS `businessCandidateSettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `businessCandidateSettings` (
  `businessId` bigint(20) NOT NULL,
  `candidateUserId` bigint(20) NOT NULL,
  `isEmergency` bit(1) DEFAULT b'0',
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`businessId`,`candidateUserId`),
  KEY `businessCandidateSettings_candidateId` (`candidateUserId`),
  CONSTRAINT `businessCandidateSettings_businessId` FOREIGN KEY (`businessId`) REFERENCES `business` (`businessId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `businessCandidateSettings_candidateId` FOREIGN KEY (`candidateUserId`) REFERENCES `candidateUser` (`candidateUserId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `businessCostCentre`
--

DROP TABLE IF EXISTS `businessCostCentre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `businessCostCentre` (
  `costCentreId` bigint(20) NOT NULL AUTO_INCREMENT,
  `businessId` bigint(20) DEFAULT NULL,
  `costCentreName` varchar(75) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `isDeleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`costCentreId`),
  KEY `businessCostCentre_businessId` (`businessId`) USING BTREE,
  CONSTRAINT `businessCostCentre_businessId` FOREIGN KEY (`businessId`) REFERENCES `business` (`businessId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `businessDepartment`
--

DROP TABLE IF EXISTS `businessDepartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `businessDepartment` (
  `departmentId` bigint(20) NOT NULL AUTO_INCREMENT,
  `businessId` bigint(20) DEFAULT NULL,
  `departmentName` varchar(100) DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`departmentId`),
  KEY `businessDepartment_businessId` (`businessId`) USING BTREE,
  CONSTRAINT `businessDepartment_businessId` FOREIGN KEY (`businessId`) REFERENCES `business` (`businessId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4191 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `businessDocument`
--

DROP TABLE IF EXISTS `businessDocument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `businessDocument` (
  `businessDocumentId` bigint(20) NOT NULL AUTO_INCREMENT,
  `businessId` bigint(20) DEFAULT NULL,
  `documentTypeId` smallint(6) DEFAULT NULL,
  `fileName` varchar(1000) DEFAULT NULL,
  `fileMimeType` varchar(10) DEFAULT NULL,
  `fileETag` varchar(1000) DEFAULT NULL,
  `fileUrl` varchar(1000) DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `fileStatus` tinyint(4) DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`businessDocumentId`),
  KEY `businessDocument_documentTypeId` (`documentTypeId`) USING BTREE,
  KEY `businessDocument_businessId` (`businessId`) USING BTREE,
  CONSTRAINT `businessDocument_businessId` FOREIGN KEY (`businessId`) REFERENCES `business` (`businessId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `businessDocument_documentTypeId` FOREIGN KEY (`documentTypeId`) REFERENCES `documentType` (`documentTypeId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `businessFeature`
--

DROP TABLE IF EXISTS `businessFeature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `businessFeature` (
  `businessId` bigint(20) NOT NULL,
  `featureId` tinyint(4) NOT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT b'0',
  `featureAmount` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`businessId`,`featureId`),
  KEY `businessFeature_featureId` (`featureId`) USING BTREE,
  CONSTRAINT `businessFeature_businessId` FOREIGN KEY (`businessId`) REFERENCES `business` (`businessId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `businessFeature_featureId` FOREIGN KEY (`featureId`) REFERENCES `feature` (`featureId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `businessFunction`
--

DROP TABLE IF EXISTS `businessFunction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `businessFunction` (
  `businessFunctionId` bigint(20) NOT NULL,
  `parentBusinessFunctionId` bigint(20) DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT b'0',
  `showInUI` bit(1) DEFAULT b'1',
  `isHeader` bit(1) DEFAULT NULL,
  `isSpecificToBusiness` bit(1) DEFAULT b'0',
  PRIMARY KEY (`businessFunctionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `businessFunctionLocale`
--

DROP TABLE IF EXISTS `businessFunctionLocale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `businessFunctionLocale` (
  `businessFunctionId` bigint(20) NOT NULL,
  `languageId` int(11) NOT NULL,
  `businessFunctionName` varchar(100) DEFAULT NULL,
  `businessFunctionDescription` varchar(1000) DEFAULT NULL,
  `parentBFName` varchar(45) DEFAULT NULL,
  `parentClaimId` bigint(20) DEFAULT NULL,
  `showinUI` bit(1) DEFAULT NULL,
  `isHeader` bit(1) DEFAULT NULL,
  `roleCategoryIds` varchar(45) DEFAULT NULL,
  `workFlowIds` varchar(45) DEFAULT NULL,
  `roleIds` varchar(45) DEFAULT NULL,
  `isBusinessSpecific` bit(1) DEFAULT NULL,
  PRIMARY KEY (`businessFunctionId`,`languageId`),
  KEY `businessFunctionLocale_languageId` (`languageId`) USING BTREE,
  CONSTRAINT `businessFunctionLocale_ibfk_1` FOREIGN KEY (`languageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `businessFunctionLocale_ibfk_2` FOREIGN KEY (`businessFunctionId`) REFERENCES `businessFunction` (`businessFunctionId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `businessFunctionRoleCategory`
--

DROP TABLE IF EXISTS `businessFunctionRoleCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `businessFunctionRoleCategory` (
  `businessFunctionId` bigint(20) NOT NULL,
  `roleCategoryId` tinyint(4) NOT NULL,
  PRIMARY KEY (`businessFunctionId`,`roleCategoryId`),
  KEY `businessFunctionRoleCateg_roleCategoryId` (`roleCategoryId`) USING BTREE,
  CONSTRAINT `businessFunctionRoleCateg_businessFunctionId` FOREIGN KEY (`businessFunctionId`) REFERENCES `businessFunction` (`businessFunctionId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `businessFunctionRoleCateg_roleCategoryId` FOREIGN KEY (`roleCategoryId`) REFERENCES `roleCategory` (`roleCategoryId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `businessFunctionWorkFlow`
--

DROP TABLE IF EXISTS `businessFunctionWorkFlow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `businessFunctionWorkFlow` (
  `businessFunctionId` bigint(20) NOT NULL,
  `workFlowId` tinyint(4) NOT NULL,
  PRIMARY KEY (`businessFunctionId`,`workFlowId`),
  KEY `businessFunctionWorkFlow_workFlowId` (`workFlowId`) USING BTREE,
  CONSTRAINT `businessFunctionWorkFlow_businessFunctionId` FOREIGN KEY (`businessFunctionId`) REFERENCES `businessFunction` (`businessFunctionId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `businessFunctionWorkFlow_workFlowId` FOREIGN KEY (`workFlowId`) REFERENCES `businessWorkFlow` (`workFlowId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `businessGrade`
--

DROP TABLE IF EXISTS `businessGrade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `businessGrade` (
  `gradeId` bigint(20) NOT NULL AUTO_INCREMENT,
  `gradeName` varchar(50) DEFAULT NULL,
  `businessId` bigint(20) DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`gradeId`),
  KEY `businessGrade_businessId` (`businessId`) USING BTREE,
  CONSTRAINT `businessGrade_businessId` FOREIGN KEY (`businessId`) REFERENCES `business` (`businessId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=237 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `businessIndustry`
--

DROP TABLE IF EXISTS `businessIndustry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `businessIndustry` (
  `businessIndustryID` bigint(20) NOT NULL AUTO_INCREMENT,
  `businessId` bigint(20) DEFAULT NULL,
  `industryId` bigint(20) DEFAULT NULL,
  `isOther` bit(1) DEFAULT NULL,
  `otherIndustrydesc` varchar(300) DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`businessIndustryID`),
  KEY `businessIndustry_industryId` (`industryId`) USING BTREE,
  KEY `businessIndustry_businessId` (`businessId`) USING BTREE,
  CONSTRAINT `businessIndustry_businessId` FOREIGN KEY (`businessId`) REFERENCES `business` (`businessId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `businessIndustry_industryId` FOREIGN KEY (`industryId`) REFERENCES `industry` (`industryID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3842 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `businessJobProfileAgreement`
--

DROP TABLE IF EXISTS `businessJobProfileAgreement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `businessJobProfileAgreement` (
  `businessjobProfileAgmntId` bigint(20) NOT NULL AUTO_INCREMENT,
  `businessId` bigint(20) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`businessjobProfileAgmntId`),
  KEY `businessJobProfileAgreeme_businessId` (`businessId`) USING BTREE,
  CONSTRAINT `businessJobProfileAgreeme_businessId` FOREIGN KEY (`businessId`) REFERENCES `business` (`businessId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `businessLicense`
--

DROP TABLE IF EXISTS `businessLicense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `businessLicense` (
  `licenseId` bigint(20) NOT NULL AUTO_INCREMENT,
  `licenseName` varchar(100) DEFAULT NULL,
  `businessId` bigint(20) DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`licenseId`),
  KEY `businessLicense_businessId` (`businessId`) USING BTREE,
  CONSTRAINT `businessLicense_businessId` FOREIGN KEY (`businessId`) REFERENCES `business` (`businessId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1586 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `businessPaymentMethod`
--

DROP TABLE IF EXISTS `businessPaymentMethod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `businessPaymentMethod` (
  `businessID` bigint(20) NOT NULL,
  `paymentMethodId` tinyint(4) NOT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` bigint(20) DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`businessID`,`paymentMethodId`),
  KEY `businessPaymentMethod_paymentMethodId` (`paymentMethodId`) USING BTREE,
  CONSTRAINT `businessPaymentMethod_businessID` FOREIGN KEY (`businessID`) REFERENCES `business` (`businessId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `businessPaymentMethod_paymentMethodId` FOREIGN KEY (`paymentMethodId`) REFERENCES `paymentMethod` (`paymentMethodId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `businessPublicLiability`
--

DROP TABLE IF EXISTS `businessPublicLiability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `businessPublicLiability` (
  `businessPublicLiabilityId` bigint(20) NOT NULL AUTO_INCREMENT,
  `businessId` bigint(20) DEFAULT NULL,
  `policyProvider` varchar(100) DEFAULT NULL,
  `coverageAmt` decimal(18,2) DEFAULT NULL,
  `policyNo` varchar(50) DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`businessPublicLiabilityId`),
  KEY `businessPublicLiability_businessId` (`businessId`) USING BTREE,
  CONSTRAINT `businessPublicLiability_businessId` FOREIGN KEY (`businessId`) REFERENCES `business` (`businessId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `businessSettings`
--

DROP TABLE IF EXISTS `businessSettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `businessSettings` (
  `settingId` bigint(20) NOT NULL AUTO_INCREMENT,
  `businessSiteId` bigint(20) NOT NULL,
  `departmentId` bigint(20) NOT NULL,
  `candidateAcknowledgeReq` bit(1) DEFAULT NULL,
  `approveHoursReq` bit(1) DEFAULT NULL,
  `maxTimeToConfirm` varchar(20) DEFAULT NULL,
  `allowSwap` bit(1) DEFAULT NULL,
  `reqManagerApproval` bit(1) DEFAULT NULL,
  `useOvertimeIndicator` bit(1) DEFAULT NULL,
  `fullTimeOTLimit` int(11) DEFAULT NULL,
  `partTimeOTLimit` int(11) DEFAULT NULL,
  `casualOTLimit` int(11) DEFAULT NULL,
  `settingStatus` tinyint(4) DEFAULT NULL,
  `rosterBreaks` bit(1) DEFAULT b'0',
  `rosterBreakRules` bit(1) DEFAULT b'0',
  `allowCantWork` bit(1) NOT NULL DEFAULT b'1',
  `lastRosterDay` bit(1) NOT NULL DEFAULT b'0',
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`settingId`),
  KEY `businessSettings_ibfk_1` (`businessSiteId`) USING BTREE,
  KEY `businessSettings_departmentId` (`departmentId`) USING BTREE,
  CONSTRAINT `businessSettings_departmentId` FOREIGN KEY (`departmentId`) REFERENCES `businessDepartment` (`departmentId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `businessSettings_ibfk_1` FOREIGN KEY (`businessSiteId`) REFERENCES `businessSite` (`businessSiteId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2497 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `businessShiftTemplate`
--

DROP TABLE IF EXISTS `businessShiftTemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `businessShiftTemplate` (
  `shiftTemplateId` bigint(20) NOT NULL AUTO_INCREMENT,
  `businessSiteId` bigint(20) NOT NULL,
  `departmentId` bigint(20) NOT NULL,
  `subClassificationId` int(11) NOT NULL,
  `weekDayId` tinyint(4) NOT NULL,
  `weekDayName` varchar(20) NOT NULL,
  `shiftStartTime` time NOT NULL,
  `shiftEndTime` time NOT NULL,
  `isFlexibleShiftTime` bit(1) NOT NULL DEFAULT b'0',
  `shiftEndTimeType` tinyint(4) DEFAULT NULL,
  `shiftEndTimeValue` varchar(30) DEFAULT NULL,
  `longBreak1Start` time DEFAULT NULL,
  `longBreak2Start` time DEFAULT NULL,
  `shortBreak1Start` time DEFAULT NULL,
  `shortBreak2Start` time DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `isDeleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`shiftTemplateId`),
  KEY `businessShiftTemplate_subClassificationId` (`subClassificationId`) USING BTREE,
  KEY `businessShiftTemplate_businessSiteId` (`businessSiteId`) USING BTREE,
  KEY `businessShiftTemplate_departmentId` (`departmentId`) USING BTREE,
  KEY `businessShiftTemplate_weekDayId` (`weekDayId`),
  CONSTRAINT `businessShiftTemplate_businessSiteId` FOREIGN KEY (`businessSiteId`) REFERENCES `businessSite` (`businessSiteId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `businessShiftTemplate_departmentId` FOREIGN KEY (`departmentId`) REFERENCES `businessDepartment` (`departmentId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `businessShiftTemplate_subClassificationId` FOREIGN KEY (`subClassificationId`) REFERENCES `jobSubClassification` (`jobSubClassificationId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `businessShiftTemplate_weekDayId` FOREIGN KEY (`weekDayId`) REFERENCES `weekDay` (`weekDayId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5081 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `businessSite`
--

DROP TABLE IF EXISTS `businessSite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `businessSite` (
  `businessSiteId` bigint(20) NOT NULL AUTO_INCREMENT,
  `businessId` bigint(20) DEFAULT NULL,
  `siteName` varchar(150) NOT NULL,
  `siteDescription` varchar(1200) DEFAULT NULL,
  `parentBusinessSiteId` bigint(20) DEFAULT NULL,
  `countryId` bigint(20) DEFAULT NULL,
  `stateId` bigint(20) DEFAULT NULL,
  `cityId` bigint(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `addressLine1` varchar(250) DEFAULT NULL,
  `addressLine2` varchar(250) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `zipCode` varchar(20) DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT b'0',
  `latitude` decimal(21,17) DEFAULT NULL,
  `longitude` decimal(21,17) DEFAULT NULL,
  `timeZoneId` int(11) DEFAULT NULL,
  `childHierarchy` varchar(1000) DEFAULT NULL,
  `parentHierarchy` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`businessSiteId`),
  KEY `businessSite_businessId` (`businessId`) USING BTREE,
  KEY `businessSite_stateId` (`stateId`) USING BTREE,
  KEY `businessSite_cityId` (`cityId`) USING BTREE,
  KEY `businessSite_countryId` (`countryId`) USING BTREE,
  KEY `businessSite_timeZoneId` (`timeZoneId`) USING BTREE,
  CONSTRAINT `businessSite_businessId` FOREIGN KEY (`businessId`) REFERENCES `business` (`businessId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `businessSite_cityId` FOREIGN KEY (`cityId`) REFERENCES `city` (`cityId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `businessSite_countryId` FOREIGN KEY (`countryId`) REFERENCES `country` (`countryId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `businessSite_stateId` FOREIGN KEY (`stateId`) REFERENCES `state` (`stateId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `businessSite_timeZoneId` FOREIGN KEY (`timeZoneId`) REFERENCES `timeZone` (`timeZoneId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4545 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `businessSitePreferredAgency`
--

DROP TABLE IF EXISTS `businessSitePreferredAgency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `businessSitePreferredAgency` (
  `businessSiteId` bigint(20) NOT NULL,
  `AgencySiteId` bigint(20) NOT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT b'0',
  `isNotified` bit(1) DEFAULT b'0',
  PRIMARY KEY (`businessSiteId`,`AgencySiteId`),
  KEY `businessSitePreferredAgen_AgencySiteId` (`AgencySiteId`) USING BTREE,
  CONSTRAINT `businessSitePreferredAgen_AgencySiteId` FOREIGN KEY (`AgencySiteId`) REFERENCES `agencySite` (`agencySiteId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `businessSitePreferredAgen_businessSiteId` FOREIGN KEY (`businessSiteId`) REFERENCES `businessSite` (`businessSiteId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `businessStepCompletion`
--

DROP TABLE IF EXISTS `businessStepCompletion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `businessStepCompletion` (
  `businessId` bigint(20) NOT NULL,
  `stepNo` tinyint(4) NOT NULL,
  `isCompleted` bit(1) DEFAULT b'0',
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`businessId`,`stepNo`),
  CONSTRAINT `businessStepCompletion_businessId` FOREIGN KEY (`businessId`) REFERENCES `business` (`businessId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `businessUserSetting`
--

DROP TABLE IF EXISTS `businessUserSetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `businessUserSetting` (
  `businessUserSetting` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) DEFAULT NULL,
  `moveRosteredStaff` bit(1) DEFAULT b'1',
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`businessUserSetting`),
  KEY `businessUserSetting_userId` (`userId`) USING BTREE,
  CONSTRAINT `businessUserSetting_userId` FOREIGN KEY (`userId`) REFERENCES `scUser` (`userId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `businessWorkFlow`
--

DROP TABLE IF EXISTS `businessWorkFlow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `businessWorkFlow` (
  `workFlowId` tinyint(4) NOT NULL AUTO_INCREMENT,
  `workFlowName` varchar(1000) DEFAULT NULL,
  `parentWorkFlowId` tinyint(4) DEFAULT NULL,
  `initialStateId` int(11) DEFAULT NULL,
  `versionId` int(11) DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`workFlowId`),
  KEY `businessWorkFlow_initialStateId` (`initialStateId`) USING BTREE,
  CONSTRAINT `businessWorkFlow_initialStateId` FOREIGN KEY (`initialStateId`) REFERENCES `workFlowState` (`stateId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `businessWorkerCompensation`
--

DROP TABLE IF EXISTS `businessWorkerCompensation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `businessWorkerCompensation` (
  `businessWorkerCompId` bigint(20) NOT NULL AUTO_INCREMENT,
  `businessId` bigint(20) DEFAULT NULL,
  `policyProvider` varchar(100) DEFAULT NULL,
  `coverageAmt` decimal(18,2) DEFAULT NULL,
  `policyNo` varchar(50) DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`businessWorkerCompId`),
  KEY `businessWorkerCompensatio_businessId` (`businessId`) USING BTREE,
  CONSTRAINT `businessWorkerCompensatio_businessId` FOREIGN KEY (`businessId`) REFERENCES `business` (`businessId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `calibration`
--

DROP TABLE IF EXISTS `calibration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calibration` (
  `calibrationId` int(11) NOT NULL,
  `platform` tinyint(4) DEFAULT NULL,
  `make` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `proximitySettings` tinyint(4) DEFAULT NULL,
  `FRSSITouchOnLimit` decimal(8,5) DEFAULT NULL,
  `FRSSITouchOnClearHyst` decimal(8,5) DEFAULT NULL,
  `FRSSIRangeLimit` decimal(8,5) DEFAULT NULL,
  `FDelay` decimal(8,5) DEFAULT NULL,
  `CRSSITouchOnLimit` decimal(8,5) DEFAULT NULL,
  `CRSSITouchOnClearHyst` decimal(8,5) DEFAULT NULL,
  `CRSSIRangeLimit` decimal(8,5) DEFAULT NULL,
  `CDelay` decimal(8,5) DEFAULT NULL,
  PRIMARY KEY (`calibrationId`),
  KEY `calibration_platform` (`platform`) USING BTREE,
  KEY `calibration_make` (`make`) USING BTREE,
  KEY `calibration_model` (`model`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `candidateBankDetail`
--

DROP TABLE IF EXISTS `candidateBankDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidateBankDetail` (
  `candidateBankDetailId` bigint(20) NOT NULL AUTO_INCREMENT,
  `candidateUserId` bigint(20) DEFAULT NULL,
  `bankName` varchar(100) DEFAULT NULL,
  `bankBranch` varchar(100) DEFAULT NULL,
  `bankAccountTitle` varchar(100) DEFAULT NULL,
  `bankAccountNo` varchar(50) DEFAULT NULL,
  `bankAccountBsb` varchar(100) DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`candidateBankDetailId`),
  KEY `candidateBankDetail_candidateUserId` (`candidateUserId`) USING BTREE,
  CONSTRAINT `candidateBankDetail_candidateUserId` FOREIGN KEY (`candidateUserId`) REFERENCES `candidateUser` (`candidateUserId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `candidateContactTime`
--

DROP TABLE IF EXISTS `candidateContactTime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidateContactTime` (
  `candidateContactTimeId` bigint(20) NOT NULL AUTO_INCREMENT,
  `candidateUserId` bigint(20) DEFAULT NULL,
  `contactStartTime` time DEFAULT NULL,
  `contactEndTime` time DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`candidateContactTimeId`),
  KEY `candidateContactTime_candidateUserId` (`candidateUserId`) USING BTREE,
  CONSTRAINT `candidateContactTime_candidateUserId` FOREIGN KEY (`candidateUserId`) REFERENCES `candidateUser` (`candidateUserId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `candidateDetail`
--

DROP TABLE IF EXISTS `candidateDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidateDetail` (
  `candidateUserId` bigint(20) NOT NULL,
  `streetAddressLine1` longtext,
  `streetAddressLine2` longtext,
  `countryId` bigint(20) DEFAULT NULL,
  `stateId` bigint(20) DEFAULT NULL,
  `cityId` bigint(20) DEFAULT NULL,
  `zipCode` longtext,
  `county` varchar(50) DEFAULT NULL,
  `dob` longtext,
  `moreInformation` varchar(1000) DEFAULT NULL,
  `considerForOverseaWork` bit(1) DEFAULT b'0',
  `considerForOtherJobProfile` bit(1) DEFAULT b'0',
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `latitude` decimal(21,17) DEFAULT NULL,
  `longitude` decimal(21,17) DEFAULT NULL,
  `studentTypeId` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`candidateUserId`),
  KEY `candidateDetail_stateId` (`stateId`) USING BTREE,
  KEY `candidateDetail_cityId` (`cityId`) USING BTREE,
  KEY `candidateDetail_countryId` (`countryId`) USING BTREE,
  KEY `candidateDetail_studentTypeId` (`studentTypeId`),
  CONSTRAINT `candidateDetail_candidateUserId` FOREIGN KEY (`candidateUserId`) REFERENCES `candidateUser` (`candidateUserId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `candidateDetail_cityId` FOREIGN KEY (`cityId`) REFERENCES `city` (`cityId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `candidateDetail_countryId` FOREIGN KEY (`countryId`) REFERENCES `country` (`countryId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `candidateDetail_stateId` FOREIGN KEY (`stateId`) REFERENCES `state` (`stateId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `candidateDetail_studentTypeId` FOREIGN KEY (`studentTypeId`) REFERENCES `studentType` (`studentTypeId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `candidateDocument`
--

DROP TABLE IF EXISTS `candidateDocument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidateDocument` (
  `candidateDocumentId` bigint(20) NOT NULL AUTO_INCREMENT,
  `candidateUserId` bigint(20) DEFAULT NULL,
  `documentName` varchar(200) DEFAULT NULL,
  `documentPath` varchar(1000) DEFAULT NULL,
  `documentMimeType` varchar(6) DEFAULT NULL,
  `documentTypeId` smallint(6) DEFAULT NULL,
  `eTag` varchar(1000) DEFAULT NULL,
  `fileStatus` tinyint(4) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`candidateDocumentId`),
  KEY `candidateDocument_candidateUserId` (`candidateUserId`) USING BTREE,
  KEY `candidateDocument_documentTypeId` (`documentTypeId`) USING BTREE,
  CONSTRAINT `candidateDocument_candidateUserId` FOREIGN KEY (`candidateUserId`) REFERENCES `candidateUser` (`candidateUserId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `candidateDocument_documentTypeId` FOREIGN KEY (`documentTypeId`) REFERENCES `documentType` (`documentTypeId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2077 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `candidateEmergencyContact`
--

DROP TABLE IF EXISTS `candidateEmergencyContact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidateEmergencyContact` (
  `canEmergencyContactId` bigint(20) NOT NULL AUTO_INCREMENT,
  `candidateUserId` bigint(20) DEFAULT NULL,
  `emgncyContactPerson` longtext,
  `emgncyContactReltn` longtext,
  `emgncyContactPhone` longtext,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`canEmergencyContactId`),
  KEY `candidateEmergencyContact_candidateUserId` (`candidateUserId`) USING BTREE,
  CONSTRAINT `candidateEmergencyContact_candidateUserId` FOREIGN KEY (`candidateUserId`) REFERENCES `candidateUser` (`candidateUserId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=320 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `candidateEmpAvailWorkingTime`
--

DROP TABLE IF EXISTS `candidateEmpAvailWorkingTime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidateEmpAvailWorkingTime` (
  `candidateUserId` bigint(20) NOT NULL,
  `dayId` tinyint(4) NOT NULL,
  `timeId` smallint(6) NOT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  KEY `candidateEmpAvailWorkingT_timeId` (`timeId`) USING BTREE,
  KEY `candidateEmpAvailWorkingT_candidateUserId` (`candidateUserId`) USING BTREE,
  KEY `candidateEmpAvailWorkingT_dayId` (`dayId`) USING BTREE,
  CONSTRAINT `candidateEmpAvailWorkingT_candidateUserId` FOREIGN KEY (`candidateUserId`) REFERENCES `candidateUser` (`candidateUserId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `candidateEmpAvailWorkingT_dayId` FOREIGN KEY (`dayId`) REFERENCES `timeSheetweekEnd` (`weekEndDayId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `candidateEmpAvailWorkingT_timeId` FOREIGN KEY (`timeId`) REFERENCES `scTime` (`timeId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `candidateEmpAvailability`
--

DROP TABLE IF EXISTS `candidateEmpAvailability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidateEmpAvailability` (
  `candidateUserId` bigint(20) NOT NULL,
  `availableStartDate` datetime DEFAULT NULL,
  `periodId` int(11) DEFAULT NULL,
  `employmentTypeId` int(11) DEFAULT NULL,
  `availableEndDate` datetime DEFAULT NULL,
  `shiftJob` bit(1) DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`candidateUserId`),
  KEY `candidateEmpAvailability_employmentTypeId` (`employmentTypeId`) USING BTREE,
  KEY `candidateEmpAvailability_periodId` (`periodId`) USING BTREE,
  CONSTRAINT `candidateEmpAvailability_candidateUserId` FOREIGN KEY (`candidateUserId`) REFERENCES `candidateUser` (`candidateUserId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `candidateEmpAvailability_employmentTypeId` FOREIGN KEY (`employmentTypeId`) REFERENCES `employmentType` (`employmentTypeId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `candidateEmpAvailability_periodId` FOREIGN KEY (`periodId`) REFERENCES `period` (`periodId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `candidateEmpDefinedSkill`
--

DROP TABLE IF EXISTS `candidateEmpDefinedSkill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidateEmpDefinedSkill` (
  `candidateEmpDefinedSkillId` bigint(20) NOT NULL AUTO_INCREMENT,
  `candidateUserId` bigint(20) NOT NULL,
  `skillName` varchar(150) NOT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`candidateEmpDefinedSkillId`),
  KEY `candidateEmpDefinedSkill_candidateUserId` (`candidateUserId`) USING BTREE,
  CONSTRAINT `candidateEmpDefinedSkill_candidateUserId` FOREIGN KEY (`candidateUserId`) REFERENCES `candidateUser` (`candidateUserId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=866 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `candidateEmpProfile`
--

DROP TABLE IF EXISTS `candidateEmpProfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidateEmpProfile` (
  `candidateEmpProfileId` bigint(20) NOT NULL AUTO_INCREMENT,
  `candidateUserId` bigint(20) NOT NULL,
  `employmentProfileID` smallint(6) NOT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT NULL,
  `showInPreference` bit(1) DEFAULT b'1',
  `guid` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`candidateEmpProfileId`),
  KEY `candidateEmpProfile_candidateUserId` (`candidateUserId`) USING BTREE,
  KEY `candidateEmpProfile_employmentProfileID` (`employmentProfileID`) USING BTREE,
  CONSTRAINT `candidateEmpProfile_candidateUserId` FOREIGN KEY (`candidateUserId`) REFERENCES `candidateUser` (`candidateUserId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `candidateEmpProfile_employmentProfileID` FOREIGN KEY (`employmentProfileID`) REFERENCES `employmentProfile` (`employmentProfileId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6686 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `candidateEmpProfileDocument`
--

DROP TABLE IF EXISTS `candidateEmpProfileDocument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidateEmpProfileDocument` (
  `candidateEmpProfileDocId` bigint(20) NOT NULL AUTO_INCREMENT,
  `candidateEmpProfileId` bigint(20) DEFAULT NULL,
  `documentName` varchar(200) DEFAULT NULL,
  `documentPath` varchar(1000) NOT NULL,
  `documentMimeType` varchar(6) DEFAULT NULL,
  `eTag` varchar(1000) DEFAULT NULL,
  `fileStatus` tinyint(4) NOT NULL DEFAULT '1',
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `isDeleted` bit(1) NOT NULL DEFAULT b'0',
  `guid` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`candidateEmpProfileDocId`),
  KEY `candidateEmpProfileDocume_candidateEmpProfileId` (`candidateEmpProfileId`) USING BTREE,
  CONSTRAINT `candidateEmpProfileDocume_candidateEmpProfileId` FOREIGN KEY (`candidateEmpProfileId`) REFERENCES `candidateEmpProfile` (`candidateEmpProfileId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=569 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `candidateEmpProfileExpSkill`
--

DROP TABLE IF EXISTS `candidateEmpProfileExpSkill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidateEmpProfileExpSkill` (
  `candidateEmpProfileSkillId` bigint(20) NOT NULL AUTO_INCREMENT,
  `candidateEmpProfileExpId` bigint(20) NOT NULL,
  `skillId` int(11) DEFAULT NULL,
  `isOther` bit(1) DEFAULT NULL,
  `otherSkill` varchar(100) DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `guid` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`candidateEmpProfileSkillId`),
  KEY `candidateEmpProfileExpSki_candidateEmpProfileExpId` (`candidateEmpProfileExpId`) USING BTREE,
  KEY `candidateEmpProfileExpSki_skillId` (`skillId`) USING BTREE,
  CONSTRAINT `candidateEmpProfileExpSki_candidateEmpProfileExpId` FOREIGN KEY (`candidateEmpProfileExpId`) REFERENCES `candidateEmpProfileExperience` (`candidateEmpProfileExpId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `candidateEmpProfileExpSki_skillId` FOREIGN KEY (`skillId`) REFERENCES `skill` (`skillId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1488 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `candidateEmpProfileExperience`
--

DROP TABLE IF EXISTS `candidateEmpProfileExperience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidateEmpProfileExperience` (
  `candidateEmpProfileExpId` bigint(20) NOT NULL AUTO_INCREMENT,
  `candidateEmpProfileID` bigint(20) NOT NULL,
  `companyName` varchar(200) DEFAULT NULL,
  `commencementYear` smallint(6) DEFAULT NULL,
  `employmentTypeId` int(11) DEFAULT NULL,
  `periodId` int(11) DEFAULT NULL,
  `expMinMonth` smallint(6) DEFAULT NULL,
  `expMaxMonth` smallint(6) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `isDeleted` bit(1) NOT NULL DEFAULT b'0',
  `guid` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`candidateEmpProfileExpId`),
  KEY `candidateEmpProfileExperi_candidateEmpProfileID` (`candidateEmpProfileID`) USING BTREE,
  KEY `candidateEmpProfileExperi_employmentTypeId` (`employmentTypeId`) USING BTREE,
  KEY `candidateEmpProfileExperi_periodId` (`periodId`) USING BTREE,
  CONSTRAINT `candidateEmpProfileExperi_candidateEmpProfileID` FOREIGN KEY (`candidateEmpProfileID`) REFERENCES `candidateEmpProfile` (`candidateEmpProfileId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `candidateEmpProfileExperi_employmentTypeId` FOREIGN KEY (`employmentTypeId`) REFERENCES `employmentType` (`employmentTypeId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `candidateEmpProfileExperi_periodId` FOREIGN KEY (`periodId`) REFERENCES `period` (`periodId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4943 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `candidateEmpProfilePreference`
--

DROP TABLE IF EXISTS `candidateEmpProfilePreference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidateEmpProfilePreference` (
  `candidateEmpProfilePreferenceId` bigint(20) NOT NULL AUTO_INCREMENT,
  `candidateUserId` bigint(20) DEFAULT NULL,
  `employmentProfileID` smallint(6) NOT NULL,
  `industryId` bigint(20) DEFAULT NULL,
  `preferredPosition` varchar(100) DEFAULT NULL,
  `salaryPerId` smallint(6) DEFAULT NULL,
  `expectedMinSalary` decimal(18,2) DEFAULT NULL,
  `expMinSalaryCurrencyId` int(11) DEFAULT NULL,
  `isPrefered` bit(1) DEFAULT b'0',
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `isDeleted` bit(1) NOT NULL,
  PRIMARY KEY (`candidateEmpProfilePreferenceId`),
  KEY `candidateEmpProfilePrefer_expMinSalaryCurrencyId` (`expMinSalaryCurrencyId`) USING BTREE,
  KEY `candidateEmpProfilePrefer_industryId` (`industryId`) USING BTREE,
  KEY `candidateEmpProfilePrefer_salaryPerId` (`salaryPerId`) USING BTREE,
  KEY `candidateEmpProfilePrefer_candidateUserId` (`candidateUserId`) USING BTREE,
  KEY `candidateEmpProfilePrefer_employmentProfileID` (`employmentProfileID`) USING BTREE,
  CONSTRAINT `candidateEmpProfilePrefer_candidateUserId` FOREIGN KEY (`candidateUserId`) REFERENCES `candidateUser` (`candidateUserId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `candidateEmpProfilePrefer_employmentProfileID` FOREIGN KEY (`employmentProfileID`) REFERENCES `employmentProfile` (`employmentProfileId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `candidateEmpProfilePrefer_expMinSalaryCurrencyId` FOREIGN KEY (`expMinSalaryCurrencyId`) REFERENCES `currency` (`currencyId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `candidateEmpProfilePrefer_industryId` FOREIGN KEY (`industryId`) REFERENCES `industry` (`industryID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `candidateEmpProfilePrefer_salaryPerId` FOREIGN KEY (`salaryPerId`) REFERENCES `salaryPer` (`salaryPerId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8726 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `candidateGiveAwayRequests`
--

DROP TABLE IF EXISTS `candidateGiveAwayRequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidateGiveAwayRequests` (
  `requestId` bigint(20) NOT NULL AUTO_INCREMENT,
  `shiftOfferId` bigint(20) DEFAULT NULL,
  `candidateId` bigint(20) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `candidateStatus` tinyint(4) DEFAULT '1',
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `isNotified` bit(1) DEFAULT b'0',
  PRIMARY KEY (`requestId`),
  KEY `candidateGiveAwayRequests_candidateId` (`candidateId`) USING BTREE,
  KEY `candidateGiveAwayRequests_shiftOfferId` (`shiftOfferId`) USING BTREE,
  CONSTRAINT `candidateGiveAwayRequests_candidateUserId` FOREIGN KEY (`candidateId`) REFERENCES `candidateUser` (`candidateUserId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `candidateGiveAwayRequests_shiftOfferId` FOREIGN KEY (`shiftOfferId`) REFERENCES `candidateShiftOffer` (`shiftOfferId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16802 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `candidatePreferredCountry`
--

DROP TABLE IF EXISTS `candidatePreferredCountry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidatePreferredCountry` (
  `candidatePreferredCountryId` bigint(20) NOT NULL AUTO_INCREMENT,
  `candidateUserId` bigint(20) NOT NULL,
  `countryId` bigint(20) NOT NULL,
  `haveWorkEligibility` bit(1) DEFAULT NULL,
  `typeOfVisa` varchar(100) DEFAULT NULL,
  `stateId` bigint(20) DEFAULT NULL,
  `cityId` bigint(20) DEFAULT NULL,
  `isPrefered` bit(1) DEFAULT b'1',
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `isDeleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`candidatePreferredCountryId`),
  KEY `candidatePreferredCountry_candidateUserId` (`candidateUserId`) USING BTREE,
  KEY `candidatePreferredCountry_countryId` (`countryId`) USING BTREE,
  CONSTRAINT `candidatePreferredCountry_candidateUserId` FOREIGN KEY (`candidateUserId`) REFERENCES `candidateUser` (`candidateUserId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `candidatePreferredCountry_countryId` FOREIGN KEY (`countryId`) REFERENCES `country` (`countryId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=688 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `candidatePreferredCountryDocument`
--

DROP TABLE IF EXISTS `candidatePreferredCountryDocument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidatePreferredCountryDocument` (
  `candidatePreferredCountryDocumentId` bigint(20) NOT NULL AUTO_INCREMENT,
  `candidatePreferredCountryId` bigint(20) NOT NULL,
  `documentName` varchar(200) DEFAULT NULL,
  `documentPath` varchar(1000) DEFAULT NULL,
  `documentMimeType` varchar(6) DEFAULT NULL,
  `eTag` varchar(1000) DEFAULT NULL,
  `fileStatus` tinyint(4) NOT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `isDeleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`candidatePreferredCountryDocumentId`),
  KEY `candidatePreferredCountry_candidatePreferredCountryId` (`candidatePreferredCountryId`) USING BTREE,
  CONSTRAINT `candidatePreferredCountry_candidatePreferredCountryId` FOREIGN KEY (`candidatePreferredCountryId`) REFERENCES `candidatePreferredCountry` (`candidatePreferredCountryId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=307 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `candidateQualification`
--

DROP TABLE IF EXISTS `candidateQualification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidateQualification` (
  `candidateQualificationId` bigint(20) NOT NULL AUTO_INCREMENT,
  `candidateUserId` bigint(20) NOT NULL,
  `courseId` int(11) DEFAULT NULL,
  `institutionName` varchar(100) DEFAULT NULL,
  `yearOfCompletion` smallint(6) DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `isDeleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`candidateQualificationId`),
  KEY `candidateQualification_candidateUserId` (`candidateUserId`) USING BTREE,
  KEY `candidateQualification_courseId` (`courseId`) USING BTREE,
  CONSTRAINT `candidateQualification_candidateUserId` FOREIGN KEY (`candidateUserId`) REFERENCES `candidateUser` (`candidateUserId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `candidateQualification_courseId` FOREIGN KEY (`courseId`) REFERENCES `course` (`courseId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=746 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `candidateQualificationDocument`
--

DROP TABLE IF EXISTS `candidateQualificationDocument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidateQualificationDocument` (
  `candidateQualificationDocumentId` bigint(20) NOT NULL AUTO_INCREMENT,
  `candidateQualificationId` bigint(20) NOT NULL,
  `documentName` varchar(200) DEFAULT NULL,
  `documentPath` varchar(1000) NOT NULL,
  `documentMimeType` varchar(6) DEFAULT NULL,
  `eTag` varchar(1000) DEFAULT NULL,
  `fileStatus` tinyint(4) NOT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `isDeleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`candidateQualificationDocumentId`),
  KEY `candidateQualificationDoc_candidateQualificationId` (`candidateQualificationId`) USING BTREE,
  CONSTRAINT `candidateQualificationDoc_candidateQualificationId` FOREIGN KEY (`candidateQualificationId`) REFERENCES `candidateQualification` (`candidateQualificationId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=505 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `candidateRosterDetails`
--

DROP TABLE IF EXISTS `candidateRosterDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidateRosterDetails` (
  `candidateId` bigint(20) NOT NULL,
  `businessSiteId` bigint(20) DEFAULT NULL,
  `departmentId` bigint(20) DEFAULT NULL,
  `jobProfileId` bigint(20) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT b'0',
  `businessId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`candidateId`),
  KEY `candidaterosterdetails_ibfk_2` (`businessSiteId`) USING BTREE,
  KEY `candidaterosterdetails_ibfk_3` (`departmentId`) USING BTREE,
  KEY `candidaterosterdetails_ibfk_4` (`jobProfileId`) USING BTREE,
  KEY `candidaterosterdetails_ibfk_5` (`businessId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `candidateScreenSectionDetail`
--

DROP TABLE IF EXISTS `candidateScreenSectionDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidateScreenSectionDetail` (
  `candidateUserId` bigint(20) NOT NULL,
  `screenSectionId` smallint(6) NOT NULL,
  `isCompleted` bigint(20) DEFAULT '0',
  PRIMARY KEY (`candidateUserId`,`screenSectionId`),
  KEY `candidateScreenSectionDet_screenSectionId` (`screenSectionId`) USING BTREE,
  CONSTRAINT `candidateScreenSectionDet_candidateUserId` FOREIGN KEY (`candidateUserId`) REFERENCES `candidateUser` (`candidateUserId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `candidateScreenSectionDet_screenSectionId` FOREIGN KEY (`screenSectionId`) REFERENCES `screenSection` (`screenSectionId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `candidateSearchExp`
--

DROP TABLE IF EXISTS `candidateSearchExp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidateSearchExp` (
  `candidateSearchExpId` smallint(6) NOT NULL AUTO_INCREMENT,
  `defaultLanguageId` int(11) DEFAULT NULL,
  PRIMARY KEY (`candidateSearchExpId`),
  KEY `candidateSearchExp_defaultLanguageId` (`defaultLanguageId`) USING BTREE,
  CONSTRAINT `candidateSearchExp_defaultLanguageId` FOREIGN KEY (`defaultLanguageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `candidateSearchExpLocale`
--

DROP TABLE IF EXISTS `candidateSearchExpLocale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidateSearchExpLocale` (
  `candidateSearchExpId` smallint(6) NOT NULL,
  `candidateSearchExp` varchar(50) NOT NULL,
  `languageId` int(11) NOT NULL,
  `minExpMonth` smallint(6) DEFAULT NULL,
  `maxExpMonth` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`candidateSearchExpId`,`languageId`),
  KEY `candidateSearchExpLocale_languageId` (`languageId`) USING BTREE,
  KEY `PK_candidateSearchExpLocale` (`candidateSearchExpId`,`languageId`) USING BTREE,
  CONSTRAINT `candidateSearchExpLocale_candidateSearchExpId` FOREIGN KEY (`candidateSearchExpId`) REFERENCES `candidateSearchExp` (`candidateSearchExpId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `candidateSearchExpLocale_languageId` FOREIGN KEY (`languageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `candidateShiftBreaks`
--

DROP TABLE IF EXISTS `candidateShiftBreaks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidateShiftBreaks` (
  `shiftbreakId` bigint(20) NOT NULL AUTO_INCREMENT,
  `shiftOfferId` bigint(20) DEFAULT NULL,
  `startTime` datetime NOT NULL,
  `endTime` datetime NOT NULL,
  `breakType` varchar(10) DEFAULT NULL,
  `isDeleted` bit(1) NOT NULL DEFAULT b'0',
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`shiftbreakId`),
  KEY `candidateShiftBreaks_ShiftOfferId` (`shiftOfferId`),
  CONSTRAINT `candidateShiftBreaks_ShiftOfferId` FOREIGN KEY (`shiftOfferId`) REFERENCES `candidateShiftOffer` (`shiftOfferId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2051 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `candidateShiftCancel`
--

DROP TABLE IF EXISTS `candidateShiftCancel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidateShiftCancel` (
  `candidateShiftCancelId` bigint(20) NOT NULL AUTO_INCREMENT,
  `shiftOfferId` bigint(20) DEFAULT NULL,
  `candidateUserId` bigint(20) DEFAULT NULL,
  `shiftStartDateTime` datetime DEFAULT NULL,
  `shiftEndDateTime` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `isNotified` tinyint(4) DEFAULT '0',
  `AcceptedCandidateUserId` bigint(20) DEFAULT NULL,
  `comment` varchar(2000) DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`candidateShiftCancelId`),
  KEY `candidateShiftCancel_ShiftOfferId` (`shiftOfferId`) USING BTREE,
  CONSTRAINT `candidateShiftCancel_ShiftOfferId` FOREIGN KEY (`shiftOfferId`) REFERENCES `candidateShiftOffer` (`shiftOfferId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2889 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `candidateShiftOffer`
--

DROP TABLE IF EXISTS `candidateShiftOffer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidateShiftOffer` (
  `shiftOfferId` bigint(20) NOT NULL AUTO_INCREMENT,
  `candidateId` bigint(20) DEFAULT NULL,
  `exchangedShiftOfferId` bigint(20) DEFAULT NULL,
  `jobProfileId` bigint(20) DEFAULT NULL,
  `departmentId` bigint(20) NOT NULL,
  `subClassificationId` int(11) NOT NULL,
  `businessSiteId` bigint(20) NOT NULL,
  `shiftStartDateTime` datetime NOT NULL,
  `shiftEndDateTime` datetime NOT NULL,
  `actualShiftStartDateTime` datetime NOT NULL,
  `actualShiftEndDateTime` datetime NOT NULL,
  `isFlexibleShiftTime` bit(1) NOT NULL DEFAULT b'0',
  `shiftEndTimeType` tinyint(4) DEFAULT NULL,
  `shiftEndTimeValue` varchar(30) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `comment` varchar(2000) DEFAULT NULL,
  `sourceModule` varchar(20) NOT NULL,
  `wageCurrencyId` int(11) DEFAULT NULL,
  `wage` decimal(10,4) DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `isDeleted` bit(1) NOT NULL DEFAULT b'0',
  `isNotified` bit(1) DEFAULT b'0',
  `isShiftAcceptRequired` bit(1) DEFAULT b'1',
  `isTimeSheetSubmitRequired` bit(1) DEFAULT b'1',
  `isCantWork` bit(1) DEFAULT b'0',
  PRIMARY KEY (`shiftOfferId`),
  KEY `candidateShiftOffer_exchangedShiftOfferId` (`exchangedShiftOfferId`) USING BTREE,
  KEY `candidateShiftOffer_businessSiteId` (`businessSiteId`) USING BTREE,
  KEY `candidateShiftOffer_departmentId` (`departmentId`) USING BTREE,
  KEY `candidateShiftOffer_jobProfileId` (`jobProfileId`) USING BTREE,
  KEY `candidateShiftOffer_subClassificationId` (`subClassificationId`) USING BTREE,
  KEY `candidateShiftOffer_candidateId` (`candidateId`,`shiftStartDateTime`) USING BTREE,
  KEY `candidateShiftOffer_wageCurrencyId` (`wageCurrencyId`),
  CONSTRAINT `candidateShiftOffer_businessSiteId` FOREIGN KEY (`businessSiteId`) REFERENCES `businessSite` (`businessSiteId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `candidateShiftOffer_departmentId` FOREIGN KEY (`departmentId`) REFERENCES `businessDepartment` (`departmentId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `candidateShiftOffer_jobProfileId` FOREIGN KEY (`jobProfileId`) REFERENCES `jobProfile` (`jobProfileId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `candidateShiftOffer_subClassificationId` FOREIGN KEY (`subClassificationId`) REFERENCES `jobSubClassification` (`jobSubClassificationId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `candidateShiftOffer_wageCurrencyId` FOREIGN KEY (`wageCurrencyId`) REFERENCES `currency` (`currencyId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=49296 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `candidateShiftOfferHistory`
--

DROP TABLE IF EXISTS `candidateShiftOfferHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidateShiftOfferHistory` (
  `candidateShiftOfferHistoryId` bigint(20) NOT NULL AUTO_INCREMENT,
  `shiftOfferId` bigint(20) DEFAULT NULL,
  `candidateUserId` bigint(20) DEFAULT NULL,
  `exchangedShiftOfferId` bigint(20) DEFAULT NULL,
  `shiftStartDateTime` datetime DEFAULT NULL,
  `shiftEndDateTime` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `isNotified` tinyint(4) DEFAULT '0',
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `isDeleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`candidateShiftOfferHistoryId`),
  KEY `candidateShiftOfferHistory_CandidateId` (`candidateUserId`) USING BTREE,
  KEY `candidateShiftOfferHistory_ShiftOfferId` (`shiftOfferId`) USING BTREE,
  CONSTRAINT `candidateShiftOfferHistory_CandidateId` FOREIGN KEY (`candidateUserId`) REFERENCES `scUser` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `candidateShiftOfferHistory_ShiftOfferId` FOREIGN KEY (`shiftOfferId`) REFERENCES `candidateShiftOffer` (`shiftOfferId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4186 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `candidateTemp`
--

DROP TABLE IF EXISTS `candidateTemp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidateTemp` (
  `candidateTempId` bigint(20) NOT NULL AUTO_INCREMENT,
  `fileId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT '0',
  `firstName` varchar(100) DEFAULT NULL,
  `middleName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `dob` longtext,
  `gender` varchar(10) DEFAULT NULL,
  `mobileNo` longtext,
  `emailId` varchar(100) DEFAULT NULL,
  `streetAddressLine1` longtext,
  `streetAddressLine2` longtext,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `postCode` longtext,
  `country` varchar(100) DEFAULT NULL,
  `recordStatus` tinyint(4) DEFAULT '0',
  `errorMessage` varchar(1000) DEFAULT NULL,
  `latitude` decimal(21,17) DEFAULT NULL,
  `longitude` decimal(21,17) DEFAULT NULL,
  `encryptionKey` varchar(100) DEFAULT NULL,
  `password` longtext,
  `userPassword` longtext,
  `genderId` smallint(6) DEFAULT NULL,
  `cityId` bigint(20) DEFAULT NULL,
  `stateId` bigint(20) DEFAULT NULL,
  `countryId` bigint(20) NOT NULL DEFAULT '0',
  `userUIId` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`candidateTempId`)
) ENGINE=InnoDB AUTO_INCREMENT=11733 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `candidateTimesheet`
--

DROP TABLE IF EXISTS `candidateTimesheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidateTimesheet` (
  `timeSheetId` bigint(20) NOT NULL AUTO_INCREMENT,
  `shiftOfferId` bigint(20) NOT NULL,
  `shiftStartDateTime` datetime DEFAULT NULL,
  `shiftEndDateTime` datetime DEFAULT NULL,
  `candidateId` bigint(20) NOT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `candidateComment` varchar(2000) DEFAULT NULL,
  `disputeComment` varchar(2000) DEFAULT NULL,
  `costcenterParentId` bigint(20) DEFAULT NULL,
  `costcenterChildId` bigint(20) DEFAULT NULL,
  `actionBy` bigint(20) DEFAULT NULL,
  `actionOn` datetime DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `isTSSubmitedByBeacon` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`timeSheetId`),
  KEY `candidateTimesheet_candidate` (`candidateId`) USING BTREE,
  KEY `candidateTimesheet_shiftOffer` (`shiftOfferId`) USING BTREE,
  CONSTRAINT `candidateTimesheet_candidate` FOREIGN KEY (`candidateId`) REFERENCES `scUser` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `candidateTimesheet_shiftOffer` FOREIGN KEY (`shiftOfferId`) REFERENCES `candidateShiftOffer` (`shiftOfferId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=39048 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `candidateTimesheetBreak`
--

DROP TABLE IF EXISTS `candidateTimesheetBreak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidateTimesheetBreak` (
  `timesheetBreakId` bigint(20) NOT NULL AUTO_INCREMENT,
  `timeSheetId` bigint(20) DEFAULT NULL,
  `startTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `breakType` varchar(10) DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`timesheetBreakId`),
  KEY `candidateTimesheetBreak_ibfk_1` (`timeSheetId`) USING BTREE,
  CONSTRAINT `candidateTimesheetBreak_ibfk_1` FOREIGN KEY (`timeSheetId`) REFERENCES `candidateTimesheet` (`timeSheetId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=827 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `candidateTimesheetComments`
--

DROP TABLE IF EXISTS `candidateTimesheetComments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidateTimesheetComments` (
  `timeSheetCommentId` bigint(20) NOT NULL AUTO_INCREMENT,
  `timeSheetId` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL,
  `comment` varchar(2000) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `isUnread` bit(1) DEFAULT b'0',
  PRIMARY KEY (`timeSheetCommentId`),
  KEY `candidateTimesheetComments_timeSheetId` (`timeSheetId`) USING BTREE,
  KEY `candidateTimesheetComments_userId` (`userId`) USING BTREE,
  CONSTRAINT `candidateTimesheetComments_timeSheetId` FOREIGN KEY (`timeSheetId`) REFERENCES `candidateTimesheet` (`timeSheetId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `candidateTimesheetComments_userId` FOREIGN KEY (`userId`) REFERENCES `scUser` (`userId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1159 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `candidateUnavailability`
--

DROP TABLE IF EXISTS `candidateUnavailability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidateUnavailability` (
  `unavailabilityId` bigint(20) NOT NULL AUTO_INCREMENT,
  `candidateId` bigint(20) DEFAULT NULL,
  `unavailableDate` date DEFAULT NULL,
  `startTime` time DEFAULT NULL,
  `endTime` time DEFAULT NULL,
  `reason` varchar(2000) DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT b'0',
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`unavailabilityId`),
  KEY `candidateUnavailability_ibfk_1` (`candidateId`,`unavailableDate`) USING BTREE,
  CONSTRAINT `candidateUnavailability_ibfk_1` FOREIGN KEY (`candidateId`) REFERENCES `scUser` (`userId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2405 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `candidateUser`
--

DROP TABLE IF EXISTS `candidateUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidateUser` (
  `candidateUserId` bigint(20) NOT NULL,
  `pin` longtext,
  `likePromotionalMails` bit(1) DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `isDeleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`candidateUserId`),
  CONSTRAINT `candidateUser_candidateUserId` FOREIGN KEY (`candidateUserId`) REFERENCES `scUser` (`userId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `candidateWfInstance`
--

DROP TABLE IF EXISTS `candidateWfInstance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidateWfInstance` (
  `candidateWfInstanceId` bigint(20) NOT NULL AUTO_INCREMENT,
  `workflowInstanceId` bigint(20) DEFAULT NULL,
  `candidateUserId` bigint(20) DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  PRIMARY KEY (`candidateWfInstanceId`),
  KEY `candidateWfInstance_candidateUserId` (`candidateUserId`) USING BTREE,
  KEY `candidateWfInstance_workflowInstanceId` (`workflowInstanceId`) USING BTREE,
  CONSTRAINT `candidateWfInstance_candidateUserId` FOREIGN KEY (`candidateUserId`) REFERENCES `candidateUser` (`candidateUserId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `candidateWfInstance_workflowInstanceId` FOREIGN KEY (`workflowInstanceId`) REFERENCES `workFlowInstance` (`workflowInstanceId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3606 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `candidateWorkPreference`
--

DROP TABLE IF EXISTS `candidateWorkPreference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidateWorkPreference` (
  `candidateWorkPreferenceId` bigint(20) NOT NULL AUTO_INCREMENT,
  `candidateUserId` bigint(20) NOT NULL,
  `startDateTime` datetime NOT NULL,
  `endDateTime` datetime NOT NULL,
  `isDeleted` bit(1) NOT NULL DEFAULT b'0',
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`candidateWorkPreferenceId`),
  KEY `candidateWorkPreference_candidateUserId` (`candidateUserId`),
  CONSTRAINT `candidateWorkPreference_candidateUserId` FOREIGN KEY (`candidateUserId`) REFERENCES `candidateUser` (`candidateUserId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=325 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `cityId` bigint(20) NOT NULL AUTO_INCREMENT,
  `defaultLanguageId` int(11) DEFAULT NULL,
  `latitude` decimal(18,10) DEFAULT NULL,
  `longitude` decimal(18,10) DEFAULT NULL,
  PRIMARY KEY (`cityId`),
  KEY `city_defaultLanguageId` (`defaultLanguageId`) USING BTREE,
  CONSTRAINT `city_defaultLanguageId` FOREIGN KEY (`defaultLanguageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=27939 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cityLocale`
--

DROP TABLE IF EXISTS `cityLocale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cityLocale` (
  `cityId` bigint(20) NOT NULL,
  `languageId` int(11) NOT NULL,
  `cityName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cityId`,`languageId`),
  KEY `cityLocale_languageId` (`languageId`) USING BTREE,
  CONSTRAINT `cityLocale_cityId` FOREIGN KEY (`cityId`) REFERENCES `city` (`cityId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `cityLocale_languageId` FOREIGN KEY (`languageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cityTimezone`
--

DROP TABLE IF EXISTS `cityTimezone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cityTimezone` (
  `cityId` bigint(20) NOT NULL,
  `timezone` varchar(50) DEFAULT NULL,
  `timezoneOffset` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contactType`
--

DROP TABLE IF EXISTS `contactType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contactType` (
  `contactTypeId` smallint(6) NOT NULL AUTO_INCREMENT,
  `defaultLanguageId` int(11) DEFAULT NULL,
  PRIMARY KEY (`contactTypeId`),
  KEY `contactType_defaultLanguageId` (`defaultLanguageId`) USING BTREE,
  CONSTRAINT `contactType_defaultLanguageId` FOREIGN KEY (`defaultLanguageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contactTypeLocale`
--

DROP TABLE IF EXISTS `contactTypeLocale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contactTypeLocale` (
  `contactTypeId` smallint(6) NOT NULL,
  `contactType` char(100) DEFAULT NULL,
  `languageId` int(11) NOT NULL,
  PRIMARY KEY (`contactTypeId`,`languageId`),
  KEY `contactTypeLocale_languageId` (`languageId`) USING BTREE,
  CONSTRAINT `contactTypeLocale_languageId` FOREIGN KEY (`languageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `countryId` bigint(20) NOT NULL AUTO_INCREMENT,
  `defaultLanguageId` int(11) DEFAULT NULL,
  `countryDateFormat` varchar(15) DEFAULT NULL,
  `proximityCalculationValue` decimal(7,5) NOT NULL DEFAULT '1.60934',
  `proximityCalculatedIn` varchar(10) NOT NULL DEFAULT 'km',
  `weekStartDayId` tinyint(4) DEFAULT '1',
  `countryISDCode` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`countryId`),
  KEY `country_defaultLanguageId` (`defaultLanguageId`) USING BTREE,
  KEY `country_weekStartDayId_idx` (`weekStartDayId`) USING BTREE,
  CONSTRAINT `country_defaultLanguageId` FOREIGN KEY (`defaultLanguageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `country_weekStartDayId` FOREIGN KEY (`weekStartDayId`) REFERENCES `weekDay` (`weekDayId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `countryLocale`
--

DROP TABLE IF EXISTS `countryLocale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countryLocale` (
  `countryId` bigint(20) NOT NULL,
  `languageId` int(11) NOT NULL,
  `countryName` varchar(50) DEFAULT NULL,
  `countryCode` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`countryId`,`languageId`),
  KEY `countryLocale_languageId` (`languageId`) USING BTREE,
  CONSTRAINT `countryLocale_countryId` FOREIGN KEY (`countryId`) REFERENCES `country` (`countryId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `countryLocale_languageId` FOREIGN KEY (`languageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `courseId` int(11) NOT NULL,
  `defaultLanguageId` int(11) DEFAULT NULL,
  PRIMARY KEY (`courseId`),
  KEY `course_defaultLanguageId` (`defaultLanguageId`) USING BTREE,
  CONSTRAINT `course_defaultLanguageId` FOREIGN KEY (`defaultLanguageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `courseLocale`
--

DROP TABLE IF EXISTS `courseLocale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courseLocale` (
  `courseId` int(11) NOT NULL,
  `courseName` varchar(200) DEFAULT NULL,
  `languageId` int(11) NOT NULL,
  PRIMARY KEY (`courseId`,`languageId`),
  KEY `courseLocale_languageId` (`languageId`) USING BTREE,
  CONSTRAINT `courseLocale_courseId` FOREIGN KEY (`courseId`) REFERENCES `course` (`courseId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `courseLocale_languageId` FOREIGN KEY (`languageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency` (
  `currencyId` int(11) NOT NULL AUTO_INCREMENT,
  `defaultLanguageId` int(11) DEFAULT NULL,
  `countryId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`currencyId`),
  KEY `currency_defaultLanguageId` (`defaultLanguageId`) USING BTREE,
  CONSTRAINT `currency_defaultLanguageId` FOREIGN KEY (`defaultLanguageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=245 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `currencyLocale`
--

DROP TABLE IF EXISTS `currencyLocale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currencyLocale` (
  `currencyId` int(11) NOT NULL,
  `languageId` int(11) NOT NULL,
  `currencyName` varchar(100) DEFAULT NULL,
  `currencyCode` varchar(10) DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`currencyId`,`languageId`),
  KEY `currencyLocale_languageId` (`languageId`) USING BTREE,
  CONSTRAINT `currencyLocale_currencyId` FOREIGN KEY (`currencyId`) REFERENCES `currency` (`currencyId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `currencyLocale_languageId` FOREIGN KEY (`languageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `departmentGroupName`
--

DROP TABLE IF EXISTS `departmentGroupName`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departmentGroupName` (
  `departmentGroupNameId` tinyint(4) NOT NULL AUTO_INCREMENT,
  `defaultLanguageId` int(11) DEFAULT NULL,
  PRIMARY KEY (`departmentGroupNameId`),
  KEY `departmentGroupName_defaultLanguageId` (`defaultLanguageId`) USING BTREE,
  CONSTRAINT `departmentGroupName_defaultLanguageId` FOREIGN KEY (`defaultLanguageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `departmentGroupNameLocale`
--

DROP TABLE IF EXISTS `departmentGroupNameLocale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departmentGroupNameLocale` (
  `departmentGroupNameId` tinyint(4) NOT NULL,
  `departmentGroupName` varchar(50) DEFAULT NULL,
  `languageId` int(11) NOT NULL,
  PRIMARY KEY (`departmentGroupNameId`,`languageId`),
  KEY `departmentGroupNameLocale_languageId` (`languageId`) USING BTREE,
  CONSTRAINT `departmentGroupNameLocale_departmentGroupNameId` FOREIGN KEY (`departmentGroupNameId`) REFERENCES `departmentGroupName` (`departmentGroupNameId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `departmentGroupNameLocale_languageId` FOREIGN KEY (`languageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deviceType`
--

DROP TABLE IF EXISTS `deviceType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deviceType` (
  `deviceTypeID` smallint(6) NOT NULL AUTO_INCREMENT,
  `defaultLanguageId` int(11) DEFAULT NULL,
  PRIMARY KEY (`deviceTypeID`),
  KEY `deviceType_defaultLanguageId` (`defaultLanguageId`) USING BTREE,
  CONSTRAINT `deviceType_defaultLanguageId` FOREIGN KEY (`defaultLanguageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deviceTypeLocale`
--

DROP TABLE IF EXISTS `deviceTypeLocale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deviceTypeLocale` (
  `deviceTypeID` smallint(6) NOT NULL,
  `deviceType` varchar(100) DEFAULT NULL,
  `languageId` int(11) NOT NULL,
  PRIMARY KEY (`deviceTypeID`,`languageId`),
  KEY `deviceTypeLocale_languageId` (`languageId`) USING BTREE,
  CONSTRAINT `deviceTypeLocale_deviceTypeID` FOREIGN KEY (`deviceTypeID`) REFERENCES `deviceType` (`deviceTypeID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `deviceTypeLocale_languageId` FOREIGN KEY (`languageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `documentMimeType`
--

DROP TABLE IF EXISTS `documentMimeType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documentMimeType` (
  `documentMimeTypeId` smallint(6) NOT NULL,
  `defaultLanguageId` int(11) DEFAULT NULL,
  PRIMARY KEY (`documentMimeTypeId`),
  KEY `documentMimeType_defaultLanguageId` (`defaultLanguageId`) USING BTREE,
  CONSTRAINT `documentMimeType_defaultLanguageId` FOREIGN KEY (`defaultLanguageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `documentMimeTypeLocale`
--

DROP TABLE IF EXISTS `documentMimeTypeLocale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documentMimeTypeLocale` (
  `documentMimeTypeId` smallint(6) NOT NULL,
  `documentMimeType` varchar(6) DEFAULT NULL,
  `languageId` int(11) NOT NULL,
  PRIMARY KEY (`documentMimeTypeId`,`languageId`),
  KEY `documentMimeTypeLocale_languageId` (`languageId`) USING BTREE,
  CONSTRAINT `documentMimeTypeLocale_documentMimeTypeId` FOREIGN KEY (`documentMimeTypeId`) REFERENCES `documentMimeType` (`documentMimeTypeId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `documentMimeTypeLocale_languageId` FOREIGN KEY (`languageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `documentType`
--

DROP TABLE IF EXISTS `documentType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documentType` (
  `documentTypeId` smallint(6) NOT NULL AUTO_INCREMENT,
  `defaultLanguageId` int(11) DEFAULT NULL,
  PRIMARY KEY (`documentTypeId`),
  KEY `documentType_defaultLanguageId` (`defaultLanguageId`) USING BTREE,
  CONSTRAINT `documentType_defaultLanguageId` FOREIGN KEY (`defaultLanguageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `documentTypeLocale`
--

DROP TABLE IF EXISTS `documentTypeLocale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documentTypeLocale` (
  `documentTypeId` smallint(6) NOT NULL,
  `documentTypeName` varchar(50) DEFAULT NULL,
  `languageId` int(11) NOT NULL,
  PRIMARY KEY (`documentTypeId`,`languageId`),
  KEY `documentTypeLocale_languageId` (`languageId`) USING BTREE,
  CONSTRAINT `documentTypeLocale_documentTypeId` FOREIGN KEY (`documentTypeId`) REFERENCES `documentType` (`documentTypeId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `documentTypeLocale_languageId` FOREIGN KEY (`languageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employmentProfile`
--

DROP TABLE IF EXISTS `employmentProfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employmentProfile` (
  `employmentProfileId` smallint(6) NOT NULL AUTO_INCREMENT,
  `defaultLanguageId` int(11) DEFAULT NULL,
  PRIMARY KEY (`employmentProfileId`),
  KEY `employmentProfile_defaultLanguageId` (`defaultLanguageId`) USING BTREE,
  CONSTRAINT `employmentProfile_ibfk_1` FOREIGN KEY (`defaultLanguageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employmentProfileLocale`
--

DROP TABLE IF EXISTS `employmentProfileLocale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employmentProfileLocale` (
  `employmentProfileId` smallint(6) NOT NULL,
  `employmentProfile` varchar(250) DEFAULT NULL,
  `languageId` int(11) NOT NULL,
  PRIMARY KEY (`employmentProfileId`,`languageId`),
  KEY `employmentProfileLocale_languageId` (`languageId`) USING BTREE,
  CONSTRAINT `employmentProfileLocale_ibfk_1` FOREIGN KEY (`employmentProfileId`) REFERENCES `employmentProfile` (`employmentProfileId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `employmentProfileLocale_ibfk_2` FOREIGN KEY (`languageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employmentType`
--

DROP TABLE IF EXISTS `employmentType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employmentType` (
  `employmentTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `defaultLanguageId` int(11) DEFAULT NULL,
  PRIMARY KEY (`employmentTypeId`),
  KEY `employmentType_defaultLanguageId` (`defaultLanguageId`) USING BTREE,
  CONSTRAINT `employmentType_defaultLanguageId` FOREIGN KEY (`defaultLanguageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employmentTypeLocale`
--

DROP TABLE IF EXISTS `employmentTypeLocale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employmentTypeLocale` (
  `employmentTypeId` int(11) NOT NULL,
  `employmentType` varchar(100) DEFAULT NULL,
  `languageId` int(11) NOT NULL,
  PRIMARY KEY (`employmentTypeId`,`languageId`),
  KEY `employmentTypeLocale_languageId` (`languageId`) USING BTREE,
  CONSTRAINT `employmentTypeLocale_employmentTypeId` FOREIGN KEY (`employmentTypeId`) REFERENCES `employmentType` (`employmentTypeId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `employmentTypeLocale_languageId` FOREIGN KEY (`languageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `estimatedDurationType`
--

DROP TABLE IF EXISTS `estimatedDurationType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estimatedDurationType` (
  `estDurationTypeId` smallint(6) NOT NULL AUTO_INCREMENT,
  `defaultLanguageId` int(11) DEFAULT NULL,
  PRIMARY KEY (`estDurationTypeId`),
  KEY `estimatedDurationType_defaultLanguageId` (`defaultLanguageId`) USING BTREE,
  CONSTRAINT `estimatedDurationType_defaultLanguageId` FOREIGN KEY (`defaultLanguageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `estimatedDurationTypeLocale`
--

DROP TABLE IF EXISTS `estimatedDurationTypeLocale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estimatedDurationTypeLocale` (
  `estDurationTypeId` smallint(6) NOT NULL,
  `estDurationType` varchar(50) DEFAULT NULL,
  `languageId` int(11) NOT NULL,
  PRIMARY KEY (`estDurationTypeId`,`languageId`),
  KEY `estimatedDurationTypeLoca_languageId` (`languageId`) USING BTREE,
  CONSTRAINT `estimatedDurationTypeLoca_estDurationTypeId` FOREIGN KEY (`estDurationTypeId`) REFERENCES `estimatedDurationType` (`estDurationTypeId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `estimatedDurationTypeLoca_languageId` FOREIGN KEY (`languageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `feature`
--

DROP TABLE IF EXISTS `feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feature` (
  `featureId` tinyint(4) NOT NULL AUTO_INCREMENT,
  `Amount` decimal(18,2) DEFAULT NULL,
  `currencyId` int(11) DEFAULT NULL,
  `defaultLanguageId` int(11) DEFAULT NULL,
  PRIMARY KEY (`featureId`),
  KEY `feature_currencyId` (`currencyId`) USING BTREE,
  KEY `feature_defaultLanguageId` (`defaultLanguageId`) USING BTREE,
  CONSTRAINT `feature_currencyId` FOREIGN KEY (`currencyId`) REFERENCES `currency` (`currencyId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `feature_defaultLanguageId` FOREIGN KEY (`defaultLanguageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `featureClaim`
--

DROP TABLE IF EXISTS `featureClaim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `featureClaim` (
  `featureId` tinyint(4) NOT NULL,
  `claimId` bigint(20) NOT NULL,
  PRIMARY KEY (`featureId`,`claimId`),
  KEY `featureClaim_claimId` (`claimId`) USING BTREE,
  CONSTRAINT `featureClaim_claimId` FOREIGN KEY (`claimId`) REFERENCES `businessFunction` (`businessFunctionId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `featureClaim_featureId` FOREIGN KEY (`featureId`) REFERENCES `feature` (`featureId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `featureLocale`
--

DROP TABLE IF EXISTS `featureLocale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `featureLocale` (
  `featureId` tinyint(4) NOT NULL,
  `languageId` int(11) NOT NULL,
  `featureName` varchar(100) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`featureId`,`languageId`),
  KEY `featureLocale_languageId` (`languageId`) USING BTREE,
  CONSTRAINT `featureLocale_featureId` FOREIGN KEY (`featureId`) REFERENCES `feature` (`featureId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `featureLocale_languageId` FOREIGN KEY (`languageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `feedbackWeighingType`
--

DROP TABLE IF EXISTS `feedbackWeighingType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedbackWeighingType` (
  `weighingTypeId` tinyint(4) NOT NULL AUTO_INCREMENT,
  `weighingType` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`weighingTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `feedbackWeighingTypeValue`
--

DROP TABLE IF EXISTS `feedbackWeighingTypeValue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedbackWeighingTypeValue` (
  `weighingTypeValueId` smallint(6) NOT NULL AUTO_INCREMENT,
  `weighingTypeId` tinyint(4) DEFAULT NULL,
  `weighingName` varchar(100) DEFAULT NULL,
  `weighingValue` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`weighingTypeValueId`),
  KEY `feedbackWeighingTypeValue_weighingTypeId` (`weighingTypeId`) USING BTREE,
  CONSTRAINT `feedbackWeighingTypeValue_weighingTypeId` FOREIGN KEY (`weighingTypeId`) REFERENCES `feedbackWeighingType` (`weighingTypeId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fileUpload`
--

DROP TABLE IF EXISTS `fileUpload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fileUpload` (
  `fileId` bigint(20) NOT NULL AUTO_INCREMENT,
  `guId` varchar(100) DEFAULT NULL,
  `fileName` varchar(500) DEFAULT NULL,
  `roleCategoryId` tinyint(4) DEFAULT NULL,
  `businessId` bigint(20) DEFAULT NULL,
  `siteId` bigint(20) DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `fileStatus` tinyint(4) DEFAULT NULL,
  `documentTypeId` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`fileId`),
  KEY `fileUpload_documentTypeId` (`documentTypeId`) USING BTREE,
  KEY `fileUpload_roleCategoryId` (`roleCategoryId`) USING BTREE,
  CONSTRAINT `fileUpload_documentTypeId` FOREIGN KEY (`documentTypeId`) REFERENCES `documentType` (`documentTypeId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fileUpload_roleCategoryId` FOREIGN KEY (`roleCategoryId`) REFERENCES `roleCategory` (`roleCategoryId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2540 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gender`
--

DROP TABLE IF EXISTS `gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gender` (
  `genderId` smallint(6) NOT NULL AUTO_INCREMENT,
  `defaultLanguageId` int(11) DEFAULT NULL,
  PRIMARY KEY (`genderId`),
  KEY `gender_defaultLanguageId` (`defaultLanguageId`) USING BTREE,
  CONSTRAINT `gender_defaultLanguageId` FOREIGN KEY (`defaultLanguageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `genderLocale`
--

DROP TABLE IF EXISTS `genderLocale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genderLocale` (
  `genderId` smallint(6) NOT NULL,
  `languageId` int(11) NOT NULL,
  `genderName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`genderId`,`languageId`),
  KEY `genderLocale_languageId` (`languageId`) USING BTREE,
  CONSTRAINT `genderLocale_genderId` FOREIGN KEY (`genderId`) REFERENCES `gender` (`genderId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `genderLocale_languageId` FOREIGN KEY (`languageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gradeLevel`
--

DROP TABLE IF EXISTS `gradeLevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gradeLevel` (
  `gradeLevelId` int(11) NOT NULL AUTO_INCREMENT,
  `defaultLanguageId` int(11) DEFAULT NULL,
  PRIMARY KEY (`gradeLevelId`),
  KEY `gradeLevel_defaultLanguageId_idx` (`defaultLanguageId`) USING BTREE,
  CONSTRAINT `gradeLevel_defaultLanguageId` FOREIGN KEY (`defaultLanguageId`) REFERENCES `language` (`languageId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gradeLevelLocale`
--

DROP TABLE IF EXISTS `gradeLevelLocale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gradeLevelLocale` (
  `gradeLevelId` int(11) NOT NULL,
  `languageId` int(11) NOT NULL,
  `gradeLevel` varchar(100) NOT NULL,
  PRIMARY KEY (`gradeLevelId`,`languageId`),
  KEY `gradeLevelLocale_languageId_idx` (`languageId`) USING BTREE,
  CONSTRAINT `gradeLevelLocale_gradeId` FOREIGN KEY (`gradeLevelId`) REFERENCES `gradeLevel` (`gradeLevelId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `gradeLevelLocale_languageId` FOREIGN KEY (`languageId`) REFERENCES `language` (`languageId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `groupName`
--

DROP TABLE IF EXISTS `groupName`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groupName` (
  `groupNameId` tinyint(4) NOT NULL AUTO_INCREMENT,
  `defaultLanguageId` int(11) DEFAULT NULL,
  PRIMARY KEY (`groupNameId`),
  KEY `groupName_defaultLanguageId` (`defaultLanguageId`) USING BTREE,
  CONSTRAINT `groupName_defaultLanguageId` FOREIGN KEY (`defaultLanguageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `groupNameLocale`
--

DROP TABLE IF EXISTS `groupNameLocale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groupNameLocale` (
  `groupNameId` tinyint(4) NOT NULL,
  `groupName` varchar(50) DEFAULT NULL,
  `languageId` int(11) NOT NULL,
  PRIMARY KEY (`groupNameId`,`languageId`),
  KEY `groupNameLocale_languageId` (`languageId`) USING BTREE,
  CONSTRAINT `groupNameLocale_groupNameId` FOREIGN KEY (`groupNameId`) REFERENCES `groupName` (`groupNameId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `groupNameLocale_languageId` FOREIGN KEY (`languageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hireRequestAllowanceOncost`
--

DROP TABLE IF EXISTS `hireRequestAllowanceOncost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hireRequestAllowanceOncost` (
  `hireRequestAllowanceId` bigint(20) NOT NULL AUTO_INCREMENT,
  `jobProfileHireRequestId` bigint(20) DEFAULT NULL,
  `allowanceId` bigint(20) DEFAULT NULL,
  `agencySiteId` bigint(20) DEFAULT NULL,
  `allowanceOnCost` decimal(18,2) DEFAULT NULL,
  `allowOnCostCurrencyId` int(11) DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`hireRequestAllowanceId`),
  KEY `hireRequestAllowanceOncos_agencySiteId` (`agencySiteId`) USING BTREE,
  KEY `hireRequestAllowanceOncos_allowanceId` (`allowanceId`) USING BTREE,
  KEY `hireRequestAllowanceOncos_allowOnCostCurrencyId` (`allowOnCostCurrencyId`) USING BTREE,
  KEY `hireRequestAllowanceOncos_jobProfileHireRequestId` (`jobProfileHireRequestId`) USING BTREE,
  CONSTRAINT `hireRequestAllowanceOncos_agencySiteId` FOREIGN KEY (`agencySiteId`) REFERENCES `agencySite` (`agencySiteId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `hireRequestAllowanceOncos_allowOnCostCurrencyId` FOREIGN KEY (`allowOnCostCurrencyId`) REFERENCES `currency` (`currencyId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `hireRequestAllowanceOncos_allowanceId` FOREIGN KEY (`allowanceId`) REFERENCES `businessAllowance` (`allowanceId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `hireRequestAllowanceOncos_jobProfileHireRequestId` FOREIGN KEY (`jobProfileHireRequestId`) REFERENCES `jobProfileHireRequest` (`jobProfileHireRequestId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=222 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hireRequestCandidate`
--

DROP TABLE IF EXISTS `hireRequestCandidate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hireRequestCandidate` (
  `hireRequestCandidateId` bigint(20) NOT NULL AUTO_INCREMENT,
  `jobProfileHireRequestId` bigint(20) DEFAULT NULL,
  `candidateUserId` bigint(20) DEFAULT NULL,
  `candidateHRStatus` tinyint(4) DEFAULT '0',
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT NULL,
  `sendToBA` bit(1) NOT NULL DEFAULT b'0',
  `paidStatus` bit(1) DEFAULT b'0',
  `isCandidateNotified` bit(1) DEFAULT b'0',
  `agreedHours` int(11) DEFAULT NULL,
  PRIMARY KEY (`hireRequestCandidateId`),
  KEY `hireRequestCandidate_candidateUserId` (`candidateUserId`) USING BTREE,
  KEY `hireRequestCandidate_jobProfileHireRequestId` (`jobProfileHireRequestId`) USING BTREE,
  KEY `hireRequestCandidate_candidateHRStatus` (`candidateHRStatus`) USING BTREE,
  CONSTRAINT `hireRequestCandidate_candidateHRStatus` FOREIGN KEY (`candidateHRStatus`) REFERENCES `hireRequestCandidateStatus` (`candidateHRStatusId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `hireRequestCandidate_candidateUserId` FOREIGN KEY (`candidateUserId`) REFERENCES `candidateUser` (`candidateUserId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `hireRequestCandidate_jobProfileHireRequestId` FOREIGN KEY (`jobProfileHireRequestId`) REFERENCES `jobProfileHireRequest` (`jobProfileHireRequestId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18687 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hireRequestCandidateAllowance`
--

DROP TABLE IF EXISTS `hireRequestCandidateAllowance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hireRequestCandidateAllowance` (
  `hireRequestCandidateAllowanceId` bigint(20) NOT NULL AUTO_INCREMENT,
  `hireRequestCandidateId` bigint(20) NOT NULL,
  `allowanceId` smallint(6) NOT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`hireRequestCandidateAllowanceId`),
  KEY `hireRequestCandidateAllowance_hireRequestCandidateId` (`hireRequestCandidateId`),
  KEY `hireRequestCandidateAllowance_allowanceId` (`allowanceId`),
  CONSTRAINT `hireRequestCandidateAllowance_allowanceId` FOREIGN KEY (`allowanceId`) REFERENCES `allowance` (`allowanceId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `hireRequestCandidateAllowance_hireRequestCandidateId` FOREIGN KEY (`hireRequestCandidateId`) REFERENCES `hireRequestCandidate` (`hireRequestCandidateId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hireRequestCandidateStatus`
--

DROP TABLE IF EXISTS `hireRequestCandidateStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hireRequestCandidateStatus` (
  `candidateHRStatusId` tinyint(4) NOT NULL,
  `candidateHRStatus` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`candidateHRStatusId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hireRequestDetail`
--

DROP TABLE IF EXISTS `hireRequestDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hireRequestDetail` (
  `hireRequestDetailId` bigint(20) NOT NULL AUTO_INCREMENT,
  `jobProfileHireRequestId` bigint(20) DEFAULT NULL,
  `needInterview` bit(1) DEFAULT b'0',
  `needbusinessApproval` bit(1) DEFAULT b'0',
  `reportToAddress` varchar(2000) DEFAULT NULL,
  `businessSiteId` bigint(20) DEFAULT NULL,
  `phoneNo` varchar(15) DEFAULT NULL,
  `mobileNo` varchar(15) DEFAULT NULL,
  `costCentreId` bigint(20) DEFAULT NULL,
  `empStartDate` date DEFAULT NULL,
  `empEndDate` date DEFAULT NULL,
  `shiftType` tinyint(4) DEFAULT NULL,
  `isTSRequired` bit(1) DEFAULT b'1',
  `timeSheetFormatId` tinyint(4) DEFAULT NULL,
  `uniformRequirements` varchar(1000) DEFAULT NULL,
  `additionalNotes` varchar(1000) DEFAULT NULL,
  `defineOnCost` bit(1) DEFAULT NULL,
  `estimatedMinHoursPerDay` int(11) DEFAULT NULL,
  `estimatedMaxHoursPerDay` int(11) DEFAULT NULL,
  `estimatedMinHoursPerWeek` int(11) DEFAULT NULL,
  `estimatedMaxHoursPerWeek` int(11) DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `isDeleted` char(10) DEFAULT NULL,
  `reportToPerson` varchar(200) DEFAULT NULL,
  `reportToPersonRoleId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`hireRequestDetailId`),
  KEY `hireRequestDetail_timeSheetFormatId` (`timeSheetFormatId`) USING BTREE,
  KEY `hireRequestDetail_jobProfileHireRequestId` (`jobProfileHireRequestId`) USING BTREE,
  KEY `hireRequestDetail_costCentreId` (`costCentreId`) USING BTREE,
  KEY `hireRequestDetail_businessSiteId` (`businessSiteId`) USING BTREE,
  CONSTRAINT `hireRequestDetail_businessSiteId` FOREIGN KEY (`businessSiteId`) REFERENCES `businessSite` (`businessSiteId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `hireRequestDetail_costCentreId` FOREIGN KEY (`costCentreId`) REFERENCES `businessCostCentre` (`costCentreId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `hireRequestDetail_jobProfileHireRequestId` FOREIGN KEY (`jobProfileHireRequestId`) REFERENCES `jobProfileHireRequest` (`jobProfileHireRequestId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `hireRequestDetail_timeSheetFormatId` FOREIGN KEY (`timeSheetFormatId`) REFERENCES `timeSheetFormat` (`timeSheetFormatId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13582 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hireRequestEstimatedStaff`
--

DROP TABLE IF EXISTS `hireRequestEstimatedStaff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hireRequestEstimatedStaff` (
  `estimatedStaffId` bigint(20) NOT NULL AUTO_INCREMENT,
  `jobProfileHireRequestId` bigint(20) DEFAULT NULL,
  `estimatedStaff` int(11) DEFAULT NULL,
  `estimatedStaffComments` varchar(2000) DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`estimatedStaffId`),
  KEY `hireRequestEstimatedStaff_jobProfileHireRequestId` (`jobProfileHireRequestId`) USING BTREE,
  CONSTRAINT `hireRequestEstimatedStaff_jobProfileHireRequestId` FOREIGN KEY (`jobProfileHireRequestId`) REFERENCES `jobProfileHireRequest` (`jobProfileHireRequestId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13590 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hireRequestFileUpload`
--

DROP TABLE IF EXISTS `hireRequestFileUpload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hireRequestFileUpload` (
  `fileId` bigint(20) DEFAULT NULL,
  `jobProfileHireRequestId` bigint(20) NOT NULL,
  `hireRequestStatus` tinyint(4) DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  KEY `hireRequestFileUpload_fileId` (`fileId`) USING BTREE,
  CONSTRAINT `hireRequestFileUpload_fileId` FOREIGN KEY (`fileId`) REFERENCES `fileUpload` (`fileId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hireRequestShift`
--

DROP TABLE IF EXISTS `hireRequestShift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hireRequestShift` (
  `hireRequestShiftId` bigint(20) NOT NULL AUTO_INCREMENT,
  `jobProfileOrderId` bigint(20) DEFAULT NULL,
  `jobProfileHireRequestId` bigint(20) DEFAULT NULL,
  `shiftName` varchar(100) DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`hireRequestShiftId`),
  KEY `hireRequestShift_jobProfileHireRequestId` (`jobProfileHireRequestId`) USING BTREE,
  CONSTRAINT `hireRequestShift_jobProfileHireRequestId` FOREIGN KEY (`jobProfileHireRequestId`) REFERENCES `jobProfileHireRequest` (`jobProfileHireRequestId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2603 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hireRequestShiftDays`
--

DROP TABLE IF EXISTS `hireRequestShiftDays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hireRequestShiftDays` (
  `hireRequestShiftDayId` bigint(20) NOT NULL AUTO_INCREMENT,
  `hireRequestShiftId` bigint(20) NOT NULL,
  `weekDayId` tinyint(4) NOT NULL,
  `shiftStartTime` time DEFAULT NULL,
  `shiftEndTime` time DEFAULT NULL,
  `shiftDuration` time DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`hireRequestShiftDayId`),
  KEY `hireRequestShiftDays_hireRequestShiftId` (`hireRequestShiftId`) USING BTREE,
  KEY `hireRequestShiftDays_weekDayId` (`weekDayId`) USING BTREE,
  CONSTRAINT `hireRequestShiftDays_hireRequestShiftId` FOREIGN KEY (`hireRequestShiftId`) REFERENCES `hireRequestShift` (`hireRequestShiftId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `hireRequestShiftDays_weekDayId` FOREIGN KEY (`weekDayId`) REFERENCES `weekDay` (`weekDayId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13885 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hireRequestStatus`
--

DROP TABLE IF EXISTS `hireRequestStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hireRequestStatus` (
  `hireRequestStatusId` tinyint(4) NOT NULL AUTO_INCREMENT,
  `hireRequestStatus` varchar(100) NOT NULL,
  PRIMARY KEY (`hireRequestStatusId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hireRequestWageOnCost`
--

DROP TABLE IF EXISTS `hireRequestWageOnCost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hireRequestWageOnCost` (
  `hireRequestWageOnCostId` bigint(20) NOT NULL AUTO_INCREMENT,
  `jobProfileHireRequestId` bigint(20) DEFAULT NULL,
  `agencySiteId` bigint(20) DEFAULT NULL,
  `wageOnCost` decimal(18,2) DEFAULT NULL,
  `wageOnCostCurrencyId` int(11) DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`hireRequestWageOnCostId`),
  KEY `hireRequestWageOnCost_agencySiteId` (`agencySiteId`) USING BTREE,
  KEY `hireRequestWageOnCost_jobProfileHireRequestId` (`jobProfileHireRequestId`) USING BTREE,
  KEY `hireRequestWageOnCost_wageOnCostCurrencyId` (`wageOnCostCurrencyId`) USING BTREE,
  CONSTRAINT `hireRequestWageOnCost_agencySiteId` FOREIGN KEY (`agencySiteId`) REFERENCES `agencySite` (`agencySiteId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `hireRequestWageOnCost_jobProfileHireRequestId` FOREIGN KEY (`jobProfileHireRequestId`) REFERENCES `jobProfileHireRequest` (`jobProfileHireRequestId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `hireRequestWageOnCost_wageOnCostCurrencyId` FOREIGN KEY (`wageOnCostCurrencyId`) REFERENCES `currency` (`currencyId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hireRequestWfInstance`
--

DROP TABLE IF EXISTS `hireRequestWfInstance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hireRequestWfInstance` (
  `hireRequestWfInstanceId` bigint(20) NOT NULL AUTO_INCREMENT,
  `workflowInstanceId` bigint(20) DEFAULT NULL,
  `businessSiteId` bigint(20) DEFAULT NULL,
  `jobProfileHireRequestId` bigint(20) DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  PRIMARY KEY (`hireRequestWfInstanceId`),
  KEY `hireRequestWfInstance_businessSiteId` (`businessSiteId`) USING BTREE,
  KEY `hireRequestWfInstance_jobProfileHireRequestId` (`jobProfileHireRequestId`) USING BTREE,
  KEY `hireRequestWfInstance_workflowInstanceId` (`workflowInstanceId`) USING BTREE,
  CONSTRAINT `hireRequestWfInstance_businessSiteId` FOREIGN KEY (`businessSiteId`) REFERENCES `businessSite` (`businessSiteId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `hireRequestWfInstance_jobProfileHireRequestId` FOREIGN KEY (`jobProfileHireRequestId`) REFERENCES `jobProfileHireRequest` (`jobProfileHireRequestId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `hireRequestWfInstance_workflowInstanceId` FOREIGN KEY (`workflowInstanceId`) REFERENCES `workFlowInstance` (`workflowInstanceId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `industry`
--

DROP TABLE IF EXISTS `industry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `industry` (
  `industryID` bigint(20) NOT NULL AUTO_INCREMENT,
  `parentIndustryId` bigint(20) DEFAULT NULL,
  `defaultLanguageId` int(11) DEFAULT NULL,
  PRIMARY KEY (`industryID`),
  KEY `industry_defaultLanguageId` (`defaultLanguageId`) USING BTREE,
  CONSTRAINT `industry_defaultLanguageId` FOREIGN KEY (`defaultLanguageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `industryLocale`
--

DROP TABLE IF EXISTS `industryLocale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `industryLocale` (
  `industryID` bigint(20) NOT NULL,
  `industryName` varchar(500) DEFAULT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `languageId` int(11) NOT NULL,
  PRIMARY KEY (`industryID`,`languageId`),
  KEY `industryLocale_languageId` (`languageId`) USING BTREE,
  CONSTRAINT `industryLocale_industryID` FOREIGN KEY (`industryID`) REFERENCES `industry` (`industryID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `industryLocale_languageId` FOREIGN KEY (`languageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jobClassification`
--

DROP TABLE IF EXISTS `jobClassification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobClassification` (
  `jobClassificationId` int(11) NOT NULL AUTO_INCREMENT,
  `parentJobClassificationId` int(11) DEFAULT NULL,
  `defaultLanguageId` int(11) DEFAULT NULL,
  `isDemo` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`jobClassificationId`),
  KEY `jobClassification_defaultLanguageId` (`defaultLanguageId`) USING BTREE,
  CONSTRAINT `jobClassification_defaultLanguageId` FOREIGN KEY (`defaultLanguageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jobClassificationAward`
--

DROP TABLE IF EXISTS `jobClassificationAward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobClassificationAward` (
  `jobClassificationId` int(11) NOT NULL,
  `awardId` int(11) NOT NULL,
  PRIMARY KEY (`jobClassificationId`,`awardId`),
  UNIQUE KEY `uniqueIndex_classificationAward` (`jobClassificationId`,`awardId`) USING BTREE,
  KEY `jobClassificationAward_awardId_idx` (`awardId`) USING BTREE,
  CONSTRAINT `jobClassificationAward_awardId` FOREIGN KEY (`awardId`) REFERENCES `award` (`awardId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jobClassificationAward_classificationId` FOREIGN KEY (`jobClassificationId`) REFERENCES `jobClassification` (`jobClassificationId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jobClassificationLocale`
--

DROP TABLE IF EXISTS `jobClassificationLocale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobClassificationLocale` (
  `jobClassificationId` int(11) NOT NULL,
  `jobClassification` varchar(100) DEFAULT NULL,
  `languageId` int(11) NOT NULL,
  PRIMARY KEY (`jobClassificationId`,`languageId`),
  KEY `jobClassificationLocale_languageId` (`languageId`) USING BTREE,
  CONSTRAINT `jobClassificationLocale_jobClassificationId` FOREIGN KEY (`jobClassificationId`) REFERENCES `jobClassification` (`jobClassificationId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `jobClassificationLocale_languageId` FOREIGN KEY (`languageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jobClassificationSubClassification`
--

DROP TABLE IF EXISTS `jobClassificationSubClassification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobClassificationSubClassification` (
  `jobClassificationId` int(11) NOT NULL,
  `jobSubClassificationId` int(11) NOT NULL,
  PRIMARY KEY (`jobClassificationId`,`jobSubClassificationId`),
  KEY `jobClassificationSubClass_jobSubClassificationId` (`jobSubClassificationId`) USING BTREE,
  CONSTRAINT `jobClassificationSubClassification_ibfk_1` FOREIGN KEY (`jobClassificationId`) REFERENCES `jobClassification` (`jobClassificationId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `jobClassificationSubClassification_ibfk_2` FOREIGN KEY (`jobSubClassificationId`) REFERENCES `jobSubClassification` (`jobSubClassificationId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jobOfferStatus`
--

DROP TABLE IF EXISTS `jobOfferStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobOfferStatus` (
  `jobOfferStatusId` tinyint(4) NOT NULL AUTO_INCREMENT,
  `defaultlanguageId` int(11) DEFAULT NULL,
  PRIMARY KEY (`jobOfferStatusId`),
  KEY `jobOfferStatus_defaultlanguageId` (`defaultlanguageId`) USING BTREE,
  CONSTRAINT `jobOfferStatus_defaultlanguageId` FOREIGN KEY (`defaultlanguageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jobOfferStatusLocale`
--

DROP TABLE IF EXISTS `jobOfferStatusLocale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobOfferStatusLocale` (
  `jobOfferStatusId` tinyint(4) NOT NULL,
  `jobOfferStatus` varchar(20) DEFAULT NULL,
  `languageId` int(11) NOT NULL,
  PRIMARY KEY (`jobOfferStatusId`,`languageId`),
  KEY `jobOfferStatusLocale_languageId` (`languageId`) USING BTREE,
  CONSTRAINT `jobOfferStatusLocale_jobOfferStatusId` FOREIGN KEY (`jobOfferStatusId`) REFERENCES `jobOfferStatus` (`jobOfferStatusId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `jobOfferStatusLocale_languageId` FOREIGN KEY (`languageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jobProfile`
--

DROP TABLE IF EXISTS `jobProfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobProfile` (
  `jobProfileId` bigint(20) NOT NULL AUTO_INCREMENT,
  `jobProfileNo` varchar(20) DEFAULT NULL,
  `jobProfileName` varchar(500) DEFAULT NULL,
  `jobClassificationId` int(11) NOT NULL,
  `jobSubClassificationId` int(11) NOT NULL,
  `jobTitle` varchar(100) NOT NULL,
  `businessjobProfileAgmntId` bigint(20) DEFAULT NULL,
  `businessId` bigint(20) DEFAULT NULL,
  `departmentId` bigint(20) DEFAULT NULL,
  `employmentTypeId` int(11) DEFAULT NULL,
  `gradeId` bigint(20) DEFAULT NULL,
  `licenseId` bigint(20) DEFAULT NULL,
  `needMedical` bit(1) DEFAULT NULL,
  `additionalRequirement` longtext,
  `expMinId` smallint(6) DEFAULT NULL,
  `expMin` int(11) DEFAULT NULL,
  `expMaxId` smallint(6) DEFAULT NULL,
  `expMax` int(11) DEFAULT NULL,
  `expDescription` longtext,
  `kpi` longtext,
  `parentJobProfileId` bigint(20) DEFAULT NULL,
  `revisionNo` int(11) DEFAULT NULL,
  `referralJobProfileId` bigint(20) DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT NULL,
  `isProvisional` bit(1) NOT NULL,
  `activeDate` date DEFAULT NULL,
  `expiryDate` date DEFAULT NULL,
  `workflowId` tinyint(4) DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `wageTypeId` tinyint(4) DEFAULT NULL,
  `wagePerId` smallint(6) DEFAULT NULL,
  `wageCurrencyId` int(11) DEFAULT NULL,
  `wageMin` decimal(14,4) DEFAULT NULL,
  `wageMax` decimal(14,4) DEFAULT NULL,
  `awardId` int(11) DEFAULT NULL,
  `gradeLevelId` int(11) DEFAULT NULL,
  `isDemo` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`jobProfileId`),
  KEY `jobProfile_jobClassificationId` (`jobClassificationId`) USING BTREE,
  KEY `jobProfile_gradeId` (`gradeId`) USING BTREE,
  KEY `jobProfile_departmentId` (`departmentId`) USING BTREE,
  KEY `jobProfile_licenseId` (`licenseId`) USING BTREE,
  KEY `jobProfile_expMinId` (`expMinId`) USING BTREE,
  KEY `jobProfile_expMaxId` (`expMaxId`) USING BTREE,
  KEY `jobProfile_businessjobProfileAgmntId` (`businessjobProfileAgmntId`) USING BTREE,
  KEY `jobProfile_employmentTypeId` (`employmentTypeId`) USING BTREE,
  KEY `jobProfile_jobSubClassificationId` (`jobSubClassificationId`) USING BTREE,
  KEY `jobProfile_workflowId` (`workflowId`) USING BTREE,
  KEY `jobProfile_wageCurrencyId` (`wageCurrencyId`) USING BTREE,
  KEY `jobProfile_wagePerId` (`wagePerId`) USING BTREE,
  KEY `jobProfile_wageTypeId` (`wageTypeId`) USING BTREE,
  KEY `jobProfile_awardId` (`awardId`),
  KEY `jobProfile_gradeLevelId` (`gradeLevelId`),
  CONSTRAINT `jobProfile_awardId` FOREIGN KEY (`awardId`) REFERENCES `award` (`awardId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jobProfile_businessjobProfileAgmntId` FOREIGN KEY (`businessjobProfileAgmntId`) REFERENCES `businessJobProfileAgreement` (`businessjobProfileAgmntId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `jobProfile_departmentId` FOREIGN KEY (`departmentId`) REFERENCES `businessDepartment` (`departmentId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `jobProfile_employmentTypeId` FOREIGN KEY (`employmentTypeId`) REFERENCES `employmentType` (`employmentTypeId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `jobProfile_expMaxId` FOREIGN KEY (`expMaxId`) REFERENCES `jobProfileExp` (`jobProfileExpId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `jobProfile_expMinId` FOREIGN KEY (`expMinId`) REFERENCES `jobProfileExp` (`jobProfileExpId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `jobProfile_gradeId` FOREIGN KEY (`gradeId`) REFERENCES `businessGrade` (`gradeId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `jobProfile_gradeLevelId` FOREIGN KEY (`gradeLevelId`) REFERENCES `gradeLevel` (`gradeLevelId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jobProfile_jobClassificationId` FOREIGN KEY (`jobClassificationId`) REFERENCES `jobClassification` (`jobClassificationId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `jobProfile_jobSubClassificationId` FOREIGN KEY (`jobSubClassificationId`) REFERENCES `jobSubClassification` (`jobSubClassificationId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `jobProfile_licenseId` FOREIGN KEY (`licenseId`) REFERENCES `businessLicense` (`licenseId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `jobProfile_wageCurrencyId` FOREIGN KEY (`wageCurrencyId`) REFERENCES `currency` (`currencyId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `jobProfile_wagePerId` FOREIGN KEY (`wagePerId`) REFERENCES `salaryPer` (`salaryPerId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `jobProfile_wageTypeId` FOREIGN KEY (`wageTypeId`) REFERENCES `wageType` (`wageTypeId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `jobProfile_workflowId` FOREIGN KEY (`workflowId`) REFERENCES `businessWorkFlow` (`workFlowId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15699 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jobProfileAllowance`
--

DROP TABLE IF EXISTS `jobProfileAllowance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobProfileAllowance` (
  `jobProfileAllowanceId` bigint(20) NOT NULL AUTO_INCREMENT,
  `jobProfileId` bigint(20) DEFAULT NULL,
  `allowanceId` bigint(20) DEFAULT NULL,
  `allowanceAmt` decimal(14,4) DEFAULT NULL,
  `allowanceCurrencyId` int(11) DEFAULT NULL,
  `allowancePaidTypeId` smallint(6) DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`jobProfileAllowanceId`),
  KEY `jobProfileAllowance_allowanceId` (`allowanceId`) USING BTREE,
  KEY `jobProfileAllowance_allowanceCurrencyId` (`allowanceCurrencyId`) USING BTREE,
  KEY `jobProfileAllowance_allowancePaidTypeId` (`allowancePaidTypeId`) USING BTREE,
  KEY `jobProfileAllowance_jobProfileId` (`jobProfileId`) USING BTREE,
  CONSTRAINT `jobProfileAllowance_allowanceCurrencyId` FOREIGN KEY (`allowanceCurrencyId`) REFERENCES `currency` (`currencyId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `jobProfileAllowance_allowanceId` FOREIGN KEY (`allowanceId`) REFERENCES `businessAllowance` (`allowanceId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `jobProfileAllowance_allowancePaidTypeId` FOREIGN KEY (`allowancePaidTypeId`) REFERENCES `allowancePaidType` (`allowancePaidTypeId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `jobProfileAllowance_jobProfileId` FOREIGN KEY (`jobProfileId`) REFERENCES `jobProfile` (`jobProfileId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=538 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jobProfileAttachment`
--

DROP TABLE IF EXISTS `jobProfileAttachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobProfileAttachment` (
  `jobProfileAttachmentId` bigint(20) NOT NULL AUTO_INCREMENT,
  `jobProfileId` bigint(20) DEFAULT NULL,
  `documentTypeId` smallint(6) DEFAULT NULL,
  `fileName` varchar(1000) DEFAULT NULL,
  `fileMimeType` varchar(10) DEFAULT NULL,
  `fileETag` varchar(1000) DEFAULT NULL,
  `fileUrl` varchar(1000) DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `fileStatus` tinyint(4) DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`jobProfileAttachmentId`),
  KEY `jobProfileAttachment_documentTypeId` (`documentTypeId`) USING BTREE,
  KEY `jobProfileAttachment_jobProfileId` (`jobProfileId`) USING BTREE,
  CONSTRAINT `jobProfileAttachment_documentTypeId` FOREIGN KEY (`documentTypeId`) REFERENCES `documentType` (`documentTypeId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `jobProfileAttachment_jobProfileId` FOREIGN KEY (`jobProfileId`) REFERENCES `jobProfile` (`jobProfileId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9989 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jobProfileBusinessSite`
--

DROP TABLE IF EXISTS `jobProfileBusinessSite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobProfileBusinessSite` (
  `jobProfileBusinessSiteId` bigint(20) NOT NULL AUTO_INCREMENT,
  `jobProfileId` bigint(20) NOT NULL,
  `businessSiteId` bigint(20) NOT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`jobProfileBusinessSiteId`),
  KEY `jobProfileBusinessSite_businessSiteId` (`businessSiteId`) USING BTREE,
  KEY `jobProfileBusinessSite_jobProfileId` (`jobProfileId`) USING BTREE,
  CONSTRAINT `jobProfileBusinessSite_businessSiteId` FOREIGN KEY (`businessSiteId`) REFERENCES `businessSite` (`businessSiteId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `jobProfileBusinessSite_jobProfileId` FOREIGN KEY (`jobProfileId`) REFERENCES `jobProfile` (`jobProfileId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=44056 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jobProfileExp`
--

DROP TABLE IF EXISTS `jobProfileExp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobProfileExp` (
  `jobProfileExpId` smallint(6) NOT NULL AUTO_INCREMENT,
  `defaultLanguageId` int(11) DEFAULT NULL,
  `expType` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`jobProfileExpId`),
  KEY `jobProfileExp_defaultLanguageId` (`defaultLanguageId`) USING BTREE,
  CONSTRAINT `jobProfileExp_defaultLanguageId` FOREIGN KEY (`defaultLanguageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jobProfileExpLocale`
--

DROP TABLE IF EXISTS `jobProfileExpLocale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobProfileExpLocale` (
  `jobProfileExpId` smallint(6) NOT NULL,
  `jobProfileExp` varchar(30) DEFAULT NULL,
  `languageId` int(11) NOT NULL,
  `minExpMnth` int(11) DEFAULT NULL,
  `maxExpMnth` int(11) DEFAULT NULL,
  PRIMARY KEY (`jobProfileExpId`,`languageId`),
  KEY `jobProfileExpLocale_languageId` (`languageId`) USING BTREE,
  CONSTRAINT `jobProfileExpLocale_jobProfileExpId` FOREIGN KEY (`jobProfileExpId`) REFERENCES `jobProfileExp` (`jobProfileExpId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `jobProfileExpLocale_languageId` FOREIGN KEY (`languageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jobProfileHireRequest`
--

DROP TABLE IF EXISTS `jobProfileHireRequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobProfileHireRequest` (
  `jobProfileHireRequestId` bigint(20) NOT NULL AUTO_INCREMENT,
  `jobProfileBusinessSiteId` bigint(20) DEFAULT NULL,
  `businessId` bigint(20) DEFAULT NULL,
  `jobProfileId` bigint(20) DEFAULT NULL,
  `parentHireRequestId` bigint(20) DEFAULT NULL,
  `refferalHireRequestId` bigint(20) DEFAULT NULL,
  `hireRequestNo` varchar(20) DEFAULT NULL,
  `respondBy` date DEFAULT NULL,
  `hiringStartDate` date DEFAULT NULL,
  `hiringEndDate` date DEFAULT NULL,
  `startTime` time DEFAULT NULL,
  `additionalComments` varchar(2000) DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT NULL,
  `workflowId` tinyint(4) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `hireRequestClosingDate` datetime DEFAULT NULL,
  `isCsvUpload` bit(1) DEFAULT b'0',
  `isNotified` bit(1) DEFAULT b'0',
  PRIMARY KEY (`jobProfileHireRequestId`),
  KEY `jobProfileHireRequest_jobProfileBusinessSiteId` (`jobProfileBusinessSiteId`) USING BTREE,
  KEY `jobProfileHireRequest_businessId` (`businessId`) USING BTREE,
  KEY `jobProfileHireRequest_jobProfileId` (`jobProfileId`),
  CONSTRAINT `jobProfileHireRequest_businessId` FOREIGN KEY (`businessId`) REFERENCES `business` (`businessId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `jobProfileHireRequest_jobProfileBusinessSiteId` FOREIGN KEY (`jobProfileBusinessSiteId`) REFERENCES `jobProfileBusinessSite` (`jobProfileBusinessSiteId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `jobProfileHireRequest_jobProfileId` FOREIGN KEY (`jobProfileId`) REFERENCES `jobProfile` (`jobProfileId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13615 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jobProfileOrder`
--

DROP TABLE IF EXISTS `jobProfileOrder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobProfileOrder` (
  `jobProfileOrderId` bigint(20) NOT NULL AUTO_INCREMENT,
  `jobProfileId` bigint(20) DEFAULT NULL,
  `quoteRequestId` bigint(20) DEFAULT NULL,
  `quoteResponseId` bigint(20) DEFAULT NULL,
  `businessSiteId` bigint(20) DEFAULT NULL,
  `agencySiteId` bigint(20) DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT NULL,
  `hireRequestShiftId` bigint(20) DEFAULT NULL,
  `hireRequestDetailId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`jobProfileOrderId`),
  KEY `jobProfileOrder_jobProfileId` (`jobProfileId`) USING BTREE,
  KEY `jobProfileOrder_hireRequestShiftId` (`hireRequestShiftId`) USING BTREE,
  KEY `jobProfileOrder_quoteRequestId` (`quoteRequestId`) USING BTREE,
  KEY `jobProfileOrder_hireRequestDetailId` (`hireRequestDetailId`) USING BTREE,
  KEY `jobProfileOrder_quoteResponseId` (`quoteResponseId`) USING BTREE,
  CONSTRAINT `jobProfileOrder_hireRequestDetailId` FOREIGN KEY (`hireRequestDetailId`) REFERENCES `hireRequestDetail` (`hireRequestDetailId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `jobProfileOrder_hireRequestShiftId` FOREIGN KEY (`hireRequestShiftId`) REFERENCES `hireRequestShift` (`hireRequestShiftId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `jobProfileOrder_jobProfileId` FOREIGN KEY (`jobProfileId`) REFERENCES `jobProfile` (`jobProfileId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `jobProfileOrder_quoteRequestId` FOREIGN KEY (`quoteRequestId`) REFERENCES `quoteRequest` (`quoteRequestId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `jobProfileOrder_quoteResponseId` FOREIGN KEY (`quoteResponseId`) REFERENCES `quoteResponse` (`quoteResponseId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jobProfileQualification`
--

DROP TABLE IF EXISTS `jobProfileQualification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobProfileQualification` (
  `jobProfileQualificationId` bigint(20) NOT NULL AUTO_INCREMENT,
  `jobProfileId` bigint(20) DEFAULT NULL,
  `qualificationId` int(11) DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`jobProfileQualificationId`),
  KEY `jobProfileQualification_jobProfileId` (`jobProfileId`) USING BTREE,
  KEY `jobProfileQualification_qualificationId` (`qualificationId`) USING BTREE,
  CONSTRAINT `jobProfileQualification_jobProfileId` FOREIGN KEY (`jobProfileId`) REFERENCES `jobProfile` (`jobProfileId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `jobProfileQualification_qualificationId` FOREIGN KEY (`qualificationId`) REFERENCES `qualification` (`qualificationId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=660 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jobSubClassification`
--

DROP TABLE IF EXISTS `jobSubClassification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobSubClassification` (
  `jobSubClassificationId` int(11) NOT NULL AUTO_INCREMENT,
  `defaultLanguageId` int(11) DEFAULT NULL,
  PRIMARY KEY (`jobSubClassificationId`),
  KEY `jobSubClassification_defaultLanguageId` (`defaultLanguageId`) USING BTREE,
  CONSTRAINT `jobSubClassification_ibfk_1` FOREIGN KEY (`defaultLanguageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jobSubClassificationLocale`
--

DROP TABLE IF EXISTS `jobSubClassificationLocale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobSubClassificationLocale` (
  `jobSubClassificationId` int(11) NOT NULL,
  `jobSubClassification` varchar(500) DEFAULT NULL,
  `languageId` int(11) NOT NULL,
  PRIMARY KEY (`jobSubClassificationId`,`languageId`),
  KEY `jobSubClassificationLocal_languageId` (`languageId`) USING BTREE,
  CONSTRAINT `jobSubClassificationLocale_ibfk_1` FOREIGN KEY (`jobSubClassificationId`) REFERENCES `jobSubClassification` (`jobSubClassificationId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `jobSubClassificationLocale_ibfk_2` FOREIGN KEY (`languageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language` (
  `languageId` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(100) DEFAULT NULL,
  `languageCode` varchar(6) DEFAULT NULL,
  `countryId` int(11) DEFAULT NULL,
  PRIMARY KEY (`languageId`)
) ENGINE=InnoDB AUTO_INCREMENT=1162 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lastMinuteHire`
--

DROP TABLE IF EXISTS `lastMinuteHire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lastMinuteHire` (
  `lastMinuteHireId` bigint(20) NOT NULL AUTO_INCREMENT,
  `shiftStartDateTime` datetime DEFAULT NULL,
  `shiftEndDateTime` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT b'0',
  `shiftOfferId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`lastMinuteHireId`),
  KEY `lastMinuteHire_ShiftOfferId` (`shiftOfferId`) USING BTREE,
  CONSTRAINT `lastMinuteHire_ShiftOfferId` FOREIGN KEY (`shiftOfferId`) REFERENCES `candidateShiftOffer` (`shiftOfferId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1916 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lastMinuteHireCandidate`
--

DROP TABLE IF EXISTS `lastMinuteHireCandidate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lastMinuteHireCandidate` (
  `lastMinuteHireCandidateId` bigint(20) NOT NULL AUTO_INCREMENT,
  `lastMinuteHireId` bigint(20) DEFAULT NULL,
  `candidateUserId` bigint(20) DEFAULT NULL,
  `candidateStatus` tinyint(4) DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT NULL,
  `isIgnored` bit(1) DEFAULT b'0',
  PRIMARY KEY (`lastMinuteHireCandidateId`),
  KEY `lastMinuteHireCandidate_lastMinuteHireId` (`lastMinuteHireId`) USING BTREE,
  KEY `lastMinuteHireCandidate_candidateUserId` (`candidateUserId`) USING BTREE,
  CONSTRAINT `lastMinuteHireCandidate_candidateUserId` FOREIGN KEY (`candidateUserId`) REFERENCES `candidateUser` (`candidateUserId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `lastMinuteHireCandidate_lastMinuteHireId` FOREIGN KEY (`lastMinuteHireId`) REFERENCES `lastMinuteHire` (`lastMinuteHireId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2502 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `masterDataTemp`
--

DROP TABLE IF EXISTS `masterDataTemp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `masterDataTemp` (
  `tableName` varchar(100) DEFAULT NULL,
  `columnMappingId` bigint(20) DEFAULT NULL,
  `col1ValueInEnglish` varchar(1000) DEFAULT NULL,
  `col1ValueInOtherLang` varchar(1000) DEFAULT NULL,
  `col2ValueInEnglish` varchar(1000) DEFAULT NULL,
  `col2ValueInOtherLang` varchar(1000) DEFAULT NULL,
  `masterDataTempId` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`masterDataTempId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mastertables`
--

DROP TABLE IF EXISTS `mastertables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mastertables` (
  `tableName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nameSalutation`
--

DROP TABLE IF EXISTS `nameSalutation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nameSalutation` (
  `nameSalutationId` smallint(6) NOT NULL AUTO_INCREMENT,
  `defaultLanguageId` int(11) DEFAULT NULL,
  PRIMARY KEY (`nameSalutationId`),
  KEY `nameSalutation_defaultLanguageId` (`defaultLanguageId`) USING BTREE,
  CONSTRAINT `nameSalutation_defaultLanguageId` FOREIGN KEY (`defaultLanguageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nameSalutationLocale`
--

DROP TABLE IF EXISTS `nameSalutationLocale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nameSalutationLocale` (
  `nameSalutationId` smallint(6) NOT NULL,
  `languageId` int(11) NOT NULL,
  `userNameSalutation` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`nameSalutationId`,`languageId`),
  KEY `nameSalutationLocale_languageId` (`languageId`) USING BTREE,
  CONSTRAINT `nameSalutationLocale_languageId` FOREIGN KEY (`languageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `nameSalutationLocale_nameSalutationId` FOREIGN KEY (`nameSalutationId`) REFERENCES `nameSalutation` (`nameSalutationId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification` (
  `notificationId` bigint(20) NOT NULL AUTO_INCREMENT,
  `businessSiteId` bigint(20) NOT NULL,
  `managerId` bigint(20) DEFAULT NULL,
  `notificationSubject` varchar(200) DEFAULT NULL,
  `notificationMessage` varchar(5000) NOT NULL,
  `sendUserName` bit(1) NOT NULL,
  `sendAppStoreLink` bit(1) NOT NULL DEFAULT b'0',
  `authorizationRequired` bit(1) NOT NULL DEFAULT b'0',
  `isDeleted` bit(1) NOT NULL DEFAULT b'0',
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`notificationId`),
  KEY `notificationRequest_businessSiteId` (`businessSiteId`),
  KEY `notificationRequest_managerId` (`managerId`),
  CONSTRAINT `notificationRequest_businessSiteId` FOREIGN KEY (`businessSiteId`) REFERENCES `businessSite` (`businessSiteId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `notificationRequest_managerId` FOREIGN KEY (`managerId`) REFERENCES `scUser` (`userId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notificationInfo`
--

DROP TABLE IF EXISTS `notificationInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notificationInfo` (
  `notificationTypeId` tinyint(4) NOT NULL AUTO_INCREMENT,
  `notificationType` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`notificationTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notificationRecipient`
--

DROP TABLE IF EXISTS `notificationRecipient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notificationRecipient` (
  `notificationRecipientId` bigint(20) NOT NULL AUTO_INCREMENT,
  `notificationRequestId` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL,
  `firstName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `emailId` varchar(100) DEFAULT NULL,
  `mobileNo` varchar(50) DEFAULT NULL,
  `notificationRecipientGUID` varchar(100) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`notificationRecipientId`),
  KEY `notificationRequestDetail_notificationRequestId` (`notificationRequestId`),
  KEY `notificationRequestDetail_userId_idx` (`userId`),
  CONSTRAINT `notificationRequestDetail_notificationRequestId` FOREIGN KEY (`notificationRequestId`) REFERENCES `notificationRequest` (`notificationRequestId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `notificationRequestDetail_userId` FOREIGN KEY (`userId`) REFERENCES `scUser` (`userId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=304 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notificationRequest`
--

DROP TABLE IF EXISTS `notificationRequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notificationRequest` (
  `notificationRequestId` bigint(20) NOT NULL AUTO_INCREMENT,
  `notificationId` bigint(20) NOT NULL,
  `frameworkRequestGUID` varchar(100) DEFAULT NULL,
  `notificationType` tinyint(4) DEFAULT NULL,
  `communicationType` tinyint(4) DEFAULT '1',
  `status` tinyint(4) DEFAULT NULL,
  `createdBy` bigint(20) NOT NULL,
  `createdOn` datetime DEFAULT NULL,
  PRIMARY KEY (`notificationRequestId`),
  KEY `notificationRequestType_notificationId` (`notificationId`),
  CONSTRAINT `notificationRequestType_notificationId` FOREIGN KEY (`notificationId`) REFERENCES `notification` (`notificationId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=208 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notificationRequestDocument`
--

DROP TABLE IF EXISTS `notificationRequestDocument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notificationRequestDocument` (
  `notificationRequestDocumentId` bigint(20) NOT NULL AUTO_INCREMENT,
  `notificationId` bigint(20) NOT NULL,
  `documentName` varchar(200) NOT NULL,
  `documentPath` varchar(1000) NOT NULL,
  `documentMimeType` varchar(6) NOT NULL,
  `eTag` varchar(1000) DEFAULT NULL,
  `fileStatus` tinyint(4) NOT NULL,
  `documentGUID` varchar(45) DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `isDeleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`notificationRequestDocumentId`),
  KEY `notificationRequestDocume_notificationId` (`notificationId`),
  CONSTRAINT `notificationRequestDocume_notificationId` FOREIGN KEY (`notificationId`) REFERENCES `notification` (`notificationId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `paymentId` bigint(20) NOT NULL AUTO_INCREMENT,
  `jobProfileHireRequestId` bigint(20) DEFAULT NULL,
  `currencyId` int(11) DEFAULT NULL,
  `amount` decimal(18,2) DEFAULT NULL,
  `transactionNo` varchar(50) DEFAULT NULL,
  `paidStatus` bit(1) DEFAULT b'0',
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  PRIMARY KEY (`paymentId`),
  KEY `payment_jobProfileHireRequestId` (`jobProfileHireRequestId`) USING BTREE,
  CONSTRAINT `payment_jobProfileHireRequestId` FOREIGN KEY (`jobProfileHireRequestId`) REFERENCES `jobProfileHireRequest` (`jobProfileHireRequestId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5746 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paymentMethod`
--

DROP TABLE IF EXISTS `paymentMethod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paymentMethod` (
  `paymentMethodId` tinyint(4) NOT NULL AUTO_INCREMENT,
  `defaultLanguageId` int(11) DEFAULT NULL,
  PRIMARY KEY (`paymentMethodId`),
  KEY `paymentMethod_defaultLanguageId` (`defaultLanguageId`) USING BTREE,
  CONSTRAINT `paymentMethod_defaultLanguageId` FOREIGN KEY (`defaultLanguageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paymentMethodLocale`
--

DROP TABLE IF EXISTS `paymentMethodLocale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paymentMethodLocale` (
  `paymentMethodId` tinyint(4) NOT NULL,
  `languageId` int(11) NOT NULL,
  `paymentMethod` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`paymentMethodId`,`languageId`),
  KEY `paymentMethodLocale_languageId` (`languageId`) USING BTREE,
  CONSTRAINT `paymentMethodLocale_languageId` FOREIGN KEY (`languageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `paymentMethodLocale_paymentMethodId` FOREIGN KEY (`paymentMethodId`) REFERENCES `paymentMethod` (`paymentMethodId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `period`
--

DROP TABLE IF EXISTS `period`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `period` (
  `periodId` int(11) NOT NULL AUTO_INCREMENT,
  `defaultLanguageId` int(11) DEFAULT NULL,
  PRIMARY KEY (`periodId`),
  KEY `period_defaultLanguageId` (`defaultLanguageId`) USING BTREE,
  CONSTRAINT `period_defaultLanguageId` FOREIGN KEY (`defaultLanguageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `periodLocale`
--

DROP TABLE IF EXISTS `periodLocale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `periodLocale` (
  `periodId` int(11) NOT NULL,
  `languageId` int(11) NOT NULL,
  `period` varchar(100) DEFAULT NULL,
  `minMonth` smallint(6) DEFAULT NULL,
  `maxMonth` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`periodId`,`languageId`),
  KEY `periodLocale_languageId` (`languageId`) USING BTREE,
  CONSTRAINT `periodLocale_languageId` FOREIGN KEY (`languageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `periodLocale_periodId` FOREIGN KEY (`periodId`) REFERENCES `period` (`periodId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile` (
  `profileId` int(11) NOT NULL AUTO_INCREMENT,
  `languageId` int(11) DEFAULT NULL,
  PRIMARY KEY (`profileId`),
  KEY `profile_languageId` (`languageId`) USING BTREE,
  CONSTRAINT `profile_languageId` FOREIGN KEY (`languageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `profileLocale`
--

DROP TABLE IF EXISTS `profileLocale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profileLocale` (
  `profileId` int(11) NOT NULL,
  `languageId` int(11) NOT NULL,
  `profileName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`profileId`,`languageId`),
  KEY `profileLocale_languageId` (`languageId`) USING BTREE,
  CONSTRAINT `profileLocale_languageId` FOREIGN KEY (`languageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `profileLocale_profileId` FOREIGN KEY (`profileId`) REFERENCES `profile` (`profileId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qualification`
--

DROP TABLE IF EXISTS `qualification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qualification` (
  `qualificationId` int(11) NOT NULL AUTO_INCREMENT,
  `defaultLanguageId` int(11) DEFAULT NULL,
  `bussinessId` bigint(20) DEFAULT NULL,
  `classificationId` int(11) DEFAULT NULL,
  `subClassificationId` int(11) DEFAULT NULL,
  `isSystemDefined` bit(1) DEFAULT b'1',
  `isDeleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`qualificationId`),
  KEY `qualification_defaultLanguageId` (`defaultLanguageId`) USING BTREE,
  KEY `qualification_classificationId` (`classificationId`) USING BTREE,
  KEY `qualification_subClassificationId` (`subClassificationId`) USING BTREE,
  CONSTRAINT `qualification_classificationId` FOREIGN KEY (`classificationId`) REFERENCES `jobClassification` (`jobClassificationId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `qualification_defaultLanguageId` FOREIGN KEY (`defaultLanguageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `qualification_subClassificationId` FOREIGN KEY (`subClassificationId`) REFERENCES `jobSubClassification` (`jobSubClassificationId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=576 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qualificationLocale`
--

DROP TABLE IF EXISTS `qualificationLocale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qualificationLocale` (
  `qualificationId` int(11) NOT NULL,
  `qualificationName` varchar(200) DEFAULT NULL,
  `languageId` int(11) NOT NULL,
  `isDeleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`qualificationId`,`languageId`),
  KEY `qualificationLocale_languageId` (`languageId`) USING BTREE,
  CONSTRAINT `qualificationLocale_languageId` FOREIGN KEY (`languageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `qualificationLocale_qualificationId` FOREIGN KEY (`qualificationId`) REFERENCES `qualification` (`qualificationId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quoteRequest`
--

DROP TABLE IF EXISTS `quoteRequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quoteRequest` (
  `quoteRequestId` bigint(20) NOT NULL AUTO_INCREMENT,
  `jobProfileId` bigint(20) DEFAULT NULL,
  `jobProfileHireRequestId` bigint(20) DEFAULT NULL,
  `businessSiteId` bigint(20) DEFAULT NULL,
  `quoteRequsetNo` varchar(20) DEFAULT NULL,
  `quoteBroadCastNo` varchar(20) DEFAULT NULL,
  `sendToQuoteBoard` bit(1) DEFAULT NULL,
  `quoteStatus` tinyint(4) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`quoteRequestId`),
  KEY `quoteRequest_businessSiteId` (`businessSiteId`) USING BTREE,
  KEY `quoteRequest_jobProfileHireRequestId` (`jobProfileHireRequestId`) USING BTREE,
  KEY `quoteRequest_jobProfileId` (`jobProfileId`) USING BTREE,
  KEY `quoteRequest_quoteStatus` (`quoteStatus`) USING BTREE,
  CONSTRAINT `quoteRequest_businessSiteId` FOREIGN KEY (`businessSiteId`) REFERENCES `businessSite` (`businessSiteId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `quoteRequest_jobProfileHireRequestId` FOREIGN KEY (`jobProfileHireRequestId`) REFERENCES `jobProfileHireRequest` (`jobProfileHireRequestId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `quoteRequest_jobProfileId` FOREIGN KEY (`jobProfileId`) REFERENCES `jobProfile` (`jobProfileId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `quoteRequest_quoteStatus` FOREIGN KEY (`quoteStatus`) REFERENCES `quoteStatus` (`quoteStatusId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quoteRequestAgencySite`
--

DROP TABLE IF EXISTS `quoteRequestAgencySite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quoteRequestAgencySite` (
  `quoteRequestAgencySiteId` bigint(20) NOT NULL AUTO_INCREMENT,
  `quoteRequestId` bigint(20) NOT NULL,
  `agencySiteId` bigint(20) NOT NULL,
  `quoteReqEmpRequiredId` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `isNotified` bit(1) DEFAULT b'0',
  `isDeleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`quoteRequestAgencySiteId`),
  KEY `quoteRequestAgencySite_quoteRequestId` (`quoteRequestId`) USING BTREE,
  KEY `quoteRequestAgencySite_agencySiteId` (`agencySiteId`) USING BTREE,
  KEY `quoteRequestAgencySite_quoteReqEmpRequiredId` (`quoteReqEmpRequiredId`) USING BTREE,
  CONSTRAINT `quoteRequestAgencySite_agencySiteId` FOREIGN KEY (`agencySiteId`) REFERENCES `agencySite` (`agencySiteId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `quoteRequestAgencySite_quoteReqEmpRequiredId` FOREIGN KEY (`quoteReqEmpRequiredId`) REFERENCES `quoteRequestEmployeeRequired` (`quoteReqEmpRequiredId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `quoteRequestAgencySite_quoteRequestId` FOREIGN KEY (`quoteRequestId`) REFERENCES `quoteRequest` (`quoteRequestId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quoteRequestEmployeeRequired`
--

DROP TABLE IF EXISTS `quoteRequestEmployeeRequired`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quoteRequestEmployeeRequired` (
  `quoteReqEmpRequiredId` bigint(20) NOT NULL AUTO_INCREMENT,
  `quoteRequestId` bigint(20) DEFAULT NULL,
  `numOfEmployeesReq` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT NULL,
  `isPartialFill` bit(1) DEFAULT b'0',
  PRIMARY KEY (`quoteReqEmpRequiredId`),
  KEY `quoteRequestEmployeeRequi_quoteRequestId` (`quoteRequestId`) USING BTREE,
  CONSTRAINT `quoteRequestEmployeeRequi_quoteRequestId` FOREIGN KEY (`quoteRequestId`) REFERENCES `quoteRequest` (`quoteRequestId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quoteRequestWfInstance`
--

DROP TABLE IF EXISTS `quoteRequestWfInstance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quoteRequestWfInstance` (
  `quoteRequestWfInstanceId` bigint(20) NOT NULL AUTO_INCREMENT,
  `workflowInstanceId` bigint(20) DEFAULT NULL,
  `businessSiteId` bigint(20) DEFAULT NULL,
  `quoteRequestId` bigint(20) DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  PRIMARY KEY (`quoteRequestWfInstanceId`),
  KEY `quoteRequestWfInstance_businessSiteId` (`businessSiteId`) USING BTREE,
  KEY `quoteRequestWfInstance_quoteRequestId` (`quoteRequestId`) USING BTREE,
  KEY `quoteRequestWfInstance_workflowInstanceId` (`workflowInstanceId`) USING BTREE,
  CONSTRAINT `quoteRequestWfInstance_businessSiteId` FOREIGN KEY (`businessSiteId`) REFERENCES `businessSite` (`businessSiteId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `quoteRequestWfInstance_quoteRequestId` FOREIGN KEY (`quoteRequestId`) REFERENCES `quoteRequest` (`quoteRequestId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `quoteRequestWfInstance_workflowInstanceId` FOREIGN KEY (`workflowInstanceId`) REFERENCES `workFlowInstance` (`workflowInstanceId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quoteResponse`
--

DROP TABLE IF EXISTS `quoteResponse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quoteResponse` (
  `quoteResponseId` bigint(20) NOT NULL AUTO_INCREMENT,
  `jobProfileId` bigint(20) DEFAULT NULL,
  `quoteRequestId` bigint(20) DEFAULT NULL,
  `agencySiteId` bigint(20) DEFAULT NULL,
  `quoteReqEmpRequiredId` bigint(20) DEFAULT NULL,
  `validToDate` datetime DEFAULT NULL,
  `actualPayRate` decimal(18,2) DEFAULT NULL,
  `actualPayRateCurrencyId` int(11) DEFAULT NULL,
  `onCost` decimal(18,2) DEFAULT NULL,
  `onCostCurrencyId` int(11) DEFAULT NULL,
  `quoteStatusId` tinyint(4) DEFAULT NULL,
  `comments` varchar(2000) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`quoteResponseId`),
  KEY `quoteResponse_actualPayRateCurrencyId` (`actualPayRateCurrencyId`) USING BTREE,
  KEY `quoteResponse_agencySiteId` (`agencySiteId`) USING BTREE,
  KEY `quoteResponse_jobProfileId` (`jobProfileId`) USING BTREE,
  KEY `quoteResponse_onCostCurrencyId` (`onCostCurrencyId`) USING BTREE,
  KEY `quoteResponse_quoteRequestId` (`quoteRequestId`) USING BTREE,
  KEY `quoteResponse_quoteStatusId` (`quoteStatusId`) USING BTREE,
  KEY `quoteResponse_quoteReqEmpRequiredId` (`quoteReqEmpRequiredId`) USING BTREE,
  CONSTRAINT `quoteResponse_actualPayRateCurrencyId` FOREIGN KEY (`actualPayRateCurrencyId`) REFERENCES `currency` (`currencyId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `quoteResponse_agencySiteId` FOREIGN KEY (`agencySiteId`) REFERENCES `agencySite` (`agencySiteId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `quoteResponse_jobProfileId` FOREIGN KEY (`jobProfileId`) REFERENCES `jobProfile` (`jobProfileId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `quoteResponse_onCostCurrencyId` FOREIGN KEY (`onCostCurrencyId`) REFERENCES `currency` (`currencyId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `quoteResponse_quoteReqEmpRequiredId` FOREIGN KEY (`quoteReqEmpRequiredId`) REFERENCES `quoteRequestEmployeeRequired` (`quoteReqEmpRequiredId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `quoteResponse_quoteRequestId` FOREIGN KEY (`quoteRequestId`) REFERENCES `quoteRequest` (`quoteRequestId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `quoteResponse_quoteStatusId` FOREIGN KEY (`quoteStatusId`) REFERENCES `quoteStatus` (`quoteStatusId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quoteResponseAllowance`
--

DROP TABLE IF EXISTS `quoteResponseAllowance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quoteResponseAllowance` (
  `quoteRespAllowanceId` bigint(20) NOT NULL AUTO_INCREMENT,
  `quoteResponseId` bigint(20) DEFAULT NULL,
  `allowanceId` bigint(20) DEFAULT NULL,
  `actualPayRate` decimal(18,2) DEFAULT NULL,
  `actualPayRateCurrencyId` int(11) DEFAULT NULL,
  `actualPayOnCost` decimal(18,2) DEFAULT NULL,
  `actualPayOnCostCurrencyId` int(11) DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`quoteRespAllowanceId`),
  KEY `quoteResponseAllowance_allowanceId` (`allowanceId`) USING BTREE,
  KEY `quoteResponseAllowance_actualPayOnCostCurrencyId` (`actualPayOnCostCurrencyId`) USING BTREE,
  KEY `quoteResponseAllowance_actualPayRateCurrencyId` (`actualPayRateCurrencyId`) USING BTREE,
  KEY `quoteResponseAllowance_quoteResponseId` (`quoteResponseId`) USING BTREE,
  CONSTRAINT `quoteResponseAllowance_actualPayOnCostCurrencyId` FOREIGN KEY (`actualPayOnCostCurrencyId`) REFERENCES `currency` (`currencyId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `quoteResponseAllowance_actualPayRateCurrencyId` FOREIGN KEY (`actualPayRateCurrencyId`) REFERENCES `currency` (`currencyId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `quoteResponseAllowance_allowanceId` FOREIGN KEY (`allowanceId`) REFERENCES `businessAllowance` (`allowanceId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `quoteResponseAllowance_quoteResponseId` FOREIGN KEY (`quoteResponseId`) REFERENCES `quoteResponse` (`quoteResponseId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quoteResponseWfInstance`
--

DROP TABLE IF EXISTS `quoteResponseWfInstance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quoteResponseWfInstance` (
  `quoteResponseWfInstanceId` bigint(20) NOT NULL AUTO_INCREMENT,
  `workflowInstanceId` bigint(20) DEFAULT NULL,
  `businessSiteId` bigint(20) DEFAULT NULL,
  `quoteResponseId` bigint(20) DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  PRIMARY KEY (`quoteResponseWfInstanceId`),
  KEY `quoteResponseWfInstance_businessSiteId` (`businessSiteId`) USING BTREE,
  KEY `quoteResponseWfInstance_quoteResponseId` (`quoteResponseId`) USING BTREE,
  KEY `quoteResponseWfInstance_workflowInstanceId` (`workflowInstanceId`) USING BTREE,
  CONSTRAINT `quoteResponseWfInstance_businessSiteId` FOREIGN KEY (`businessSiteId`) REFERENCES `businessSite` (`businessSiteId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `quoteResponseWfInstance_quoteResponseId` FOREIGN KEY (`quoteResponseId`) REFERENCES `quoteResponse` (`quoteResponseId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `quoteResponseWfInstance_workflowInstanceId` FOREIGN KEY (`workflowInstanceId`) REFERENCES `workFlowInstance` (`workflowInstanceId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quoteStatus`
--

DROP TABLE IF EXISTS `quoteStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quoteStatus` (
  `quoteStatusId` tinyint(4) NOT NULL AUTO_INCREMENT,
  `quoteStatus` varchar(20) DEFAULT NULL,
  `quoteType` tinyint(4) DEFAULT NULL,
  `languageId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`quoteStatusId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relationShip`
--

DROP TABLE IF EXISTS `relationShip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relationShip` (
  `relationShipId` varchar(50) NOT NULL,
  `relationShip` varchar(50) DEFAULT NULL,
  `languageId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`relationShipId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `roleBusinessFunction`
--

DROP TABLE IF EXISTS `roleBusinessFunction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roleBusinessFunction` (
  `roleId` bigint(20) NOT NULL,
  `businessFunctionId` bigint(20) NOT NULL,
  `businessId` bigint(20) NOT NULL,
  `roleCategoryId` tinyint(4) NOT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`roleId`,`businessFunctionId`,`businessId`,`roleCategoryId`),
  KEY `roleBusinessFunction_businessFunctionId` (`businessFunctionId`) USING BTREE,
  CONSTRAINT `roleBusinessFunction_businessFunctionId` FOREIGN KEY (`businessFunctionId`) REFERENCES `businessFunction` (`businessFunctionId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `roleBusinessFunction_roleId` FOREIGN KEY (`roleId`) REFERENCES `roleInfo` (`roleId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `roleBusinessFunctionDefault`
--

DROP TABLE IF EXISTS `roleBusinessFunctionDefault`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roleBusinessFunctionDefault` (
  `businessFunctionId` bigint(20) NOT NULL,
  `roleId` bigint(20) NOT NULL,
  PRIMARY KEY (`businessFunctionId`,`roleId`),
  KEY `scRoleClaim_roleId` (`roleId`) USING BTREE,
  CONSTRAINT `roleBusinessFunctionDefault_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `roleInfo` (`roleId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `roleCategory`
--

DROP TABLE IF EXISTS `roleCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roleCategory` (
  `roleCategoryId` tinyint(4) NOT NULL AUTO_INCREMENT,
  `roleCategory` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`roleCategoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `roleInfo`
--

DROP TABLE IF EXISTS `roleInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roleInfo` (
  `roleId` bigint(20) NOT NULL AUTO_INCREMENT,
  `roleCategoryId` tinyint(4) DEFAULT NULL,
  `isSystemRole` bit(1) DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT b'0',
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `businessId` bigint(20) DEFAULT NULL,
  `createdBySiteId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`roleId`),
  KEY `scRole_roleCategoryId` (`roleCategoryId`) USING BTREE,
  CONSTRAINT `roleInfo_roleCategoryId` FOREIGN KEY (`roleCategoryId`) REFERENCES `roleCategory` (`roleCategoryId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `roleInfoLocale`
--

DROP TABLE IF EXISTS `roleInfoLocale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roleInfoLocale` (
  `roleId` bigint(20) NOT NULL,
  `languageId` int(11) NOT NULL,
  `roleName` varchar(100) DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`roleId`,`languageId`),
  KEY `scRoleLocale_languageId` (`languageId`) USING BTREE,
  CONSTRAINT `roleInfoLocale_languageId` FOREIGN KEY (`languageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `roleInfoLocale_roleId` FOREIGN KEY (`roleId`) REFERENCES `roleInfo` (`roleId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `roleWorkFlow`
--

DROP TABLE IF EXISTS `roleWorkFlow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roleWorkFlow` (
  `roleId` bigint(20) NOT NULL,
  `workFlowId` tinyint(4) NOT NULL,
  PRIMARY KEY (`roleId`,`workFlowId`),
  KEY `roleWorkFlow_workFlowId` (`workFlowId`) USING BTREE,
  CONSTRAINT `roleWorkFlow_roleId` FOREIGN KEY (`roleId`) REFERENCES `roleInfo` (`roleId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `roleWorkFlow_workFlowId` FOREIGN KEY (`workFlowId`) REFERENCES `businessWorkFlow` (`workFlowId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rosterCurrentWeekShift`
--

DROP TABLE IF EXISTS `rosterCurrentWeekShift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rosterCurrentWeekShift` (
  `rosterCurrentWeekShiftId` bigint(20) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(100) NOT NULL,
  `shiftOfferId` bigint(20) DEFAULT NULL,
  `businessSiteId` bigint(20) NOT NULL,
  `departmentId` bigint(20) NOT NULL,
  `subClassificationId` int(11) NOT NULL,
  `shiftStartDateTime` datetime NOT NULL,
  `shiftEndDateTime` datetime NOT NULL,
  `candidateId` bigint(20) DEFAULT NULL,
  `STATUS` tinyint(4) DEFAULT NULL,
  `prevShiftOfferId` bigint(20) DEFAULT NULL,
  `rowId` bigint(20) DEFAULT NULL,
  `combId` varchar(100) DEFAULT NULL,
  `prevCandidateId` bigint(20) DEFAULT NULL,
  `isAvailable` bit(1) DEFAULT NULL,
  `dayId` int(11) DEFAULT NULL,
  `totalOffer` int(11) DEFAULT NULL,
  `shiftTemplateId` bigint(20) DEFAULT NULL,
  `isFlexibleShiftTime` bit(1) DEFAULT NULL,
  PRIMARY KEY (`rosterCurrentWeekShiftId`)
) ENGINE=InnoDB AUTO_INCREMENT=443 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rosterPreviousWeekShift`
--

DROP TABLE IF EXISTS `rosterPreviousWeekShift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rosterPreviousWeekShift` (
  `rosterPreviousWeekShiftId` bigint(20) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(100) NOT NULL,
  `shiftOfferId` bigint(20) DEFAULT NULL,
  `businessSiteId` bigint(20) NOT NULL,
  `departmentId` bigint(20) NOT NULL,
  `subClassificationId` int(11) NOT NULL,
  `shiftStartDateTime` datetime NOT NULL,
  `shiftEndDateTime` datetime NOT NULL,
  `candidateId` bigint(20) DEFAULT NULL,
  `STATUS` tinyint(4) DEFAULT NULL,
  `rowId` bigint(20) DEFAULT NULL,
  `combId` varchar(100) DEFAULT NULL,
  `dayId` int(11) DEFAULT NULL,
  `errorCode` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`rosterPreviousWeekShiftId`)
) ENGINE=InnoDB AUTO_INCREMENT=333 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `salaryPer`
--

DROP TABLE IF EXISTS `salaryPer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salaryPer` (
  `salaryPerId` smallint(6) NOT NULL AUTO_INCREMENT,
  `languageId` int(11) DEFAULT NULL,
  PRIMARY KEY (`salaryPerId`),
  KEY `salaryPer_languageId` (`languageId`) USING BTREE,
  CONSTRAINT `salaryPer_languageId` FOREIGN KEY (`languageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `salaryPerLocale`
--

DROP TABLE IF EXISTS `salaryPerLocale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salaryPerLocale` (
  `salaryPerId` smallint(6) NOT NULL,
  `salaryPerName` varchar(50) DEFAULT NULL,
  `languageId` int(11) NOT NULL,
  PRIMARY KEY (`salaryPerId`,`languageId`),
  KEY `salaryPerLocale_languageId` (`languageId`) USING BTREE,
  CONSTRAINT `salaryPerLocale_languageId` FOREIGN KEY (`languageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `salaryPerLocale_salaryPerId` FOREIGN KEY (`salaryPerId`) REFERENCES `salaryPer` (`salaryPerId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `salaryRateType`
--

DROP TABLE IF EXISTS `salaryRateType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salaryRateType` (
  `salaryRateTypeId` smallint(6) NOT NULL AUTO_INCREMENT,
  `languageId` int(11) DEFAULT NULL,
  PRIMARY KEY (`salaryRateTypeId`),
  KEY `salaryRateType_languageId` (`languageId`) USING BTREE,
  CONSTRAINT `salaryRateType_languageId` FOREIGN KEY (`languageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `salaryRateTypeLocale`
--

DROP TABLE IF EXISTS `salaryRateTypeLocale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salaryRateTypeLocale` (
  `salaryRateTypeId` smallint(6) NOT NULL,
  `salaryRateType` varchar(40) DEFAULT NULL,
  `languageId` int(11) NOT NULL,
  PRIMARY KEY (`salaryRateTypeId`,`languageId`),
  KEY `salaryRateTypeLocale_languageId` (`languageId`) USING BTREE,
  CONSTRAINT `salaryRateTypeLocale_languageId` FOREIGN KEY (`languageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `salaryRateTypeLocale_salaryRateTypeId` FOREIGN KEY (`salaryRateTypeId`) REFERENCES `salaryRateType` (`salaryRateTypeId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scMonth`
--

DROP TABLE IF EXISTS `scMonth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scMonth` (
  `monthId` int(11) NOT NULL,
  `defaultLanguageId` int(11) DEFAULT NULL,
  PRIMARY KEY (`monthId`),
  KEY `scMonth_defaultLanguageId` (`defaultLanguageId`) USING BTREE,
  CONSTRAINT `scMonth_defaultLanguageId` FOREIGN KEY (`defaultLanguageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scMonthLocale`
--

DROP TABLE IF EXISTS `scMonthLocale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scMonthLocale` (
  `monthId` int(11) NOT NULL,
  `monthName` varchar(30) DEFAULT NULL,
  `languageId` int(11) NOT NULL,
  PRIMARY KEY (`monthId`,`languageId`),
  KEY `scMonthLocale_languageId` (`languageId`) USING BTREE,
  CONSTRAINT `scMonthLocale_languageId` FOREIGN KEY (`languageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `scMonthLocale_monthId` FOREIGN KEY (`monthId`) REFERENCES `scMonth` (`monthId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scTime`
--

DROP TABLE IF EXISTS `scTime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scTime` (
  `timeId` smallint(6) NOT NULL,
  `slotName` varchar(100) DEFAULT NULL,
  `startTime` time DEFAULT NULL,
  `endTime` time DEFAULT NULL,
  PRIMARY KEY (`timeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scUser`
--

DROP TABLE IF EXISTS `scUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scUser` (
  `userId` bigint(20) NOT NULL AUTO_INCREMENT,
  `userUIId` varchar(100) DEFAULT NULL,
  `firstName` varchar(50) NOT NULL,
  `middleName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) NOT NULL,
  `genderId` smallint(6) DEFAULT NULL,
  `nationalityId` bigint(20) DEFAULT NULL,
  `RoleCategoryId` tinyint(4) DEFAULT NULL,
  `emailId` varchar(100) NOT NULL,
  `UserPassword` longtext,
  `secondaryEmail` varchar(100) DEFAULT NULL,
  `timeZoneId` int(11) DEFAULT NULL,
  `preferredLanguageId` int(11) DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT b'0',
  `acceptTermsConditions` bit(1) DEFAULT NULL,
  `isLoggedInOnce` bit(1) DEFAULT NULL,
  `isOTPGenerated` bit(1) DEFAULT b'0',
  `otpGeneratedOn` datetime DEFAULT NULL,
  `encryptionKey` varchar(100) DEFAULT NULL,
  `userType` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`userId`),
  UNIQUE KEY `UniqueEmailId` (`emailId`) USING BTREE,
  KEY `scUser_RoleCategoryId` (`RoleCategoryId`) USING BTREE,
  KEY `scUser_genderId` (`genderId`) USING BTREE,
  KEY `scUser_preferredLanguageId` (`preferredLanguageId`) USING BTREE,
  KEY `scUser_nationalityId` (`nationalityId`) USING BTREE,
  KEY `scUser_timeZoneId` (`timeZoneId`) USING BTREE,
  KEY `scUser_userTypeId` (`userType`),
  CONSTRAINT `scUser_RoleCategoryId` FOREIGN KEY (`RoleCategoryId`) REFERENCES `roleCategory` (`roleCategoryId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `scUser_genderId` FOREIGN KEY (`genderId`) REFERENCES `gender` (`genderId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `scUser_nationalityId` FOREIGN KEY (`nationalityId`) REFERENCES `country` (`countryId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `scUser_preferredLanguageId` FOREIGN KEY (`preferredLanguageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `scUser_timeZoneId` FOREIGN KEY (`timeZoneId`) REFERENCES `timeZone` (`timeZoneId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `scUser_userTypeId` FOREIGN KEY (`userType`) REFERENCES `userType` (`userType`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12162 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scYear`
--

DROP TABLE IF EXISTS `scYear`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scYear` (
  `yearId` smallint(6) NOT NULL AUTO_INCREMENT,
  `yearName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`yearId`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenSection`
--

DROP TABLE IF EXISTS `screenSection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenSection` (
  `screenSectionId` smallint(6) NOT NULL AUTO_INCREMENT,
  `sectionName` varchar(100) NOT NULL,
  `step` smallint(6) DEFAULT NULL,
  `weightage` smallint(6) DEFAULT NULL,
  `roleCategoryId` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`screenSectionId`),
  KEY `screenSection_roleCategoryId` (`roleCategoryId`) USING BTREE,
  CONSTRAINT `screenSection_roleCategoryId` FOREIGN KEY (`roleCategoryId`) REFERENCES `roleCategory` (`roleCategoryId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shiftBreakRuleSettings`
--

DROP TABLE IF EXISTS `shiftBreakRuleSettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shiftBreakRuleSettings` (
  `breakRuleId` bigint(20) NOT NULL AUTO_INCREMENT,
  `businessSiteId` bigint(20) DEFAULT NULL,
  `departmentId` bigint(20) DEFAULT NULL,
  `subClassificationId` int(11) DEFAULT NULL,
  `longBreakDuration` int(11) DEFAULT NULL,
  `shortBreakDuration` int(11) DEFAULT NULL,
  `minShortShiftHours` int(11) DEFAULT NULL,
  `maxShortShiftHours` int(11) DEFAULT NULL,
  `minMediumShiftHours` int(11) DEFAULT NULL,
  `maxMediumShiftHours` int(11) DEFAULT NULL,
  `minLongShiftHours` int(11) DEFAULT NULL,
  `maxLongShiftHours` int(11) DEFAULT NULL,
  `longerShiftHours` int(11) DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`breakRuleId`),
  KEY `shiftBreakRuleSettings_ibfk_1` (`businessSiteId`) USING BTREE,
  KEY `shiftBreakRuleSettings_departmentId` (`departmentId`) USING BTREE,
  KEY `shiftBreakRuleSettings_subClassificationId` (`subClassificationId`) USING BTREE,
  CONSTRAINT `shiftBreakRuleSettings_departmentId` FOREIGN KEY (`departmentId`) REFERENCES `businessDepartment` (`departmentId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `shiftBreakRuleSettings_ibfk_1` FOREIGN KEY (`businessSiteId`) REFERENCES `businessSite` (`businessSiteId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `shiftBreakRuleSettings_subClassificationId` FOREIGN KEY (`subClassificationId`) REFERENCES `jobSubClassification` (`jobSubClassificationId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=516 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `skill`
--

DROP TABLE IF EXISTS `skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skill` (
  `skillId` int(11) NOT NULL AUTO_INCREMENT,
  `languageId` int(11) DEFAULT NULL,
  `employmentProfileId` smallint(6) NOT NULL,
  PRIMARY KEY (`skillId`),
  KEY `skill_employmentProfileId` (`employmentProfileId`) USING BTREE,
  KEY `skill_languageId` (`languageId`) USING BTREE,
  CONSTRAINT `skill_employmentProfileId` FOREIGN KEY (`employmentProfileId`) REFERENCES `employmentProfile` (`employmentProfileId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `skill_languageId` FOREIGN KEY (`languageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `skillLocale`
--

DROP TABLE IF EXISTS `skillLocale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skillLocale` (
  `skillId` int(11) NOT NULL,
  `languageId` int(11) NOT NULL,
  `skillName` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`skillId`,`languageId`),
  KEY `skillLocale_languageId` (`languageId`) USING BTREE,
  CONSTRAINT `skillLocale_languageId` FOREIGN KEY (`languageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `skillLocale_skillId` FOREIGN KEY (`skillId`) REFERENCES `skill` (`skillId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state` (
  `stateId` bigint(20) NOT NULL AUTO_INCREMENT,
  `countryId` bigint(20) DEFAULT NULL,
  `defaultLanguageId` int(11) DEFAULT NULL,
  PRIMARY KEY (`stateId`),
  KEY `state_countryId` (`countryId`) USING BTREE,
  KEY `state_defaultLanguageId` (`defaultLanguageId`) USING BTREE,
  CONSTRAINT `state_countryId` FOREIGN KEY (`countryId`) REFERENCES `country` (`countryId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `state_defaultLanguageId` FOREIGN KEY (`defaultLanguageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stateCity`
--

DROP TABLE IF EXISTS `stateCity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stateCity` (
  `cityId` bigint(20) DEFAULT NULL,
  `stateId` bigint(20) DEFAULT NULL,
  `lattitude` decimal(18,10) DEFAULT NULL,
  `longitude` decimal(18,10) DEFAULT NULL,
  KEY `stateCity_stateId` (`stateId`) USING BTREE,
  KEY `stateCity_cityId` (`cityId`) USING BTREE,
  CONSTRAINT `stateCity_cityId` FOREIGN KEY (`cityId`) REFERENCES `city` (`cityId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `stateCity_stateId` FOREIGN KEY (`stateId`) REFERENCES `state` (`stateId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stateLocale`
--

DROP TABLE IF EXISTS `stateLocale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stateLocale` (
  `stateId` bigint(20) NOT NULL,
  `languageId` int(11) NOT NULL,
  `stateName` varchar(50) DEFAULT NULL,
  `abbreviation` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`stateId`,`languageId`),
  KEY `stateLocale_languageId` (`languageId`) USING BTREE,
  CONSTRAINT `stateLocale_languageId` FOREIGN KEY (`languageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `stateLocale_stateId` FOREIGN KEY (`stateId`) REFERENCES `state` (`stateId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `statusLookup`
--

DROP TABLE IF EXISTS `statusLookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statusLookup` (
  `statusId` tinyint(4) NOT NULL,
  `statusName` varchar(50) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`statusId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `studentType`
--

DROP TABLE IF EXISTS `studentType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studentType` (
  `studentTypeId` tinyint(4) NOT NULL AUTO_INCREMENT,
  `defaultLanguageId` int(11) NOT NULL,
  PRIMARY KEY (`studentTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `studentTypeLocale`
--

DROP TABLE IF EXISTS `studentTypeLocale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studentTypeLocale` (
  `studentTypeId` tinyint(4) NOT NULL,
  `languageId` int(11) NOT NULL,
  `studentType` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`studentTypeId`,`languageId`),
  KEY `studentTypeLocale_languageId_idx` (`languageId`) USING BTREE,
  CONSTRAINT `studentTypeLocale_languageId` FOREIGN KEY (`languageId`) REFERENCES `language` (`languageId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `studentTypeLocale_studentTypeId` FOREIGN KEY (`studentTypeId`) REFERENCES `studentType` (`studentTypeId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subClassification`
--

DROP TABLE IF EXISTS `subClassification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subClassification` (
  `jobSubClassificationId` int(11) NOT NULL AUTO_INCREMENT,
  `defaultLanguageId` int(11) DEFAULT NULL,
  PRIMARY KEY (`jobSubClassificationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `timeSheet`
--

DROP TABLE IF EXISTS `timeSheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timeSheet` (
  `timeSheetId` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) DEFAULT NULL,
  `jobId` bigint(20) DEFAULT NULL,
  `businessSiteId` bigint(20) DEFAULT NULL,
  `agencySiteId` bigint(20) DEFAULT NULL,
  `timeSheetDate` bigint(20) DEFAULT NULL,
  `timeSheetDateOffset` int(11) DEFAULT NULL,
  `timeSheetDateTimeZoneId` varchar(50) DEFAULT NULL,
  `timeSheetStartTime` bigint(20) DEFAULT NULL,
  `timeSheetEndTime` bigint(20) DEFAULT NULL,
  `approvedBy` bigint(20) DEFAULT NULL,
  `approvedDate` bigint(20) DEFAULT NULL,
  `approvedDateOffset` int(11) DEFAULT NULL,
  `approvedDateTimeZoneId` varchar(50) DEFAULT NULL,
  `timeSheetStatusId` tinyint(4) DEFAULT NULL,
  `timeSheetCreatedOn` bigint(20) DEFAULT NULL,
  `timeSheetCreatedOffset` int(11) DEFAULT NULL,
  `timeSheetCreatedTimeZoneId` varchar(50) DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  PRIMARY KEY (`timeSheetId`),
  KEY `timeSheet_businessSiteId` (`businessSiteId`) USING BTREE,
  CONSTRAINT `timeSheet_businessSiteId` FOREIGN KEY (`businessSiteId`) REFERENCES `business` (`businessId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `timeSheetFormat`
--

DROP TABLE IF EXISTS `timeSheetFormat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timeSheetFormat` (
  `timeSheetFormatId` tinyint(4) NOT NULL AUTO_INCREMENT,
  `defaultLanguageId` int(11) DEFAULT NULL,
  PRIMARY KEY (`timeSheetFormatId`),
  KEY `timeSheetFormat_defaultLanguageId` (`defaultLanguageId`) USING BTREE,
  CONSTRAINT `timeSheetFormat_defaultLanguageId` FOREIGN KEY (`defaultLanguageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `timeSheetFormatLocale`
--

DROP TABLE IF EXISTS `timeSheetFormatLocale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timeSheetFormatLocale` (
  `timeSheetFormatId` tinyint(4) NOT NULL,
  `timeSheetFormat` varchar(50) DEFAULT NULL,
  `languageId` int(11) NOT NULL,
  PRIMARY KEY (`timeSheetFormatId`,`languageId`),
  KEY `timeSheetFormatLocale_languageId` (`languageId`) USING BTREE,
  CONSTRAINT `timeSheetFormatLocale_languageId` FOREIGN KEY (`languageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `timeSheetFormatLocale_timeSheetFormatId` FOREIGN KEY (`timeSheetFormatId`) REFERENCES `timeSheetFormat` (`timeSheetFormatId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `timeSheetStatus`
--

DROP TABLE IF EXISTS `timeSheetStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timeSheetStatus` (
  `timeSheetStatusId` tinyint(4) NOT NULL AUTO_INCREMENT,
  `defaultLanguageId` int(11) NOT NULL,
  PRIMARY KEY (`timeSheetStatusId`),
  KEY `timeSheetStatus_defaultLanguageId` (`defaultLanguageId`) USING BTREE,
  CONSTRAINT `timeSheetStatus_defaultLanguageId` FOREIGN KEY (`defaultLanguageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `timeSheetStatusLocale`
--

DROP TABLE IF EXISTS `timeSheetStatusLocale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timeSheetStatusLocale` (
  `timeSheetStatusId` tinyint(4) NOT NULL,
  `languageId` int(11) NOT NULL,
  `timeSheetStatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`timeSheetStatusId`,`languageId`),
  KEY `timeSheetStatusLocale_languageId` (`languageId`) USING BTREE,
  CONSTRAINT `timeSheetStatusLocale_languageId` FOREIGN KEY (`languageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `timeSheetStatusLocale_timeSheetStatusId` FOREIGN KEY (`timeSheetStatusId`) REFERENCES `timeSheetStatus` (`timeSheetStatusId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `timeSheetweekEnd`
--

DROP TABLE IF EXISTS `timeSheetweekEnd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timeSheetweekEnd` (
  `weekEndDayId` tinyint(4) NOT NULL AUTO_INCREMENT,
  `defaultLanguageId` int(11) DEFAULT NULL,
  PRIMARY KEY (`weekEndDayId`),
  KEY `timeSheetweekEnd_defaultLanguageId` (`defaultLanguageId`) USING BTREE,
  CONSTRAINT `timeSheetweekEnd_defaultLanguageId` FOREIGN KEY (`defaultLanguageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `timeSheetweekEndLocale`
--

DROP TABLE IF EXISTS `timeSheetweekEndLocale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timeSheetweekEndLocale` (
  `weekEndDayId` tinyint(4) NOT NULL,
  `languageId` int(11) NOT NULL,
  `weekEndDay` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`weekEndDayId`,`languageId`),
  KEY `timeSheetweekEndLocale_languageId` (`languageId`) USING BTREE,
  CONSTRAINT `timeSheetweekEndLocale_languageId` FOREIGN KEY (`languageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `timeSheetweekEndLocale_weekEndDayId` FOREIGN KEY (`weekEndDayId`) REFERENCES `timeSheetweekEnd` (`weekEndDayId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `timeZone`
--

DROP TABLE IF EXISTS `timeZone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timeZone` (
  `timeZoneId` int(11) NOT NULL AUTO_INCREMENT,
  `timeZoneName` varchar(100) DEFAULT NULL,
  `timeZoneFormat` varchar(100) DEFAULT NULL,
  `timeDiffInMinutes` int(11) DEFAULT NULL,
  PRIMARY KEY (`timeZoneId`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `timeZoneLocale`
--

DROP TABLE IF EXISTS `timeZoneLocale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timeZoneLocale` (
  `timeZoneId` int(11) NOT NULL,
  `timeZoneName` varchar(100) DEFAULT NULL,
  `timeZoneFormat` varchar(100) DEFAULT NULL,
  `languageId` int(11) NOT NULL,
  `timeZoneGMT` varchar(15) DEFAULT NULL,
  `sortOrder` int(11) DEFAULT NULL,
  PRIMARY KEY (`timeZoneId`,`languageId`),
  KEY `timeZoneLocale_languageId` (`languageId`) USING BTREE,
  CONSTRAINT `timeZoneLocale_languageId` FOREIGN KEY (`languageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `timeZoneLocale_timeZoneId` FOREIGN KEY (`timeZoneId`) REFERENCES `timeZone` (`timeZoneId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `timesheetBeaconDetail`
--

DROP TABLE IF EXISTS `timesheetBeaconDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timesheetBeaconDetail` (
  `timesheetId` bigint(20) NOT NULL,
  `beaconId` bigint(20) NOT NULL,
  `clockMode` tinyint(4) DEFAULT NULL,
  `clockTime` datetime DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  KEY `timesheetBeaconDetail_beaconId` (`beaconId`),
  KEY `timesheetBeaconDetail_timesheetId` (`timesheetId`),
  CONSTRAINT `timesheetBeaconDetail_beaconId` FOREIGN KEY (`beaconId`) REFERENCES `beacon` (`beaconId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `timesheetBeaconDetail_timesheetId` FOREIGN KEY (`timesheetId`) REFERENCES `candidateTimesheet` (`timeSheetId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `typeOfVisa`
--

DROP TABLE IF EXISTS `typeOfVisa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `typeOfVisa` (
  `typeOfVisaId` bigint(20) NOT NULL AUTO_INCREMENT,
  `countryId` bigint(20) NOT NULL,
  `defaultlanguageId` int(11) DEFAULT NULL,
  PRIMARY KEY (`typeOfVisaId`),
  KEY `typeOfVisa_defaultlanguageId` (`defaultlanguageId`) USING BTREE,
  CONSTRAINT `typeOfVisa_defaultlanguageId` FOREIGN KEY (`defaultlanguageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `typeOfVisaLocale`
--

DROP TABLE IF EXISTS `typeOfVisaLocale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `typeOfVisaLocale` (
  `typeOfVisaId` bigint(20) NOT NULL,
  `typeOfVisaName` varchar(500) DEFAULT NULL,
  `languageId` int(11) NOT NULL,
  PRIMARY KEY (`typeOfVisaId`,`languageId`),
  KEY `typeOfVisaLocale_languageId` (`languageId`) USING BTREE,
  CONSTRAINT `typeOfVisaLocale_languageId` FOREIGN KEY (`languageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userContact`
--

DROP TABLE IF EXISTS `userContact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userContact` (
  `userID` bigint(20) NOT NULL,
  `homePhone` longtext,
  `workPhone` longtext,
  `mobilePhone` longtext,
  `isDeleted` bit(1) DEFAULT NULL,
  `fax` longtext,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`userID`),
  CONSTRAINT `userContact_userID` FOREIGN KEY (`userID`) REFERENCES `scUser` (`userId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userDevice`
--

DROP TABLE IF EXISTS `userDevice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userDevice` (
  `userID` bigint(20) NOT NULL,
  `deviceTypeID` smallint(6) NOT NULL,
  `deviceToken` varchar(200) NOT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT b'0',
  `deviceId` varchar(200) NOT NULL,
  `isForceLogOut` bit(1) DEFAULT b'0',
  `shiftOfferNFSentTime` datetime DEFAULT NULL,
  `viewShiftOffers` bit(1) DEFAULT b'1',
  PRIMARY KEY (`userID`,`deviceTypeID`,`deviceId`),
  KEY `userDevice_deviceTypeID` (`deviceTypeID`) USING BTREE,
  CONSTRAINT `userDevice_deviceTypeID` FOREIGN KEY (`deviceTypeID`) REFERENCES `deviceType` (`deviceTypeID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `userDevice_userID` FOREIGN KEY (`userID`) REFERENCES `scUser` (`userId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userLastLogin`
--

DROP TABLE IF EXISTS `userLastLogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userLastLogin` (
  `userId` bigint(20) NOT NULL,
  `deviceTypeId` smallint(4) NOT NULL,
  `lastLoginTime` datetime NOT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`userId`,`deviceTypeId`),
  KEY `userLastLogin_DeviceType` (`deviceTypeId`),
  CONSTRAINT `userLastLogin_DeviceType` FOREIGN KEY (`deviceTypeId`) REFERENCES `deviceType` (`deviceTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `userLastLogin_userId` FOREIGN KEY (`userId`) REFERENCES `scUser` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userProfileImage`
--

DROP TABLE IF EXISTS `userProfileImage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userProfileImage` (
  `userId` bigint(20) NOT NULL,
  `imageName` varchar(200) DEFAULT NULL,
  `imagePath` varchar(1000) DEFAULT NULL,
  `imageMimeType` varchar(6) DEFAULT NULL,
  `eTag` varchar(1000) DEFAULT NULL,
  `fileStatus` tinyint(4) DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`userId`),
  CONSTRAINT `userProfileImage_userId` FOREIGN KEY (`userId`) REFERENCES `scUser` (`userId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userRole`
--

DROP TABLE IF EXISTS `userRole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userRole` (
  `userRoleId` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) DEFAULT NULL,
  `roleId` bigint(20) DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `roleCategoryId` tinyint(4) DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`userRoleId`),
  KEY `userRole_roleId` (`roleId`) USING BTREE,
  KEY `userRole_userId` (`userId`) USING BTREE,
  KEY `userRole_roleCategoryId` (`roleCategoryId`) USING BTREE,
  CONSTRAINT `userRole_roleCategoryId` FOREIGN KEY (`roleCategoryId`) REFERENCES `roleCategory` (`roleCategoryId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `userRole_roleId` FOREIGN KEY (`roleId`) REFERENCES `roleInfo` (`roleId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `userRole_userId` FOREIGN KEY (`userId`) REFERENCES `scUser` (`userId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11965 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userRoleAgencySite`
--

DROP TABLE IF EXISTS `userRoleAgencySite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userRoleAgencySite` (
  `userRoleId` bigint(20) NOT NULL,
  `agencySiteId` bigint(20) NOT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT b'0',
  `userRoleAgencySiteId` bigint(20) NOT NULL AUTO_INCREMENT,
  `status` tinyint(4) DEFAULT '2',
  PRIMARY KEY (`userRoleAgencySiteId`),
  KEY `userRoleAgencySite_agencySiteId` (`agencySiteId`) USING BTREE,
  KEY `userRoleAgencySite_userRoleId` (`userRoleId`) USING BTREE,
  CONSTRAINT `userRoleAgencySite_agencySiteId` FOREIGN KEY (`agencySiteId`) REFERENCES `agencySite` (`agencySiteId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `userRoleAgencySite_userRoleId` FOREIGN KEY (`userRoleId`) REFERENCES `userRole` (`userRoleId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userRoleBusinessSite`
--

DROP TABLE IF EXISTS `userRoleBusinessSite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userRoleBusinessSite` (
  `userRoleId` bigint(20) NOT NULL,
  `businessSiteId` bigint(20) NOT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT b'0',
  `userRoleBusinessSiteId` bigint(20) NOT NULL AUTO_INCREMENT,
  `status` tinyint(4) DEFAULT '2',
  PRIMARY KEY (`userRoleBusinessSiteId`),
  KEY `userRoleBusinessSite_businessSiteId` (`businessSiteId`) USING BTREE,
  KEY `userRoleBusinessSite_userRoleId` (`userRoleId`) USING BTREE,
  CONSTRAINT `userRoleBusinessSite_businessSiteId` FOREIGN KEY (`businessSiteId`) REFERENCES `businessSite` (`businessSiteId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `userRoleBusinessSite_userRoleId` FOREIGN KEY (`userRoleId`) REFERENCES `userRole` (`userRoleId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16317 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userTempEmailId`
--

DROP TABLE IF EXISTS `userTempEmailId`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userTempEmailId` (
  `userId` bigint(20) NOT NULL,
  `emailId` varchar(100) NOT NULL,
  `isCompleted` bit(1) DEFAULT b'0',
  `createdOn` datetime DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `userTempEmailId_userId` FOREIGN KEY (`userId`) REFERENCES `scUser` (`userId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userType`
--

DROP TABLE IF EXISTS `userType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userType` (
  `userType` tinyint(4) NOT NULL,
  `typeName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `vwCandidateRosterDetails`
--

DROP TABLE IF EXISTS `vwCandidateRosterDetails`;
/*!50001 DROP VIEW IF EXISTS `vwCandidateRosterDetails`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vwCandidateRosterDetails` AS SELECT 
 1 AS `candidateId`,
 1 AS `businessSiteId`,
 1 AS `departmentId`,
 1 AS `jobProfileId`,
 1 AS `jobSubClassificationId`,
 1 AS `empStartDate`,
 1 AS `empEndDate`,
 1 AS `jobProfileHireRequestId`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `wageType`
--

DROP TABLE IF EXISTS `wageType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wageType` (
  `wageTypeId` tinyint(4) NOT NULL AUTO_INCREMENT,
  `defaultLanguageId` int(11) DEFAULT NULL,
  PRIMARY KEY (`wageTypeId`),
  KEY `wageType_defaultLanguageId` (`defaultLanguageId`) USING BTREE,
  CONSTRAINT `wageType_defaultLanguageId` FOREIGN KEY (`defaultLanguageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wageTypeLocale`
--

DROP TABLE IF EXISTS `wageTypeLocale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wageTypeLocale` (
  `wageTypeId` tinyint(4) NOT NULL,
  `wageType` varchar(50) DEFAULT NULL,
  `languageId` int(11) NOT NULL,
  PRIMARY KEY (`wageTypeId`,`languageId`),
  KEY `wageTypeLocale_languageId` (`languageId`) USING BTREE,
  CONSTRAINT `wageTypeLocale_languageId` FOREIGN KEY (`languageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `wageTypeLocale_wageTypeId` FOREIGN KEY (`wageTypeId`) REFERENCES `wageType` (`wageTypeId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `weekDay`
--

DROP TABLE IF EXISTS `weekDay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weekDay` (
  `weekDayId` tinyint(4) NOT NULL AUTO_INCREMENT,
  `defaultLanguageId` char(10) DEFAULT NULL,
  PRIMARY KEY (`weekDayId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `weekDayLocale`
--

DROP TABLE IF EXISTS `weekDayLocale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weekDayLocale` (
  `weekDayId` tinyint(4) NOT NULL,
  `languageId` int(11) NOT NULL,
  `weekDay` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`weekDayId`,`languageId`),
  CONSTRAINT `weekDayLocale_weekDayId` FOREIGN KEY (`weekDayId`) REFERENCES `weekDay` (`weekDayId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `workFlowEvent`
--

DROP TABLE IF EXISTS `workFlowEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workFlowEvent` (
  `eventId` int(11) NOT NULL AUTO_INCREMENT,
  `eventName` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`eventId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `workFlowHistory`
--

DROP TABLE IF EXISTS `workFlowHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workFlowHistory` (
  `workflowHistoryId` bigint(20) NOT NULL AUTO_INCREMENT,
  `workflowInstanceId` bigint(20) DEFAULT NULL,
  `transitId` int(11) DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  PRIMARY KEY (`workflowHistoryId`),
  KEY `workFlowHistory_transitId` (`transitId`) USING BTREE,
  KEY `workFlowHistory_workflowInstanceId` (`workflowInstanceId`) USING BTREE,
  CONSTRAINT `workFlowHistory_transitId` FOREIGN KEY (`transitId`) REFERENCES `workFlowStateTransition` (`transitId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `workFlowHistory_workflowInstanceId` FOREIGN KEY (`workflowInstanceId`) REFERENCES `workFlowInstance` (`workflowInstanceId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11717 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `workFlowInstance`
--

DROP TABLE IF EXISTS `workFlowInstance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workFlowInstance` (
  `workflowInstanceId` bigint(20) NOT NULL AUTO_INCREMENT,
  `workFlowId` tinyint(4) DEFAULT NULL,
  `currentStateId` int(11) DEFAULT NULL,
  `parentWorkflowInstanceId` bigint(20) DEFAULT NULL,
  `businessSiteId` bigint(20) DEFAULT NULL,
  `jobProfileHireRequestId` bigint(20) DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`workflowInstanceId`),
  KEY `workFlowInstance_workFlowId` (`workFlowId`) USING BTREE,
  KEY `workFlowInstance_currentStateId` (`currentStateId`) USING BTREE,
  KEY `workFlowInstance_businessSiteId` (`businessSiteId`) USING BTREE,
  KEY `workFlowInstance_jobProfileHireRequestId` (`jobProfileHireRequestId`) USING BTREE,
  CONSTRAINT `workFlowInstance_businessSiteId` FOREIGN KEY (`businessSiteId`) REFERENCES `businessSite` (`businessSiteId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `workFlowInstance_currentStateId` FOREIGN KEY (`currentStateId`) REFERENCES `workFlowState` (`stateId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `workFlowInstance_jobProfileHireRequestId` FOREIGN KEY (`jobProfileHireRequestId`) REFERENCES `jobProfileHireRequest` (`jobProfileHireRequestId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `workFlowInstance_workFlowId` FOREIGN KEY (`workFlowId`) REFERENCES `businessWorkFlow` (`workFlowId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17155 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `workFlowState`
--

DROP TABLE IF EXISTS `workFlowState`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workFlowState` (
  `stateId` int(11) NOT NULL AUTO_INCREMENT,
  `stateName` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`stateId`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `workFlowStateTransition`
--

DROP TABLE IF EXISTS `workFlowStateTransition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workFlowStateTransition` (
  `transitId` int(11) NOT NULL AUTO_INCREMENT,
  `stateId` int(11) DEFAULT NULL,
  `eventId` int(11) DEFAULT NULL,
  `transitStateId` int(11) DEFAULT NULL,
  PRIMARY KEY (`transitId`),
  UNIQUE KEY `workFlowStateEvent` (`stateId`,`eventId`) USING BTREE,
  KEY `workFlowStateTransition_transitStateId` (`transitStateId`) USING BTREE,
  KEY `workFlowStateTransition_eventId` (`eventId`) USING BTREE,
  CONSTRAINT `workFlowStateTransition_eventId` FOREIGN KEY (`eventId`) REFERENCES `workFlowEvent` (`eventId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `workFlowStateTransition_stateId` FOREIGN KEY (`stateId`) REFERENCES `workFlowState` (`stateId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `workFlowStateTransition_transitStateId` FOREIGN KEY (`transitStateId`) REFERENCES `workFlowState` (`stateId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zipCode`
--

DROP TABLE IF EXISTS `zipCode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zipCode` (
  `countryId` bigint(20) DEFAULT NULL,
  `stateId` bigint(20) DEFAULT NULL,
  `cityId` bigint(20) DEFAULT NULL,
  `zCode` varchar(10) DEFAULT NULL,
  `languageId` int(11) DEFAULT NULL,
  KEY `zipCode_languageId` (`languageId`) USING BTREE,
  KEY `zipCode_cityId` (`cityId`) USING BTREE,
  KEY `zipCode_countryId` (`countryId`) USING BTREE,
  KEY `zipCode_stateId` (`stateId`) USING BTREE,
  CONSTRAINT `zipCode_cityId` FOREIGN KEY (`cityId`) REFERENCES `city` (`cityId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `zipCode_countryId` FOREIGN KEY (`countryId`) REFERENCES `country` (`countryId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `zipCode_languageId` FOREIGN KEY (`languageId`) REFERENCES `language` (`languageId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `zipCode_stateId` FOREIGN KEY (`stateId`) REFERENCES `state` (`stateId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Final view structure for view `vwCandidateRosterDetails`
--

/*!50001 DROP VIEW IF EXISTS `vwCandidateRosterDetails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `vwCandidateRosterDetails` AS select `hrc`.`candidateUserId` AS `candidateId`,`jpbs`.`businessSiteId` AS `businessSiteId`,`jp`.`departmentId` AS `departmentId`,`jp`.`jobProfileId` AS `jobProfileId`,`jp`.`jobSubClassificationId` AS `jobSubClassificationId`,`hrd`.`empStartDate` AS `empStartDate`,`hrd`.`empEndDate` AS `empEndDate`,`hrc`.`jobProfileHireRequestId` AS `jobProfileHireRequestId` from ((((((`hireRequestCandidate` `hrc` join `jobProfileHireRequest` `jphr` on((`hrc`.`jobProfileHireRequestId` = `jphr`.`jobProfileHireRequestId`))) join `jobProfileBusinessSite` `jpbs` on((`jphr`.`jobProfileBusinessSiteId` = `jpbs`.`jobProfileBusinessSiteId`))) join `jobProfile` `jp` on((`jphr`.`jobProfileId` = `jp`.`jobProfileId`))) join `hireRequestDetail` `hrd` on((`jphr`.`jobProfileHireRequestId` = `hrd`.`jobProfileHireRequestId`))) join `businessSite` `bs` on((`jpbs`.`businessSiteId` = `bs`.`businessSiteId`))) join `timeZone` `tz` on((`bs`.`timeZoneId` = `tz`.`timeZoneId`))) where ((`hrc`.`candidateHRStatus` = 11) and (`hrd`.`empEndDate` >= cast((utc_timestamp() + interval `tz`.`timeDiffInMinutes` minute) as date)) and (`jphr`.`isDeleted` = 0) and (`hrc`.`isDeleted` = 0) and (`jpbs`.`isDeleted` = 0) and (`jp`.`isDeleted` = 0) and (`bs`.`isDeleted` = 0)) order by `hrc`.`candidateUserId` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-22 12:22:57
