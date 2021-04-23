FUNCTION CINV
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=88*)
    temp := X.re * X.re + X.im * X.im;
    CINV.re := X.re / temp;
    CINV.im := -X.im / temp;

    (* revision history
    hm	21. feb 2008	rev 1.0
    	original version

    *)
END_FUNCTION