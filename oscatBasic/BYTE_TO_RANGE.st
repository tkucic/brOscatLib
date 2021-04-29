FUNCTION BYTE_TO_RANGE
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=273*)
    BYTE_TO_RANGE := (HIGH - LOW) * BYTE_TO_SINT(X) / 255.0 + LOW;


    (* revision history
    hm	9. jan 2008		rev 1.0
    	original version

    *)

END_FUNCTION
