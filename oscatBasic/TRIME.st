FUNCTION TRIME
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=181*)
    RETVAL := STR;
    (* beginning blanks need to be stripped off *)
    WHILE LEFT(RETVAL,1) = ' ' DO
    	RETVAL := DELETE(RETVAL,1,1);
    END_WHILE

    (* ending blanks need to be stripped off *)
    WHILE RIGHT(RETVAL,1) = ' ' DO
    	RETVAL := DELETE(RETVAL,1,LEN(RETVAL));
    END_WHILE
    TRIME := TRUE;

    (* revision histroy
    hm	28. mar. 2008	rev 1.0
    	original release

    *)
END_FUNCTION
