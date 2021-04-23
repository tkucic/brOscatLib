FUNCTION CSIN
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=90*)
    CSIN.re := cosH(X.im) * SIN(X.re);
    CSIN.im := sinH(X.im) * COS(X.re);


    (* revision history
    hm	21. feb 2008	rev 1.0
    	original version

    *)
END_FUNCTION
