FUNCTION CASIN
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=85*)
    y.re := -x.im;
    y.im := x.re;
    y := CASINH(y);
    CASIN.re := y.im;
    CASIN.im := -y.re;



    (* revision history
    hm	21. feb 2008	rev 1.0
    	original version


    *)
END_FUNCTION
