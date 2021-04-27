FUNCTION IS_LOWER
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=167*)
    pt ACCESS ADR(STR);
    l := LEN(STR);
    FOR pos := 1 TO l DO
    	IF NOT ISC_LOWER(pt) THEN
    		IS_LOWER := FALSE;
    		RETURN;
    	END_IF
        	pt ACCESS (ADR(pt) + 1);
    END_FOR
    IS_LOWER := l > 0;


    (* revision history
    hm	29. feb 2008	rev 1.0
    	original version

    hm	29. mar. 2008	rev 1.1
    	changed STRING to STRING(STRING_LENGTH)
    *)
END_FUNCTION
