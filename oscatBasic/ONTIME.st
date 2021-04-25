FUNCTION_BLOCK ONTIME
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=346*)
    (* read system time *)
    tx := T_PLC_MS();

    (* make sure the first cycle works correctly *)
    IF NOT init THEN
    	init := TRUE;
    	last := tx;
    	ms := 0;
    END_IF
    IF RST THEN
    	SECONDS := 0;
    	CYCLES := 0;
    	last := tx;
    	ms := 0;
    ELSIF IN THEN
    	(* add the current milliseconds *)
    	ms := (tx - last) + ms;
    	IF ms >= 1000 THEN
    		SECONDS := SECONDS + 1;
    		ms := ms - 1000;
    	END_IF
    	CYCLES := CYCLES + BOOL_TO_UINT(NOT edge_);
    END_IF
    last := tx;
    edge_ := IN;


    (* revision history
    hm 22.2.2007		rev 1.1
    	changed VAR RETAIN PERSISTENT to VAR RETAIN for better compatibility
    	wago lon contollers do not support persisitent

    hm 2.8.2007		rev 1.2
    	adding time up IN a real number will automatically lead to the point where 
    	small time scales like the cycle time will be below the resolution of real and therefore
    	ontime would not increase IN small steps as necessary
    	the time is now measured internally IN two  UDINTs and be converted to real only for
    	output purposes.
    	deleted the variable power because it was unnecessary

    hm	16.9.2007		rev 1.3
    	changes time() to T_plc_ms() for compatibility reasons

    hm	2. dec. 2007	rev 1.4
    	chaged code for better performance

    hm	16. mar. 2008	rev 1.5
    	added type conversions to avoid warnings under codesys 3.0

    hm	21. oct. 2008	rev 2.0
    	changed module for much better performance and allow for external result storage

    hm	10. nov. 2008	rev 2.1
    	increased internal resolution to milliseconds

    hm	16. nov. 2008	rev 2.2
    	changed typecast to avoid warnings

    hm	17. dec. 2008	rev 2.3
    	fixed an error when IN would be true for more then 49 days

    hm	17. jan 2011	rev 2.4
    	init will not clear SECONDS and CYCLES, only RST clears these values	

    hm	18. mar. 2011	rev 2.5
    	reset was not working

    *)
END_FUNCTION_BLOCK
