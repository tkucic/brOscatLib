FUNCTION_BLOCK FT_TN64
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=419*)
    (* read system time *)
    tx := UDINT_TO_TIME(T_PLC_MS());

    TRIG := FALSE;
    IF NOT init THEN
    	X[cnt] := IN;
    	init := TRUE;
    	last := tx;
    ELSIF tx - last >= T / length THEN
    	IF cnt = length - 1 THEN cnt := 0; ELSE cnt := cnt + 1; END_IF
    	OUT := X[cnt];
    	X[cnt] := IN;
    	last := tx;
    	TRIG := TRUE;
    END_IF

    (* revision history
    hm		1. jan 2007		rev 1.0
    	original version

    hm		16. sep 2007	rev 1.1
    	changes time() to T_plc_ms() for compatibility reasons

    *)
END_FUNCTION_BLOCK
