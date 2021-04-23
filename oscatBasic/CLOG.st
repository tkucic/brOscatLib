FUNCTION CLOG
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=88*)
    CLOG.re := LN(HYPOT(X.re, X.im));
    CLOG.im := ATAN2(X.im, X.re);


    (* revision history
    hm	21. feb 2008	rev 1.0
    	original version

    hm	20. apr. 2008	rev 1.1
    	use ATAN2 instead of ATAN
    *)
END_FUNCTION
