CREATE OR REPLACE FUNCTION assignDeliquents(theAgent text, theCount integer)
AS $$

DECLARE
    iterator integer := 0;
    theAgentID integer := 0;
    thePayerID integer := 0;

DECLARE cursor_d CURSOR FOR
  SELECT d.taxpayerID 
  FROM Deliquents d
  WHERE ;

DECLARE cursor_i CURSOR FOR
  SELECT i.IRSagentID 
  FROM IRSAgents i
  WHERE i.IRSagentID IS NULL
  ORDER BY i.IRSagentID ASC
  FOR UPDATE;

BEGIN
	OPEN cursor_d;
	FETCH FROM cursor_d INTO thePayerID;
    WHILE Found 
	LOOP

		OPEN cursor_i;
		iterator := 1;
		FETCH cursor_i INTO theAgentID;
		WHILE iterator <= theCount AND Found 
		LOOP
			UPDATE Delinquents SET IRSagentID := theAgentID FROM Delinquents d, Individuals i WHERE IRSAgentID IS NULL AND i.taxpaterID = d.taxpayerID;
			iterator := iterator + 1;
			FETCH cursor_i INTO theAgentID;
		END LOOP;
		CLOSE cursor_i;

	FETCH FROM cursor_d INTO thePayerID;
	END LOOP;
	
	RETURN theAgentID;
	CLOSE cursor_d;
END;
$$
LANGUAGE plpgsql