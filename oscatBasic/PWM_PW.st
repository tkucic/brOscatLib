FUNCTION_BLOCK PWM_PW
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=264*)
    IF F > 0.0 THEN
    	clk(PT := REAL_TO_TIME(1000.0 / F));
    	pulse(IN := clk.Q, PT := PW);
    	Q := pulse.Q;
    END_IF

    (* revision history

    hm	25. feb 2007	rev 1.1
    	recoded in st for better performance and better portability

    hm	27. nov 2007	rev 1.2
    	avoid divide by 0 when F = 0

    hm	9. dec 2007		rev 1.3
    	corrected an error with F = 0

    hm	19. oct. 2008	rev 1.4
    	changed type tp_r to TP_x brecause of name change

    hm	11. mar. 2009	rev 1.5
    	changed real constants to use dot syntax

    *)
END_FUNCTION_BLOCK
