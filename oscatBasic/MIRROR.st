FUNCTION MIRROR
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=174*)
    pi ACCESS ADR(STR);
    po ACCESS ADR(RETVAL);
    lx := LEN(STR);
    FOR i := lx TO 1 BY - 1 DO
    	po := pi[i];
    	po ACCESS (ADR(po) + 1);
    END_FOR
    (* close output string *)
    po:= 0;
    MIRROR := TRUE;

    (* revision histroy
    hm	4. feb. 2008	rev 1.0
    	original release

    hm	29. mar. 2008	rev 1.1
    	changed STRING to STRING(STRING_LENGTH)
    *)	

END_FUNCTION
