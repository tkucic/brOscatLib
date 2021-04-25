FUNCTION_BLOCK CLICK
    (*http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=47*)
    (* reconfiguration and debounce circuitry *)
    s_in(in := in, TD := T_debounce, TR := T_reconfig);

    (* read system time *)
    tx := DWORD_TO_TIME(OSCAT_BASIC.T_PLC_MS());

    (* count the mumber of clicks *)
    IF s_in.Q XOR Q THEN
    	last := tx;
    	IF s_in.Q THEN state := state + 1; END_IF;
    END_IF;
    Q := s_in.Q;

    (* set outputs *)
    IF state > 0 THEN
    	IF (Q AND tx - last > t_short) OR (NOT Q AND tx - last > t_pause) THEN
    		CASE state OF
    			1:	single := TRUE;
    				status := 111;
    			2:	double := TRUE;
    				status := 112;
    			3:	triple := TRUE;
    				status := 113;
    		END_CASE;
    		state := 0;
    	END_IF;
    ELSIF NOT q THEN
    	single := FALSE;
    	double := FALSE;
    	triple := FALSE;
    	status := 110;
    	last := tx;
    	state := 0;
    END_IF;





    (* revision history

    15 Feb 2007	rev 1.0	hm
    	created original version

    18.5.2007	rev 1.1 hm
    	corrected an error while execution would stop after t_reconfig elapsed.

    15.9.2007	rev 1.2 hm
    	replaced Time() with T_PLC_MS for compatibility and performance reasons

    28. dec. 2008	rev 2.0
    	rewritten using modular approach

    *)
END_FUNCTION_BLOCK
