FUNCTION LIST_LEN
    PT := ADR(LIST);
    LIST_LEN := 1;
    l := LEN(list);
    FOR pos := 1 TO l DO
    	IF pt^[pos] = SEP THEN LIST_LEN := LIST_LEN + 1; END_IF
    END_FOR



    (* code before rev 1.1
    LIST_LEN := COUNT_CHAR(LIST, SEP) + 1;
    *)


    (* revision histroy
    hm	25. jun. 2008	rev 1.0
    	original release

    hm	16. oct. 2008	rev 1.1
    	fixed a problem where list_len would only work up to LIST_LENGTH

    hm	19. jan. 2001	rev 1.2
    	changed string(255) to string(LIST_LENGTH)

    *)	

END_FUNCTION
