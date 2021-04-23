FUNCTION SCALE_B4
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=291*)
    SCALE_B4 := 	(((IN1_max - IN1_min)* IN1 + (IN2_max - IN2_min)* IN2 + (IN3_max - IN3_min)* IN3 + (IN4_max - IN4_min)* IN4)* 0.003921569 + IN1_min + IN2_min + IN3_min + IN4_min) * K + O;


    (* revision History
    hm 19.1.2007		rev 1.1
    	changed outputs to real to avoid overflow of integer
    	added offset for better cascading of scale functions
    	changed from fb to function

    hm	6. jan 2008		rev 1.2
    	improved performance

    hm	26. oct. 2008	rev 1.3
    	optimized code

    hm	3. nov. 2008	rev 1.4
    	used wrong factor in formula

    *)
END_FUNCTION
