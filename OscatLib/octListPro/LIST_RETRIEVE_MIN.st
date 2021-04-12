FUNCTION LIST_RETRIEVE_MIN
    PT := ADR(LIST);
    l := LEN(list);
    lx := 255;
    FOR pos := 1 TO l DO
    	IF pt^[pos] = sep THEN
    		IF pos - last - 1 < lx THEN
    			mpos := last + 1;
    			lx := pos - last - 1;
    			(* if we found an element with length 0 then we can stop *)
    		END_IF
    		last := pos;
    		IF lx = 0 THEN EXIT; END_IF
    	END_IF
    END_FOR

    (* check length of last element *)
    IF l - last < lx THEN
    	mpos := last + 1;
    	lx := l - last;
    	LIST_RETRIEVE_MIN := RIGHT(list, lx);
    	list := LEFT(list, last - 1);
    ELSE
    	LIST_RETRIEVE_MIN := MID(LIST, lx, mpos);
    	LIST := DELETE(LIST, lx + 1, mpos);
    END_IF



    (* revision histroy
    hm	23. oct. 2008	rev 1.0
    	original release

    hm	19. jan. 2011	rev 1.1
    	changed string(255) to string(LIST_LENGTH)

    *)	

END_FUNCTION
