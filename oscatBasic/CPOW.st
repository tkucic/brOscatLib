FUNCTION CPOW
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=89*)
    CLOG(X,temp);
    CMUL(Y,temp, temp2);
    CEXP(temp2, RETVAL);
    CPOW := TRUE;

    (* revision history
    hm	21. feb 2008	rev 1.0
    	original version

    *)
END_FUNCTION
