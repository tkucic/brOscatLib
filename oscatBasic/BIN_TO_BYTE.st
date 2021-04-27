FUNCTION BIN_TO_BYTE
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=145*)
    pt ACCESS ADR(BIN);
    stop := LEN(BIN);
    FOR i := 1 TO stop DO
    	X := pt;
    	(* calculate the value of the digit *)
    	IF X = BYTE#48 THEN
    		BIN_TO_BYTE := SHL(BIN_TO_BYTE,1);
    	ELSIF X = BYTE#49 THEN
    		BIN_TO_BYTE := SHL(BIN_TO_BYTE,1) OR 1;
    	END_IF
    	pt ACCESS (ADR(pt) + 1);
    END_FOR



    (* revision histroy
    hm	18. jun. 2008	rev 1.0
    	original release

    hm	20. sep. 2008	rev 1.1
    	changed length of input string from 20 to 12

    hm	26. jul. 2009	rev 1.2
    	optimized code
    *)	

END_FUNCTION
