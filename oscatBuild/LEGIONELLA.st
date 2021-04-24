FUNCTION_BLOCK LEGIONELLA
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=443*)
    (* startup initialization *)
    IF NOT init THEN
    	init := TRUE;
    	X1.DAY := SHR(BYTE#128,DAY);
    	X1.start := T_START;
    	x3.low := TEMP_OFFSET + TEMP_SET;
    	x3.high := TEMP_HYS + x3.low;
    	x2.wait0 := T_MAX_HEAT;
    	x2.delay0 := TP_0;
    	x2.delay1 := TP_1;
    	x2.delay2 := TP_2;
    	x2.delay3 := TP_3;
    	x2.delay4 := TP_4;
    	x2.delay5 := TP_5;
    	x2.delay6 := TP_6;
    	x2.delay7 := TP_7;
    	x2.wait1 := T_MAX_RET;
    	x2.wait2 := T_MAX_RET;
    	x2.wait3 := T_MAX_RET;
    	x2.wait4 := T_MAX_RET;
    	x2.wait5 := T_MAX_RET;
    	x2.wait6 := T_MAX_RET;
    	x2.wait7 := T_MAX_RET;
    	x2();
    END_IF

    (* oerational code *)
    X1(DTi := DT_IN);
    IF X1.Q OR MANUAL OR x2.RUN THEN
    	x3(in := TEMP_BOILER);
    	x2.in0 := x3.Q OR x3.win;
    	x2.in1 := TEMP_RETURN >= TEMP_SET;
    	x2.in2 := x2.in1;
    	x2.in3 := x2.in1;
    	x2.in4 := x2.in1;
    	x2.in5 := x2.in1;
    	x2.in6 := x2.in1;
    	x2.in7 := x2.in1;
    	x2.RST := RST;
    	x2(start := X1.Q OR MANUAL);
    	RUN := x2.RUN;
    	PUMP := x2.qx;
    	HEAT := NOT x3.Q AND x2.RUN;
    	VALVE0 := x2.Q0;
    	VALVE1 := x2.Q1;
    	VALVE2 := x2.Q2;
    	VALVE3 := x2.Q3;
    	VALVE4 := x2.Q4;
    	VALVE5 := x2.Q5;
    	VALVE6 := x2.Q6;
    	VALVE7 := x2.Q7;
    	PUMP := x2.qx;
    	STATUS := x2.STATUS;
    ELSE;
    	x2(start :=0);
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
