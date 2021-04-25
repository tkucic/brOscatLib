FUNCTION CATANH
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=86*)
    i2 := X.im * X.im;
    num := 1.0 + X.re;
    num := i2 + num * num;
    den := 1.0 - X.re;
    den := i2 + den * den;
    RETVAL.re := 0.25 * (LN(num) - LN(den));
    den := 1 - X.re * X.re - i2;
    RETVAL.im := 0.5 * ATAN(2.0 * X.im / den);
    CATANH:=TRUE;
    (* revision history
    hm	21. feb 2008	rev 1.0
    	original version


    *)
END_FUNCTION
