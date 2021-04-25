FUNCTION CDIV
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=87*)
    Temp := Y.re * Y.re + Y.im * Y.im;
    RETVAL.re := (X.re * Y.re + X.im * Y.im) / Temp;
    RETVAL.im := (X.im * Y.re - X.re * Y.im) / Temp;
    CDIV := TRUE;
    (* revision history
    hm	21. feb 2008	rev 1.0
    	original version

    *)
END_FUNCTION
