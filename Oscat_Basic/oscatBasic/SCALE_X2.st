FUNCTION SCALE_X2
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=295*)
    SCALE_X2 := (SEL(IN1, IN1_MIN, IN1_MAX)+ SEL(IN2, IN2_MIN, IN2_MAX)) * k + o;


    (* revision history
    hm	19. jan, 2007	rev 1.0
    	original version

    hm	26. oct. 2008	rev 1.1
    	code optimized

    *)
END_FUNCTION
