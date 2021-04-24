FUNCTION PARITY
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=230*)
    WHILE IN > 0 DO
    	PARITY := PARITY XOR IN.0 XOR IN.1 XOR IN.2 XOR IN.3;
    	IN := SHR(IN,4);
    END_WHILE

    (* code before rev 1.2
    WHILE IN > 0 DO
    	IF IN.0 THEN cnt := cnt +1; END_IF
    	IN := SHR(IN,1);
    END_WHILE
    IF (cnt MOD 2) = 1 THEN PARITY := TRUE; ELSE PARITY := FALSE; END_IF
    *)

    (* revision history

    rev 1.0 hm 1 sep 2006
    	original version

    rev 1.1 hm 10.9.2007
    	changed algorithm to improve performance

    rev 1.2	hm	8 dec 2007
    	changed algorithm to improve performance

    rev 1.3	hm	18 feb 2008
    	changed algorithm to improve performance
    *)
END_FUNCTION
