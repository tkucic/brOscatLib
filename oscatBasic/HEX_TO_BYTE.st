FUNCTION HEX_TO_BYTE
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=164*)
    pt ACCESS ADR(HEX);
    stop := LEN(HEX);
    FOR i := 1 TO stop DO
    	(* read the first character and subtract 48 to get value in decimal 0 = 48 *)
    	X := pt;
        intX := BYTE_TO_USINT(X);
    	(* calculate the value of the digit *)
    	IF intX > 47 AND intX < 58 THEN
    		HEX_TO_BYTE := USINT_TO_BYTE(BYTE_TO_USINT(SHL(HEX_TO_BYTE,4)) + intX - 48);
    	ELSIF intX > 64 AND intX < 71 THEN
    		HEX_TO_BYTE := USINT_TO_BYTE(BYTE_TO_USINT(SHL(HEX_TO_BYTE,4)) + intX - 55);
    	ELSIF intX > 96 AND intX < 103 THEN
    		HEX_TO_BYTE := USINT_TO_BYTE(BYTE_TO_USINT(SHL(HEX_TO_BYTE,4)) + intX - 87);
    	END_IF
    	pt ACCESS (ADR(pt) + 1);
    END_FOR




    (* revision histroy
    hm	18. jun. 2008	rev 1.0
    	original release

    hm	20. sep.2008	rev 1.1
    	changed length of input string from 20 to 5

    *)	

END_FUNCTION
