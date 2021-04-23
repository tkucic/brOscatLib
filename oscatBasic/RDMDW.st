FUNCTION RDMDW
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=63*)
    M := BIT_COUNT(LAST);
    RX := RDM(FRACT(M * math.PI));
    RDMDW := SHL(REAL_TO_DWORD(rx*65535),16);
    RX := RDM(FRACT(M * math.E));
    RDMDW := RDMDW OR (REAL_TO_DWORD(rx*65535) AND 16#0000FFFF);



    (* revision history
    hm		14. mar 2008		rev 1.0
    	original version

    hm		18. may. 2008		rev 1.1
    	changed constant E to E1

    hm		18. oct. 2008		rev 1.2
    	using math constants

    *)
END_FUNCTION
