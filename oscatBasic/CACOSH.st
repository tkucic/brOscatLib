FUNCTION CACOSH
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=84*)
    y.re := (X.re - X.im)*(X.re + X.im) - 1.0;
    y.im := 2.0 * X.re * X.im;
    y    := CSQRT(y);
    y.re := y.re + x.re;
    y.im := y.im + x.im;
    CACOSH  := CLOG(y);



    (* revision history
    hm	21. feb 2008	rev 1.0
    	original version


    *)
END_FUNCTION
