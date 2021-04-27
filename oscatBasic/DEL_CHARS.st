FUNCTION DEL_CHARS
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=151*)
    (* copy input string *)
    RETVAL := IN;
    stop := LEN(IN);
    WHILE pos <= stop DO
    	IF FIND(CX, MID(RETVAL, 1, pos)) > 0 THEN
    		(* wrong chracter needs to be deleted *)
    		RETVAL := DELETE(RETVAL, 1, pos);
    		stop := stop - 1;	(* the string is one character shorter now *)
    	ELSE
    		(* charcter not found skip to next one *)
    		pos := pos + 1;
    	END_IF
    END_WHILE
    DEL_CHARS := TRUE;


    (* revision history

    hm		18. jun. 2008	rev 1.0		
    	original version 


    *)
END_FUNCTION
