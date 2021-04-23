FUNCTION RANGE_TO_BYTE
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=288*)
    RANGE_TO_BYTE := INT_TO_BYTE(DINT_TO_INT(TRUNC((LIMIT(low, X, high) - low) * 255.0 / (high - low))));


    (* revision history
    hm	9. jan 2008		rev 1.0
    	original version

    *)

END_FUNCTION
