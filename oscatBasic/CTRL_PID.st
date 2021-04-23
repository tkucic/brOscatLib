FUNCTION_BLOCK CTRL_PID
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=384*)
    DIFF := CTRL_IN(SET, ACT, SUP);
    pid(in := DIFF, KP := KP, TN := TN, TV := TV, LIM_l := LL, LIM_h := LH, RST := RST);
    co(ci := pid.Y, OFFSET := OFS, MAN_in := M_I, LIM_l := LL, LIM_h := LH, MANUAL := MAN);
    Y := co.Y;
    LIM := co.LIM;



    (* revision history

    hm 1.12.2006	 	rev 1.1
    	changed algorithm to trapezregel for higher accuracy.

    hm 3.1.2007		rev 1.2
    	added integ_band to select when the integrator is ACTive.

    hm	3.3.2007		rev 1.3
    	added default values to inputs KP, TN, TV, LIMIT_L und LIMIT_H.

    hm 31.oct 2007	rev 1.4
    	total rewrite of the module to avoid failures when one of the LIMits is 0

    hm	3.11.2007	rev 1.5
    	added noise input to filter noise
    	added output DIFF
    	SET LIMit output false when output is within LIMits
    	overfolw was not SET correctly

    hm	5. jan 2008	rev 1.6
    	improved code for better perforMANce
    *)
END_FUNCTION_BLOCK
