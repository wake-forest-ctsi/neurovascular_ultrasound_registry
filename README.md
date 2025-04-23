Welcome to your new dbt project!

### Using the starter project

Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices

```sql
duckdb iscv.duckdb
create schema raw;
set schema='raw';

CREATE TABLE EchoFindingCodesEmbeddedInStudy (
	PerformedProcedureID VARCHAR,
	CodingScheme VARCHAR,
	FindingCode VARCHAR,
	FindingCodeText VARCHAR,
	MenuText VARCHAR,
	SeverityCode BIGINT,
	FindingGroupID VARCHAR,
	SequenceInGroup BIGINT,
	PatientID VARCHAR,
	ReportVersion VARCHAR,
	AuxiliaryText VARCHAR,
	QualifierID VARCHAR,
	CarotidVesselSegmentID VARCHAR,
	EchoLateralityID VARCHAR,
	ReportProfileID VARCHAR)
;
COPY EchoFindingCodesEmbeddedInStudy FROM '.private/EchoFindingCodesEmbeddedInStudy.csv';

CREATE TABLE EchoStudies(
	PerformedProcedureID VARCHAR,
	ProcedureStatus VARCHAR,
	ProcedureStatusDBKey VARCHAR,
	ProcedureStartDate TIMESTAMP,
	FormattedProcedureDate DATE,
	PatientID VARCHAR,
	PatientLastName VARCHAR,
	PatientFirstName VARCHAR,
	PatientMiddleName VARCHAR,
	PatientName VARCHAR,
	ReferringPhysicianID VARCHAR,
	ReferringPhysicianLastName VARCHAR,
	ReferringPhysicianFirstName VARCHAR,
	ReferringPhysicianMiddleName VARCHAR,
	ReferringPhysician VARCHAR,
	OrderingStaffID VARCHAR,
	OrderingStaffLastName VARCHAR,
	OrderingStaffFirstName VARCHAR,
	OrderingStaffMiddleName VARCHAR,
	OrderingStaff VARCHAR,
	TechnologistID VARCHAR,
	TechnologistLastName VARCHAR,
	TechnologistFirstName VARCHAR,
	TechnologistMiddleName VARCHAR,
	Technologist VARCHAR,
	ReviewerID VARCHAR,
	ReviewerLastName VARCHAR,
	ReviewerFirstName VARCHAR,
	ReviewerMiddleName VARCHAR,
	Reviewer VARCHAR,
	ReadingPhysicianID VARCHAR,
	ReadingPhysicianLastName VARCHAR,
	ReadingPhysicianFirstName VARCHAR,
	ReadingPhysicianMiddleName VARCHAR,
	ReadingPhysician VARCHAR,
	ResultToPhysicianID VARCHAR,
	ResultToPhysicianLastName VARCHAR,
	ResultToPhysicianFirstName VARCHAR,
	ResultToPhysicianMiddleName VARCHAR,
	ResultToPhysician VARCHAR,
	StudyLocationID VARCHAR,
	StudyLocation VARCHAR,
	PatientClass VARCHAR,
	PatientClassCode VARCHAR,
	EchoReasonForStudyID VARCHAR,
	EchoReasonForStudy VARCHAR,
	PatientHeight VARCHAR,
	HeightUnitOfMeasure VARCHAR,
	PatientWeight VARCHAR,
	WeightUnitOfMeasure VARCHAR,
	SystolicPressure VARCHAR,
	DiastolicPressure VARCHAR,
	PressureUnitOfMeasure VARCHAR,
	HeartRateBPM VARCHAR,
	PrimaryStudyFlag BIGINT,
	StatusLastChangedDateTime TIMESTAMP,
	EnteredName VARCHAR,
	EnteredMRN VARCHAR,
	ImageFormat VARCHAR,
	Printed VARCHAR,
	StudyType VARCHAR,
	StudyTypeCategory VARCHAR,
	StudyTypeShortName VARCHAR,
	ImageQualityIndex VARCHAR,
	ProtocolID VARCHAR,
	TargetHeartRateBPM VARCHAR,
	TargetHROverride VARCHAR,
	PercentTargetHeartRateBPM VARCHAR,
	PercentTargetHROverride VARCHAR,
	MaxPredictedHeartRateBPM VARCHAR,
	MaxPredictedHROverride VARCHAR,
	DurationOfStress VARCHAR,
	DurationOfStressOverride BIGINT,
	DurationOfExercise VARCHAR,
	StressDrugID VARCHAR,
	DurationOfDrugInfusion VARCHAR,
	METS VARCHAR,
	VideoTapeNumber VARCHAR,
	LocationOnVideoTape VARCHAR,
	Priority VARCHAR,
	SuggestedReportingProfileID BIGINT,
	FillerOrderNumber VARCHAR,
	PercentMaxPredictedHeartRateBPM VARCHAR,
	PercentMaxPredictedHROverride VARCHAR,
	PatientLocationID VARCHAR,
	PatientLocation VARCHAR,
	StudyConfig1 VARCHAR,
	StudyConfig2 VARCHAR,
	StudyConfig3 VARCHAR,
	StudyConfig4 VARCHAR,
	StudyConfig5 VARCHAR,
	StudyConfig6 VARCHAR,
	StudyConfig7 VARCHAR,
	StudyConfig8 VARCHAR,
	StudyConfig9 VARCHAR,
	StudyConfig10 VARCHAR,
	Modality VARCHAR,
	ModalityType VARCHAR,
	InstitutionID VARCHAR,
	Institution VARCHAR,
	MRN VARCHAR,
	DateOfBirth TIMESTAMP);
COPY EchoStudies FROM '.private/EchoStudies.csv';

CREATE TABLE Patient( 
	PatientID INT
	,PatientLastName VARCHAR
	,PatientFirstName VARCHAR
	,PatientMiddleName VARCHAR
	,PatientName VARCHAR
	,DateOfBirth DATE
	,MRN VARCHAR
	,InstitutionID VARCHAR
	,Institution INT
	,Gender VARCHAR
	,Race VARCHAR
	,AddressLine1 VARCHAR
	,AddressLine2 VARCHAR
	,City VARCHAR
	,State VARCHAR
	,Zipcode VARCHAR
	,Country VARCHAR
	,HomeTelephoneNumber VARCHAR
	,OtherTelephoneNumber VARCHAR
	,MobilePhoneNumber VARCHAR
	,eMPI VARCHAR
	,LinkedPatientID INT
	,AlternateIDNumber VARCHAR
	,MedicalHistoryComment VARCHAR);
COPY Patient FROM '.private/Patient.csv';

.exit
```

```sql
select
	EchoFindingCodesEmbeddedInStudy.*
from
	DataMining.dbo.EchoStudies
	inner join DataMining.dbo.EchoFindingCodesEmbeddedInStudy on EchoStudies.PerformedProcedureID = EchoFindingCodesEmbeddedInStudy.PerformedProcedureID
where
	1 = 1
	AND EchoStudies.FormattedProcedureDate < '20240101'--@EndDate
	AND EchoStudies.StudyConfig3 like '%TRANSCRANIAL%'
;
```