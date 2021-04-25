FUNCTION_BLOCK GEN_RMP
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=260*)
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
    ltemp := temp;
    IF PT > t#0s THEN temp := FRACT(TIME_TO_REAL(tx + MULTIME(PT, DL)) / TIME_TO_REAL(PT)); END_IF
    OUT := AM * temp + OS;

    (* boolean output Q *)
    Q := temp < ltemp;

    (* revision history
    hm	3. mar 2007		rev 1.0
    	original version

    hm	17 sep 2007		rev 1.1
    	replaced time() with t_plc_ms for compatibilitx reasons

    hm	27. nov 2007	rev 1.2
    	avoid divide by 0 when PT = 0

    ks	26. oct. 2008	rev 1.3
    	code optimization

    hm	10. mar. 2009	rev 1.4
    	changed real constants to use dot syntax
    *)
END_FUNCTION_BLOCK
