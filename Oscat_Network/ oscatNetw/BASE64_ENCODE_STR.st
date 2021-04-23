FUNCTION_BLOCK BASE64_ENCODE_STR
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=74*)
    CASE mode OF
    0:	IF RUN AND NOT run_last THEN
    		DONE := FALSE;
    		mode := 1;
    		end := LEN(STR1);
    		pos := 0;
    		STR2 := '';
    	END_IF
    1:
    	size1 := MIN(48,end - pos);
    	IF size1 > 0 THEN
    		OSCAT_BASIC._STRING_TO_BUFFER(STR:=MID(STR1, size1, pos + 1), POS:=0, PT:=ADR(buf1), SIZE:=SIZEOF(buf1));
    		BASE64_ENCODE_STREAM(BUF1:=buf1 ,BUF2:=buf2 ,SIZE1:=size1 ,SIZE2=>size2);
    		STR2 := CONCAT(STR2,OSCAT_BASIC.BUFFER_TO_STRING(PT:=ADR(buf2), SIZE:=SIZEOF(buf2), START:=0, STOP:=size2 - 1));
    	ELSE
    		mode := 0;
    		DONE := TRUE;
    	END_IF
    	pos := pos + size1;
    END_CASE

    run_last := RUN;

    (* revision history

    ks	6. dec. 2009 rev 1.0
    	original version

    *)
END_FUNCTION_BLOCK
