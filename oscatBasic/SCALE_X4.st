FUNCTION SCALE_X4
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=296*)
    SCALE_X4 := (SEL(IN1,IN1_MIN, IN1_MAX) + SEL(IN2, IN2_MIN, IN2_MAX)+SEL(IN3, IN3_MIN, IN3_MAX)+ SEL(IN4, IN4_MIN, IN4_MAX)) * k + o;


    (* revision history
    hm	19. jan. 2008	rev 1.0
    	original version

    hm	26. oct. 2008	rev 1.1
    	optimized code
    *)
END_FUNCTION
