FUNCTION REPLACE_ALL
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=177*)
    REPLACE_ALL := str;
    lx := LEN(src);
    lp := LEN(rep);
    pos := FINDP(REPLACE_ALL, src, 1);
    WHILE pos > 0 DO
    	REPLACE_ALL := REPLACE(REPLACE_ALL,rep,lx, pos);
    	pos := FINDP(REPLACE_ALL, src, pos + lp);
    END_WHILE

    (* revision histroy
    hm	4. feb. 2008	rev 1.0
    	original release

    hm	29. mar. 2008	rev 1.1
    	changed STRING to STRING(STRING_LENGTH)
    *)	

END_FUNCTION
