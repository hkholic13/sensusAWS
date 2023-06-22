CREATE SCHEMA IF NOT EXISTS sensus_survey COLLATE utf8mb4_0900_ai_ci;

USE sensus_survey;

SET GLOBAL local_infile = 'ON';

SHOW GLOBAL VARIABLES LIKE 'local_infile';

DROP TABLE IF EXISTS survey_result;
CREATE TABLE `survey_result` (
  `Row_id` int NOT NULL,
  `Type` varchar(255) DEFAULT NULL,
  `Id` varchar(45) DEFAULT NULL,
  `DeviceId` varchar(300) DEFAULT NULL,
  `Timestamp` varchar(45) DEFAULT NULL,
  `ProtocolId` varchar(45) DEFAULT NULL,
  `BuildId` varchar(20) DEFAULT NULL,
  `ParticipantId` varchar(45) DEFAULT NULL,
  `DeviceManufacturer` varchar(20) DEFAULT NULL,
  `DeviceModel` varchar(20) DEFAULT NULL,
  `OperatingSystem` varchar(20) DEFAULT NULL,
  `TaggedEventId` varchar(255) DEFAULT NULL,
  `TaggedEventTags` varchar(255) DEFAULT NULL,
  `SensingAgentStateDescription` varchar(255) DEFAULT NULL,
  `LocalOffsetFromUTC` varchar(20) DEFAULT NULL,
  `Decibels` double DEFAULT NULL,
  `BatteryLevel` double DEFAULT NULL,
  `AccessPointBSSID` varchar(30) DEFAULT NULL,
  `Activity` varchar(20) DEFAULT NULL,
  `Phase` varchar(20) DEFAULT NULL,
  `State` varchar(20) DEFAULT NULL,
  `Confidence` varchar(20) DEFAULT NULL,
  `Latitude` double DEFAULT NULL,
  `Longitude` double DEFAULT NULL,
  `LocationAccuracy` double DEFAULT NULL,
  `ProtocolName` varchar(255) DEFAULT NULL,
  `Formatted_time` datetime DEFAULT NULL,
  PRIMARY KEY (`Row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


LOAD DATA LOCAL INFILE 'C:/Users/himan/OneDrive/Documents/group13_output.csv' INTO TABLE survey_result
   FIELDS TERMINATED BY ',' ESCAPED BY '\\' OPTIONALLY ENCLOSED BY '"'
   LINES TERMINATED BY '\n'
   ignore 1 lines;
select * from survey_result;

-- proj_5595-> Himanshi's device
SET @deviceId = 'AA756C5F-EBED-401C-B175-A3838A43A5C8';
select batteryLevel from survey_result where Type='Battery' and DeviceId=@deviceId;
select Min(Formatted_time),max(Formatted_time) from survey_result group by DeviceId having DeviceId=@deviceId;
select count(*) from survey_result where (Type='Battery' or Type='Battery SensusAndroid') and DeviceId=@deviceId;
select count(*) from survey_result where (Type='Sound' or Type='Sound SensusAndroid' ) and DeviceId=@deviceId;
select count(*) from survey_result where (Type='Activity' or Type='Activity SensusAndroid') and DeviceId=@deviceId;
select count(*) from survey_result where (Type='Wlan' or Type='Wlan SensusAndroid')  and DeviceId=@deviceId;
select count(*) from survey_result where Type='Location' or Type='Location SensusAndroid'  and DeviceId=@deviceId;
select count(*) as n, Activity as a from survey_result where DeviceId=@deviceId group by Activity;
create view v as select count(*) as n, Activity as a from survey_result where DeviceId=@deviceId group by Activity;
select a from v where n=(select max(n) from v);

-- proj_0941 -> Pavan's device
SET @deviceId = '2b07dc94f4cbd526';
select batteryLevel from survey_result where Type='Battery SensusAndroid' and DeviceId=@deviceId;
select Min(Formatted_time),max(Formatted_time) from survey_result group by DeviceId having DeviceId=@deviceId;
select count(*) from survey_result where (Type='Battery' or Type='Battery SensusAndroid') and DeviceId=@deviceId;
select count(*) from survey_result where (Type='Sound' or Type='Sound SensusAndroid' ) and DeviceId=@deviceId;
select count(*) from survey_result where (Type='Activity' or Type='Activity SensusAndroid') and DeviceId=@deviceId;
select count(*) from survey_result where (Type='Wlan' or Type='Wlan SensusAndroid')  and DeviceId=@deviceId;
select count(*) from survey_result where Type='Location' or Type='Location SensusAndroid'  and DeviceId=@deviceId;
select count(*) as n, Activity as a from survey_result where DeviceId=@deviceId group by Activity;
create view v as select count(*) as n, Activity as a from survey_result where DeviceId=@deviceId group by Activity;
select a from v where n=(select max(n) from v);

-- proj_6488 -> Hrushikesh's device
SET @participantId = 'proj_6488';

select batteryLevel from survey_result where Type='Battery SensusAndroid' and ParticipantId=@participantId;
select Min(Formatted_time),max(Formatted_time) from survey_result group by ParticipantId having ParticipantId=@participantId;
select count(*) from survey_result where (Type='Battery' or Type='Battery SensusAndroid') and ParticipantId=@participantId;
select count(*) from survey_result where (Type='Sound' or Type='Sound SensusAndroid' ) and ParticipantId=@participantId;
select count(*) from survey_result where (Type='Activity' or Type='Activity SensusAndroid') and ParticipantId=@participantId;
select count(*) from survey_result where (Type='Wlan' or Type='Wlan SensusAndroid')  and ParticipantId=@participantId;
select count(*) from survey_result where Type='Location' or Type='Location SensusAndroid'  and ParticipantId=@participantId;
select count(*) as n, Activity as a from survey_result where ParticipantId=@participantId group by Activity;
create view v as select count(*) as n, Activity as a from survey_result where ParticipantId=@participantId group by Activity;
select a from v where n=(select max(n) from v);

-- proj_7800 -> chiatanya's device
SET @participantId = 'proj_7800';
select batteryLevel from survey_result where Type='Battery SensusAndroid' and ParticipantId=@participantId;
select Min(Formatted_time),max(Formatted_time) from survey_result group by ParticipantId having ParticipantId=@participantId;
select count(*) from survey_result where (Type='Battery' or Type='Battery SensusAndroid') and ParticipantId=@participantId;
select count(*) from survey_result where (Type='Sound' or Type='Sound SensusAndroid' ) and ParticipantId=@participantId;
select count(*) from survey_result where (Type='Activity' or Type='Activity SensusAndroid') and ParticipantId=@participantId;
select count(*) from survey_result where (Type='Wlan' or Type='Wlan SensusAndroid')  and ParticipantId=@participantId;
select count(*) from survey_result where Type='Location' or Type='Location SensusAndroid'  and ParticipantId=@participantId;
select count(*) as n, Activity as a from survey_result where ParticipantId=@participantId group by Activity;
create view v as select count(*) as n, Activity as a from survey_result where ParticipantId=@participantId group by Activity;
select a from v where n=(select max(n) from v);