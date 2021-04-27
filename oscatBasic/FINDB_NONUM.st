FUNCTION FINDB_NONUM
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=158*)
    pt ACCESS (ADR(STR) + LEN(STR) - 1);
    FOR pos := LEN(STR) TO 1 BY -1 DO;
    	IF (pt < 48 AND pt <> 46) OR pt > 57 THEN
    		FINDB_NONUM := pos;
    		RETURN;
    	END_IF
    	pt ACCESS (ADR(pt) - 1);
    END_FOR
    FINDB_NONUM := 0;


    (* revision history
    hm	6. oct 2006		rev 1.0
    	original version

    hm	29. feb 2008	rev 1.1
    	improved performance

    hm	29. mar. 2008	rev 1.2
    	changed STRING to STRING(STRING_LENGTH)

    hm	21. oct. 2008	rev 1.3
    	optimized code
    *)
END_FUNCTION
