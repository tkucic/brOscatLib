FUNCTION_BLOCK LIST_NEXT
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=487*)
    pt ACCESS ADR(LIST);
    po ACCESS ADR(LEL);

    IF RST THEN
    	pos := 1;
    END_IF

    IF pt[pos] = 0 OR pos = LIST_LENGTH THEN
    	LEL := '';
    	NUL := TRUE;
    ELSE
    	NUL := FALSE;
    	write := 1;
    	FOR pos := pos + 1 TO LIST_LENGTH DO
    		c := pt[pos];
    		IF c = 0 OR c = SEP THEN
    			po[write] := 0;
    			RETURN;
    		ELSE
    			po[write] := pt[pos];
    			write := write + 1;
    		END_IF
    	END_FOR
    END_IF




    (* revision histroy
    hm	25. jun. 2008	rev 1.0
    	original release

    hm	19. jan. 2011	rev 1.1
    	changed string(255) to string(LIST_LENGTH)	

    hm	21. mar. 2011	rev 2.0
    	all elements start with SEP

    *)	

END_FUNCTION_BLOCK
