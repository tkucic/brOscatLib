FUNCTION_BLOCK METER
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=343*)
    (* measure the last cycle time and make sure we onle execute once every millisecond *)
    tx := T_PLC_MS();
    IF NOT init THEN
    	init := TRUE;
    	last := tx;
    	MR.RX := MX;
    	MR.R1 := 0.0;
    ELSIF tx = last THEN
    	RETURN;
    ELSE
    	tc := UDINT_TO_REAL(tx - last) * 0.001;
    END_IF
    last := tx;

    (* reset *)
    IF RST THEN
    	MR.R1 := 0.0;
    	MR.RX := 0.0;
    ELSE
    	(* current consumption measurement *)
    	IF I1 THEN MX1 := M1; ELSE MX1 := 0.0; END_IF
    	IF I2 THEN MX2 := M2; ELSE MX2 := 0.0; END_IF
    	(* add up the current values in a double real *)
    	R2_ADD(MR,(SEL(I1,0.0,MX1) + SEL(I2, 0.0, MX2)) / D * tc, MR);
    	(* set the current output value *)
    	MX := MR.RX;
    END_IF




    (* revision history

    hm	16. sep.2007		rev 1.0
    	original version

    hm	7. feb 2008		rev 1.1
    	use new version of ft_int to avoid a counting stop at high values
    	deleted unnecessary limits

    hm	24. mar. 2008	rev 1.2
    	use data_type real2 to extend accuracy to 15 digits total
    	do not use ft_int which adds unnecessary overhead

    hm	8. feb. 2009	rev 1.3
    	changed MX to be I/O
    	make sure calculation works for cycle times < 1 ms

    hm	8. mar. 2009	rev 1.4
    	last was not updated
    	code improvements

    *)

END_FUNCTION_BLOCK
