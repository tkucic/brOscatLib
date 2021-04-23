FUNCTION_BLOCK BLIND_ACTUATOR
    (*http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=74*)
    (* make sure only one motor is active at a given time *)
    lock(i1 := UP, I2 := DN, TL := T_lockout);

    (* ramp UP or down to simulate the ANGle POSition of the blind slats *)
    ANGle(e := lock.Q1 OR lock.Q2, UP := lock.Q1, PT := T_Angle);
    POSition(e := lock.Q1 AND ANGle.high OR lock.Q2 AND ANGle.low, UP := lock.Q1, PT := T_UD);

    (* set the outputs *)
    POS := POSition.Out;
    ANG := ANGle.Out;

    (* set the outputs *)
    QU := lock.Q1;
    QD := lock.Q2;

    (* set the STATUS output *)
    IF UP AND DN THEN
    	 STATUS := 1;			(* error UP and down together are not allowed *)
    ELSIF UP THEN
    	STATUS := 121;
    ELSIF DN THEN
    	STATUS := 122;
    ELSE
    	STATUS := S_IN;
    END_IF


    (* revision history
    hm	29. sep 2007	rev 1.0
    	original release

    hm	6. oct 2007	rev 1.1
    	rearANGed outputs

    hm	18. oct. 2008	rev 1.2
    	chANGed calls for rmp_B because of chANGe in RMP_B

    hm	27. jul. 2009	rev 1.3
    	chANGes STATUS to be 12X

    ae	08. mar. 2010 rev 1.4	
    	at aPosition

    *)
END_FUNCTION_BLOCK
