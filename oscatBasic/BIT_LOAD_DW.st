FUNCTION BIT_LOAD_DW
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=211*)
    IF VAL THEN
    	BIT_LOAD_DW := IN OR SHL(dat,POS);
    ELSE
    	BIT_LOAD_DW := IN AND (NOT SHL(dat,POS));
    END_IF


    (* revision history
    hm	29. feb 2008	rev 1.0
    	origINal version

    hm	16. mar 2008	rev 1.1
    	change INput bit to VAL for compatibility reasons
    *)


END_FUNCTION