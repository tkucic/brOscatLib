FUNCTION_BLOCK TIMER_EXT
    (* lösche die millisekunden bei sunrise und sunset *)
    SUN_RISE := DWORD_TO_TOD(TOD_TO_DWORD(SUN_RISE) / 1000 * 1000);
    SUN_SET := DWORD_TO_TOD(TOD_TO_DWORD(SUN_SET) / 1000 * 1000);

    (* measure cycle time tc and make sure this circuitry is not called more then once in 200ms*)
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

    (* read time of day and strip off all milliseconds *)
    tdx := DT_TO_TOD(dt_in);
    wdx := OSCAT_BASIC.DAY_OF_WEEK(DT_TO_DATE(dt_in));

    (* automatic output control *)
    IF deb.Q THEN
    	qx := NOT qx;
    	status := 110;
    ELSIF holiday AND NOT enable_holiday THEN
    	qx := FALSE;
    ELSIF wdx = 6 AND NOT enable_saturday THEN
    	qx := FALSE;
    ELSIF wdx = 7 AND NOT enable_sunday THEN
    	qx := FALSE;
    ELSIF T_day_start > TOD#00:00 AND tdx - T_DAY_START <= tc THEN
    	(* turn on at specified daytime *)
    	qx := TRUE;
    	status := 111;
    ELSIF T_DAY_STOP > TOD#00:00 AND tdx - T_DAY_STOP <= tc THEN
    	(* turn off at specific daytime *)
    	qx := FALSE;
    	status := 112;
    ELSIF T_RISE_START > T#0s AND tdx - SUN_RISE + T_RISE_START <= tc THEN
    	(* turn on before sunrise *)
    	qx := TRUE;
    	status := 113;
    ELSIF T_RISE_STOP > T#0s AND tdx - SUN_RISE - T_RISE_STOP <= tc THEN
    	(* turn off after sunrise *)
    	qx := FALSE;
    	status := 114;
    ELSIF T_SET_start > T#0s AND tdx - SUN_SET + T_SET_START <= tc THEN
    	(* turn on before sunset *)
    	qx := TRUE;
    	status := 115;
    ELSIF T_SET_STOP > t#0s AND tdx - SUN_SET - T_SET_STOP <= tc THEN
    	(* turn off after sunset *)
    	qx := FALSE;
    	status := 116;
    END_IF


    (* mnaual and output control *)
    mx(in := qx, ena := ENA, on := ON, off := OFF, man := MAN);
    Q := mx.Q;

    (* set the status output *)
    IF mx.STATUS > 100 THEN status := mx.STATUS; END_IF



    (*
    hm 	7. oct. 2008	rev 1.0
    	original version

    hm	6. nov. 2008	rev 1.1
    	added default = true for ena input
    *)
END_FUNCTION_BLOCK