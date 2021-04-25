FUNCTION CEXP
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=88*)
    Temp := EXP(X.re);
    RETVAL.re := Temp * COS(X.im);
    RETVAL.im := Temp * SIN(X.im);
    CEXP:=TRUE;

    (* revision history
    hm	21. feb 2008	rev 1.0
    	original version

    *)
END_FUNCTION
