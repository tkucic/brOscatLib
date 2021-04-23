FUNCTION CMUL
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=89*)
    CMUL.re := X.re * Y.re - X.im * Y.im;
    CMUL.im := X.re * Y.im + X.im * Y.re;

    (* revision history
    hm	21. feb 2008	rev 1.0
    	original version

    *)
END_FUNCTION
