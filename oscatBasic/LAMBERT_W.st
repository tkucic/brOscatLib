FUNCTION LAMBERT_W
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=58*)
    (* check for valid input and return -1000 if too low *)
    IF X < -0.367879441171442 THEN
    	LAMBERT_W := -1000.0;
    	RETURN;
    (* return 0 if X = 0 *)
    ELSIF X = 0.0 THEN
    	RETURN;
    (* first an estimate is calculated *)
    ELSIF X <= 500.0 THEN
    	w := LN(X + 1.0);
    	w := 0.665 * (1.0 + 0.0195 * w) * w + 0.04;
    ELSE
    	w := LN(X - 4.0) - (1.0 - 1.0/LN(X)) * LN(LN(X));
    END_IF
    (* use estimate to calculate exact result *)
    FOR i := 0 TO 5 DO
    	ewx := EXP(w);
    	we := w * ewx - X;
    	w1e := (w+1.0) * ewx;
    	last := REAL_TO_DWORD(w) AND 16#FFFF_FFFC;
    	w := w - (we / (w1e - (w+2.0) * we / (2.0 * w + 2.0)));
    	IF (REAL_TO_DWORD(w) AND 16#FFFF_FFFC) = last THEN EXIT; END_IF
    END_FOR
    LAMBERT_W := w;


    (* revision hisdtory
    hm	26. oct. 2008	rev 1.0
    	original version

    hm	10. mar. 2009	rev 1.1
    	real constants updated to new systax using dot

    *)
END_FUNCTION
