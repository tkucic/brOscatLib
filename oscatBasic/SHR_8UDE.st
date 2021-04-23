FUNCTION_BLOCK SHR_8UDE
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=252*)
    (* trig.Q signals a rising EDGE_ on CLK *)
    trig(CLK := CLK);

    IF SET OR RST THEN
    	Q0 := NOT RST;
    	Q1 := Q0;
    	Q2 := Q0;
    	Q3 := Q0;
    	Q4 := Q0;
    	Q5 := Q0;
    	Q6 := Q0;
    	Q7 := Q0;
    ELSIF trig.Q THEN
    	IF DN THEN
    		Q0 := Q1;
    		Q1 := Q2;
    		Q2 := Q3;
    		Q3 := Q4;
    		Q4 := Q5;
    		Q5 := Q6;
    		Q6 := Q7;
    		Q7 := D7;
    	ELSE
    		Q7 := Q6;
    		Q6 := Q5;
    		Q5 := Q4;
    		Q4 := Q3;
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
