-- The taxpayerID field in IRSagents should reference the taxpayerID primary key in Individuals

ALTER TABLE IRSagents
ADD FOREIGN KEY (taxpayerID)
REFERENCES Individuals(taxpayerID);

-- The IRSagentID field in Delinquents should reference the IRSagentID primary key in IRSagents.

ALTER TABLE Delinquents
ADD FOREIGN KEY (IRSagentID)
REFERENCES IRSagents(IRSagentID);

-- The collectionAgencyID field in Delinquents should reference the taxpayerID primary key in
-- Businesses.

ALTER TABLE Delinquents
ADD FOREIGN KEY (collectionAgencyID)
REFERENCES Businesses(taxpayerID);