FUNCTION_BLOCK TIMER_EXT
    (*http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=63*)
    (* lösche die millisekunden bei sunrise und sunset *)
    SUN_RISE := DWORD_TO_TOD(TOD_TO_DWORD(SUN_RISE) / 1000 * 1000);
    SUN_SET := DWORD_TO_TOD(TOD_TO_DWORD(SUN_SET) / 1000 * 1000);

    (* measure cycle time tc and make sure this circuitry is not called more then ONce in 200ms*)
    tx := OSCAT_BASIC.T_PLC_MS();
    IF NOT init THEN
    	init := TRUE;
    	tl := tx;
    END_IF
    tc := DWORD_TO_TIME(tx - tl);
    IF tc < t#200ms THEN RETURN; END_IF
    tl := tx;

    (* debounce *)
    deb(in := SWITCH, TD := T_DEBOUNCE, PM := TRUE);

    (* read time of day and strip OFF all millisecONds *)
    tdx := DT_TO_TOD(DT_IN);
    wdx := OSCAT_BASIC.DAY_OF_WEEK(DT_TO_DATE(DT_IN));

    (* automatic output cONtrol *)
    IF deb.Q THEN
    	qx := NOT qx;
    	STATUS := 110;
    ELSIF HOLIDAY AND NOT ENAble_HOLIDAY THEN
    	qx := FALSE;
    ELSIF wdx = 6 AND NOT ENAble_saturday THEN
    	qx := FALSE;
    ELSIF wdx = 7 AND NOT ENAble_sunday THEN
    	qx := FALSE;
    ELSIF T_DAY_START > TOD#00:00 AND tdx - T_DAY_START <= tc THEN
    	(* turn ON at specified daytime *)
    	qx := TRUE;
    	STATUS := 111;
    ELSIF T_DAY_STOP > TOD#00:00 AND tdx - T_DAY_STOP <= tc THEN
    	(* turn OFF at specific daytime *)
    	qx := FALSE;
    	STATUS := 112;
    ELSIF T_RISE_START > T#0s AND tdx - SUN_RISE + T_RISE_START <= tc THEN
    	(* turn ON before sunrise *)
    	qx := TRUE;
    	STATUS := 113;
    ELSIF T_RISE_STOP > T#0s AND tdx - SUN_RISE - T_RISE_STOP <= tc THEN
    	(* turn OFF after sunrise *)
    	qx := FALSE;
    	STATUS := 114;
    ELSIF T_SET_start > T#0s AND tdx - SUN_SET + T_SET_START <= tc THEN
    	(* turn ON before sunset *)
    	qx := TRUE;
    	STATUS := 115;
    ELSIF T_SET_STOP > t#0s AND tdx - SUN_SET - T_SET_STOP <= tc THEN
    	(* turn OFF after sunset *)
    	qx := FALSE;
    	STATUS := 116;
    END_IF


    (* mnaual and output cONtrol *)
    mx(in := qx, ENA := ENA, ON := ON, OFF := OFF, MAN := MAN);
    Q := mx.Q;

    (* set the STATUS output *)
    IF mx.STATUS > 100 THEN STATUS := mx.STATUS; END_IF



    (*
    hm 	7. oct. 2008	rev 1.0
    	original versiON

    hm	6. nov. 2008	rev 1.1
    	added default = true for ENA input
    *)
END_FUNCTION_BLOCK
