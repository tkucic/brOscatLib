FUNCTION BIT_LOAD_B2
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=211*)
    IF D THEN
    	BIT_LOAD_B2 := ROL(SHR(BYTE#255, 8 - N) OR ROR(i, P), P);
    ELSE
    	BIT_LOAD_B2 := ROL(SHL(BYTE#255, N) AND ROR(I, P), P);
    END_IF



    (* revision history
    hm	18. oct. 2008	rev 1.0
    	original version


    *)

END_FUNCTION
