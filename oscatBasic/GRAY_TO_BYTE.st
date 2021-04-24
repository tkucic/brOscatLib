FUNCTION GRAY_TO_BYTE
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=226*)
    GRAY_TO_BYTE := SHR(IN,4) XOR IN;
    GRAY_TO_BYTE := SHR(GRAY_TO_BYTE,2) XOR GRAY_TO_BYTE;
    GRAY_TO_BYTE := SHR(GRAY_TO_BYTE,1) XOR GRAY_TO_BYTE;

    (* revision history
    hm	9. nov. 2009	rev 1.0
    	original version

    *)
END_FUNCTION
