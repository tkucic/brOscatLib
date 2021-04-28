FUNCTION_BLOCK SWITCH_I
    (*http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=58*)
    (* read system time *)
    tx := UDINT_TO_TIME(T_PLC_MS());

    (* asynchronous SET and reset first *)
    IF SET AND NOT RST THEN
    	Q := TRUE;
    	T_on := tx;
    ELSIF RST THEN
    	Q := FALSE;
    (* check FOR input edge_ AND start debounce timer *)
    ELSIF (IN XOR edge_) AND NOT (state = 1) THEN
    	state := 1;
    	T_on := tx;
    (* edge_ was detected and debounce time elapsed *)
    ELSIF (state = 1) AND (tx - T_DEBOUNCE >= T_on) THEN
    	state := 2;
    	(* react on rising or falling edge_ depending on r_edge *)
    	IF r_edge XOR IN THEN Q := NOT Q; END_IF
    (* wait for T_RECONFIG and adjust r_edge *)
    ELSIF state = 2 AND tx - T_RECONFIG >= T_on THEN
    	r_edge := IN;
    END_IF
    IF Q AND T_ON_MAX > t#0ms AND tx >= T_on + T_ON_MAX THEN
    	Q := FALSE;
    END_IF
    edge_ := IN;

    (* revision history

    hm	4 aug 2006	rev 1.0
    	original version

    hm	15.9.2007	rev 1.1
    	replaced Time() with T_PLC_MS for compatibility and performance reasons

    *)
END_FUNCTION_BLOCK
