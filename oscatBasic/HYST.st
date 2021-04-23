FUNCTION_BLOCK HYST
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=421*)
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


    (* revisiON history
    hm		2.  jun 2008	rev 1.0
    	origINal versiON

    *)
END_FUNCTION_BLOCK
