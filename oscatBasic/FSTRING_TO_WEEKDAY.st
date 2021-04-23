FUNCTION FSTRING_TO_WEEKDAY
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=164*)
    IF LANG = 0 THEN ly := LANGUAGE.DEFAULT; ELSE ly := MIN(LANG, LANGUAGE.LMAX); END_IF
    (* tmp needs to be calculated first otherwise find can return wrong values *)
    tmp := TRIM(WDAY);
    tmp := CAPITALIZE(LOWERCASE(tmp));
    FOR i := 1 TO 7 DO
    	IF LANGuage.WEEKDAYS2[ly, i] = tmp THEN
    		FSTRING_TO_WEEKDAY := i;
    		RETURN;
    	END_IF
    END_FOR
    FSTRING_TO_WEEKDAY := STRING_TO_INT(WDAY);




    (* revision histroy
    hm	18. jun. 2008	rev 1.0
    	original release

    hm	18. jul. 2008	rev 1.1
    	changed nested call of left(trim()) for compatibility reasons

    hm	25. oct. 2008	rev 1.2
    	using LANGuage constants
    *)	

END_FUNCTION