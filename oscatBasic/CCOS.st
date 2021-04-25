FUNCTION CCOS
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=87*)
    CSET(-X.im, X.re, temp);
    CCOSH(temp,RETVAL);
    CCOS := TRUE;

    (* revision history
    hm	21. feb 2008	rev 1.0
    	original version

    *)
END_FUNCTION
