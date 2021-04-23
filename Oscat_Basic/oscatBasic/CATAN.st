FUNCTION CATAN
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=86*)
    r2 := x.re * x.re;
    den := 1.0 - r2 - x.im * x.im;
    CATAN.re := 0.5 * ATAN(2.0 * x.re / den);
    num := x.im + 1.0;
    num := r2 + num * num;
    den := x.im - 1.0;
    den := r2 + den * den;
    CATAN.im := 0.25 * (LN(num)-LN(den));

    (* revision history
    hm	21. feb 2008	rev 1.0
    	original version


    *)
END_FUNCTION
