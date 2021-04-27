FUNCTION LOWERCASE
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=172*)
    PT ACCESS ADR(RETVAL);
    RETVAL := STR;
    l := LEN(STR);
    FOR pos := 1 TO l DO
    	PT := TO_LOWER(PT);
    	PT ACCESS (ADR(PT) + 1);
    END_FOR
    LOWERCASE := TRUE;

    (* revision histroy
    hm	6. oct. 2006	rev 1.0
    	original release

    hm	4. feb. 2008	rev 1.1
    	improved performance
    	added Ä.Ö,Ü

    hm	6. mar. 2008	rev 1.2
    	added support for exteded Ascii

    hm	29. mar. 2008	rev 1.3
    	changed STRING to STRING(STRING_LENGTH)
    *)	

END_FUNCTION
