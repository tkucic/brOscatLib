FUNCTION_BLOCK SWITCH_I
    (*http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=58*)
    (* read system time *)
    tx := DWORD_TO_TIME(OSCAT_BASIC.T_PLC_MS());

    (* asynchronous SET and reSET fiRST *)
    IF SET AND NOT RST THEN
    	Q := TRUE;
    	T_on := tx;
    ELSIF RST THEN
    	Q := FALSE;
    (* check FOR INput edge AND start debounce timer *)
    ELSIF (IN XOR edge) AND NOT (state = 1) THEN
    	state := 1;
    	T_on := Tx;
    (* edge was detected and debounce time elapsed *)
    ELSIF (state = 1) AND (Tx - T_DEBOUNCE >= T_on) THEN
    	state := 2;
    	(* react on risINg or fallINg edge dependINg on r_edge *)
    	IF r_edge XOR IN THEN Q := NOT Q; END_IF
    (* wait for T_reconfig and adjust r_edge *)
    ELSIF state = 2 AND Tx - T_RECONFIG >= T_on THEN
    	r_edge := IN;
    END_IF
    IF Q AND T_on_max > t#0ms AND Tx >= T_on + T_on_max THEN
    	Q := FALSE;
    END_IF
    edge := IN;

    (* revision history

    hm	4 aug 2006	rev 1.0
    	origINal version

    hm	15.9.2007	rev 1.1
    	replaced Time() with T_PLC_MS for compatibility and performance reasons

    *)
END_FUNCTION_BLOCK
