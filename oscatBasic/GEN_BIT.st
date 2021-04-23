FUNCTION_BLOCK GEN_BIT
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=196*)
    (* check if number of RUNs is finished or REP = 0 which means continuous *)

    IF CLK AND NOT RST THEN
    	RUN := (REP = 0) OR (rx <= REP);
    	IF RUN THEN
    		(* check for step counter reached and reset to 0 if CNT = STEPS *)
    		IF CNT = STEPS THEN
    			CNT := 0;
    		END_IF

    		(* when CNT = 0 then reload the inputs into the registers *)
    		IF CNT = 0 THEN
    			r0 := IN0;
    			r1 := IN1;
    			r2 := IN2;
    			r3 := IN3;
    		END_IF

    		(* when CNT < STEPS, shift the lowest bits to the outputs *)
    		IF (CNT < STEPS) THEN
    			Q0 := r0.0;
    			Q1 := r1.0;
    			Q2 := r2.0;
    			Q3 := r3.0;
    			r0 := SHR(r0,1);
    			r1 := SHR(r1,1);
    			r2 := SHR(r2,1);
    			r3 := SHR(r3,1);
    		END_IF

    		(* increment the step counter *)
    		CNT := CNT +1;
    		IF (CNT = STEPS) AND (REP <> 0) THEN rx := rx +1; END_IF
    		IF (rx > REP) AND (REP <> 0) THEN RUN := FALSE; END_IF
    	END_IF
    ELSE
    	IF RST THEN
    		RUN := FALSE;
    		Q0 := FALSE;
    		Q1 := FALSE;
    		Q2 := FALSE;
    		Q3 := FALSE;
    		r0 := 0;
    		r1 := 0;
    		r2 := 0;
    		r3 := 0;
    		CNT := 0;
    		rx := 1;
    	END_IF
    END_IF



    (* revision histroy
    hm	4 aug 2006	rev 1.0
    	original version

    hm 15. oct. 2008	rev 1.1
    	improved performance

    hm	14. mar. 2009	rev 1.2
    	removed double assignments

    *)
END_FUNCTION_BLOCK
