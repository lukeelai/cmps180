-- Some tax payers have tuples appearing in the Delinquents table and also in the TaxDebts and
-- PaymentCredits views. For each tax payer that has tuples appearing in all 3, output that tax
-- payer’s taxpayerID, their debt (from TaxDebts) and their credit (from PaymentCredits).

SELECT t.taxpayerID, t.debt, p.credit
FROM TaxDebts t, PaymentCredits p, Delinquents d
WHERE t.taxpayerID = p.taxpayerID
	AND t.taxpayerID = d.taxpayerID; 

-- Result :  taxpayerid |   debt    |  credit
--			------------+-----------+-----------
--        			112 | 112765.00 | 122878.93

DELETE
FROM TaxReturns
WHERE taxpayerID = 112
	AND taxYear = 2016;

DELETE
FROM TaxReturns
WHERE taxpayerID = 116
	AND taxYear = 2017;

SELECT t.taxpayerID, t.debt, p.credit
FROM TaxDebts t, PaymentCredits p, Delinquents d
WHERE t.taxpayerID = p.taxpayerID
	AND t.taxpayerID = d.taxpayerID;

-- Result:	 taxpayerid |   debt    |  credit
-- 			------------+-----------+-----------
-- 	        		112 | 112765.00 | 122878.93
-- 			(1 row)

-- 			DELETE 1
-- 			DELETE 1
-- 	 		taxpayerid | debt | credit
-- 			-----------+------+--------
-- 			(0 rows)
