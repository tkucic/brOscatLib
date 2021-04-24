FUNCTION_BLOCK PULSE_LENGTH
    (*http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=56*)
    (* read system time *)
    tx := DWORD_TO_TIME(OSCAT_BASIC.T_PLC_MS());

    (* reset outputs, they should only be active 1 cycle *)
    SHORT := FALSE;
    MIDDLE := FALSE;
    LONG := FALSE;

    (* detect rising EDGE_ *)
    IF IN AND NOT EDGE_ THEN
    	EDGE_ := TRUE;
    	tn := tx;

    (* detect for falling EDGE_ *)
    ELSIF NOT IN AND EDGE_ THEN
    	EDGE_ := FALSE;
    	tn := tx - tn;
    	IF tn < t_short THEN
    		SHORT := TRUE;
    	ELSIF tn > t_long THEN
    		LONG := TRUE;
    	ELSE
    		MIDDLE := TRUE;
    	END_IF

    (* generate LONG pulse as soon as T_long is reached *)
    ELSIF IN AND tx - tn > t_long THEN
    	LONG := TRUE;
    END_IF


    (* revision history

    hm	15. feb 2006	rev 1.0
    	original version

    hm	15 sep 2007		rev 1.1
    	replaced Time() with T_PLC_MS for compatibility and performance reasons

    *)
END_FUNCTION_BLOCK
