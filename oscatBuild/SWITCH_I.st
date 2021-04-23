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
    (* check FOR INput EDGE_ AND start debounce timer *)
    ELSIF (IN XOR EDGE_) AND NOT (state = 1) THEN
    	state := 1;
    	T_on := Tx;
    (* EDGE_ was detected and debounce time elapsed *)
    ELSIF (state = 1) AND (Tx - T_DEBOUNCE >= T_on) THEN
    	state := 2;
    	(* react on risINg or fallINg EDGE_ dependINg on r_EDGE_ *)
    	IF r_EDGE_ XOR IN THEN Q := NOT Q; END_IF
    (* wait for T_reconfig and adjust r_EDGE_ *)
    ELSIF state = 2 AND Tx - T_RECONFIG >= T_on THEN
    	r_EDGE_ := IN;
    END_IF
    IF Q AND T_on_max > t#0ms AND Tx >= T_on + T_on_max THEN
    	Q := FALSE;
    END_IF
    EDGE_ := IN;

    (* revision history

    hm	4 aug 2006	rev 1.0
    	origINal version

    hm	15.9.2007	rev 1.1
    	replaced Time() with T_PLC_MS for compatibility and performance reasons

    *)
END_FUNCTION_BLOCK
