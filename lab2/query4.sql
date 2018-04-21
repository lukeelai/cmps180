-- For each	individual,	the	spouseID attribute gives the taxpayerID of that individual’s spouse;
-- it is NULL if the person	doesn’t have a spouse. For each	individual taxpayer whose spouse
-- is also an individual taxpayer, give	the	name of	both the taxpayer and that taxpayer’s spouse.		
-- In your result, the first attribute should be called	taxpayerName and the second	attribute should
-- be called spouseName.

SELECT
	name
FROM
	Individuals
WHERE
	name = taxpayerName
		
		(spouseID = taxpayerID
			SELECT
				name
			FROM
				Individuals
			WHERE
				spouseID = taxpayerID 
					AND
						name = SpouseName)
