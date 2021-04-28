FUNCTION_BLOCK CLK_PULSE
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=193*)
    tx := T_PLC_MS();		(* read system *)
    Q := FALSE;				(* reset Q we generate pulses only for one cycle *)
    RUN := CNT < N;

    IF NOT init OR RST THEN
    	init := TRUE;
    	CNT := 0;
    	tn := tx - TIME_TO_UDINT(PT);
    	RUN := FALSE;
    ELSIF (CNT < N OR N = 0) AND tx - tn >= TIME_TO_UDINT(PT) THEN		(* generate a pulse *)
    	CNT := CNT + 1;
    	Q := TRUE;
    	tn := tn + TIME_TO_UDINT(PT);
    END_IF



    (* revision history
    hm		4. aug 2006		rev 1.0
    	original version

    hm		17. sep 2007	rev 1.1
    	replaced time() with T_PLC_S() for compatblity reasons

    hm		16. feb. 2011	rev 1.2
    	fixed an error when timer overflows 
    *)
END_FUNCTION_BLOCK
