FUNCTION_BLOCK GEN_SQ
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=197*)
    (* read system time *)
    tx := T_PLC_MS();

    IF NOT init THEN
    	init := TRUE;
    	tn := tx;
    	Q := TRUE;
    ELSIF tx - tn >= SHR(TIME_TO_UDINT(PT),1) THEN
    	Q := NOT Q;
    	tn := tn + SHR(TIME_TO_UDINT(PT),1);
    END_IF


    (* revision history
    hm	4. aug 2006	rev 1.0
    	original version

    hm	17. sep 2007	rev 1.1
    	replaced time() with T_PLC_MS() for compatibility reasons

    hm	18. jul. 2009	rev 1.2
    	improved accuracy

    hm	16. feb 2011	rev 1.3
    	corrected an error with timer overflow 
    *)




END_FUNCTION_BLOCK
