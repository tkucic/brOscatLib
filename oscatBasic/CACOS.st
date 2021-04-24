FUNCTION CACOS
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=83*)
    Y := CACOSH(X);
    CACOS.re := Y.im;
    CACOS.im := -Y.re;



    (* revision history
    hm	21. feb 2008	rev 1.0
    	original version


    *)
END_FUNCTION
