--No points deducted if you omit following DROP and CREATE

DROP SCHEMA Lab2 CASCADE;
CREATE SCHEMA Lab2;


--TaxReturns(taxpayerID, taxYear, kind, dateFiled, income, taxOwed)

CREATE TABLE TaxReturns (
	taxpayerID INT NOT NULL UNIQUE,
	taxYear INT,
	kind CHAR(1),
	dateFiled DATE NOT NULL UNIQUE,
	income DECIMAL(11, 2),
	taxOwed DECIMAL(11, 2),
	PRIMARY KEY (taxpayerID, taxYear)
);

--Payments(taxpayerID, datePaid, amountPaid)

CREATE TABLE Payments (
	taxpayerID INT,
	datePaid DATE,
	amountPaid DECIMAL(11, 2) NOT NULL,
	PRIMARY KEY (taxpayerID, datePaid)
);

--Individuals(taxpayerID, name, address, spouseID, lastDateFiled, lastDatePaid, totalTaxOwed)

CREATE TABLE Individuals (
	taxpayerID INT PRIMARY KEY,
	name VARCHAR(30),
	address VARCHAR(30),
	spouseID INT,
	lastDateFiled DATE,
	lastDatePaid DATE,
	totalTaxOwed DECIMAL(11, 2),
	UNIQUE(spouseID)
);

--Businesses(taxpayerID, name, address, businessType, lastDateFiled, lastDatePaid, totalTaxOwed)

CREATE TABLE Businesses ( 
	taxpayerID INT PRIMARY KEY,
	name VARCHAR(30),
	address VARCHAR(30),
	businessType CHAR(1),
	lastDateFiled DATE,
	lastDatePaid DATE,
	totalTaxOwed DECIMAL(11, 2),
	UNIQUE(name, address)
);

--IRSagents(IRSagentID, taxpayerID, jobLevel, active)

CREATE TABLE IRSagents (
	IRSagentID CHAR(6) PRIMARY KEY,
	taxpayerID INT NOT NULL, 
	jobLevel INT, 
	active BOOLEAN
);

--Delinquents(taxpayerID, IRSagentID, collectionAgencyID)

CREATE TABLE Delinquents (
	taxpayerID INT PRIMARY KEY, 
	IRSagentID CHAR(6), 
	collectionAgencyID INT
);