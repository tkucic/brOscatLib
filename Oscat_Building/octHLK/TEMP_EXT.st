FUNCTION_BLOCK TEMP_EXT
    IF NOT init THEN
    	init := TRUE;
    	heat_start := OSCAT_BASIC.SET_DATE(1972,OSCAT_BASIC.MONTH_OF_DATE(heat_period_start),OSCAT_BASIC.DAY_OF_MONTH(heat_period_start));
    	heat_stop := OSCAT_BASIC.SET_DATE(1972,OSCAT_BASIC.MONTH_OF_DATE(heat_period_stop),OSCAT_BASIC.DAY_OF_MONTH(heat_period_stop));
    	cool_start := OSCAT_BASIC.SET_DATE(1972,OSCAT_BASIC.MONTH_OF_DATE(cool_period_start),OSCAT_BASIC.DAY_OF_MONTH(cool_period_start));
    	cool_stop := OSCAT_BASIC.SET_DATE(1972,OSCAT_BASIC.MONTH_OF_DATE(cool_period_stop),OSCAT_BASIC.DAY_OF_MONTH(cool_period_stop));
    END_IF

    (* read system time *)
    tx := DWORD_TO_TIME(OSCAT_BASIC.T_PLC_MS());

    (* for efficiency exit isf this program has been executed less then 1min ago *)
    IF tx - last_run < cycle_time THEN RETURN; END_IF

    (* calculate frequently used variables *)
    xdate := OSCAT_BASIC.SET_DATE(1972,OSCAT_BASIC.MONTH_OF_DATE(DT_TO_DATE(dt_in)),OSCAT_BASIC.DAY_OF_MONTH(DT_TO_DATE(dt_in)));
    day := DT_TO_TOD(dt_in) >= start_day AND  DT_TO_TOD(dt_in) < start_night;

    (* read the correct external temperature depending on the t_ext_config setting *)
    t_ext := OSCAT_BASIC.MULTI_IN(t_ext1, t_ext2, t_ext3, t_ext_default, t_ext_min, t_ext_max, t_ext_config);

    (* dtermine heating *)
    IF (heat_start <= heat_stop AND xdate >= heat_start AND xdate <= heat_stop) OR (heat_start > heat_stop AND (xdate >= heat_start OR xdate <= heat_stop)) THEN
    	(* heating period id true check for temperature *)
    	IF day AND t_ext <= heat_start_temp_day THEN
    		heat := TRUE;
    	ELSIF NOT day AND t_ext <= heat_start_temp_night THEN
    		heat := TRUE;
    	ELSIF t_ext >= heat_stop_temp THEN
    		heat := FALSE;
    	END_IF
    ELSE
    	heat := FALSE;
    END_IF

    (* dtermine cooling *)
    IF (cool_start <= cool_stop AND xdate >= cool_start AND xdate <= cool_stop) OR (cool_start > cool_stop AND (xdate >= cool_start OR xdate <= cool_stop)) THEN
    	(* cooling period is true check for temperature *)
    	IF day AND t_ext >= cool_start_temp_day THEN
    		cool := TRUE;
    	ELSIF NOT day AND t_ext >= cool_start_temp_night THEN
    		cool := TRUE;
    	ELSIF t_ext <= cool_stop_temp THEN
    		cool := FALSE;
    	END_IF
    ELSE
    	cool := FALSE;
    END_IF

    last_run := tx;

    (* revision history
    hm	6 dec 2006	rev 1.0
    	original version

    hm	15.9.2007		rev 1.1
    	replaced Time() with T_PLC_MS for compatibility and performance reasons

    hm	7. oct. 2008	rev 1.2
    	changed name of function month to month_of_date

    hm	13. mar. 2009	rev 1.3
    	real constants updated to new systax using dot

    *)

END_FUNCTION_BLOCK