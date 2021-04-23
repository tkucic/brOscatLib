FUNCTION BIT_TOGGLE_B
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=214*)
    BIT_TOGGLE_B := SHL(BYTE#1, POS) XOR IN;




    (* revision history
    hm	18. oct. 2008	rev 1.0
    	origINal version


    *)

END_FUNCTION
