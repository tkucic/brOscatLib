FUNCTION FIND_CHAR
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=156*)
    pt ACCESS ADR(STR);
    stop := LEN(STR);
    FOR i := MAX(POS,1) TO stop DO;
    	X := pt[i];
    	IF X > 31 AND ((cEXTENDED_ASCII AND X <> 127) OR (NOT cEXTENDED_ASCII AND X < 127)) THEN
    		FIND_CHAR := i;
    		RETURN;
    	END_IF
    END_FOR
    FIND_CHAR := 0;


    (* revision history
    hm	29. feb 2008	rev 1.0
    	original version

    hm	26. mar. 2008	rev 1.1
    	char will now accept extended ascii

    hm	29. mar. 2008	rev 1.2
    	changed STRING to STRING(STRING_LENGTH)

    hm	21. oct. 2008	rev 1.3
    	changes setup constants
    	optimized code
    *)


END_FUNCTION
