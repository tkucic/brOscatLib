FUNCTION FINDB
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=158*)
    length := LEN(STR2);
    FOR pos := LEN(STR1) - length + 1 TO 1 BY -1 DO
    	IF MID(STR1,length,pos) = STR2 THEN
    		FindB := pos;
    		RETURN;
    	END_IF
    END_FOR
    FindB := 0;

    (* revision history
    hm	6. oct 2006		rev 1.0
    	original version

    hm	15 dec 2007		rev 1.1
    	changed code for better performance

    hm	29. feb 2008	rev 1.2
    	added FINDB := 0 for compatibility reasons

    hm	29. mar. 2008	rev 1.3
    	changed STRING to STRING(STRING_LENGTH)
    *)
END_FUNCTION
