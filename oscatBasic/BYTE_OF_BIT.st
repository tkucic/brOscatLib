FUNCTION BYTE_OF_BIT
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=215*)
    Byte_of_bit := SHL(SHL(SHL(SHL(SHL(SHL(SHL(BOOL_TO_BYTE(B7),1) OR BOOL_TO_BYTE(B6),1) OR BOOL_TO_BYTE(B5),1) OR BOOL_TO_BYTE(B4),1)
    	OR BOOL_TO_BYTE(B3),1) OR BOOL_TO_BYTE(B2),1) OR BOOL_TO_BYTE(B1),1) OR BOOL_TO_BYTE(B0);


    (* revision history

    hm	4. aug 2006		rev 1.0
    	original version

    hm	18. feb. 2008	rev 1.1
    	improved performance

    *)
END_FUNCTION
