FUNCTION DEC_TO_DWORD
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=150*)
    pt := ADR(DEC);
    stop := LEN(DEC);
    FOR I := 1 TO stop DO
    	(* read the first character and subtract 48 to get value in DECimal 0 = 48 *)
    	x := pt^;
    	(* calculate the value of the digit *)
    	IF X > 47 AND x < 58 THEN
    		DEC_TO_DWORD := DEC_TO_DWORD * 10 + X - 48;
    	END_IF
    	pt := pt + 1;
    END_FOR



    (* revision histroy
    hm	20. jun. 2008	rev 1.0
    	original release

    hm	30. sep. 2008	rev 1.1
    	corrected an error where DECoding of characters 8 and 9 would fail
    *)	

END_FUNCTION
