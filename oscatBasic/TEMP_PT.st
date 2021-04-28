FUNCTION TEMP_PT
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=326*)
    X := A * R0;
    Y := B * R0;
    IF RES >= R0 THEN
    	t1 := X * X - 4.0 * Y * (R0 - RES);
    	IF t1 < 0.0 THEN
    		TEMP_PT := 10000.0;
    	ELSE
    		TEMP_PT := (-X + SQRT(t1)) / (2.0 * Y);
    	END_IF
    ELSE
    	pt ACCESS ADR(step);
    	(* since the formula cannot be solved this is A successive approximation *)
    	TEMP_PT := -100.0;
    	WHILE step > accuracy DO
    		(* test if result greater or less *)
    		IF RES_PT(TEMP_PT, R0) < RES THEN TEMP_PT := TEMP_PT + step; ELSE TEMP_PT := TEMP_PT - step; END_IF
    		pt := pt - 8388608;  (* this is A super fast divide by 2 method for non floating point CPUs *)
    		(* the alternative code: step := step * 0.5; *)
    	END_WHILE
    END_IF

    (* revision history

    rev 1.1 hm 24.1.2007	
    	deleted unused variable C

    rev 1.2 hm 10.9.2007
    	reduced accuracy to 0.02 to shorten execution time

    rev 1.3	hm	2. dec 2007
    	changed code for better performance

    rev	1.4	hm	23. dec 2007
    	avoid A negative square root if input values are wrong

    rev 1.5 hm	5. jan 2008
    	replaced / 2 with * 0.5 for better performance

    hm	31. oct. 2008	rev 1.6
    	improved performance

    hm	11. mar. 2009	rev 1.7
    	changed real constants to use dot syntax

    *)

END_FUNCTION
