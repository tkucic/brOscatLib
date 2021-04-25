FUNCTION_BLOCK GEN_SIN
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=261*)
    (* read system time and prepare input data *)
    tx := UDINT_TO_TIME(T_PLC_MS()) - last;
    DL := MODR(DL,1.0);
    IF DL < 0.0 THEN DL := 1.0 - DL; END_IF

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

    (* generate sine wave *)
    IF PT > t#0s THEN temp := SIN(cPI2 * UDINT_TO_REAL(TIME_TO_UDINT(tx + MULTIME(PT, DL))) / UDINT_TO_REAL(TIME_TO_UDINT(PT))); END_IF
    OUT := AM * 0.5 *  temp + OS;

    (* boolean output Q *)
    Q := NOT SIGN_R(temp);

    (* revision history
    hm	22. jan 2007	rev 1.0
    	original version

    hm	17 sep 2007	rev 1.1
    	replaced time() with t_plc_ms for compatibilitx reasons

    hm	27. nov 2007	rev 1.2
    	avoid divide by 0 when PT = 0

    hm	6. jan 2008		rev 1.3
    	improved performance

    hm	16. mar. 2008	rev 1.4
    	added type conversion to avoid warnings under codesys 3.0

    hm	18. oct. 2008	rev 1.5
    	using math constants

    hm	11. mar. 2009	rev 1.6
    	changed real constants to use dot syntax

    *)
END_FUNCTION_BLOCK
