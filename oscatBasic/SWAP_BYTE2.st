FUNCTION SWAP_BYTE2
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=234*)
    SWAP_BYTE2 := (ROR(IN,8) AND 16#FF00FF00) OR (ROL(IN,8) AND 16#00FF00FF);

    (* revision history
    hm		4. feb 2008	rev 1.0
    	original version

    *)

END_FUNCTION
