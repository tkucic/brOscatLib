FUNCTION_BLOCK SHA1_STR
    (*http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=83*)
    CASE mode OF
    0:	(* Wait für Start *)
    	IF RUN AND NOT run_last THEN
    		DONE := FALSE;
    		mode := 1; (* Initialisierung *)
    		size := LEN(STR);
    	END_IF

    2:	(* Data copy and Calc *)
    	IF size > 0 THEN
    		OSCAT_BASIC._STRING_TO_BUFFER(STR:=MID(STR, UDINT_TO_INT(SIZE), UDINT_TO_INT(POS) + 1), POS:=0, PT:=ADR(buf), SIZE:=SIZEOF(buf));
    	END_IF

    3:	DONE := TRUE;
    	mode := 0; (* Stop *)

    END_CASE

    IF mode > 0 THEN
    	SHA1_STREAM(SIZE:=size, MODE:=mode, BUF:=buf, SHA1:=SHA1, POS=>pos);
    END_IF

    run_last := RUN;

    (* revision history

    ks	6. dec. 2009 rev 1.0
    	original version

    *)
END_FUNCTION_BLOCK
