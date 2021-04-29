FUNCTION_BLOCK TIMER_2
    (*http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=60*)
    (* read system time *)
    tx := UDINT_TO_TIME(T_PLC_MS());

    IF NOT init THEN
    	init := TRUE;
    	last_check := tx - t#100ms;
    END_IF

    (* for performance resons exit if execution is not necessary *)
    IF tx - last_check < T#100ms THEN RETURN; END_IF

    (* calculate temp variables *)
    dat := DT_TO_DATE(DT_IN);
    daytime := DT_TO_TOD(DT_IN);
    wday := DAY_OF_WEEK(dat);

    (* calculate if any action is necessary today *)
    CASE BYTE_TO_USINT(MODE) OF
    	1..7:	(* mondays to fridays *)
    		enabled := wday = BYTE_TO_INT(MODE);
    	11:	(* every day *)
    		enabled := TRUE;
    	12..16:	(* every nth day *)
    		enabled := (DATE_TO_UDINT(dat)/86400) MOD (BYTE_TO_USINT(MODE) - 10) = 0;
    	20:	(* monday - friday *)
    		enabled := wday <= 5;
    	21:	(* saturday and sunday *)
    		enabled := wday > 5;
    	22: (* workdays only *)
    		enabled := wday <= 5 AND NOT HOLIDAY;
    	23:	(* holidays and weekends *)
    		enabled := wday > 5 OR HOLIDAY;
    	24:	(* holidays only *)
    		enabled := HOLIDAY;
    	25:	(* 1st day of the month *)
    		enabled := DAY_OF_MONTH(dat) = 1;
    	26:	(* last day of month *)
    		enabled := DAY_OF_MONTH(UDINT_TO_DATE(DATE_TO_UDINT(dat) + TIME_TO_UDINT(T#24h))) = 1;
    	27:	(* 31st of december *)
    		enabled := DAY_OF_MONTH(dat) = 31 AND MONTH_OF_DATE(dat) = 12;
    	28:	(* 1st of january *)
    		enabled := DAY_OF_YEAR(dat) = 1;
    ELSE
    	enabled := FALSE;
    END_CASE

    (* set output if necessary *)
    IF enabled AND NOT Q AND daytime >= START AND run_date <> dat THEN
    	Q := TRUE;
    	activation := tx;
    	run_date := dat;
    ELSIF Q AND tx - activation >= DURATION THEN
    	Q := FALSE;
    END_IF
    last_check := tx;


    (* revision history
    hm 22.2.2007		rev 1.1
    	changed VAR RETAIN PERSISTENT to VAR RETAIN for better compatibility
    	wago lon contollers do not support persisitent

    hm	15.9.2007		rev 1.2
    	replaced Time() with T_PLC_MS for compatibility and performance reasons

    hm	7. oct. 2008	rev 1.3
    	changed function month to month_of_date

    hm	20. oct. 2008	rev 1.4
    	improved performance
    	deleted unnecessary trunc

    hm	22. dec. 2008	rev 1.5
    	make sure timer_2 is executed in the first cycle

    *)
END_FUNCTION_BLOCK
