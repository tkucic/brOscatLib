FUNCTION MONTH_TO_STRING
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=175*)
    IF LANG = 0 THEN ly := cDEFAULT; ELSE ly := MIN(LANG, cLMAX); END_IF
    IF MTH < 1 OR MTH > 12 THEN
    	RETURN;
    ELSIF LX = 0 THEN
    	MONTH_TO_STRING := cMONTHS[ly, MTH];
    ELSIF LX = 3 THEN
    	MONTH_TO_STRING := cMONTHS3[ly, MTH];
    END_IF


    (* revisison history

    hm	21. sep. 2008	rev 1.0
    	original version

    hm	19. oct. 2008	rev 1.1
    	changed language setup constants
    *)
END_FUNCTION
