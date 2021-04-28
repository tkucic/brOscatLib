FUNCTION_BLOCK TMAX
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=204*)
    (* read system timer *)
    tx := UDINT_TO_TIME(T_PLC_MS());

    Z := FALSE;

    IF NOT IN THEN
    	Q := FALSE;
    ELSIF IN AND NOT last_in THEN
    	Q := TRUE;
    	start := tx;
    ELSIF (tx - start >= PT) AND Q THEN
    	Q := FALSE;
    	Z := TRUE;
    END_IF

    last_in := IN;



    (* revision history
    hm	20. jul. 2008	rev 1.0
    	original version

    *)
END_FUNCTION_BLOCK
