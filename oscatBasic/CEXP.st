FUNCTION CEXP
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=88*)
    temp := EXP(X.re);
    CEXP.re := temp * COS(X.im);
    CEXP.im := temp * SIN(X.im);


    (* revision history
    hm	21. feb 2008	rev 1.0
    	original version

    *)
END_FUNCTION
