FUNCTION IS_CTRL
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=166*)
    pt ACCESS ADR(STR);
    L := LEN(STR);
    FOR pos := 1 TO L DO
    	IF NOT ISC_CTRL(pt) THEN
    		IS_CTRL := FALSE;
    		RETURN;
    	END_IF
        pt ACCESS (ADR(pt) + 1);
    END_FOR
    IS_CTRL := L > 0;


    (* revision history
    hm	29. feb. 2008	rev 1.0
    	original version

    hm	29. mar. 2008	rev 1.1
    	changed STRING to STRING(STRING_LENGTH)
    *)
END_FUNCTION
