FUNCTION_BLOCK BAR_GRAPH
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=333*)
    IF NOT init THEN
    	init := TRUE;
    	IF LOG_SCALE THEN
    		temp := EXP(LN(TRIGGER_HIGH / TRIGGER_LOW) * 0.166666666666666666666);
    		T1 := TRIGGER_LOW * temp;
    		T2 := T1 * temp;
    		T3 := T2 * temp;
    		T4 := T3 * temp;
    		T5 := T4 * temp;
    	ELSE
    		temp := (TRIGGER_HIGH - TRIGGER_LOW) * 0.142857142;
    		T1 := TRIGGER_LOW + temp;
    		T2 := T1 + temp;
    		T3 := T2 + temp;
    		T4 := T3 + temp;
    		T5 := T4 + temp;
    	END_IF
    END_IF

    (* clear outputs before checking *)
    Q1 := FALSE;
    Q2 := FALSE;
    Q3 := FALSE;
    Q4 := FALSE;
    Q5 := FALSE;
    Q6 := FALSE;
    STATUS := 110;

    (* LOW, HIGH and ALARM can only be cleared with RST depending on ALARM_LOW and ALARM_HIGH *)
    IF NOT ALARM_LOW THEN LOW := FALSE; END_IF
    IF NOT ALARM_HIGH THEN HIGH := FALSE; END_IF
    IF RST THEN
    	ALARM := FALSE;
    	LOW := FALSE;
    	HIGH := FALSE;
    END_IF

    (* check and set outputs *)
    IF X < TRIGGER_LOW THEN
    	LOW := TRUE;
    	STATUS := 111;
    	IF ALARM_LOW THEN
    		ALARM := TRUE;
    		STATUS := 1;
    	END_IF
    ELSIF X < T1 THEN
    	Q1 := TRUE;
    ELSIF x < t2 THEN
    	Q2 := TRUE;
    ELSIF x < t3 THEN
    	Q3 := TRUE;
    ELSIF x < T4 THEN
    	Q4 := TRUE;
    ELSIF x < T5 THEN
    	Q5 := TRUE;
    ELSIF x < TRIGGER_HIGH THEN
    	Q6 := TRUE;
    ELSE
    	HIGH := TRUE;
    	STATUS := 112;
    	IF ALARM_HIGH THEN
    		ALARM := TRUE;
    		STATUS := 2;
    	END_IF
    END_IF

    (* revision history
    hm	22. feb 2007	rev 1.0
    	original version

    hm	2. dec 2007		rev 1.1
    	chaged code for better performance

    hm	6. jan 2008		rev 1.2
    	further performance improvement

    *)
END_FUNCTION_BLOCK
