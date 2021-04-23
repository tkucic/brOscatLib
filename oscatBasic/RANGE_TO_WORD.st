FUNCTION RANGE_TO_WORD
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=288*)
    RANGE_TO_WORD := DINT_TO_WORD(TRUNC((LIMIT(LOW,X,HIGH)-LOW) * 65535.0 / (HIGH - LOW)));


    (* revision history
    hm	9. jan 2008		rev 1.0
    	original version

    *)

END_FUNCTION
