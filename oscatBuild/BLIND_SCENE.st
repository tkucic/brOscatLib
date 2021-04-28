FUNCTION_BLOCK BLIND_SCENE
    (*http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=87*)
    (* delete all bits except the lower 4 of SCENE *)
    x := BYTE_TO_USINT(SCENE AND 16#0F);

    IF ENABLE AND sx[x,2] > 0 AND UP AND DN THEN
    	PO := sx[x,0];
    	AO := sx[x,1];
    	STATUS := USINT_TO_BYTE(160 + x);  (* STATUS number is 160 to 175 for the 16 scenes *)
    	QU := TRUE;
    	QD := TRUE;
    ELSE
    	QU := UP;
    	QD := DN;
    	STATUS := S_IN;
    	PO := PI;
    	AO := AI;
    END_IF

    (* write SCENE if necessary *)
    IF SWRITE THEN
    	STATUS := 176;		(* write SCENE *)
    	sx[x,0] := PI;
    	sx[x,1] := AI;
    	IF ENABLE THEN sx[x,2] := 1; ELSE sx[x,2] := 0; END_IF (* if sx[x,2] = 0 the SCENE is disabled *)
    END_IF


    (* revision history
    hm	24. oct 2007	rev 1.0
    	original release

    hm		29.1.2008	rev 1.1
    	replaced shr/shl with and for better performance
    *)


END_FUNCTION_BLOCK
