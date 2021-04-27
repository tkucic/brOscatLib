FUNCTION FIND_NUM
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=157*)
    pt ACCESS ADR(STR);
    stop := LEN(STR);
    FOR i := MAX(POS,1) TO stop DO;
    	X := pt[i];
    	IF (X > 47 AND X < 58) OR X = 46 THEN
    		FIND_NUM := i;
    		RETURN;
    	END_IF
    END_FOR
    FIND_NUM := 0;


    (* revision history
    hm	6. oct. 2006	rev 1.0
    	original version

    hm	29. feb 2008	rev 1.1
    	added input POS to start search at position

    hm	29. mar. 2008	rev 1.2
    	changed STRING to STRING(STRING_LENGTH)

    *)
END_FUNCTION
