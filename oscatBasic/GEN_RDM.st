FUNCTION_BLOCK GEN_RDM
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=258*)
    (* read system time and prepare input data *)
    tx := UDINT_TO_TIME(T_PLC_MS()) - last;

    (* init section *)
    IF NOT init THEN
    	init := TRUE;
    	last := tx;
    	tx := t#0s;
    END_IF

    (* add last if one cycle is finished *)
    IF tx >= PT THEN
    	last := last + PT;
    	tx := tx - PT;

    	(* generate output signal *)
    	OUT := AM * (RDM(0) - 0.5) + OS;
    	Q := TRUE;
    ELSE
    	Q := FALSE;
    END_IF

    (* revision history

    hm	7.2.2007		rev 1.0
    	original version

    hm	16.9.2007		rev 1.1
    	changes time() to T_plc_ms() for compatibility reasons

    *)

END_FUNCTION_BLOCK
