FUNCTION_BLOCK FF_D4E
    IF rst THEN
    	Q0 := FALSE;
    	Q1 := FALSE;
    	Q2 := FALSE;
    	Q3 := FALSE;
    ELSIF clk AND NOT edge THEN
    	Q0 := D0;
    	Q1 := D1;
    	Q2 := D2;
    	Q3 := D3;
    END_IF
    edge := CLK;

    (* revision history
    hm	4. aug 2006	rev 1.0
    	original version

    hm	27. dec 2007	rev 1.1
    	changed code for better performance

    hm	30. oct. 200	rev 1.2
    	deleted unnecessary init with 0

    hm	14. mar. 2009	rev 1.3
    	removed double assignments

    *)

END_FUNCTION_BLOCK
