FUNCTION_BLOCK SHR_4E
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=249*)
    (* trig.Q signals a rising edge on CLK *)
    trig(CLK := CLK);

    IF SET OR RST THEN
    	Q0 := NOT RST;
    	Q1 := Q0;
    	Q2 := Q0;
    	Q3 := Q0;
    ELSIF trig.Q THEN
    	Q3 := Q2;
    	Q2 := Q1;
    	Q1 := Q0;
    	Q0 := D0;
    END_IF



    (* revision history
    hm	4. aug. 2006	rev 1.0
    	original version

    hm	25. oct. 2008	rev 1.1
    	optimized code

    *)
END_FUNCTION_BLOCK
