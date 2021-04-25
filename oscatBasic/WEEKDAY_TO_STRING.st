FUNCTION WEEKDAY_TO_STRING
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=182*)
    IF LANG = 0 THEN ly := cLANGUAGE_DEFAULT; ELSE ly := MIN(LANG, cLANGUAGE_LMAX); END_IF
    IF WDAY < 1 OR WDAY > 7 THEN
    	RETURN;
    ELSIF LX = 0 THEN
    	RETVAL := cWEEKDAYS[ly, WDAY];
    ELSIF LX = 2 THEN
    	RETVAL := cWEEKDAYS2[ly, WDAY];
    END_IF
    WEEKDAY_TO_STRING := TRUE;

    (* revisison history

    hm	21. sep. 2008	rev 1.0
    	original version

    hm	19. oct. 2008	rev 1.1
    	changed language setup constants
    *)
END_FUNCTION
