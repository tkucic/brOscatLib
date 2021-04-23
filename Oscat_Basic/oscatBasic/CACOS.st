FUNCTION CACOS
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=83*)
    y := CACOSH(x);
    CACOS.re := y.im;
    CACOS.im := -y.re;



    (* revision history
    hm	21. feb 2008	rev 1.0
    	original version


    *)
END_FUNCTION
