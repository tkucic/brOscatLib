FUNCTION_BLOCK LIST_NEXT
    (* load pointers *)
    pt := ADR(LIST);
    stop := LEN(LIST);

    IF rst THEN
    	start := 0;
    	pos := 1;
    	NUL := FALSE;
    END_IF

    (* search next occurence of separation character or end of list *)
    WHILE pos <= stop DO
    	IF pt^[pos] = SEP THEN EXIT; END_IF
    	pos := pos + 1;
    END_WHILE
    IF start <= stop THEN
    	LEL := MID(LIST, pos - start - 1, start + 1);
    	start := pos;
    	pos := pos + 1;
    ELSE
    	LEL := '';
    	NUL := TRUE;
    END_IF



    (* revision histroy
    hm	25. jun. 2008	rev 1.0
    	original release

    hm	19. jan. 2011	rev 1.1
    	changed string(255) to string(LIST_LENGTH)	

    *)	

END_FUNCTION_BLOCK
