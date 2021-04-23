FUNCTION_BLOCK BLIND_CONTROL
    (*http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=75*)
    IF bTimeTest THEN
    	PI:=iPOS;
    	AI:=iANGel;
    	UP:=TRUE;
    	DN:=TRUE;
    END_IF

    (* Check POSition*)
    act(T_UD:=T_UD, T_ANGLE:=T_ANGLE, T_LOCKOUT := T_Lockout);

    IF UP AND DN THEN
    	(* automatic modus detected *)
    	(* first find correct POSition *)
    	IF BYTE_TO_INT(act.POS) < BYTE_TO_INT(PI) - delta THEN
    		act.UP := TRUE;
    		act.DN := FALSE;
    		delta := 0;
    		STATUS := 121;
    	ELSIF BYTE_TO_INT(act.POS) > BYTE_TO_INT(PI) + delta THEN
    		act.UP := FALSE;
    		act.DN := TRUE;
    		delta := 0;
    		STATUS := 122;
    	(* regulate ANGle *)
    	ELSIF BYTE_TO_INT(act.ANG) < BYTE_TO_INT(AI) - delta AND T_ANGLE > T#100ms THEN
    		act.UP := TRUE;
    		act.DN := FALSE;
    		delta := SENS/2;
    		STATUS := 123;
    	ELSIF BYTE_TO_INT(act.ANG) > BYTE_TO_INT(AI) + delta AND T_ANGLE > T#100ms THEN
    		act.UP := FALSE;
    		act.DN := TRUE;
    		delta := SENS/2;
    		STATUS := 124;
    	(* correct POSition reached *)
    	ELSE
    		act.UP := FALSE;
    		act.DN := FALSE;
    		delta := SENS;
    		STATUS := S_IN;
    	END_IF
    ELSE
    	act.UP := UP;
    	act.DN := DN;
    	STATUS := S_IN;
    END_IF

    (* blind control calls blind_actuator *)
    act(T_UD:=T_UD, T_ANGLE:=T_ANGLE, T_LOCKOUT := T_Lockout);
    POS := act.POS;
    ANG := act.ANG;
    MU := act.QU;
    MD := act.QD;
    STATUS := act.STATUS;

    (* revision history
    hm	29. sep 2007	rev 1.0
    	original release

    hm	6. oct 2007	rev 1.1
    	rearrANGed outputs
    	integrated blind_actuator into blind_control

    hm	16. oct 2007	rev 1.2
    	ignore ANGle when T_ANGLE = 0

    hm 29. oct 2007	rev 1.3
    	added lockout configuration time for motor direction chANGe
    	SENS has a setUP value of 5

    hm	27. jul. 2009	rev 1.4
    	chANGed STATUS handling

    ae	08. mar. 2010	rev 1.5
    	at aPOSition bevor control
    	at tolerance "delta := SENS/2;"

    *)
END_FUNCTION_BLOCK
