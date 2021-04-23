FUNCTION CCOSH
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=87*)
    CCOSH.re := cosH(x.re) * COS(x.im);
    CCOSH.im := sinH(x.re) * SIN(x.im);


    (* revision history
    hm	21. feb 2008	rev 1.0
    	original version

    *)
END_FUNCTION
