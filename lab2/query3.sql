-- For each payment that was made on or after March 1, 2017, 
-- give the name and address of the taxpayer who made the payment, 
-- the date that the payment was made, and the amount paid. 
-- Your	result should include both businesses and individuals

SELECT
	name, address, lastDateFiled, lastDatePaid
FROM
	Individuals, Businesses
WHERE
	login_date >= '2014-03-01'