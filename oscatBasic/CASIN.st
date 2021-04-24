FUNCTION CASIN
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=85*)
    Y.re := -X.im;
    Y.im := X.re;
    Y := CASINH(Y);
    CASIN.re := Y.im;
    CASIN.im := -Y.re;



    (* revision history
    hm	21. feb 2008	rev 1.0
    	original version


    *)
END_FUNCTION
