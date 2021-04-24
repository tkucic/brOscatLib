FUNCTION CHECK_PARITY
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=217*)
    CHECK_PARITY := NOT P;
    WHILE IN > 0 DO
    	CHECK_PARITY := CHECK_PARITY XOR IN.0 XOR IN.1 XOR IN.2 XOR IN.3;
    	IN := SHR(IN,4);
    END_WHILE

    (* code before rev 1.2
    WHILE IN > 0 DO
    	IF IN.0 THEN cnt := cnt + 1; END_IF
    	IN := SHR(IN,1);
    END_WHILE
    CHECK_PARITY := even(cnt) XOR P;
    *)


    (* revision history

    rev 1.0 HM  1.oct.2006

    rev 1.1 hm	10.sep.2007
    	changed algorithm to improove performance

    rev 1.2	hm	8 dec 2007
    	changed algorithm to improove performance

    rev 1.3 hm	18. feb 2008
    	changed algorithm to improove performance
    *)
END_FUNCTION
