FUNCTION COUNT_CHAR
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=150*)
    pt ACCESS ADR(STR);
    l := LEN(STR);
    COUNT_CHAR := 0;
    FOR pos := 1 TO l DO
    	IF pt = CHR THEN COUNT_CHAR := COUNT_CHAR + 1; END_IF
        pt ACCESS (ADR(pt) + 1);
    END_FOR


    (* revision history
    hm	29. feb 2008	rev 1.0
    	original version

    hm	29. mar. 2008	rev 1.1
    	changed STRING to STRING(STRING_LENGTH)
    *)
END_FUNCTION
