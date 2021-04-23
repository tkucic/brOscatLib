FUNCTION REPLACE_ALL
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=177*)
    REPLACE_ALL := STR;
    lx := LEN(SRC);
    lp := LEN(REP);
    pos := FINDP(REPLACE_ALL, SRC, 1);
    WHILE pos > 0 DO
    	REPLACE_ALL := REPLACE(REPLACE_ALL,REP,lx, pos);
    	pos := FINDP(REPLACE_ALL, SRC, pos + lp);
    END_WHILE

    (* revision hiSTRoy
    hm	4. feb. 2008	rev 1.0
    	original release

    hm	29. mar. 2008	rev 1.1
    	changed STRING to STRING(STRING_LENGTH)
    *)	

END_FUNCTION
