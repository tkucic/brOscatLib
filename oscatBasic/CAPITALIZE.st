FUNCTION CAPITALIZE
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=146*)
    PT := ADR(CAPITALIZE);
    CAPITALIZE := STR;
    L := LEN(STR);
    FOR pos := 1 TO l DO
    	IF first THEN pt^ := TO_UPPER(pt^);	END_IF
    	(* remember in first if the next char needs to capitalized *)
    	first := pt^= 32;
    	PT := pt + 1;
    END_FOR

    (* revision hiSTRoy
    hm		4. mar 2008	rev 1.0
    	original release

    hm	29. mar. 2008	rev 1.1
    	changed STRING to STRING(STRING_LENGTH)

    hm	20. jun. 2008	rev 1.2
    	improved performance

    *)	

END_FUNCTION
