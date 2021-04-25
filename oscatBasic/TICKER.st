FUNCTION_BLOCK TICKER
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=178*)
    
    (* generate next ticker when delay is low *)
    IF N < LEN(TEXT) THEN
    	IF NOT delay.Q THEN
    		(* increase step for next tick *)
    		step := step + 1;
    		IF step > LEN(TEXT) THEN step := 1; END_IF
    		(* extract dispay from TEXT *)
    		DISPLAY := MID(TEXT, N, step);
    		(* set delay timer for next tick *)
    		delay(IN := TRUE, PT := PT);
    	ELSE;
    		(* execute delay timer *)
    		delay(IN := FALSE);
    	END_IF
    ELSE
    	DISPLAY := TEXT;
    END_IF
    (* revision history
    hm	4. dec. 2007	rev 1.0
    	original version

    hm	15. dec. 2007	rev 1.1
    	step now starts at 1 instaed of 0

    hm	29. mar. 2008	rev 1.2
    	changed STRING to STRING(STRING_LENGTH)
    *)
END_FUNCTION_BLOCK
