FUNCTION FIND_NONUM
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=157*)
    pt ACCESS ADR(STR);
    end := LEN(STR);
    FOR i := MAX(POS,1) TO end DO;
    	X := pt[i];
    	IF (X < 48 AND X <> 46) OR X > 57 THEN
    		FIND_NONUM := i;
    		RETURN;
    	END_IF
    END_FOR
    FIND_NONUM := 0;


    (* revision history
    hm	6. oct. 2006	rev 1.0
    	original version

    hm	29. feb 2008	rev 1.1
    	added input POS to start search at position

    hm	29. mar. 2008	rev 1.2
    	changed STRING to STRING(STRING_LENGTH)

    hm	21. oct. 2008	rev 1.3
    	optimized code

    *)
END_FUNCTION
