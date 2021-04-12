FUNCTION_BLOCK FIFO_32
    IF RST THEN
    	pw := pr;
    	FULL := FALSE;
    	EMPTY := TRUE;
    	Dout := 0;
    ELSIF E THEN
    	IF NOT EMPTY AND RD THEN
    		Dout := fifo[pr];
    		pr := INC1(pr,n);
    		EMPTY := pr = pw;
    		FULL := FALSE;
    	END_IF
    	IF NOT FULL AND WD THEN
    		fifo[pw] := Din;
    		pw := INC1(pw,n);
    		FULL := pw = pr;
    		EMPTY := FALSE;
    	END_IF
    END_IF

    (* revision history
    hm	4. aug. 2006	rev 1.0
    	original version

    hm	19. feb 2008	rev 1.1
    	performance improvements

    hm	17. oct. 2008	rev 1.2
    	improved performance

    ks	27. oct. 2008 rev 1.3
    	improved code

    hm	14. mar. 2009	rev 1.4
    	removed double assignments

    hm 24. jul. 2009	rev 2.0
    	chaged inputs E and WR to E, WD and WR
    	allow read and write in one cycle

    *)


END_FUNCTION_BLOCK
