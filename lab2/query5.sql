-- For each	taxpayer that has made one or more payments, give the taxpayerID, the number of	
-- payments	that the taxpayer made,	and	the	sum	of those payments. The 3 attributes	in	your
-- result should be	called payingTaxpayer, howmanyPayments and sumPayments. Your result only
-- includes taxpayers who made at least	one payment, so	write your query using just	the	
-- Payments relation

SELECT
	taxpayerID, amountPaid
FROM
	Payments
WHERE
	payingTaxpayer = name
	AND
		howmanyPayments = how many times taxpayerID occurs
		AND
			sumPayments = amountPaid++++
