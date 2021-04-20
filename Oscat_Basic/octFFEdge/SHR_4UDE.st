FUNCTION_BLOCK SHR_4UDE
    (* trig.Q signals a rising edge on clk *)
    trig(CLK := CLK);

    IF SET OR RST THEN
    	Q0 := NOT RST;
    	Q1 := Q0;
    	Q2 := Q0;
    	Q3 := Q0;
    ELSIF trig.Q THEN
    	IF DN THEN
    		Q0 := Q1;
    		Q1 := Q2;
    		Q2 := Q3;
    		Q3 := D3;
    	ELSE
    		Q3 := Q2;
    		Q2 := Q1;
    		Q1 := Q0;
    		Q0 := D0;
    	END_IF
    END_IF



    (* revision history
    hm	4. aug. 2006	rev 1.0
    	original version

    hm	25. oct. 2008	rev 1.1
    	optimized code

    hm	14. mar. 2009	rev 1.2
    	removed double assignments

    *)
END_FUNCTION_BLOCK
