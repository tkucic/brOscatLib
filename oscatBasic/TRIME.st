FUNCTION TRIME
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=181*)
    TRIME := STR;
    (* beginning blanks need to be STRipped off *)
    WHILE LEFT(TRIME,1) = ' ' DO
    	TRIME := DELETE(TRIME,1,1);
    END_WHILE

    (* ending blanks need to be STRipped off *)
    WHILE RIGHT(TRIME,1) = ' ' DO
    	TRIME := DELETE(TRIME,1,LEN(TRIME));
    END_WHILE


    (* revision hiSTRoy
    hm	28. mar. 2008	rev 1.0
    	original release

    *)
END_FUNCTION
