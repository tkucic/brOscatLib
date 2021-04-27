FUNCTION TO_LOWER
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=179*)
    byteAsInt := BYTE_TO_USINT(IN);
    IF byteAsInt > 64 AND byteAsInt < 91 THEN
       TO_LOWER := IN OR 16#20;
    ELSIF (byteAsInt > 191 AND byteAsInt < 223) AND byteAsInt <> 215 AND cEXTENDED_ASCII THEN
       TO_LOWER := IN OR 16#20;
    ELSE
       TO_LOWER := IN;
    END_IF


    (* revision history
    hm	6. mar. 2008	rev 1.0
    	original version

    hm	19. oct. 2008	rev 1.1
    	changed setup constants

    ks	25. oct. 2008	rev 1.2
    	optimized code
    *)
END_FUNCTION
