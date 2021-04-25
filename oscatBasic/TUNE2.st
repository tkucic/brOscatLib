FUNCTION_BLOCK TUNE2
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=475*)
    (* read system time *)
    tx := T_PLC_MS();

    IF rst THEN
    	Y := RST_val;
    	state := 0;
    ELSIF set THEN
    	Y := SET_val;
    	state := 0;
    ELSIF state > 0 THEN
    	(* key has been pushed state machine operating *)
    	(* first read the correct input *)
    	CASE state OF
    		1 :	(* slow up *)
    			in := su;
    		2 :	(* slow down *)
    			in := sd;
    		3 :	(* fast up *)
    			in := fu;
    		4 :	(* fast down *)
    			in := fd;
    	END_CASE;
    	(* check for single step operation *)
    	IF NOT in AND tx - start <= TIME_TO_DWORD(TR) THEN
    		Y := Y_start + step;
    		state := 0;
    	(* check if ramp needs to be generated *)
    	ELSIF in AND tx - start >= TIME_TO_DWORD(TR) THEN
    		Y := Y_start + DWORD_TO_REAL(tx - start - TIME_TO_DWORD(TR)) * speed;
    	ELSIF NOT in THEN
    		state := 0;
    	END_IF;
    ELSIF su THEN
    	(* slow step up *)
    	state := 1;
    	start := tx;
    	step := ss;
    	speed := s1 * 1.0E-3;
    	Y_start := Y;
    ELSIF sd THEN
    	(* slow step down *)
    	state := 2;
    	start := tx;
    	step := -ss;
    	speed := -s1 * 1.0E-3;
    	Y_start := Y;
    ELSIF fu THEN
    	(* fast step up *)
    	state := 3;
    	start := tx;
    	step := fs;
    	speed := s2 * 1.0E-3;
    	y_start := Y;
    ELSIF fd THEN
    	(* fast step down *)
    	state := 4;
    	start := tx;
    	step := -fs;
    	speed := -s2 * 1.0E-3;
    	y_start := Y;
    END_IF;

    (* make sure output does not exceed limits *)
    Y := LIMIT(LIMIT_L, Y, LIMIT_H);

    (* revision history
    hm	3.11.2007		rev 1.0
    	original version

    hm	16. 3. 2008	rev 1.1
    	added type conversions to avoid warnings in codesys 3.0
    	improved performance

    hm	11. mar. 2009	rev 1.2
    	real constants updated to new systax using dot																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																											

    *)
END_FUNCTION_BLOCK
