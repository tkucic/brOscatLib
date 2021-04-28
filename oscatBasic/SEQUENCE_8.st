FUNCTION_BLOCK SEQUENCE_8
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=203*)
    (* read sps timer *)
    tx := UDINT_TO_TIME(T_PLC_MS());

    (* initialize on startup *)
    IF NOT init THEN
    	last := tx;
    	init := TRUE;
    	STATUS := 110;
    END_IF

    (* asynchronous reset *)
    IF RST THEN
    	STEP := -1;
    	Q0 := 0;
    	Q1 := 0;
    	Q2 := 0;
    	Q3 := 0;
    	Q4 := 0;
    	Q5 := 0;
    	Q6 := 0;
    	Q7 := 0;
    	STATUS := 110;
    	RUN := 0;

    (* edge_ on START input restarts the sequencer *)
    ELSIF START AND NOT edge_ THEN
    	STEP := 0;
    	last := tx;
    	STATUS := 111;
    	Q0 := 0;
    	Q1 := 0;
    	Q2 := 0;
    	Q3 := 0;
    	Q4 := 0;
    	Q5 := 0;
    	Q6 := 0;
    	Q7 := 0;
    	RUN := 1;
    END_IF
    edge_ := START;

    (* check if stop on error is necessary *)
    IF STATUS > 0 AND STATUS < 100 AND STOP_ON_ERROR THEN RETURN; END_IF

    (* sequence is running *)
    IF RUN AND STEP = 0 THEN
    	IF NOT Q0 AND IN0 AND tx - last <= WAIT0 THEN
    		Q0 := TRUE;
    		last := tx;
    	ELSIF NOT Q0 AND tx - last > WAIT0 THEN
    		STATUS := 1;
    		RUN := FALSE;
    	ELSIF Q0 AND tx - last >= DELAY0 THEN
    		STEP := 1;
    		last := tx;
    	END_IF
    END_IF
    IF RUN AND STEP = 1 THEN
    	IF NOT Q1 AND IN1 AND tx - last <= WAIT1 THEN
    		Q0 := FALSE;
    		Q1 := TRUE;
    		last := tx;
    	ELSIF NOT Q1 AND tx - last > WAIT1 THEN
    		STATUS := 2;
    		Q0 := FALSE;
    		RUN := FALSE;
    	ELSIF Q1 AND tx - last >= DELAY1 THEN
    		STEP := 2;
    		last := tx;
    	END_IF
    END_IF
    IF RUN AND STEP = 2 THEN
    	IF NOT Q2 AND IN2 AND tx - last <= WAIT2 THEN
    		Q1 := FALSE;
    		Q2 := TRUE;
    		last := tx;
    	ELSIF NOT Q2 AND tx - last > WAIT2 THEN
    		STATUS := 3;
    		Q1 := FALSE;
    		RUN := FALSE;
    	ELSIF Q2 AND tx - last >= DELAY2 THEN
    		STEP := 3;
    		last := tx;
    	END_IF
    END_IF
    IF RUN AND STEP = 3 THEN
    	IF NOT Q3 AND IN3 AND tx - last <= WAIT3 THEN
    		Q2 := FALSE;
    		Q3 := TRUE;
    		last := tx;
    	ELSIF NOT Q3 AND tx - last > WAIT3 THEN
    		STATUS := 4;
    		Q2 := FALSE;
    		RUN := FALSE;
    	ELSIF Q3 AND tx - last >= DELAY3 THEN
    		STEP := 4;
    		last := tx;
    	END_IF
    END_IF
    IF RUN AND STEP = 4 THEN
    	IF NOT Q4 AND IN4 AND tx - last <= WAIT4 THEN
    		Q3 := FALSE;
    		Q4 := TRUE;
    		last := tx;
    	ELSIF NOT Q4 AND tx - last > WAIT4 THEN
    		STATUS := 5;
    		Q3 := FALSE;
    		RUN := FALSE;
    	ELSIF Q4 AND tx - last >= DELAY4 THEN
    		STEP := 5;
    		last := tx;
    	END_IF
    END_IF
    IF RUN AND STEP = 5 THEN
    	IF NOT Q5 AND IN5 AND tx - last <= WAIT5 THEN
    		Q4 := FALSE;
    		Q5 := TRUE;
    		last := tx;
    	ELSIF NOT Q5 AND tx - last > WAIT5 THEN
    		STATUS := 6;
    		Q4 := FALSE;
    		RUN := FALSE;
    	ELSIF Q5 AND tx - last >= DELAY5 THEN
    		STEP := 6;
    		last := tx;
    	END_IF
    END_IF
    IF RUN AND STEP = 6 THEN
    	IF NOT Q6 AND IN6 AND tx - last <= WAIT6 THEN
    		Q5 := FALSE;
    		Q6 := TRUE;
    		last := tx;
    	ELSIF NOT Q6 AND tx - last > WAIT6 THEN
    		STATUS := 7;
    		Q5 := FALSE;
    		RUN := FALSE;
    	ELSIF Q6 AND tx - last >= DELAY6 THEN
    		STEP := 7;
    		last := tx;
    	END_IF
    END_IF
    IF RUN AND STEP = 7 THEN
    	IF NOT Q7 AND IN7 AND tx - last <= WAIT7 THEN
    		Q6 := FALSE;
    		Q7 := TRUE;
    		last := tx;
    	ELSIF NOT Q7 AND tx - last > WAIT7 THEN
    		STATUS := 8;
    		Q6 := FALSE;
    		RUN := FALSE;
    	ELSIF Q7 AND tx - last >= DELAY7 THEN
    		STEP := -1;
    		Q7 := FALSE;
    		RUN := FALSE;
    		STATUS := 110;
    	END_IF
    END_IF
    QX := Q0 OR Q1 OR Q2 OR Q3 OR Q4 OR Q5 OR Q6 OR Q7;

    (*
    hm 1.10.06		rev 1.1
    	corrected delay logic to be after event and not before
    	added any output

    hm 1.12.06		rev 1.2
    	corrected failure in sequence logic.
    	added init at startup to prevent from initial statuss after START.

    hm 17.1.2007		rev 1.3
    	changed output fault to STATUS for better compatibility with other modules (ESR)
    	added stop on error functionality and setup variable
    	default for inputs IN0..7 is true.
    	renames variable state to STEP

    hm	17.sep 2007	rev 1.4
    	replaced time() with T_PLC_MS() for compatibility reasons

    hm	13. mar. 2009	rev 1.5
    	renamed output any to QX for compatibility resons

    *)
END_FUNCTION_BLOCK
