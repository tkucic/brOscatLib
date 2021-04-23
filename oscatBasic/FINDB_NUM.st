FUNCTION FINDB_NUM
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=159*)
    pt := ADR(STR) + LEN(STR) - 1;
    FOR pos := LEN(STR) TO 1 BY -1 DO;
    	IF (PT^ > 47 AND PT^ < 58) OR PT^ = 46 THEN
    		FINDB_NUM := pos;
    		RETURN;
    	END_IF
    	PT := PT - 1;
    END_FOR
    FINDB_NUM := 0;

    (* revision history
    hm	6. oct 2006		rev 1.0
    	original version

    hm	29. feb 2008	rev 1.1
    	improved performance

    hm	29. mar. 2008	rev 1.2
    	changed STRING to STRING(STRING_LENGTH)
    *)
END_FUNCTION