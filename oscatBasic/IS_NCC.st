FUNCTION IS_NCC
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=168*)
    L := LEN(STR);
    FOR pos := 1 TO L DO
    	IF FIND(CMP,MID(STR,1,pos)) > 0 THEN RETURN; END_IF
    END_FOR
    IS_NCC := TRUE;



    (* revision history
    hm	19. mar 2008	rev 1.0
    	original version

    hm	29. mar. 2008	rev 1.1
    	changed STRING to STRING(STRING_LENGTH)
    *)
END_FUNCTION