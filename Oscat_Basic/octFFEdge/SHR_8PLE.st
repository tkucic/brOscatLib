FUNCTION_BLOCK SHR_8PLE
    (* flankenerkennung CLK wird high und edge war high reset ist nicht aktiv und set ist nicht aktiv *)
    IF CLK AND edge_ AND NOT RST THEN
    	edge_ := FALSE;	(* flanke wurde erkannt und weitere flankenerkennung wird verhindert bis edge wieder true ist *)
    	(* hier ist der code für das flankenevent *)
    	IF UP THEN						(*shift up *)
    		register := SHL(register,1);
    		register.0 := Din;
    		DOut := register.7;
    	ELSE								(* shift down *);
    		register := SHR(register,1);
    		register.7 := Din;
    		DOut := register.0;
    	END_IF
    	IF load THEN							(* the byte on Din will be loaded if load = true *)
    		register := Dload;
    		IF UP THEN DOut := register.7; ELSE DOut := register.0; END_IF
    	END_IF
    END_IF
    IF NOT CLK THEN edge_ := TRUE; END_IF	(* sobald CLK wieder low wird warten auf nächste flanke *)
    IF RST THEN									(* wenn reset aktiv dann ausgang rücksetzen *)
    	register := 0;
    	DOut := FALSE;
    END_IF

END_FUNCTION_BLOCK
