FUNCTION_BLOCK TOF_1
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=205*)
    (* read system timer *)
    tx := UDINT_TO_TIME(T_PLC_MS());

    IF RST THEN
    	Q := FALSE;
    ELSIF IN THEN
    	Q := TRUE;
    	start := tx;
    ELSIF tx - start >= PT THEN
    	Q := FALSE;
    END_IF




    (* revision history
    hm	17. jul. 2008	rev 1.0
    	original version

    *)
END_FUNCTION_BLOCK
