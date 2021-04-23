FUNCTION_BLOCK BASE64_ENCODE_STREAM
    (*http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=74*)
    IF SIZE1 <= 0 THEN
    	SIZE2 := 0;
    	RETURN;
    END_IF
    c := SIZE1 - 1;
    i2 := 0;
    a := 0;
    b := 0;
    FOR i := 0 TO c DO
    	b := SHL(b,8) OR BUF1[i];
    	a := a + 8;
    	WHILE a >= 6 DO
    		a := a - 6;
    		BUF2[i2] := OSCAT_BASIC.CODE(BASE64,WORD_TO_INT(SHR(b,a)) + 1);
    		i2 := i2 + 1;
    		b := b AND NOT SHL(WORD#16#FFFF,a);
    	END_WHILE
    END_FOR
    IF a > 0 THEN
    	BUF2[i2] := OSCAT_BASIC.CODE(BASE64,WORD_TO_INT(SHL(b,6 - a)) + 1);
    	i2 := i2 + 1;
    	i3 := i2 + (NOT INT_TO_WORD(i2) AND 2#11);
    	FOR i := i2 TO i3 DO
    		BUF2[i] := 61;
    	END_FOR
    	SIZE2 := i3 + 1;
    ELSE
    	SIZE2 := i2;
    END_IF

    (* revision history

    ks	6. dec. 2009 rev 1.0
    	original version

    *)
END_FUNCTION_BLOCK
