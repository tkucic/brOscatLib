FUNCTION_BLOCK TANK_LEVEL
    (*http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=41*)
    (* preprocess the LEVEL information *)
    tl(in := LEVEL, T_ON := LEVEL_DELAY_TIME, T_OFF := LEVEL_DELAY_TIME);
    open := tl.Q;

    (* start logic *)
    IF ALARM THEN
    	(* check for ACLR if ALARM is present *)
    	IF ACLR THEN
    		ALARM := FALSE;
    		STATUS := 101; (* ACLR pressed *)
    		cx(in := FALSE);
    	END_IF
    	RETURN;
    ELSIF LEAK THEN
    	(* leakeage detected *)
    	cx(in := FALSE);
    	ALARM := TRUE;
    	STATUS := 1;	(* leakeage error *)
    ELSIF open THEN
    	(* VALVE needs to be opened because LEVEL is too low *)
    	cx(in := TRUE);
    	STATUS := 102; (* VALVE open by low LEVEL *)
    ELSE
    	(* VALVE needs to be closed *)
    	cx(in := FALSE);
    	STATUS := 100; (* VALVE idle *)
    END_IF

    (* check if VALVE is open too long and generate ALARM if necessary *)
    tn(in := cx.out AND (MAX_VALVE_TIME > T#0s), PT := MAX_VALVE_TIME);
    IF tn.Q THEN
    	ALARM := TRUE;
    	STATUS := 2; (* overtime error *)
    	cx(in := FALSE);
    END_IF

    (* set output signal *)
    VALVE := cx.out;


    (* revision history
    hm 27. feb 2007	rev 1.0
    	original version

    hm	24. jul 2009	rev 1.1
    	changed parameters of tonof

    *)
END_FUNCTION_BLOCK
