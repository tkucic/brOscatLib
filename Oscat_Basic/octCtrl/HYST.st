FUNCTION_BLOCK HYST
    IF ON >= OFF THEN
    	IF IN < OFF THEN
    		Q := FALSE;
    		WIN := FALSE;
    	ELSIF  IN > ON THEN
    		Q := TRUE;
    		WIN := FALSE;
    	ELSE
    		WIN := TRUE;
    	END_IF
    ELSE
    	IF IN > OFF THEN
    		Q := FALSE;
    		WIN := FALSE;
    	ELSIF  IN < ON THEN
    		Q := TRUE;
    		WIN := FALSE;
    	ELSE
    		WIN := TRUE;
    	END_IF
    END_IF


    (* revision history
    hm		2.  jun 2008	rev 1.0
    	original version

    *)
END_FUNCTION_BLOCK