FUNCTION BYTE_TO_GRAY
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=217*)
    BYTE_TO_GRAY := IN XOR SHR(IN,1);

    (* revision history
    hm	9. nov. 2009	rev 1.0
    	origINal version

    *)
END_FUNCTION
