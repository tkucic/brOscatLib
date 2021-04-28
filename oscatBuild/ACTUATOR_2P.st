FUNCTION_BLOCK ACTUATOR_2P
    (*http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=12*)
    (* run the autorun timer *)
    timer(TRUN := SELF_ACT_PULSE * (2 * SELF_ACT_CYCLES), TOFF := SELF_ACT_TIME, TEST := TEST, ARE := ARE, ARX := ARX);
    ARO := timer.ARO;

    (* run the pulse width generator *)
    IF ARO THEN
    	pwgen(PTL := SELF_ACT_PULSE, PTH := SELF_ACT_PULSE);
    	OUT := pwgen.Q;
    ELSIF BYTE_TO_USINT(IN) < BYTE_TO_USINT(SENS) THEN
    	OUT := FALSE;
    ELSIF BYTE_TO_USINT(IN) > 255 - BYTE_TO_USINT(SENS) THEN
    	OUT := TRUE;
    ELSE
    	pwgen.PTH := (CYCLE_TIME * BYTE_TO_USINT(BAND_B(IN,SENS))) / 255;
    	pwgen.PTL := CYCLE_TIME - pwgen.PTH;
    	pwgen();
    	OUT := pwgen.Q;
    END_IF



    (* revision history
    hm	7.10.2006 		rev 1.1
    	changed error pos could not reach 1 or 0 under certain conditions due to error IN code.
    	changed on and off IN force and force_in for better usability.

    hm	17.1.2007		rev 1.2
    	deleted unused variable time_overflow

    hm	15.9.2007		rev 1.3
    	replaced time() with T_PLC_MS for compatibility and performance reasons

    hm	19. 11 2007		rev 1.4
    	replaced left over statement time() with tx

    hm	27. 12. 2007	REV 1.5
    	CHANGED CODE FOR BETTER PERFORMANCE

    hm	21. oct. 2008	rev 1.6
    	code optimized

    hm	23. nov. 2008	rev 2.0
    	new code using library modules

    hm	24. jan. 2009	rev 2.1
    	deleted unused var inb
    *)
END_FUNCTION_BLOCK
