FUNCTION CDIV
    temp := Y.re * Y.re + Y.im * Y.im;
    CDIV.re := (X.re * Y.re + X.im * Y.im) / temp;
    CDIV.im := (X.im * Y.re - X.re * Y.im) / temp;

    (* revision history
    hm	21. feb 2008	rev 1.0
    	original version

    *)
END_FUNCTION