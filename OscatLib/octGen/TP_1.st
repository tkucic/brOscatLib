FUNCTION_BLOCK TP_1
    (* read system timer *)
    tx := DWORD_TO_TIME(T_PLC_MS());

    IF RST THEN
    	Q := FALSE;
    ELSIF IN AND NOT ix THEN
    	Q := TRUE;
    	start := tx;
    ELSIF tx - start >= PT THEN
    	Q := FALSE;
    END_IF

    ix:= IN;



    (* revision history
    hm	28. jun. 2008
    	original version

    *)
END_FUNCTION_BLOCK
