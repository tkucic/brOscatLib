FUNCTION CATANH
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=86*)
    i2 := x.im * x.im;
    num := 1.0 + x.re;
    num := i2 + num * num;
    den := 1.0 - x.re;
    den := i2 + den * den;
    CATANH.re := 0.25 * (LN(num) - LN(den));
    den := 1 - x.re * x.re - i2;
    CATANH.im := 0.5 * ATAN(2.0 * x.im / den);

    (* revision history
    hm	21. feb 2008	rev 1.0
    	original version


    *)
END_FUNCTION
