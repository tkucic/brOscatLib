FUNCTION CSINH
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=90*)
    RETVAL.re := SINH(X.re) * COS(X.im);
    RETVAL.im := COSH(X.re) * SIN(X.im);
    CSINH:=TRUE;

    (* revision history
    hm	21. feb 2008	rev 1.0
    	original version

    *)
END_FUNCTION
