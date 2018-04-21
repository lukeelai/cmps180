-- Create a view named TaxDebts. For each taxpayerID in TaxReturns, this view should provide taxpayerID and
-- the sum of taxOwed in the TaxReturns for that taxpayerID. In your result, the second attribute should be called
-- debt. But only include a tuple for a taxpayerID if that taxpayerID has at least 4 tax returns in TaxReturns

CREATE VIEW TaxDebts AS
	SELECT taxpayerID, SUM(taxOwed) AS debt
	FROM TaxReturns
	GROUP BY taxpayerID
	HAVING COUNT(taxpayerID) >= 4;
	
-- Create a second view named PaymentCredits. For each taxpayerID in Payments, this view should provide
-- taxpayerID, the biggest value of datePaid for that taxpayerID in Payments, and the total of amountPaid for that
-- taxpayerID in Payments. In your result, the attributes should be called taxpayerID, biggestDatePaid and credit.
-- But only include a tuple for a taxpayerID if that taxpayerID has at least 2 different amountPaid values in
-- Payments.

CREATE VIEW PaymentCredits AS
SELECT taxpayerID, MAX(datePaid) AS biggestDatePaid, SUM(amountPaid) AS credit
FROM Payments
GROUP BY taxpayerID
HAVING COUNT(amountPaid) >= 2;