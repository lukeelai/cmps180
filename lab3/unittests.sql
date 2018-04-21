-- For each of the 3 foreign key constraints specified in section 2.3, write one unit test:
-- An INSERT command that violates the foreign key constraint (and elicits an error).

INSERT INTO IRSagents (IRSagentID, taxpayerID, jobLevel, active)
	-- (SELECT i.taxpayerID FROM Individuals i);
		VALUES (-100, -100, 1, TRUE);


INSERT INTO Delinquents(taxpayerID, IRSagentID, collectionAgencyID)
	-- (SELECT i.IRSagentID FROM IRSagents i);
		VALUES (-100, -100, -100);
	
INSERT INTO Delinquents(taxpayerID, IRSagentID, collectionAgencyID)
	-- (SELECT b.taxpayerID FROM Businesses b);
		VALUES(-50, -50, -50);

-- Also, for each of the 4 general constraints, write 2 unit tests:
-- An UPDATE command that meets the constraint.
-- An UPDATE command that violates the constraint (and elicits an error).

UPDATE Payments
SET amountPaid = 1000;

UPDATE Payments 
SET amountPaid = -1;


UPDATE Businesses
SET lastDateFiled = lastDatePaid;

UPDATE Businesses
SET lastDateFiled = lastDatePaid - interval '10' day;


UPDATE IRSagents
SET jobLevel = NULL, active = NULL;

UPDATE IRSagents
SET jobLevel = NULL, active = TRUE;


UPDATE Individuals
SET taxpayerID = spouseID - 1;

UPDATE Individuals
SET taxpayerID = spouseID;
