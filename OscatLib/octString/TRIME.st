FUNCTION TRIME
    TRIME := str;
    (* beginning blanks need to be stripped off *)
    WHILE LEFT(TRIME,1) = ' ' DO
    	TRIME := DELETE(TRIME,1,1);
    END_WHILE

    (* ending blanks need to be stripped off *)
    WHILE RIGHT(TRIME,1) = ' ' DO
    	TRIME := DELETE(TRIME,1,LEN(TRIME));
    END_WHILE


    (* revision histroy
    hm	28. mar. 2008	rev 1.0
    	original release

    *)
END_FUNCTION
