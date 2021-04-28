FUNCTION_BLOCK PULSE_LENGTH
    (*http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=56*)
    (* read system time *)
    tx := UDINT_TO_TIME(T_PLC_MS());

    (* reset outputs, they should only be active 1 cycle *)
    SHORT := FALSE;
    MIDDLE := FALSE;
    LONG := FALSE;

    (* detect rising edge_ *)
    IF IN AND NOT edge_ THEN
    	edge_ := TRUE;
    	tn := tx;

    (* detect for falling edge_ *)
    ELSIF NOT IN AND edge_ THEN
    	edge_ := FALSE;
    	tn := tx - tn;
    	IF tn < T_SHORT THEN
    		SHORT := TRUE;
    	ELSIF tn > T_LONG THEN
    		LONG := TRUE;
    	ELSE
    		MIDDLE := TRUE;
    	END_IF

    (* generate LONG pulse as soon as T_LONG is reached *)
    ELSIF IN AND tx - tn > T_LONG THEN
    	LONG := TRUE;
    END_IF


    (* revision history

    hm	15. feb 2006	rev 1.0
    	original version

    hm	15 sep 2007		rev 1.1
    	replaced Time() with T_PLC_MS for compatibility and performance reasons

    *)
END_FUNCTION_BLOCK
