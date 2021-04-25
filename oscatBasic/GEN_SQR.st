FUNCTION_BLOCK GEN_SQR
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=262*)
    (* check DC = 1 or 0 *)
    IF DC = 0.0 THEN
    	OUT := -AM * 0.5 + OS;
    	Q := FALSE;
    	RETURN;
    ELSIF DC = 1.0 THEN
    	OUT := AM * 0.5 + OS;
    	Q := TRUE;
    	RETURN;
    END_IF

    (* read system time and prepare input data *)
    tx := UDINT_TO_TIME(T_PLC_MS()) - last;
    DL := MODR(DL,1.0);
    IF DL < 0.0 THEN DL := 1.0 - DL; END_IF
    DC := MODR(DC,1.0);
    IF DC < 0.0 THEN DC := 1.0 - DC; END_IF

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
    END_IF

    (* check if falling or rising edge first *)
    IF MULTIME(PT, DL + DC) >= PT THEN
    	(* generate falling edge *)
    	IF tx >= MULTIME(PT, DL + DC - 1) THEN
    		OUT := -AM * 0.5 + OS;
    		Q := FALSE;
    	END_IF
    	(* generate rising edge *)
    	IF tx >= MULTIME(PT, DL) THEN
    		OUT := AM * 0.5 + OS;
    		Q := TRUE;
    	END_IF
    ELSE
    	(* generate rising edge first *)
    	IF tx >= MULTIME(PT, DL) THEN
    		OUT := AM * 0.5 + OS;
    		Q := TRUE;
    	END_IF
    	(* generate falling edge *)
    	IF tx >= MULTIME(PT, DL + DC) THEN
    		OUT := -AM * 0.5 +OS;
    		Q := FALSE;
    	END_IF
    END_IF

    (* revision history

    hm	12. feb 2007	rev 1.1
    	added default value for DC = 0.5

    hm	17 sep 2007	rev 1.2
    	replaced time() with t_plc_ms for compatibilitx reasons

    hm	6. jan 2008	rev 1.3
    	improved performance

    hm	11. mar. 2009	rev 1.4
    	changed real constants to use dot syntax
    	set default amplitude to 1.0

    *)

END_FUNCTION_BLOCK
