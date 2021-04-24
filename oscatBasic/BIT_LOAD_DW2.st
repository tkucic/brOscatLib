FUNCTION BIT_LOAD_DW2
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=212*)
    IF D THEN
    	BIT_LOAD_DW2 := ROL(SHR(DWORD#4294967295, 32 - N) OR ROR(I, P), P);
    ELSE
    	BIT_LOAD_DW2 := ROL(SHL(DWORD#4294967295, N) AND ROR(I, P), P);
    END_IF



    (* revision history
    hm	18. oct. 2008	rev 1.0
    	original version


    *)

END_FUNCTION
