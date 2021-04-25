FUNCTION DIR_TO_DEG
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=360*)
    IF L = 0 THEN ly := cLOCATION_DEFAULT; ELSE ly := MIN(L, cLOCATION_LMAX); END_IF
    FOR i := 0 TO 15 DO
    	IF cDIRS[ly, i] = DIR THEN EXIT; END_IF
    END_FOR
    DIR_TO_DEG := SHR(i * 45 + 1, 1);






    (* revision histroy
    hm	22. oct. 2008	rev 1.1
    	original release

    *)
END_FUNCTION
