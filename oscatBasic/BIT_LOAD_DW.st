FUNCTION BIT_LOAD_DW
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=211*)
    IF val THEN
    	BIT_LOAD_DW := in OR SHL(dat,pos);
    ELSE
    	BIT_LOAD_DW := in AND (NOT SHL(dat,pos));
    END_IF;


    (* revision history
    hm	29. feb 2008	rev 1.0
    	original version

    hm	16. mar 2008	rev 1.1
    	change input bit to val for compatibility reasons
    *)


END_FUNCTION
