FUNCTION DEC_TO_BYTE
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=150*)
    pt ACCESS ADR(DEC);
    stop := LEN(DEC);
    FOR i := 1 TO stop DO
    	(* read the first character and subtract 48 to get value in decimal 0 = 48 *)
    	X := pt;
        intX := BYTE_TO_USINT(X);
    	(* calculate the value of the digit *)
    	IF intX > 47 AND intX < 58 THEN
    		DEC_TO_BYTE := USINT_TO_BYTE(BYTE_TO_USINT(DEC_TO_BYTE) * 10 + intX - 48);
    	END_IF
    	pt ACCESS (ADR(pt) + 1);
    END_FOR



    (* revision histroy
    hm	20. jun. 2008	rev 1.0
    	original release

    hm	30. sep.2008	rev 1.1
    	changed length of input string from 20 to 10
    	corrected an error where decoding of characters 8 and 9 would fail

    *)	

END_FUNCTION
