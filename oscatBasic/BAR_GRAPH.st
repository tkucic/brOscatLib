FUNCTION_BLOCK BAR_GRAPH
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=333*)
    IF NOT init THEN
    	init := TRUE;
<<<<<<< HEAD:oscatBasic/BAR_GRAPH.st
    	IF LOG_SCALE THEN
    		temp := EXP(LN(TRIGGER_HIGH / TRIGGER_LOW) * 0.166666666666666666666);
    		T1 := TRIGGER_LOW * temp;
=======
    	IF log_scale THEN
    		temp := EXP(LN(trigger_High / trigger_Low) * 0.166666666666666666666);
    		T1 := trigger_Low * temp;
>>>>>>> 800137518c97e6c8be9a9f286ec9de596d141e5a:Oscat_Basic/octMeasure/BAR_GRAPH.st
    		T2 := T1 * temp;
    		T3 := T2 * temp;
    		T4 := T3 * temp;
    		T5 := T4 * temp;
    	ELSE
<<<<<<< HEAD:oscatBasic/BAR_GRAPH.st
    		temp := (TRIGGER_HIGH - TRIGGER_LOW) * 0.142857142;
    		T1 := TRIGGER_LOW + temp;
=======
    		temp := (trigger_High - trigger_Low) * 0.142857142;
    		T1 := trigger_Low + temp;
>>>>>>> 800137518c97e6c8be9a9f286ec9de596d141e5a:Oscat_Basic/octMeasure/BAR_GRAPH.st
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
<<<<<<< HEAD:oscatBasic/BAR_GRAPH.st
    STATUS := 110;

    (* LOW, HIGH and ALARM can only be cleared with RST depending on ALARM_LOW and ALARM_HIGH *)
    IF NOT ALARM_LOW THEN LOW := FALSE; END_IF
    IF NOT ALARM_HIGH THEN HIGH := FALSE; END_IF
    IF RST THEN
    	ALARM := FALSE;
=======
    Status := 110;

    (* low, high and alarm can only be cleared with rst depending on alarm_low and alarm_high *)
    IF NOT Alarm_low THEN LOW := FALSE; END_IF
    IF NOT Alarm_high THEN HIGH := FALSE; END_IF
    IF rst THEN
    	Alarm := FALSE;
>>>>>>> 800137518c97e6c8be9a9f286ec9de596d141e5a:Oscat_Basic/octMeasure/BAR_GRAPH.st
    	LOW := FALSE;
    	HIGH := FALSE;
    END_IF

    (* check and set outputs *)
<<<<<<< HEAD:oscatBasic/BAR_GRAPH.st
    IF X < TRIGGER_LOW THEN
    	LOW := TRUE;
    	STATUS := 111;
    	IF ALARM_LOW THEN
    		ALARM := TRUE;
    		STATUS := 1;
=======
    IF X < trigger_Low THEN
    	LOW := TRUE;
    	Status := 111;
    	IF Alarm_low THEN
    		Alarm := TRUE;
    		Status := 1;
>>>>>>> 800137518c97e6c8be9a9f286ec9de596d141e5a:Oscat_Basic/octMeasure/BAR_GRAPH.st
    	END_IF
    ELSIF X < T1 THEN
    	Q1 := TRUE;
    ELSIF X < T2 THEN
    	Q2 := TRUE;
    ELSIF X < T3 THEN
    	Q3 := TRUE;
    ELSIF X < T4 THEN
    	Q4 := TRUE;
<<<<<<< HEAD:oscatBasic/BAR_GRAPH.st
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
=======
    ELSIF X < T5 THEN
    	Q5 := TRUE;
    ELSIF X < trigger_High THEN
    	Q6 := TRUE;
    ELSE
    	HIGH := TRUE;
    	Status := 112;
    	IF Alarm_high THEN
    		Alarm := TRUE;
    		Status := 2;
>>>>>>> 800137518c97e6c8be9a9f286ec9de596d141e5a:Oscat_Basic/octMeasure/BAR_GRAPH.st
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
