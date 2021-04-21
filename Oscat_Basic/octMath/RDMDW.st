FUNCTION RDMDW
    M := BIT_COUNT(last);
    RX := RDM(FRACT(M * PI));
    RDMDW := SHL(REAL_TO_DWORD(RX*65535),16);
    RX := RDM(FRACT(M * E));
    RDMDW := RDMDW OR (REAL_TO_DWORD(RX*65535) AND 16#0000FFFF);



    (* revision history
    hm		14. mar 2008		rev 1.0
    	original version

    hm		18. may. 2008		rev 1.1
    	changed constant E to E1

    hm		18. oct. 2008		rev 1.2
    	using math constants

    *)
END_FUNCTION
