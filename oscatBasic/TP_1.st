FUNCTION_BLOCK TP_1
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=207*)
    (* read system timer *)
    tx := UDINT_TO_TIME(T_PLC_MS());

    IF RST THEN
    	Q := FALSE;
    ELSIF IN AND NOT ix THEN
    	Q := TRUE;
    	start := tx;
    ELSIF tx - start >= PT THEN
    	Q := FALSE;
    END_IF

    ix:= IN;



    (* revision history
    hm	28. jun. 2008
    	original version

    *)
END_FUNCTION_BLOCK
