FUNCTION CAPITALIZE
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=146*)
    PT ACCESS ADR(RETVAL);
    RETVAL := STR;
    L := LEN(STR);
    FOR pos := 1 TO L DO
    	IF first THEN PT := TO_UPPER(PT);	END_IF
    	(* remember in first if the next char needs to capitalized *)
    	first := PT= 32;
    	PT ACCESS (ADR(PT) + 1);
    END_FOR
    CAPITALIZE := TRUE;
    (* revision histroy
    hm		4. mar 2008	rev 1.0
    	original release

    hm	29. mar. 2008	rev 1.1
    	changed STRING to STRING(STRING_LENGTH)

    hm	20. jun. 2008	rev 1.2
    	improved performance

    *)	

END_FUNCTION
