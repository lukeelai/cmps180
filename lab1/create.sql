DROP SCHEMA Lab1 CASCADE;
CREATE SCHEMA Lab1;

--Create Tables

CREATE TABLE TaxReturns (
taxpayerID INT,
taxYear INT,
kind VARCHAR(1), /* kind character(1) */
dateFiled DATE,
income DECIMAL(11, 2),
taxOwed DECIMAL(11, 2),
PRIMARY KEY(taxpayerID, taxYear)
); 

CREATE TABLE Payments (
taxpayerID INT,
datePaid DATE,
amountPaid DECIMAL(11,2),
PRIMARY KEY(taxpayerID, datePaid)
); 

CREATE TABLE Individuals(
taxpayerID INT PRIMARY KEY,
name VARCHAR(30), /* name character(30) */
address VARCHAR(30), /* address character(30) */
spouseID INT,
lastDateFiled DATE,
lastDatePaid DATE,
totalTaxOwed DECIMAL(11, 2)
);

CREATE TABLE Businesses(
taxpayerID INT PRIMARY KEY,
name VARCHAR(30), /* name character(30) */ 
address VARCHAR(30), /* address character(30) */
businessType VARCHAR(1), /*businessType character(1) */
lastDateFiled DATE, 
lastDatePaid DATE, 
totalTaxOwed DECIMAL(11, 2)
);

CREATE TABLE IRSagents(
IRSagentID VARCHAR(6) PRIMARY KEY, /*IRSagentID character(6) */
taxpayerID INT,
jobLevel INT,
active BOOLEAN
);

CREATE TABLE Delinquents(
taxpayerID INT PRIMARY KEY,
IRSagentID VARCHAR(6), /*IRSagentID character(6) */
collectionAgencyID INT
);