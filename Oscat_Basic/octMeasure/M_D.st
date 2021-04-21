FUNCTION_BLOCK M_D
    (* check for rst input *)
    IF rst OR ET >= tmax THEN
    	PT := t#0ms;
    	ET := t#0ms;
    	startup := FALSE;
    	run := FALSE;
    END_IF

    (* avoid timers to start when input is true at startup *)
    IF NOT startup THEN
    	edge_ := start;
    	startup := TRUE;
    END_IF

    (* read system timer *)
    tx := UDINT_TO_TIME(T_PLC_MS());

    (* detect rising edge on start *)
    IF start AND NOT edge_ AND NOT stop THEN
    	T0 := tx;
    	run := TRUE;
    	PT := t#0s;
    ELSIF stop AND run THEN
    	PT := ET;
    	run := FALSE;
    END_IF
    edge_ := start;
    IF run THEN ET := tx - T0; END_IF

    (* revision history
    hm		2.5.2007	rev 1.0
    	original version

    hm		16.9.2007	rev 1.1
    	changes time() to T_plc_ms() for compatibility reasons

    hm	27. feb 2009	rev 1.2
    	deleted unnecessary init with 0
    *)

END_FUNCTION_BLOCK
