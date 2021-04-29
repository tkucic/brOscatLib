FUNCTION_BLOCK TEMP_EXT
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=449*)
    IF NOT init THEN
    	init := TRUE;
    	heat_start := SET_DATE(1972,MONTH_OF_DATE(HEAT_PERIOD_START),DAY_OF_MONTH(HEAT_PERIOD_START));
    	heat_stop := SET_DATE(1972,MONTH_OF_DATE(HEAT_PERIOD_STOP),DAY_OF_MONTH(HEAT_PERIOD_STOP));
    	cool_start := SET_DATE(1972,MONTH_OF_DATE(COOL_PERIOD_START),DAY_OF_MONTH(COOL_PERIOD_START));
    	cool_stop := SET_DATE(1972,MONTH_OF_DATE(COOL_PERIOD_STOP),DAY_OF_MONTH(COOL_PERIOD_STOP));
    END_IF

    (* read system time *)
    tx := UDINT_TO_TIME(T_PLC_MS());

    (* for efficiency exit isf this program has been executed less then 1min ago *)
    IF tx - last_run < CYCLE_TIME THEN RETURN; END_IF

    (* calculate frequently used variables *)
    xdate := SET_DATE(1972,MONTH_OF_DATE(DT_TO_DATE(DT_IN)),DAY_OF_MONTH(DT_TO_DATE(DT_IN)));
    day := DT_TO_TOD(DT_IN) >= START_DAY AND  DT_TO_TOD(DT_IN) < START_NIGHT;

    (* read the correct external temperature depending on the T_EXT_CONFIG setting *)
    T_EXT := MULTI_IN(T_EXT1, T_EXT2, T_EXT3, T_EXT_DEFAULT, T_EXT_MIN, T_EXT_MAX, BYTE_TO_USINT(T_EXT_CONFIG));

    (* dtermine heating *)
    IF (heat_start <= heat_stop AND xdate >= heat_start AND xdate <= heat_stop) OR (heat_start > heat_stop AND (xdate >= heat_start OR xdate <= heat_stop)) THEN
    	(* heating period id true check for temperature *)
    	IF day AND T_EXT <= HEAT_START_TEMP_DAY THEN
    		HEAT := TRUE;
    	ELSIF NOT day AND T_EXT <= HEAT_START_TEMP_NIGHT THEN
    		HEAT := TRUE;
    	ELSIF T_EXT >= HEAT_STOP_TEMP THEN
    		HEAT := FALSE;
    	END_IF
    ELSE
    	HEAT := FALSE;
    END_IF

    (* dtermine cooling *)
    IF (cool_start <= cool_stop AND xdate >= cool_start AND xdate <= cool_stop) OR (cool_start > cool_stop AND (xdate >= cool_start OR xdate <= cool_stop)) THEN
    	(* cooling period is true check for temperature *)
    	IF day AND T_EXT >= COOL_START_TEMP_DAY THEN
    		COOL := TRUE;
    	ELSIF NOT day AND T_EXT >= COOL_START_TEMP_NIGHT THEN
    		COOL := TRUE;
    	ELSIF T_EXT <= COOL_STOP_TEMP THEN
    		COOL := FALSE;
    	END_IF
    ELSE
    	COOL := FALSE;
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
