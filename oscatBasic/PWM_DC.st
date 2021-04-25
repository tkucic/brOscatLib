FUNCTION_BLOCK PWM_DC
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=263*)
    IF F > 0.0 THEN
    	tmp := 1000.0 / F;
    	clk(PT := REAL_TO_TIME(tmp));
    	pulse(IN := clk.Q, PT := REAL_TO_TIME(tmp * DC));
    	Q := pulse.Q;
    END_IF

    (* revision history

    hm	25. feb 2007	rev 1.1
    	recoded in st for better performance and better portability

    hm	27. nov 2007	rev 1.2
    	avoid divide by 0 when F = 0

    hm	19. oct. 2008	rev 1.3
    	changed type TP_R to TP_X because of name change
    	improved performance

    hm	11. mar. 2009	rev 1.4
    	changed real constants to use dot syntax

    *)
END_FUNCTION_BLOCK
