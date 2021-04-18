FUNCTION SCALE_B2
    SCALE_B2 := 	(((in1_max - in1_min)* in1 + (in2_max - in2_min)* in2) * 0.003921569 + in1_min + in2_min) * K + O;


    (* revision History
    hm 19.1.2007		rev 1.1
    	changed outputs to real to avoid overflow of integer
    	added offset for better cascading of scale functions
    	changed from FB to function

    hm	6. jan 2008		rev 1.2
    	improved performance

    hm	26. oct. 2008	rev 1.3
    	code optimization

    hm	3. nov. 2008	rev 1.4
    	used wrong factor in formula

    *)
END_FUNCTION