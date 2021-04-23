FUNCTION SCALE_X8
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=297*)
    SCALE_X8 := (SEL(IN1,IN1_MIN, IN1_MAX)+ SEL(IN2,IN2_MIN, IN2_MAX)+SEL(IN3,IN3_MIN, IN3_MAX)+ SEL(IN4,IN4_MIN, IN4_MAX)
    				+SEL(IN5,IN5_MIN, IN5_MAX)+ SEL(IN6,IN6_MIN, IN6_MAX)+SEL(IN7,IN7_MIN, IN7_MAX)+ SEL(IN8,IN8_MIN, IN8_MAX)) * k + o;



    (* revision history
    hm	19. jan. 2008	rev 1.0
    	original version

    hm	26. oct. 2008	rev 1.1
    	optimized code

    hm	24. jan. 2008	rev 1.2
    	corrected error in formula
    *)
END_FUNCTION
