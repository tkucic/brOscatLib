FUNCTION_BLOCK ACTUATOR_COIL
    (*http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=16*)
    (* read system time *)
    now := T_PLC_MS();

    (* initialize for first cycle *)
    IF NOT init THEN
    	last := now;
    	init := TRUE;
    ELSIF IN THEN
    	OUT := TRUE;
    	STATUS := 101; (* activated by input *)
    	last := now;
    ELSE
    	OUT := FALSE;
    	STATUS := 100; (* disabled *)
    	(* now we need to check for self activation *)
    	tx := now - last;
    	IF (SELF_ACT_CYCLE > T#0s) AND (tx >= TIME_TO_UDINT(SELF_ACT_CYCLE)) THEN
    		OUT := TRUE;
    		STATUS := 102; (* auto activation *)
    		IF tx >= TIME_TO_UDINT(SELF_ACT_CYCLE + SELF_ACT_TIME) THEN
    			last := now;
    			OUT := FALSE;
    			STATUS := 100; (* idle *)
    		END_IF
    	END_IF
    END_IF



    (*
    revision history:

    hm		1. jun. 2008 	rev 1.0
    	original version

    *)
END_FUNCTION_BLOCK
