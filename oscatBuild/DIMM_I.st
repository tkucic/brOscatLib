FUNCTION_BLOCK DIMM_I
    (*http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=52*)
    (* the input is first sent through auto reconfiguration and debouncing *)
    config(IN := IN, TD := T_DEBOUNCE, TR := T_RECONFIG);
    decode(IN := config.Q, T_LONG := T_DIMM_START);

    IF RST THEN
    	IF RST_OUT THEN OUT := 0; END_IF
    	Q := FALSE;
    	dir := OUT > 127;
    ELSIF SET THEN
    	OUT := VAL;
    	Q := TRUE;
    	(* SET direction to up when value < 127 otherwise SET dir down dir is reversed because next action will reverse again *)
    	dir := OUT > 127;
    ELSIF decode.SINGLE THEN
    	(* a single click reverses output Q *)
    	Q := NOT Q;
    	(* when dimmer is turned on we need to limit OUT to min and max limits *)
    	IF Q THEN	OUT := LIMIT(MAX(MIN_ON,1), OUT, MAX_ON);	END_IF
    	(* SET the appropriate direction of dimmer dir is reversed because next action will reverse again *)
    	dir := OUT > 127;
    ELSIF decode.TP_LONG THEN
    	IF NOT Q THEN
    		IF SOFT_DIMM THEN
    			OUT := 1;
    			dir := TRUE;
    		ELSE
    			OUT := LIMIT(MAX(MIN_ON,1), OUT, MAX_ON);
    			dir := OUT < 127;
    		END_IF
    		Q := TRUE;
    	ELSE
    		(* reverse direction with every long click *)
    		dir := NOT dir;
    	END_IF
    END_IF

    (* SET the double click output *)
    IF NOT DBL_TOGGLE THEN DBL := FALSE; END_IF
    IF decode.DOUBLE THEN DBL := NOT DBL; END_IF

    (* while dimming is active ramp the output OUT up or down *)
    dim(DIR := dir, E := decode.LONG AND Q, TR := T_DIMM, RMP := OUT);

    (* reverse direction when limits are reached *)
    IF OUT = 0 THEN
    	dir := TRUE;
    ELSIF OUT = 255 THEN
    	dir := FALSE;
    END_IF

    (* limit the maximum runtime *)
    IF T_ON_MAX > t#0s THEN
    	t3(IN := Q, PT := T_ON_MAX);
    	Q := Q XOR t3.Q;
    END_IF




    (* revision history

    hm 22.1.2007		rev 1.1
    	deleted unused structure ramp

    hm 2.feb 2007		rev 1.2
    	changed structure to read time() at the beginning for better time consistency if a higher priorized tak interrupts dimm_i
    	added statements IN case structure for state 1 to allow for short 1 cycle input pulses

    hm 	15.9.2007		rev 1.3
    	replaced Time() with T_PLC_MS for compatibility and performance reasons

    hm	30. sep. 2008	rev 1.4
    	added Input VAL to supply value for SET input
    	added setup parameter init_val

    hm	22. oct. 2008	rev 2.0
    	new code and features

    hm	14. nov. 2008	rev 2.1
    	added SOFT_DIMM feature

    hm	16. nov. 2008	rev 2.2
    	added reset OUT feature

    hm	26. jan. 2009	rev 2.3
    	dimming will also reverse at OUT = 0
    	RST will override SET
    *)
END_FUNCTION_BLOCK
