FUNCTION_BLOCK DT_SIMU
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=338*)
    (* read system timer *)
    tx := T_PLC_MS();
    tc := REAL_TO_UDINT(UDINT_TO_REAL(tx - last) * SPEED);

    IF NOT init THEN
    	init := TRUE;
    	DTS := START;
    	tc := 0;
    	last := tx;
    ELSIF SPEED = 0.0 THEN
    	DTS := UDINT_TO_DT(DT_TO_UDINT(DTS) + 1);
    ELSIF tc >= 1000 THEN
    	td := (tc / 1000) * 1000;
    	DTS := DTS + UDINT_TO_TIME(td);
    	last := last + REAL_TO_UDINT(UDINT_TO_REAL(td) / SPEED);
    END_IF

    (* revision history
    hm	11. sep. 2008	rev 1.0
    	original version

    hm	16. nov	2008	rev 1.1
    	added type conversions for compatibility reasons

    hm	8.	mar. 2009	rev 1.2
    	added increment by cycle mode

    *)

END_FUNCTION_BLOCK
