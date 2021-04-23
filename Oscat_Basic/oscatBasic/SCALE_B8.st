FUNCTION SCALE_B8
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=292*)
    SCALE_B8 := 	(((in1_max - in1_min)* in1 + (in2_max - in2_min)* in2 + (in3_max - in3_min)* in3 + (in4_max - in4_min)* in4 +
    				(in5_max - in5_min)* in5 + (in6_max - in6_min)* in6 + (in7_max - in7_min)* in7 + (in8_max - in8_min)* in8) * 0.003921569
    				 + in1_min + in2_min + in3_min + in4_min + in5_min + in6_min + in7_min + in8_min) * K + O;


    (* revision History
    hm	19. jan.2007	rev 1.1
    	changed outputs to real to avoid overflow of integer
    	added offset for better cascading of scale functions

    hm	6. jan. 2008	rev 1.2
    	improved performance

    hm	26. oct. 2008	rev 1.3
    	code optimization

    hm	3. nov. 2008	rev 1.4
    	used wrong factor in formula

    *)
END_FUNCTION
