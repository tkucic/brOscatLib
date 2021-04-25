FUNCTION_BLOCK FT_TN8
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=420*)
    tx := DWORD_TO_TIME(T_PLC_MS());
    trig := FALSE;
    IF NOT init THEN
    	x[cnt] := in;
    	init := TRUE;
    	last := tx;
    ELSIF tx - last >= T / length THEN
    	IF cnt = length - 1 THEN cnt := 0; ELSE cnt := cnt + 1; END_IF;
    	Out := X[cnt];
    	x[cnt] := in;
    	last := tx;
    	trig := TRUE;
    END_IF;

    (* revision history
    hm		1. jan 2007		rev 1.0
    	original version

    hm		16. sep 2007	rev 1.1
    	changes time() to T_plc_ms() for compatibility reasons

    *)
END_FUNCTION_BLOCK
