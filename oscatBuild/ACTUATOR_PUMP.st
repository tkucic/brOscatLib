FUNCTION_BLOCK ACTUATOR_PUMP
    (*http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=16*)
    tx := UDINT_TO_TIME(T_PLC_MS());

    IF NOT init THEN
    	init := TRUE;
    	last_change := tx;
    ELSIF RST THEN
    	RST := FALSE;
    	RUNTIME := 0;
    	CYCLES := 0;
    ELSIF MANUAL AND NOT PUMP AND NOT old_man THEN
    	last_change := tx;
    	PUMP := TRUE;
    ELSIF NOT MANUAL AND old_man AND PUMP AND NOT IN THEN
    	last_change := tx;
    	PUMP := FALSE;
    ELSIF IN AND NOT PUMP AND tx - last_change >= MIN_OFFTIME THEN
    	last_change := tx;
    	PUMP := TRUE;
    ELSIF PUMP AND NOT IN AND NOT MANUAL AND tx - last_change >= MIN_ONTIME THEN
    	last_change := tx;
    	PUMP := FALSE;
    ELSIF NOT PUMP AND (tx - last_change >= RUN_EVERY) AND (RUN_EVERY > T#0s) THEN
    	last_change := tx;
    	PUMP := TRUE;
    END_IF

    meter(IN := PUMP, SECONDS := RUNTIME, CYCLES := CYCLES);
    old_man := MANUAL;



    (*
    hm	27.12.2006		rev 1.1
    	fixed a failure while the PUMP would run for tmin after startup.

    hm	15.9.2007		rev 1.2
    	replaced Time() with T_PLC_MS for compatibility and performance reasons

    hm	13. oct. 2008	rev 1.3
    	auto activation can now be disabled when RUN_EVERY = t#0s

    hm	21. oct. 2008	rev 1.4
    	changed to use ontime rev 2.0

    *)
END_FUNCTION_BLOCK
