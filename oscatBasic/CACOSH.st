FUNCTION CACOSH
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=84*)
    Y.re := (X.re - X.im)*(X.re + X.im) - 1.0;
    Y.im := 2.0 * X.re * X.im;
    CSQRT(Y, Y);
    Y.re := Y.re + X.re;
    Y.im := Y.im + X.im;
    CLOG(Y, RETVAL);
    CACOSH  := TRUE;


    (* revision history
    hm	21. feb 2008	rev 1.0
    	original version


    *)
END_FUNCTION
