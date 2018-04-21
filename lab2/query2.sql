-- Give	the	taxPayerID of each	business whose name begins	with ‘TI’	
-- and	that has no tax	returns.	

SELECT 
	taxPayerID
FROM 
	TaxReturns
WHERE 
	kind = 'B' 
	AND 
		taxPayerID = 'TI';