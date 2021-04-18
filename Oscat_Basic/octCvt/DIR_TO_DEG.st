FUNCTION DIR_TO_DEG
    IF L = 0 THEN ly := LANGUAGE.DEFAULT; ELSE ly := MIN(L, LANGUAGE.LMAX); END_IF
    FOR i := 0 TO 15 DO
    	IF language.DIRS[ly, i] = DIR THEN EXIT; END_IF
    END_FOR
    DIR_TO_DEG := SHR(i * 45 + 1, 1);






    (* revision histroy
    hm	22. oct. 2008	rev 1.1
    	original release

    *)
END_FUNCTION
