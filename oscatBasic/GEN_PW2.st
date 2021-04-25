FUNCTION_BLOCK GEN_PW2
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=258*)
    (* read system timer *)
    tx := UDINT_TO_TIME(T_PLC_MS());

    (* startup initialization *)
    IF NOT init THEN
    	start := tx;
    	init := TRUE;
    	TH := T#0s;
    	TL := T#0s;
    END_IF

    (* timing selection *)
    IF TS THEN
    	t_high := TH2;
    	t_low := TL2;
    ELSE
    	t_high := TH1;
    	t_low := TL1;
    END_IF

    (* normal operation *)
    IF ENQ THEN
    	et := tx - start;
    	IF NOT Q THEN
    		IF et >= t_low THEN
    			Q := TRUE;
    			start := tx;
    			TL := T#0s;
    		ELSE
    			TL := et;
    		END_IF
    	ELSE
    		IF et >= t_high THEN
    			Q := FALSE;
    			start := tx;
    			TH := T#0s;
    		ELSE
    			TH := et;
    		END_IF
    	END_IF
    ELSE
    	Q := FALSE;
    	TH := T#0s;
    	TL := T#0s;
    	start := tx;
    END_IF



    (* revision history
    hm	26. sep. 2008	rev 1.0
    	original version

    hm	14. mar. 2009	rev 1.1
    	removed double assignments

    *)
END_FUNCTION_BLOCK
