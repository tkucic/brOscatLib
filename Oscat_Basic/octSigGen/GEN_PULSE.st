FUNCTION_BLOCK GEN_PULSE
    IF enq THEN
    	tx := DWORD_TO_TIME(T_PLC_MS());
    	IF NOT init THEN init := TRUE; tn := tx; END_IF
    	IF tx - tn >= SEL(Q, PTL, PTH) THEN
    		tn := tn + SEL(Q, PTL, PTH);
    		Q := NOT Q;
    	END_IF
    ELSE
    	Q := FALSE;
    	init := FALSE;
    END_IF



    (* revision history
    hm	29. jun. 2008	rev 1.0
    	original version

    hm	23. nov. 2008	rev 1.1
    	set default for enq to be true

    hm	18. jul. 2009	rev 1.2
    	improved performance

    hm	13. nov. 2009	rev 1.3
    	corrected error

    hm	16. feb. 2011	rev 1.4
    	corrected an error when timer overflows

    hm	8. apr. 2011	rev 1.5
    	ptl and pth was exchanged
    *)
END_FUNCTION_BLOCK
