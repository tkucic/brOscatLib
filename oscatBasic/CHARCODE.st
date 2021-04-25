FUNCTION CHARCODE
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=147*)
    IF LEN(STR) = 1 THEN
    	CHARCODE := CODE(STR, 1);
    ELSIF STR <> '' THEN
    	(* construct search string *)
    	search := CONCAT('&', STR);
    	search := CONCAT(search, ';');
    	WHILE pos = 0 AND (i < 4) DO
    		i := i + 1;
    		pos := FIND(cCHARNAMES[i], search);
    	END_WHILE
    	found := MID(cCHARNAMES[i], 1, pos - 1);
    	CHARCODE := CODE(found, 1);
    END_IF




    (* revision history
    hm	13. may. 2008	rev 1.0
    	original version

    hm	19. oct. 2008	rev 1.1
    	changed setup constants

    hm	24. oct. 2008	rev 1.2
    	optimized code
    *)

END_FUNCTION
