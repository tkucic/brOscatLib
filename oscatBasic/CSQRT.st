FUNCTION CSQRT
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=91*)
    temp := HYPOT(x.re, x.im);
    CSQRT.re :=  SQRT(0.5 * (temp + x.re));
    CSQRT.im :=  sgn(x.im) * SQRT(0.5 * (temp - x.re));


    (* revision history
    hm	21. feb 2008	rev 1.0
    	original version

    *)
END_FUNCTION
