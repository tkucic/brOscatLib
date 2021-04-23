FUNCTION OCT_TO_BYTE
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=175*)
    pt := ADR(OCT);
    stop := LEN(OCT);
    FOR I := 1 TO stop DO
    	(* read the first character and subtract 48 to get value in decimal 0 = 48 *)
    	x := pt^;
    	(* calculate the value of the digit *)
    	IF X > 47 AND x < 56 THEN
    		OCT_TO_BYTE := SHL(OCT_TO_BYTE,3) + X - 48;
    	END_IF
    	pt := pt + 1;
    END_FOR



    (* revision histroy
    hm	18. jun. 2008	rev 1.0
    	original release

    hm	20. sep. 2008	rev 1.1
    	changed length of input string from 20 to 10

    *)	

END_FUNCTION