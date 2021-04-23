FUNCTION MIRROR
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=174*)
    pi := ADR(STR);
    po := ADR(mirror);
    lx := LEN(STR);
    FOR i := lx TO 1 BY - 1 DO
    	po^ := pi^[i];
    	po := po + 1;
    END_FOR
    (* close output STRing *)
    po^:= 0;


    (* revision hiSTRoy
    hm	4. feb. 2008	rev 1.0
    	original release

    hm	29. mar. 2008	rev 1.1
    	changed STRING to STRING(STRING_LENGTH)
    *)	

END_FUNCTION