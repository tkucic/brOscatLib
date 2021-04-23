FUNCTION BAND_B
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=377*)
    IF X < B THEN
    	BAND_B := 0;
    ELSIF X > BYTE#255-B THEN
    	BAND_B := 255;
    ELSE
    	BAND_B := X;
    END_IF



    (* revision history
    hm	21. nov. 2008	rev 1.0
    	original version

    *)

END_FUNCTION
