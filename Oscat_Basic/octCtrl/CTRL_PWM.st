FUNCTION_BLOCK CTRL_PWM
    PW(F := F, DC := SEL(MANUAL,CI,MAN_IN));
    Q := PW.Q;


    (* revision history
    hm 3. jun. 2008 	rev 1.0
    	original version

    hm	21. oct. 2008	rev 1.1
    	optimized code

    *)
END_FUNCTION_BLOCK