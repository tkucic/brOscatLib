FUNCTION_BLOCK TP_1D
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=208*)
    (* read system timer *)
    tx := UDINT_TO_TIME(T_PLC_MS());

    IF RST THEN
    	Q := FALSE;
    	RST := FALSE;
    	W := FALSE;
    ELSIF W THEN
    	IF tx - start >= PTD THEN
    		W := FALSE;
    	END_IF
    ELSIF IN AND NOT ix THEN
    	Q := TRUE;
    	start := tx;
    	IN := FALSE;
    ELSIF tx - start >= PT1 THEN
    	Q := FALSE;
    	W := TRUE;
    	start := tx;
    END_IF

    ix := IN;



    (* revision history
    hm	28. jun. 2008
    	original version

    *)
END_FUNCTION_BLOCK
