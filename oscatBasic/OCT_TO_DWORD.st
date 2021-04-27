FUNCTION OCT_TO_DWORD
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=176*)
    pt ACCESS ADR(OCT);
    stop := LEN(OCT);
    FOR i := 1 TO stop DO
    	(* read the first character and subtract 48 to get value in decimal 0 = 48 *)
    	X := pt;
        intX := BYTE_TO_USINT(X);
    	(* calculate the value of the digit *)
    	IF intX > 47 AND intX < 56 THEN
    		OCT_TO_DWORD := UDINT_TO_DWORD(DWORD_TO_UDINT(SHL(OCT_TO_DWORD,3)) + intX - 48);
    	END_IF
    	pt ACCESS (ADR(pt) + 1);
    END_FOR



    (* revision histroy
    hm	18. jun. 2008	rev 1.0
    	original release


    *)	

END_FUNCTION
