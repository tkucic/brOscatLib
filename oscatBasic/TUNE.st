FUNCTION_BLOCK TUNE
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=472*)
    (* read system time *)
    tx := T_PLC_MS();

    IF RST THEN
    	Y := RST_VAL;
    	state := 0;
    ELSIF SET THEN
    	Y := SET_VAL;
    	state := 0;
    ELSIF state > 0 THEN
    	(* key has been pushed state machine operating *)
    	(* first read the correct input *)
    	IF state = 1 THEN
    		(* step up *)
    		in := SU;
    	ELSE
    		(* step down *)
    		in := SD;
    	END_IF
    	(* check for single step operation *)
    	IF NOT in AND tx - start <= TIME_TO_UDINT(T1) THEN
    		Y := Y_start + step;
    		state := 0;
    	(* check if fast ramp needs to be generated *)
    	ELSIF in AND tx - start >= TIME_TO_UDINT(T2) THEN
    		Y := Y_start2 + UDINT_TO_REAL(tx - start2) * S2 / SPEED;
    	(* check if slow ramp needs to be generated *)
    	ELSIF in AND tx - start >= TIME_TO_UDINT(T1) THEN
    		Y := Y_start + UDINT_TO_REAL(tx - start - TIME_TO_UDINT(T1)) * S1 / SPEED;
    		start2 := tx;
    		Y_start2 := Y;
    	ELSIF NOT in THEN
    		state := 0;
    	END_IF
    ELSIF SU THEN
    	(* slow step up *)
    	state := 1;
    	start := tx;
    	step := SS;
    	SPEED := 1000.0;
    	Y_start := Y;
    ELSIF SD THEN
    	(* slow step down *)
    	state := 2;
    	start := tx;
    	step := -SS;
    	SPEED := -1000.0;
    	Y_start := Y;
    END_IF

    (* make sure output does not exceed limits *)
    Y := LIMIT(LIMIT_L, Y, LIMIT_H);

    (* revision history
    hm	3.11.2007		rev 1.0
    	original version

    hm	16. mar. 2008	rev 1.1
    	added type conversions to avoid warnings under codesys 3.0

    hm	11. mar. 2009	rev 1.2
    	real constants updated to new systax using dot																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																											

    *)
END_FUNCTION_BLOCK
