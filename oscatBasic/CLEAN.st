FUNCTION CLEAN
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=149*)
    (* copy INput strINg *)
    CLEAN := IN;
    stop := LEN(IN);
    WHILE pos <= stop DO
    	IF FIND(CX, MID(CLEAN, 1, pos)) > 0 THEN
    		(* charcter found skip to next one *)
    		pos := pos + 1;
    	ELSE
    		(* wrong chracter needs to be deleted *)
    		CLEAN := DELETE(CLEAN, 1, pos);
    		stop := stop - 1;	(* the strINg is one character shorter now *)
    	END_IF
    END_WHILE



    (* revision history

    hm		18. jun. 2008	rev 1.0		
    	origINal version 


    *)
END_FUNCTION
