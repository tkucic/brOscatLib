FUNCTION HEX_TO_DWORD
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=165*)
    pt ACCESS ADR(HEX);
    stop := LEN(HEX);
    FOR i := 1 TO stop DO
    	(* read the first character and subtract 48 to get value in decimal 0 = 48 *)
    	X := pt;
        intX := BYTE_TO_USINT(X);
    	(* calculate the value of the digit *)
    	IF intX > 47 AND intX < 58 THEN
    		HEX_TO_DWORD := UDINT_TO_DWORD(DWORD_TO_UDINT(SHL(HEX_TO_DWORD,4)) + intX - 48);
    	ELSIF intX > 64 AND intX < 71 THEN
    		HEX_TO_DWORD := UDINT_TO_DWORD(DWORD_TO_UDINT(SHL(HEX_TO_DWORD,4)) + intX - 55);
    	ELSIF intX > 96 AND intX < 103 THEN
    		HEX_TO_DWORD := UDINT_TO_DWORD(DWORD_TO_UDINT(SHL(HEX_TO_DWORD,4)) + intX - 87);
    	END_IF
    	pt ACCESS (ADR(pt) + 1);
    END_FOR



    (* revision histroy
    hm	2.10.2007		rev 1.0
    	original release

    hm	19.11.2007		rev 1.1
    	changed type of function from int to dword

    hm 	4. mar 2008		rev 1.2
    	added support for a..f and return 0 for invalid string

    hm	29. mar. 2008	rev 1.3
    	changed STRING to STRING(8)

    hm	18. jun. 2008	rev 1.4
    	changed input HEX to STRING(20)
    	function now ignores wrong characters
    *)	

END_FUNCTION
