FUNCTION RDMDW
<<<<<<< HEAD:oscatBasic/RDMDW.st
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=63*)
    M := BIT_COUNT(LAST);
    RX := RDM(FRACT(M * math.PI));
    RDMDW := SHL(REAL_TO_DWORD(rx*65535),16);
    RX := RDM(FRACT(M * math.E));
    RDMDW := RDMDW OR (REAL_TO_DWORD(rx*65535) AND 16#0000FFFF);
=======
    M := BIT_COUNT(last);
    RX := RDM(FRACT(M * PI));
    RDMDW := SHL(REAL_TO_DWORD(RX*65535),16);
    RX := RDM(FRACT(M * E));
    RDMDW := RDMDW OR (REAL_TO_DWORD(RX*65535) AND 16#0000FFFF);
>>>>>>> 800137518c97e6c8be9a9f286ec9de596d141e5a:Oscat_Basic/octMath/RDMDW.st



    (* revision history
    hm		14. mar 2008		rev 1.0
    	original version

    hm		18. may. 2008		rev 1.1
    	changed constant E to E1

    hm		18. oct. 2008		rev 1.2
    	using math constants

    *)
END_FUNCTION
