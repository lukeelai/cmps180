-- Give	the	different jobLevels	that	appear	for	active	IRSagents.		
-- The	jobLevels	in	your	result	should	appear in	decreasing	numerical	order.

UPDATE 
	jobLevel
FROM 
	IRSagents
WHERE 
	active = True
ORDER BY 
	jobLevel 
		DESC;