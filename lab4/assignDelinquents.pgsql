CREATE FUNCTION assignDelinquents(
    IN theAgent CHAR(6), 
    IN theCount INT
    )
	RETURNS INTEGER AS
    $$
    DECLARE 
        checkAgent INTEGER;
        checkCount INTEGER;
        checkA BOOLEAN;
    BEGIN
        SELECT COUNT(*) INTO checkAgent FROM Delinquents WHERE IRsagentID = theAgent;
        SELECT taxpayerID INTO checkCount FROM Delinquents WHERE IRSagentID IS NULL;
        IF theCount < 1 OR 
           theCount > (SELECT COUNT(*) FROM Delinquents d, Individuals i WHERE d.taxpayerID = i.taxpayerID)
        THEN SELECT d.taxpayerID FROM Delinquents d, Individuals i GROUP BY d.taxpayerID HAVING MAX(i.totaltaxOwed);
        ELSE checkA := TRUE;
        END IF;
        
        IF checkAgent >= 1 AND checkA = TRUE
        THEN
            UPDATE Delinquents d
            SET IRSagentID = theAgent
            WHERE IRSagentID is NULL;
            
            RETURN (theCount);
        ELSE
            RETURN -1;
        END IF;
    END;
    $$ LANGUAGE plpgsql;