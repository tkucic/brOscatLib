FUNCTION RDM2
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=62*)
    RDM2 := DINT_TO_INT(TRUNC(RDM(FRACT(LAST * cPI)) * (HIGH - LOW + 1)) + LOW);

    (* revision history
    hm		29. feb 2008		rev 1.0
    	original version

    hm		18. oct. 2008		rev 1.1
    	using math constants

    *)
END_FUNCTION
