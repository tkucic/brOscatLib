FUNCTION CATAN
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=86*)
    r2 := X.re * X.re;
    den := 1.0 - r2 - X.im * X.im;
    RETVAL.re := 0.5 * ATAN(2.0 * X.re / den);
    num := X.im + 1.0;
    num := r2 + num * num;
    den := X.im - 1.0;
    den := r2 + den * den;
    RETVAL.im := 0.25 * (LN(num)-LN(den));
    CATAN:=TRUE;
    (* revision history
    hm	21. feb 2008	rev 1.0
    	original version


    *)
END_FUNCTION
