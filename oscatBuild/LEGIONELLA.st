FUNCTION_BLOCK LEGIONELLA
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=443*)
    (* startup initialization *)
    IF NOT init THEN
    	init := TRUE;
    	X1.DAY := SHR(BYTE#128,DAY);
    	X1.start := T_start;
    	X3.low := Temp_offset + TEMP_SET;
    	X3.high := Temp_hys + X3.low;
    	X2.wait0 := T_max_HEAT;
    	X2.delay0 := TP_0;
    	X2.delay1 := TP_1;
    	X2.delay2 := TP_2;
    	X2.delay3 := TP_3;
    	X2.delay4 := TP_4;
    	X2.delay5 := TP_5;
    	X2.delay6 := TP_6;
    	X2.delay7 := TP_7;
    	X2.wait1 := T_max_ret;
    	X2.wait2 := T_max_ret;
    	X2.wait3 := T_max_ret;
    	X2.wait4 := T_max_ret;
    	X2.wait5 := T_max_ret;
    	X2.wait6 := T_max_ret;
    	X2.wait7 := T_max_ret;
    	X2();
    END_IF

    (* oerational code *)
    X1(DTi := DT_in);
    IF X1.Q OR MANUAL OR x2.RUN THEN
    	X3(in := TEMP_BOILER);
    	X2.in0 := X3.Q OR x3.win;
    	X2.in1 := TEMP_RETURN >= TEMP_SET;
    	X2.in2 := x2.in1;
    	X2.in3 := x2.in1;
    	X2.in4 := x2.in1;
    	X2.in5 := x2.in1;
    	X2.in6 := x2.in1;
    	X2.in7 := x2.in1;
    	X2.RST := RST;
    	X2(start := X1.Q OR MANUAL);
    	RUN := x2.RUN;
    	PUMP := x2.qx;
    	Heat := NOT X3.Q AND x2.RUN;
    	VALVE0 := X2.Q0;
    	VALVE1 := X2.Q1;
    	VALVE2 := X2.Q2;
    	VALVE3 := X2.Q3;
    	VALVE4 := X2.Q4;
    	VALVE5 := X2.Q5;
    	VALVE6 := X2.Q6;
    	VALVE7 := X2.Q7;
    	PUMP := X2.qx;
    	STATUS := X2.STATUS;
    ELSE;
    	X2(start :=0);
    	STATUS := x2.STATUS;
    END_IF

    (* revision history

    hm 17.jan 2007	rev 1.1
    	rewritten to st for higher performance
    	changes eeror output to esr compatible STATUS output

    hm	23. 10.2008	rev 1.2
    	update code to use new version of timer_1

    hm	13. mar. 2009	rev 1.3
    	real constants updated to new systax using dot
    	using new module sequence_8
    *)



END_FUNCTION_BLOCK
