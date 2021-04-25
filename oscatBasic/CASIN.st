FUNCTION CASIN
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=85*)
    Y.re := -X.im;
    Y.im := X.re;
    CASINH(Y, Y);
    RETVAL.re := Y.im;
    RETVAL.im := -Y.re;
    CASIN := TRUE;


    (* revision history
    hm	21. feb 2008	rev 1.0
    	original version


    *)
END_FUNCTION
