FUNCTION_BLOCK PULSE_T
    (*http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=56*)
    tx := UDINT_TO_TIME(T_PLC_MS());
    IF NOT init THEN
    	init := TRUE;
    	last := tx;
    ELSIF RST THEN
    	(* asynchronous reset *)
    	Q := FALSE;
    ELSIF IN AND NOT edge_ AND NOT Q THEN
    	(* a rising edge_ on IN will reversre the output status, if new pulse is startet the start time is stored IN last *)
    	last := tx;
    	Q := TRUE;
    ELSIF NOT IN AND edge_ AND ((tx - last) > T1) THEN
    	(* a falling edge_ on IN will clear the output if IN was high for more then T1 *)
    	Q := FALSE;
    ELSIF (tx - last) >= T2 THEN
    	(* timeout for long pulse if second click did not occur or IN stays high *)
    	Q := FALSE;
    END_IF

    edge_ := IN;

    (* revision histroy
    hm	15. jul. 2008	rev 1.0
    	original release


    *)	

END_FUNCTION_BLOCK
