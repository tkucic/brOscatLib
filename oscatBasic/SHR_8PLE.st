FUNCTION_BLOCK SHR_8PLE
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=251*)
    (* flankenerkennung CLK wird high und EDGE_ war high reset ist nicht aktiv und set ist nicht aktiv *)
    IF CLK AND EDGE_ AND NOT RST THEN
    	EDGE_ := FALSE;	(* flanke wurde erkannt und weitere flankenerkennung wird verhindert bis EDGE_ wieder true ist *)
    	(* hier ist der code für das flankenevent *)
    	IF UP THEN						(*shift UP *)
    		register := SHL(register,1);
    		register.0 := Din;
    		Dout := register.7;
    	ELSE								(* shift down *);
    		register := SHR(register,1);
    		register.7 := Din;
    		Dout := register.0;
    	END_IF
    	IF LOAD THEN							(* the byte on Din will be LOADed if LOAD = true *)
    		register := DLOAD;
    		IF UP THEN Dout := register.7; ELSE Dout := register.0; END_IF
    	END_IF
    END_IF
    IF NOT CLK THEN EDGE_ := TRUE; END_IF	(* sobald CLK wieder low wird warten auf nächste flanke *)
    IF RST THEN									(* wenn reset aktiv dann ausgang rücksetzen *)
    	register := 0;
    	Dout := FALSE;
    END_IF

END_FUNCTION_BLOCK
