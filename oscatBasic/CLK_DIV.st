FUNCTION_BLOCK CLK_DIV
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=190*)
    IF rst THEN
    	cnt:= 0;
    	Q0 := 0;
    	Q1 := 0;
    	Q2 := 0;
    	Q3 := 0;
    	Q4 := 0;
    	Q5 := 0;
    	Q6 := 0;
    	Q7 := 0;
    ELSIF clk THEN
    	cnt:= cnt +1;
    	Q0 := cnt.0;
    	Q1 := cnt.1;
    	Q2 := cnt.2;
    	Q3 := cnt.3;
    	Q4 := cnt.4;
    	Q5 := cnt.5;
    	Q6 := cnt.6;
    	Q7 := cnt.7;
    END_IF

    (* revision history
    hm	4. aug. 2006	rev 1.0
    	original version

    hm	2. jan 2008		rev 1.1
    	improved performance

    *)
END_FUNCTION_BLOCK
