FUNCTION_BLOCK FT_Profile
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=457*)
    (* read system time *)
    tx := UDINT_TO_TIME(T_PLC_MS());

    (* determine start condition *)
    IF E AND NOT edge_ THEN
    	RUN := TRUE;
    	ET := t#0s;
    	t0 := tx;
    	ta := tx;
    	tb := MULTIME(TIME_1, M);
    	va := VALUE_0;
    	vb := VALUE_1;
    	temp := VALUE_0;
    	state := 1;
    END_IF
    edge_ := E;

    (* generate startup profile *)
    IF RUN THEN
    	CASE state OF
    		1:	IF tx - ta >= tb THEN
    				ta := ta + tb;
    				tb := MULTIME(TIME_2 - TIME_1, M);
    				va := VALUE_1;
    				vb := VALUE_2;
    				temp := VALUE_1;
    				state := 2;
    			ELSE
    				temp := ((vb - va) * TIME_TO_REAL(tx - ta) / TIME_TO_REAL(tb) + va);
    			END_IF
    		2:	IF tx - ta >= tb THEN
    				ta := ta + tb;
    				tb := MULTIME(TIME_3 - TIME_2, M);
    				va := VALUE_2;
    				vb := VALUE_3;
    				temp := VALUE_2;
    				state := 3;
    			ELSE
    				temp := ((vb - va) * TIME_TO_REAL(tx - ta) / TIME_TO_REAL(tb) + va);
    			END_IF
    		3:	IF tx - ta >= tb THEN
    				ta := ta + tb;
    				tb := MULTIME(TIME_10 - TIME_3, M);
    				va := VALUE_3;
    				vb := VALUE_10;
    				temp := VALUE_3;
    				state := 4;
    			ELSE
    				temp := ((vb - va) * TIME_TO_REAL(tx - ta) / TIME_TO_REAL(tb) + va);
    			END_IF
    		4 :	IF tx - ta >= tb THEN
    				ta := ta + tb;
    				tb := MULTIME(TIME_11 - TIME_10, M);
    				va := VALUE_10;
    				vb := VALUE_11;
    				temp := VALUE_10;
    				IF E THEN state := 5; ELSE state := 6; END_IF
    			ELSE
    				temp := ((vb - va) * TIME_TO_REAL(tx - ta) / TIME_TO_REAL(tb) + va);
    			END_IF
    		5:	(* extend the signal while E is true *)
    			IF E THEN
    				ta := tx;
    			ELSE
    				state := 6;
    			END_IF
    		6:	IF tx - ta >= tb THEN
    				ta := ta + tb;
    				tb := MULTIME(TIME_12 - TIME_11, M);
    				va := VALUE_11;
    				vb := VALUE_12;
    				temp := VALUE_11;
    				state := 7;
    			ELSE
    				temp := ((vb - va) * TIME_TO_REAL(tx - ta) / TIME_TO_REAL(tb) + va);
    			END_IF
    		7:	IF tx - ta >= tb THEN
    				ta := ta + tb;
    				tb := MULTIME(TIME_13 - TIME_12, M);
    				va := VALUE_12;
    				vb := VALUE_13;
    				temp := VALUE_12;
    				state := 8;
    			ELSE
    				temp := ((vb - va) * TIME_TO_REAL(tx - ta) / TIME_TO_REAL(tb) + va);
    			END_IF
    		8:	IF tx - ta >= tb THEN
    				temp := VALUE_13;
    				RUN := FALSE;
    			ELSE
    				temp := ((vb - va) * TIME_TO_REAL(tx - ta) / TIME_TO_REAL(tb) + va);
    			END_IF
    	END_CASE
    	Y := temp * K + O;
    	ET := tx - t0;
    END_IF

    (* revision history
    hm	27 feb 2007		rev 1.0
    	original version

    hm	15. sep2007		rev 1.1
    	replaced Time() with T_PLC_MS for compatibility and performance reasons

    *)
END_FUNCTION_BLOCK
