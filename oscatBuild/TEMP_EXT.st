FUNCTION_BLOCK TEMP_EXT
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=449*)
    IF NOT init THEN
    	init := TRUE;
    	HEAT_start := OSCAT_BASIC.SET_DATE(1972,OSCAT_BASIC.MONTH_OF_DATE(HEAT_PERIOD_START),OSCAT_BASIC.DAY_OF_MONTH(HEAT_PERIOD_START));
    	HEAT_stop := OSCAT_BASIC.SET_DATE(1972,OSCAT_BASIC.MONTH_OF_DATE(HEAT_PERIOD_STOP),OSCAT_BASIC.DAY_OF_MONTH(HEAT_PERIOD_STOP));
    	COOL_start := OSCAT_BASIC.SET_DATE(1972,OSCAT_BASIC.MONTH_OF_DATE(COOL_PERIOD_START),OSCAT_BASIC.DAY_OF_MONTH(COOL_PERIOD_START));
    	COOL_stop := OSCAT_BASIC.SET_DATE(1972,OSCAT_BASIC.MONTH_OF_DATE(COOL_PERIOD_STOP),OSCAT_BASIC.DAY_OF_MONTH(COOL_PERIOD_STOP));
    END_IF

    (* read system time *)
    tx := DWORD_TO_TIME(OSCAT_BASIC.T_PLC_MS());

    (* for efficiency exit isf this program has been executed less then 1min ago *)
    IF tx - last_run < CYCLE_TIME THEN RETURN; END_IF

    (* calculate frequently used variables *)
    xdate := OSCAT_BASIC.SET_DATE(1972,OSCAT_BASIC.MONTH_OF_DATE(DT_TO_DATE(DT_IN)),OSCAT_BASIC.DAY_OF_MONTH(DT_TO_DATE(DT_IN)));
    day := DT_TO_TOD(DT_IN) >= START_DAY AND  DT_TO_TOD(DT_IN) < START_NIGHT;

    (* read the correct external temperature depending on the T_EXT_CONFIG setting *)
    T_EXT := OSCAT_BASIC.MULTI_IN(T_EXT1, T_EXT2, T_EXT3, T_EXT_DEFAULT, T_EXT_MIN, T_EXT_MAX, T_EXT_CONFIG);

    (* dtermine HEATing *)
    IF (HEAT_start <= HEAT_stop AND xdate >= HEAT_start AND xdate <= HEAT_stop) OR (HEAT_start > HEAT_stop AND (xdate >= HEAT_start OR xdate <= HEAT_stop)) THEN
    	(* HEATing period id true check for temperature *)
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

    (* dtermine COOLing *)
    IF (COOL_start <= COOL_stop AND xdate >= COOL_start AND xdate <= COOL_stop) OR (COOL_start > COOL_stop AND (xdate >= COOL_start OR xdate <= COOL_stop)) THEN
    	(* COOLing period is true check for temperature *)
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
