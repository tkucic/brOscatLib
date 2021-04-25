FUNCTION CSIN
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=90*)
    RETVAL.re := COSH(X.im) * SIN(X.re);
    RETVAL.im := SINH(X.im) * COS(X.re);
    CSIN:=TRUE;

    (* revision history
    hm	21. feb 2008	rev 1.0
    	original version

    *)
END_FUNCTION
