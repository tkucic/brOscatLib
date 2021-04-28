FUNCTION_BLOCK BURNER
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=430*)
    (* read system time *)
    tx := UDINT_TO_TIME(T_PLC_MS());

    (* check RST input and overtemp *)
    IF RST OR OVER_TEMP OR state = 0 THEN
    	IF STATUS > 0 AND tx - last_change >= LOCKOUT_TIME AND RST THEN
    		STATUS := 110;
    		FAIL := FALSE;
    		state := 1;
    	ELSE
    		(* normaler reset *)
    		MOTOR := FALSE;
    		COIL1 := FALSE;
    		COIL2 := FALSE;
    		IGNITE := FALSE;
    		PRE_HEAT := FALSE;
    		IF OVER_TEMP THEN
    			STATUS := 9;
    			FAIL := TRUE;
    		END_IF
    		last_change := tx;
    		last := tx;
    		state := 1;
    	END_IF
    END_IF

    (* check for timer RST and RST timer if true *)
    IF RST_TIMER THEN
    	RUNTIME1 := 0;
    	RUNTIME2 := 0;
    	CYCLES := 0;
    	cycles2 := 0;
    END_IF

    (* quit here if an error is present *)
    IF (STATUS > 0 AND STATUS < 100) OR RST THEN RETURN; END_IF

    (* start sequence *)
    CASE BYTE_TO_USINT(state) OF

    1:	(* IN signal starts oil pre heating *)
    	IF IN AND FLAME THEN
    		state := 7;
    		PRE_HEAT := FALSE;
    		STATUS := 2;
    		last_change := tx;
    	ELSIF IN THEN
    		PRE_HEAT := TRUE;
    		state := 2;
    		last_change := tx;
    	END_IF

    2:	(* after pre_heating time start MOTOR *)
    	IF (tx- last_change >= PRE_HEAT_TIME AND OIL_TEMP) OR (OIL_TEMP AND NOT oil_temp_last) THEN
    		MOTOR := TRUE;
    		state := 3;
    		last_change := tx;
    	(* PRE_HEAT_TIME ist abgelaufen und OIL_TEMP ist nicht aktiv *)
    	ELSIF tx - last_change >= PRE_HEAT_TIME AND NOT OIL_TEMP THEN
    		state := 7;
    		PRE_HEAT := FALSE;
    		STATUS := 1;
    		last_change := tx;
    	(* FLAME monitor cannot be active at this time *)
    	ELSIF FLAME THEN
    		state := 7;
    		PRE_HEAT := FALSE;
    		STATUS := 2;
    		last_change := tx;
    	END_IF

    3:	(* abwarten bis zündung eingeschaltet werden kann *)
    	IF tx - last_change >= PRE_VENT_TIME - PRE_IGNITE_TIME THEN
    		IGNITE := TRUE;
    		state := 4;
    		last_change := tx;
    	(* FLAME monitor cannot be active at this time *)
    	ELSIF FLAME THEN
    		state := 7;
    		PRE_HEAT := FALSE;
    		MOTOR := FALSE;
    		STATUS := 3;
    		last_change := tx;
    	END_IF

    4:	(* warten bis oelzufuhr geoeffnet werden darf *)
    	IF tx - last_change >= PRE_IGNITE_TIME THEN
    		COIL1 := TRUE;
    		state := 5;
    		last_change := tx;
    	END_IF

    5:	(* warten auf flammwaechter und falls noetig abschalten *)
    	IF tx - last_change >= SAFETY_TIME OR FLAME THEN
    		IF NOT FLAME THEN
    			(* notabschaltung da flammwaechster nicht angesprochen hat *)
    			state := 7;
    			MOTOR := FALSE;
    			COIL1 := FALSE;
    			PRE_HEAT := FALSE;
    			IGNITE := FALSE;
    			STATUS := 4;
    			last_change := tx;
    		ELSE
    			state := 6;
    			last_change := tx;
    		END_IF
    	END_IF

    6:	(* brenner läuft, flammueberwachung und nach ablauf der nachigniteszeit IGNITE abschalten *)
    	IF NOT FLAME AND NOT MULTIPLE_IGNITION THEN
    		(* notabschaltung da flammwaechster keine flamme meldet *)
    		state := 7;
    		MOTOR := FALSE;
    		COIL1 := FALSE;
    		COIL2 := FALSE;
    		PRE_HEAT := FALSE;
    		IGNITE := FALSE;
    		STATUS := 5;
    		last_change := tx;
    	ELSIF NOT FLAME AND MULTIPLE_IGNITION THEN
    		IGNITE := TRUE;
    		state := 5;
    		COIL2 := FALSE;
    		last_change := tx;
    	ELSE
    		IF tx - last_change >= POST_IGNITE_TIME THEN
    			(* POST_IGNITE_TIME abgelaufen, IGNITE abschalten *)
    			IGNITE := FALSE;
    		END_IF
    		IF tx - last_change >= STAGE2_DELAY AND STAGE2 THEN
    			COIL2 := TRUE;
    		ELSE
    			COIL2 := FALSE;
    		END_IF
    	END_IF
    END_CASE

    (* abschaltung wenn kein eingangssignal *)
    IF NOT IN THEN
    	state := 1;
    	MOTOR := FALSE;
    	COIL1 := FALSE;
    	COIL2 := FALSE;
    	IGNITE := FALSE;
    	PRE_HEAT := FALSE;
    	last_change := tx;
    END_IF

    (* runtimezähler *)
    timer1(IN := FLAME AND IN AND MOTOR AND COIL1 AND NOT COIL2, SECONDS := RUNTIME1, CYCLES := CYCLES);
    timer2(IN := FLAME AND IN AND MOTOR AND COIL1 AND COIL2, SECONDS := RUNTIME2, CYCLES := cycles2);
    KWH := UDINT_TO_REAL(RUNTIME1) * KW1 / 3600.0 + UDINT_TO_REAL(RUNTIME2) * KW2 / 3600.0;

    (* zeit fuer naechsten aufruf merken *)
    last := tx;

    (* set FAIL output IF ERROR and STATUS  if normal operation *)

    IF STATUS > 0 AND STATUS < 100 THEN
    	FAIL := TRUE;
    ELSE
    	FAIL := FALSE;
    	IF NOT IN THEN
    		STATUS := 110;
    	ELSIF FLAME AND IN AND MOTOR AND COIL2 AND COIL1 THEN
    		STATUS := 113;
    	ELSIF FLAME AND IN AND MOTOR AND COIL1 THEN
    		STATUS := 112;
    	ELSE
    		STATUS := 111;
    	END_IF
    END_IF



    (*
    31.12.2006	hm		rev 1.1
    	added PRE_HEAT timing and output
    	FLAME monitor before ignition will generate error on STATUS output
    	added output for KWH

    31.12.2006	hm		rev 1.2
    	added oil_temp_input

    31.12.2006	hm		rev 1.3
    	changed STATUS output to be byte instead of bool

    22.1.2007		hm		rev 1.4
    	renamed FAIL output to STATUS
    	added output CYCLES
    	corrected an error while PRE_HEAT would be on when an error was present
    	added COIL2 output and STAGE2 input

    15.9.2007		hm		rev 1.5
    	replaced Time() with T_PLC_MS for compatibility and performance reasons

    hm	21. oct. 2008	rev 1.6
    	changed code to use new ontime rev 2.0	
    *)
END_FUNCTION_BLOCK
