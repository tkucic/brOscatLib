FUNCTION_BLOCK PULSE_LENGTH
    (*http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=56*)
    (* read system time *)
    tx := DWORD_TO_TIME(OSCAT_BASIC.T_PLC_MS());

    (* reset outputs, they should only be active 1 cycle *)
    SHORT := FALSE;
    Middle := FALSE;
    LONG := FALSE;

    (* detect risINg edge *)
    IF IN AND NOT edge THEN
    	edge := TRUE;
    	tn := tx;

    (* detect for fallINg edge *)
    ELSIF NOT IN AND edge THEN
    	edge := FALSE;
    	tn := tx - tn;
    	IF tn < t_SHORT THEN
    		SHORT := TRUE;
    	ELSIF tn > t_LONG THEN
    		LONG := TRUE;
    	ELSE
    		Middle := TRUE;
    	END_IF

    (* generate LONG pulse as soon as T_LONG is reached *)
    ELSIF IN AND tx - tn > t_LONG THEN
    	LONG := TRUE;
    END_IF


    (* revision history

    hm	15. feb 2006	rev 1.0
    	origINal version

    hm	15 sep 2007		rev 1.1
    	replaced Time() with T_PLC_MS for compatibility and performance reasons

    *)
END_FUNCTION_BLOCK
