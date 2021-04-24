FUNCTION WEEKDAY_TO_STRING
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=182*)
    IF LANG = 0 THEN ly := LANGUAGE.DEFAULT; ELSE ly := MIN(LANG, LANGUAGE.LMAX); END_IF
    IF WDAY < 1 OR WDAY > 7 THEN
    	RETURN;
    ELSIF LX = 0 THEN
    	WEEKDAY_TO_STRING := language.WEEKDAYS[ly, WDAY];
    ELSIF LX = 2 THEN
    	WEEKDAY_TO_STRING := language.WEEKDAYS2[ly, WDAY];
    END_IF


    (* revisison history

    hm	21. sep. 2008	rev 1.0
    	original version

    hm	19. oct. 2008	rev 1.1
    	changed language setup constants
    *)
END_FUNCTION
