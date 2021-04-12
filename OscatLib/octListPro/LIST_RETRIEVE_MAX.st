FUNCTION LIST_RETRIEVE_MAX
    PT := ADR(LIST);
    l := LEN(list);
    FOR pos := 1 TO l DO
    	IF pt^[pos] = sep THEN
    		IF pos - last - 1 > lx THEN
    			mpos := last + 1;
    			lx := pos - last - 1;
    		END_IF
    		last := pos;
    	END_IF
    END_FOR

    (* check length of last element *)
    IF l - last > lx THEN
    	mpos := last + 1;
    	lx := l - last;
    	LIST_RETRIEVE_MAX := RIGHT(list, lx);
    	list := LEFT(list, last - 1);
    ELSE
    	LIST_RETRIEVE_MAX := MID(LIST, lx, mpos);
    	LIST := DELETE(LIST, lx + 1, mpos);
    END_IF



    (* revision histroy
    hm	22. oct. 2008	rev 1.0
    	original release

    hm	19. jan. 2011	rev 1.1
    	changed string(255) to string(LIST_LENGTH)

    *)	

END_FUNCTION
