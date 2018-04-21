-- For each "new payment" tuple t that's in NewPayments either
--		a) there isn't a tuple in Payments that has the same primary key, or
-- 		b) there is a tuple in Payments with the same primary key
--	
--		a) If there isn’t already a tuple in Payments that has the same primary key, then insert a tuple into 
--			the Payments table corresponding to that tuple in the NewPayments table.
--		b) If there is already a tuple in Payments that has the same primary key, then update Payments, adding
--			to the new amountPaid to the old amountPaid. For example, suppose that(for a particular taxpayerID
--			and date), there already was a Payment tuple whose amountPaid was 500.00. If the new payment
--			tuple for that taxpayerID and date is 200.00, then the amountPaid in the Payments tuple for that
--			taxpayerID and date should become 500.00 + 200.00 = 700.00.

-- UPDATE Payments SET
-- 	taxpayerID  = CASE WHEN n.taxpayerID <> p.taxpayerID THEN n.taxpayerID ELSE p.taxpayerID END,
-- 	datePaid = CASE WHEN n.taxpayerID <> p.taxpayerID THEN n.datePaid ELSE p.datePaid END,
-- 	amountPaid = CASE WHEN n.taxpayerID <> p.taxpayerID THEN n.amountPaid ELSE (n.amountPaid + p.amountPaid) END
-- FROM NewPayments n, Payments p;

UPDATE Payments 
SET amountPaid = Payments.amountPaid + NewPayments.amountPaid 
FROM NewPayments
WHERE Payments.taxpayerID = NewPayments.taxpayerID AND
		Payments.datePaid = NewPayments.datePaid;
INSERT INTO Payments (taxpayerID, datePaid, amountPaid)
(SELECT n.taxpayerID, n.datePaid, n.amountPaid
	FROM NewPayments n
	WHERE NOT EXISTS (SELECT *
						FROM Payments p
						WHERE p.taxpayerID = n.taxpayerID AND
							p.datePaid = n.datePaid));
