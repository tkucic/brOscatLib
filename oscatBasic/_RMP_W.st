FUNCTION_BLOCK _RMP_W
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=256*)
    tx := T_PLC_MS();
    IF E AND init THEN
    	(* we need to set tl = tx when direction changes *)
    	IF DIR XOR last_dir THEN
    	 tl := tx;
    	 last_dir := DIR;
    	END_IF
    	(* check_elapsed time and calculate only if necessary *)
    	IF TR > t#0s THEN
    		step := UDINT_TO_DINT(SHL(tx-tl, 16) / TIME_TO_UDINT(TR));
    	ELSE
    		step := 65535;
    	END_IF
    	IF step > 0 THEN
    		(* perform the step on the ramp *)
    		tl := tx;
    		(* calculate the step response *)
    		IF NOT DIR THEN step := - step; END_IF
    		RMP := DINT_TO_WORD(LIMIT(0, WORD_TO_DINT(RMP) + step, 65535));
    	END_IF
    ELSE
    	tl := tx;
    	init := TRUE;
    END_IF


    (* revison history
    hm	22. oct. 2008	rev 1.0
    	original version

    hm	20. nov. 2008	rev 1.1
    	set default for E to be TRUE
    	added init

    *)
END_FUNCTION_BLOCK
