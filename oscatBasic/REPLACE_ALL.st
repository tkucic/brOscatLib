FUNCTION REPLACE_ALL
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=177*)
    RETVAL := STR;
    lx := LEN(SRC);
    lp := LEN(REP);
    pos := FINDP(RETVAL, SRC, 1);
    WHILE pos > 0 DO
    	RETVAL := REPLACE(RETVAL,REP,lx, pos);
    	pos := FINDP(RETVAL, SRC, pos + lp);
    END_WHILE
    REPLACE_ALL := TRUE;
    (* revision histroy
    hm	4. feb. 2008	rev 1.0
    	original release

    hm	29. mar. 2008	rev 1.1
    	changed STRING to STRING(STRING_LENGTH)
    *)	

END_FUNCTION
