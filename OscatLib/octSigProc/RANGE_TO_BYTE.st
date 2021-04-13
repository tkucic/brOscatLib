FUNCTION RANGE_TO_BYTE
    RANGE_TO_BYTE := INT_TO_BYTE(TRUNC_INT((LIMIT(low, X, high) - low) * 255.0 / (high - low)));


    (* revision history
    hm	9. jan 2008		rev 1.0
    	original version

    *)

END_FUNCTION