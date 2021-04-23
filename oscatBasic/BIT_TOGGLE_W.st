FUNCTION BIT_TOGGLE_W
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=215*)
    BIT_TOGGLE_W := SHL(WORD#1, POS) XOR IN;



    (* revision history
    hm	18. oct. 2008	rev 1.0
    	original version


    *)

END_FUNCTION
