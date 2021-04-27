FUNCTION FIND_CTRL
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=157*)
    pt ACCESS ADR(STR);
    stop := LEN(STR);
    FOR i := MAX(POS,1) TO stop DO;
    	x := pt[i];
    	IF x < 32 OR x = 127 THEN
    		FIND_CTRL := i;
    		RETURN;
    	END_IF
    END_FOR
    FIND_CTRL := 0;


    (* revision history
    hm	29. feb 2008	rev 1.0
    	original version

    hm	26. mar. 2008	rev 1.1
    	character 127 is now recognized as control

    hm	29. mar. 2008	rev 1.2
    	changed STRING to STRING(STRING_LENGTH)
    *)
END_FUNCTION
