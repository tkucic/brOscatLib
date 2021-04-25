FUNCTION HEX_TO_DWORD
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=165*)
    pt := ADR(HEX);
    stop := LEN(HEX);
    FOR i := 1 TO stop DO
    	(* read the first character and subtract 48 to get value in decimal 0 = 48 *)
    	X := pt;
    	(* calculate the value of the digit *)
    	IF X > 47 AND X < 58 THEN
    		HEX_TO_DWORD := SHL(HEX_TO_DWORD,4) + X - 48;
    	ELSIF X > 64 AND X < 71 THEN
    		HEX_TO_DWORD := SHL(HEX_TO_DWORD,4) + X - 55;
    	ELSIF X > 96 AND X < 103 THEN
    		HEX_TO_DWORD := SHL(HEX_TO_DWORD,4) + X - 87;
    	END_IF
    	pt := pt + 1;
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
