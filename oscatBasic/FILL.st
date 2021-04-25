FUNCTION FILL
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=155*)
    CHR_TO_STRING(C, sx);
    (* limit L to maximum 80 characters the length of a standard string *)
    L := LIMIT(0,L,STRING_LENGTH);
    (* create a string of characters to be connected to str *)
    FOR i := 1 TO 8 DO
    	RETVAL := CONCAT(RETVAL,RETVAL);
    	IF L.7 THEN RETVAL := CONCAT(RETVAL,sx); END_IF
    	L := SHL(L,1);
    END_FOR
    FILL:=TRUE;




    (* revision histroy
    hm	29. mar. 2008	rev 1.0
    	original release

    hm	17. dec. 2008	rev 1.1
    	changed function chr to chr_to_string

    *)
END_FUNCTION
