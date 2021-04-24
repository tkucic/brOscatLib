FUNCTION BIT_LOAD_B
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=210*)
    IF VAL THEN
    	BIT_LOAD_B := IN OR SHL(dat,POS);
    ELSE
    	BIT_LOAD_B := IN AND (NOT SHL(dat,POS));
    END_IF


    (* revision history
    hm	29. feb 2008	rev 1.0
    	original version

    hm	16. mar 2008	rev 1.1
    	change input bit to VAL for compatibility reasons
    *)

END_FUNCTION
