FUNCTION SCALE_B8
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=292*)
    SCALE_B8 := 	(((IN1_MAX - IN1_MIN)* BYTE_TO_USINT(IN1) + (IN2_MAX - IN2_MIN)* BYTE_TO_USINT(IN2) + (IN3_MAX - IN3_MIN)* BYTE_TO_USINT(IN3) + (IN4_MAX - IN4_MIN)* BYTE_TO_USINT(IN4) +
    				(IN5_MAX - IN5_MIN)* BYTE_TO_USINT(IN5) + (IN6_MAX - IN6_MIN)* BYTE_TO_USINT(IN6) + (IN7_MAX - IN7_MIN)* BYTE_TO_USINT(IN7) + (IN8_MAX - IN8_MIN)* BYTE_TO_USINT(IN8)) * 0.003921569
    				 + IN1_MIN + IN2_MIN + IN3_MIN + IN4_MIN + IN5_MIN + IN6_MIN + IN7_MIN + IN8_MIN) * K + O;


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
