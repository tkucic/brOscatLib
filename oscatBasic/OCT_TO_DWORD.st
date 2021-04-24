FUNCTION OCT_TO_DWORD
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=176*)
    pt := ADR(OCT);
    stop := LEN(OCT);
    FOR i := 1 TO stop DO
    	(* read the first character and subtract 48 to get value in decimal 0 = 48 *)
    	X := pt^;
    	(* calculate the value of the digit *)
    	IF X > 47 AND X < 56 THEN
    		OCT_TO_DWORD := SHL(OCT_TO_DWORD,3) + X - 48;
    	END_IF
    	pt := pt + 1;
    END_FOR




    (* revision histroy
    hm	18. jun. 2008	rev 1.0
    	original release


    *)	

END_FUNCTION
