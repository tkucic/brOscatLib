FUNCTION_BLOCK SWITCH_X
    (*http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=59*)
    (* initialize on startup *)
    IF NOT init THEN
    	init := TRUE;
    	IF T_DEBOUNCE < t#50ms THEN tx := t#50ms; ELSE tx := T_DEBOUNCE; END_IF
    	T1(PT := tx);
    	T2(PT := tx);
    	T3(PT := tx);
    	T4(PT := tx);
    	T5(PT := tx);
    	T6(PT := tx);
    ELSE
    	Q1 := FALSE;
    	Q2 := FALSE;
    	Q3 := FALSE;
    	Q4 := FALSE;
    	Q5 := FALSE;
    	Q6 := FALSE;
    	Q31 := FALSE;
    	Q41 := FALSE;
    	Q51 := FALSE;
    	Q61 := FALSE;
    	Q32 := FALSE;
    	Q42 := FALSE;
    	Q52 := FALSE;
    	Q62 := FALSE;
    END_IF

    (* read inputs and debounce *)
    	T1(IN := IN1);
    	T2(IN := IN2);
    	T3(IN := IN3);
    	T4(IN := IN4);
    	T5(IN := IN5);
    	T6(IN := IN6);

    (* detect edge of IN1 and IN2 *)
    IF T1.Q AND NOT E1 THEN x1 := TRUE; END_IF
    IF T2.Q AND NOT E2 THEN x2 := TRUE; END_IF

    IF T1.Q THEN
    	IF T3.Q THEN
    		Q31 := TRUE;
    		x1 := FALSE;
    	ELSIF T4.Q THEN
    		Q41 := TRUE;
    		x1 := FALSE;
    	ELSIF T5.Q THEN
    		Q51 := TRUE;
    		x1 := FALSE;
    	ELSIF T6.Q THEN
    		Q61 := TRUE;
    		x1 := FALSE;
    	END_IF
    ELSIF T2.Q THEN
    	IF T3.Q THEN
    		Q32 := TRUE;
    		x2 := FALSE;
    	ELSIF T4.Q THEN
    		Q42 := TRUE;
    		x2 := FALSE;
    	ELSIF T5.Q THEN
    		Q52 := TRUE;
    		x2 := FALSE;
    	ELSIF T6.Q THEN
    		Q62 := TRUE;
    		x2 := FALSE;
    	END_IF
    (* IN1 was active alone *)
    ELSIF NOT T1.Q AND E1 AND x1 THEN
    	Q1 := TRUE;
    	x1 := FALSE;
    ELSIF NOT T2.Q AND E2 AND x2 THEN
    	Q2 := TRUE;
    	x2 := FALSE;
    ELSIF T3.Q THEN
    	Q3 := TRUE;
    ELSIF T4.Q THEN
    	Q4 := TRUE;
    ELSIF T5.Q THEN
    	Q5 := TRUE;
    ELSIF T6.Q THEN
    	Q6 := TRUE;
    END_IF

    (* save state of IN1 and IN2 *)
    E1 := T1.Q;
    E2 := T2.Q;

END_FUNCTION_BLOCK
