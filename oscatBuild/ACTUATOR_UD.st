FUNCTION_BLOCK ACTUATOR_UD
    (*http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=17*)
    (* read system time *)
    tx := UDINT_TO_TIME(T_PLC_MS());

    IF NOT init THEN
    	(* INITIALIZATION AT FIRST CALL *)
    	last := tx;
    	init := TRUE;
    ELSIF OFF THEN
    	(* emergency shut OFF detected *)
    	YUP := FALSE;
    	YDN := FALSE;
    	last := tx;
    	STATUS := 101;

    (* Watch FOR MIN TON TIME *)
    ELSIF ((YUP OR YDN) AND tx - last < TON) THEN
    	RETURN;
    ELSIF NOT YUP AND NOT YDN AND tx - last < TOFF THEN
    	RETURN;

    (* MANUAL operation *)
    ELSIF MANUAL THEN
    	STATUS := 102;
    	(* directional chage set both outs 0 first *)
    	IF YUP AND NOT UP OR YDN AND NOT DN THEN
    		YDN := FALSE;
    		YUP := FALSE;
    		last := tx;
    	(* MANUAL UP operation *)
    	ELSIF UP AND NOT DN AND NOT OFF THEN
    		YDN := FALSE;
    		YUP := TRUE;
    		last := tx;
    		STATUS := 103;
    	(* MANUAL down operation *)
    	ELSIF DN AND NOT UP AND NOT OFF THEN
    		YUP := FALSE;
    		YDN := TRUE;
    		last := tx;
    		STATUS := 104;
    	(* maual mode but no UP or down *)
    	ELSE
    		IF YUP OR YDN THEN last := tx; END_IF
    		YUP := FALSE;
    		YDN := FALSE;
    	END_IF

    (* automatic operation *)
    ELSE
    	(* directional change set outputs low first *)
    	IF YUP AND NOT UD OR YDN AND UD THEN
    		YUP := FALSE;
    		YDN := FALSE;
    		last := tx;
    	(* automatic UP operation *)
    	ELSIF UD AND ON AND NOT OFF THEN
    		YDN := FALSE;
    		YUP := TRUE;
    		last := tx;
    		STATUS := 111;

    	(* automatic down operation *)
    	ELSIF NOT UD AND ON AND NOT OFF THEN
    		YUP := FALSE;
    		YDN := TRUE;
    		last := tx;
    		STATUS := 112;
    	(* standby mode *)
    	ELSE
    		IF YUP OR YDN THEN last := tx; END_IF
    		YUP := FALSE;
    		YDN := FALSE;
    		STATUS := 110;
    	END_IF
    END_IF

    (* make sure YUP and YDN are never ON at the same time *)
    IF YDN AND YUP_IN AND OUT_RETURN THEN
    	YDN := FALSE;
    	STATUS := 1;
    END_IF
    IF YUP AND YDN_IN AND OUT_RETURN THEN
    	YUP := FALSE;
    	STATUS := 2;
    END_IF



    (* revision history
    hm 22. jan 2007	rev 1.1
    	added STATUS output
    	changed inputs TON, TOFF to config variables
    	added config var OUT_RETURN to enable YUP_IN and YDN_IN
    	MANUAL mod will override automatic mode 

    hm	15.9.2007	rev 1.2
    	replaced Time() with T_PLC_MS for compatibility and performance reasons

    hm	17. oct. 2008	rev 1.3
    	deleted unnecessary initialization with 0
    *)
END_FUNCTION_BLOCK
