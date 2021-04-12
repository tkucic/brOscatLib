FUNCTION_BLOCK TOF_1
    (* read system timer *)
    tx := DWORD_TO_TIME(T_PLC_MS());

    IF RST THEN
    	Q := FALSE;
    ELSIF IN THEN
    	Q := TRUE;
    	start := tx;
    ELSIF tx - start >= PT THEN
    	Q := FALSE;
    END_IF




    (* revision history
    hm	17. jul. 2008	rev 1.0
    	original version

    *)
END_FUNCTION_BLOCK
