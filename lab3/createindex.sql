-- create an index named LookUpReturns over the
-- kind and dateFiled columns (in that order) of the TaxReturns table. Save the command in the file


CREATE INDEX LookUpReturns ON TaxReturns(kind, dateFiled);