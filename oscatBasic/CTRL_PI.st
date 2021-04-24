FUNCTION_BLOCK CTRL_PI
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=382*)
    DIFF := CTRL_IN(SET, ACT, SUP);
    pi(in := DIFF, KP := KP, KI := KI, lim_l := LL, lim_h := LH, RST := RST);
    co(ci := pi.Y, OFFSET := OFS, man_in := M_I, lim_l := LL, lim_h := LH, MANUAL := MAN);
    Y := co.Y;
    LIM := co.LIM;


    (* revision history
    hm 	31.10.2007 		rev 1.0
    	original version

    hm	3.11.2007		rev 1.1
    	added noise input to filter noise
    	added output DIFF
    	SET limit output false when output is within limits
    	overfolw was not SET correctly

    hm	5. jan 2008		rev 1.2
    	improved performance

    hm	20. jun. 2008	rev 2.0
    	rewritten using new modular approach

    *)
END_FUNCTION_BLOCK
