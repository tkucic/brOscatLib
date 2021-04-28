FUNCTION SCALE_B4
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=291*)
    SCALE_B4 := 	(((IN1_MAX - IN1_MIN)* BYTE_TO_USINT(IN1) + (IN2_MAX - IN2_MIN)* BYTE_TO_USINT(IN2) + (IN3_MAX - IN3_MIN)* BYTE_TO_USINT(IN3) + (IN4_MAX - IN4_MIN)* BYTE_TO_USINT(IN4))* 0.003921569 + IN1_MIN + IN2_MIN + IN3_MIN + IN4_MIN) * K + O;


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
