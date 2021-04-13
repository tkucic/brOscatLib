FUNCTION CLEAN
    (* copy input string *)
    CLEAN := IN;
    stop := LEN(in);
    WHILE pos <= stop DO
    	IF FIND(cx, MID(CLEAN, 1, pos)) > 0 THEN
    		(* charcter found skip to next one *)
    		pos := pos + 1;
    	ELSE
    		(* wrong chracter needs to be deleted *)
    		CLEAN := DELETE(CLEAN, 1, pos);
    		stop := stop - 1;	(* the string is one character shorter now *)
    	END_IF
    END_WHILE



    (* revision history

    hm		18. jun. 2008	rev 1.0		
    	original version 


    *)
END_FUNCTION