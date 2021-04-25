FUNCTION FSTRING_TO_WEEK
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=163*)
    pos := FIND(WEEK, ',');
    WHILE pos > 0 DO
    	FSTRING_TO_WEEK := FSTRING_TO_WEEK OR SHR(BYTE#128, FSTRING_TO_WEEKDAY(MID(WEEK, pos - 1, 1), LANG));
    	WEEK := RIGHT(WEEK, LEN(Week) - pos);
    	pos := FIND(WEEK, ',');
    END_WHILE;
    FSTRING_TO_WEEK := (FSTRING_TO_WEEK OR SHR(BYTE#128, FSTRING_TO_WEEKDAY(WEEK, LANG))) AND BYTE#127;


    (* revision histroy
    hm	18. jun. 2008	rev 1.0
    	original release

    hm	25. oct. 2008	rev 1.1
    	using language defauls and input lang
    *)	

END_FUNCTION
