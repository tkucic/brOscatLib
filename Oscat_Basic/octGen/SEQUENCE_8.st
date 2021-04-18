FUNCTION_BLOCK SEQUENCE_8
    (* read sps timer *)
    tx := DWORD_TO_TIME(T_PLC_MS());

    (* initialize on startup *)
    IF NOT init THEN
    	last := tx;
    	init := TRUE;
    	status := 110;
    END_IF

    (* asynchronous reset *)
    IF rst THEN
    	step := -1;
    	Q0 := 0;
    	Q1 := 0;
    	Q2 := 0;
    	Q3 := 0;
    	Q4 := 0;
    	Q5 := 0;
    	Q6 := 0;
    	Q7 := 0;
    	status := 110;
    	run := 0;

    (* edge on start input restarts the sequencer *)
    ELSIF start AND NOT edge THEN
    	step := 0;
    	last := tx;
    	status := 111;
    	Q0 := 0;
    	Q1 := 0;
    	Q2 := 0;
    	Q3 := 0;
    	Q4 := 0;
    	Q5 := 0;
    	Q6 := 0;
    	Q7 := 0;
    	run := 1;
    END_IF
    edge := start;

    (* check if stop on error is necessary *)
    IF status > 0 AND status < 100 AND stop_on_error THEN RETURN; END_IF

    (* sequence is running *)
    IF run AND step = 0 THEN
    	IF NOT q0 AND in0 AND tx - last <= wait0 THEN
    		Q0 := TRUE;
    		last := tx;
    	ELSIF NOT q0 AND tx - last > wait0 THEN
    		status := 1;
    		run := FALSE;
    	ELSIF q0 AND tx - last >= delay0 THEN
    		step := 1;
    		last := tx;
    	END_IF
    END_IF
    IF run AND step = 1 THEN
    	IF NOT q1 AND in1 AND tx - last <= wait1 THEN
    		Q0 := FALSE;
    		Q1 := TRUE;
    		last := tx;
    	ELSIF NOT q1 AND Tx - last > wait1 THEN
    		status := 2;
    		q0 := FALSE;
    		run := FALSE;
    	ELSIF q1 AND tx - last >= delay1 THEN
    		step := 2;
    		last := tx;
    	END_IF
    END_IF
    IF run AND step = 2 THEN
    	IF NOT q2 AND in2 AND tx - last <= wait2 THEN
    		Q1 := FALSE;
    		Q2 := TRUE;
    		last := tx;
    	ELSIF NOT q2 AND Tx - last > wait2 THEN
    		status := 3;
    		q1 := FALSE;
    		run := FALSE;
    	ELSIF q2 AND tx - last >= delay2 THEN
    		step := 3;
    		last := tx;
    	END_IF
    END_IF
    IF run AND step = 3 THEN
    	IF NOT q3 AND in3 AND tx - last <= wait3 THEN
    		Q2 := FALSE;
    		Q3 := TRUE;
    		last := tx;
    	ELSIF NOT q3 AND Tx - last > wait3 THEN
    		status := 4;
    		q2 := FALSE;
    		run := FALSE;
    	ELSIF q3 AND tx - last >= delay3 THEN
    		step := 4;
    		last := tx;
    	END_IF
    END_IF
    IF run AND step = 4 THEN
    	IF NOT q4 AND in4 AND tx - last <= wait4 THEN
    		Q3 := FALSE;
    		Q4 := TRUE;
    		last := tx;
    	ELSIF NOT q4 AND Tx - last > wait4 THEN
    		status := 5;
    		q3 := FALSE;
    		run := FALSE;
    	ELSIF q4 AND tx - last >= delay4 THEN
    		step := 5;
    		last := tx;
    	END_IF
    END_IF
    IF run AND step = 5 THEN
    	IF NOT q5 AND in5 AND tx - last <= wait5 THEN
    		Q4 := FALSE;
    		Q5 := TRUE;
    		last := tx;
    	ELSIF NOT q5 AND Tx - last > wait5 THEN
    		status := 6;
    		q4 := FALSE;
    		run := FALSE;
    	ELSIF q5 AND tx - last >= delay5 THEN
    		step := 6;
    		last := tx;
    	END_IF
    END_IF
    IF run AND step = 6 THEN
    	IF NOT q6 AND in6 AND tx - last <= wait6 THEN
    		Q5 := FALSE;
    		Q6 := TRUE;
    		last := tx;
    	ELSIF NOT q6 AND Tx - last > wait6 THEN
    		status := 7;
    		q5 := FALSE;
    		run := FALSE;
    	ELSIF q6 AND tx - last >= delay6 THEN
    		step := 7;
    		last := tx;
    	END_IF
    END_IF
    IF run AND step = 7 THEN
    	IF NOT q7 AND in7 AND tx - last <= wait7 THEN
    		Q6 := FALSE;
    		Q7 := TRUE;
    		last := tx;
    	ELSIF NOT q7 AND Tx - last > wait7 THEN
    		status := 8;
    		q6 := FALSE;
    		run := FALSE;
    	ELSIF q7 AND tx - last >= delay7 THEN
    		step := -1;
    		Q7 := FALSE;
    		Run := FALSE;
    		status := 110;
    	END_IF
    END_IF
    QX := q0 OR q1 OR q2 OR q3 OR q4 OR q5 OR q6 OR q7;

    (*
    hm 1.10.06		rev 1.1
    	corrected delay logic to be after event and not before
    	added any output

    hm 1.12.06		rev 1.2
    	corrected failure in sequence logic.
    	added init at startup to prevent from initial statuss after start.

    hm 17.1.2007		rev 1.3
    	changed output fault to status for better compatibility with other modules (ESR)
    	added stop on error functionality and setup variable
    	default for inputs in0..7 is true.
    	renames variable state to step

    hm	17.sep 2007	rev 1.4
    	replaced time() with T_PLC_MS() for compatibility reasons

    hm	13. mar. 2009	rev 1.5
    	renamed output any to qx for compatibility resons

    *)
END_FUNCTION_BLOCK