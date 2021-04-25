FUNCTION CHARNAME
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=147*)
    IF C <> 0 THEN
    	(* construct search string from code followed by $ sign, also clear CHARNAME string*)
    	CHR_TO_STRING(C, RETVAL);
    	RETVAL := CONCAT(RETVAL,'&');
    	RETVAL := CONCAT(';', RETVAL);
    	WHILE pos = 0 AND (i < 4) DO
    		i := i + 1;
    		pos := FIND(cCHARNAMES[i], RETVAL);
    	END_WHILE
    	IF pos > 0 THEN
    		RETVAL := MID(cCHARNAMES[i], 10, pos + 3);
    		(* search for end of name and truncate *)
    		pos := FIND(RETVAL, ';');
    		RETVAL := LEFT(RETVAL,pos - 1);
    	ELSE
    		 CHR_TO_STRING(C, RETVAL);
    	END_IF
        CHARNAME:=TRUE;
    ELSE
    	RETVAL := '';
        CHARNAME:=FALSE;
    END_IF




    (* revision history
    hm	13. may. 2008	rev 1.0
    	original version

    hm	16. jun. 2008	rev 1.1
    	changed nested call of concat for better compatibility

    hm	19. oct. 2008	rev 1.2
    	changes setup constants

    hm	24. oct. 2008	rev 1.3
    	new code for high performance

    hm	17. dec. 2008	rev 1.4
    	changed function chr to chr_to_string
    *)

END_FUNCTION
