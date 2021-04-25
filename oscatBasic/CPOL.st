FUNCTION CPOL
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=89*)
    RETVAL.re := L * COS(A);
    RETVAL.im := L * SIN(A);
    CPOL:=TRUE;

    (* revision history
    hm	21. feb 2008	rev 1.0
    	original version

    *)
END_FUNCTION
