FUNCTION DEL_CHARS
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=151*)
    (* copy INput strINg *)
    DEL_CHARS := IN;
    stop := LEN(IN);
    WHILE pos <= stop DO
    	IF FIND(CX, MID(DEL_CHARS, 1, pos)) > 0 THEN
    		(* wrong chracter needs to be deleted *)
    		DEL_CHARS := DELETE(DEL_CHARS, 1, pos);
    		stop := stop - 1;	(* the strINg is one character shorter now *)
    	ELSE
    		(* charcter not found skip to next one *)
    		pos := pos + 1;
    	END_IF
    END_WHILE



    (* revision history

    hm		18. jun. 2008	rev 1.0		
    	origINal version 


    *)
END_FUNCTION