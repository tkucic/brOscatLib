FUNCTION_BLOCK HEAT_METER
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=436*)
    IF RST THEN
    	int1(RST := TRUE);
    	int1.RST := FALSE;
    	C := 0.0;
    	Y := 0.0;
    ELSIF E THEN
    	x := (WATER_DENSITY(SEL(RETURN_METER, TF, TR), FALSE) * (WATER_ENTHALPY(TF) - WATER_ENTHALPY(TR)) * (1.0 - CONTENT) + CP * DENSITY * CONTENT * (TF-TR));
    END_IF

    (* integrate or add consumption *)
    int1(RUN := NOT PULSE_MODE AND E, IN := x * LPH * 2.77777777777E-4);
    IF PULSE_MODE THEN
    	IF NOT edge_ AND E THEN Y := Y + x * LPH; END_IF
    ELSE
    	Y := int1.OUT;
    END_IF

    (* store the value of E *)
    edge_ := E;

    (* read system_time *)
    tx := T_PLC_MS();

    (* only init at startup necessary *)
    IF NOT init THEN
    	init := TRUE;
    	last := tx;
    END_IF

    (* calculate the current consumption *)
    IF (tx - last >= TIME_TO_UDINT(AVG_TIME)) AND (AVG_TIME > T#0s) THEN
    	last := tx;
    	C := (Y - y_last) * 3.6E6 / UDINT_TO_REAL(TIME_TO_UDINT(AVG_TIME));
    	y_last := Y;
    END_IF



    (* revision history
    hm	16. nov. 2007	rev 1.0
    	original version

    hm	24. dec. 2007	rev 1.1
    	added config variable RETURN_METER
    	added output C for current consumption

    hm	6. mar. 2008	rev 1.2
    	corrected an error in pulse mode

    hm	16. mar. 2008	rev 1.3
    	added type conversion to avoid warnings under codesys 3.0

    hm	21. oct. 2008	rev 1.4
    	improved code

    hm	6. nov. 2008	rev 1.5
    	changed to FT_INT2 to avoid overrun at hig values

    hm	8. feb. 2009	rev 1.6
    	changes Y to be I/O

    hm	23. mar. 2009	rev 1.7
    	real constants updated to new systax using dot
    	corected error in formula

    hm	27. jul 2009	rev 1.8
    	output C is now calculated in J/h

    hm	13. nov. 2009	rev 1.9
    	output C is now calculated correctly

    hm	23. jan. 2011	rev 1.10
    	corrected an error with PULSE_MODE
    *)

END_FUNCTION_BLOCK
