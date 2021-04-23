FUNCTION_BLOCK SWITCH_X
    (*http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=59*)
    (* initialize on startup *)
    IF NOT init THEN
    	init := TRUE;
    	IF t_debounce < t#50ms THEN tx := t#50ms; ELSE tx := t_debounce; END_IF
    	T1(PT := Tx);
    	T2(PT := Tx);
    	T3(PT := Tx);
    	T4(PT := Tx);
    	T5(PT := Tx);
    	T6(PT := Tx);
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
    IF t1.Q AND NOT E1 THEN X1 := TRUE; END_IF
    IF t2.Q AND NOT E2 THEN X2 := TRUE; END_IF

    IF t1.Q THEN
    	IF t3.q THEN
    		Q31 := TRUE;
    		X1 := FALSE;
    	ELSIF t4.q THEN
    		Q41 := TRUE;
    		X1 := FALSE;
    	ELSIF t5.q THEN
    		Q51 := TRUE;
    		X1 := FALSE;
    	ELSIF t6.q THEN
    		Q61 := TRUE;
    		X1 := FALSE;
    	END_IF
    ELSIF t2.Q THEN
    	IF t3.q THEN
    		Q32 := TRUE;
    		X2 := FALSE;
    	ELSIF t4.q THEN
    		Q42 := TRUE;
    		X2 := FALSE;
    	ELSIF t5.q THEN
    		Q52 := TRUE;
    		X2 := FALSE;
    	ELSIF t6.q THEN
    		Q62 := TRUE;
    		X2 := FALSE;
    	END_IF
    (* IN1 was active alone *)
    ELSIF NOT T1.Q AND E1 AND X1 THEN
    	Q1 := TRUE;
    	X1 := FALSE;
    ELSIF NOT T2.Q AND E2 AND X2 THEN
    	Q2 := TRUE;
    	X2 := FALSE;
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
