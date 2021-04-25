FUNCTION CCOSH
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=87*)
    RETVAL.re := COSH(X.re) * COS(X.im);
    RETVAL.im := SINH(X.re) * SIN(X.im);
    CCOSH := TRUE;

    (* revision history
    hm	21. feb 2008	rev 1.0
    	original version

    *)
END_FUNCTION
