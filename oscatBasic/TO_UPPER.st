FUNCTION TO_UPPER
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=180*)
    byteAsInt := BYTE_TO_USINT(IN);
    IF byteAsInt > 96 AND byteAsInt < 123 THEN
       TO_UPPER := IN AND 16#DF;
    ELSIF byteAsInt > 223 AND byteAsInt <> 247 AND byteAsInt <> 255 AND cEXTENDED_ASCII THEN
       TO_UPPER := IN AND 16#DF;
    ELSE
       TO_UPPER := IN;
    END_IF




    (* revision history
    hm	6. mar. 2008	rev 1.0
    	original version

    hm	19. oct. 2008	rev 1.1
    	changed setup constants

    ks	25. oct. 2008	rev 1.2
    	optimized code

    hm 16. jan 2009	rev 1.3
    	corrected an error IN module

    *)
END_FUNCTION
