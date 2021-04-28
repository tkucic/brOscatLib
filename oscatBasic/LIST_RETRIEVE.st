FUNCTION LIST_RETRIEVE
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=488*)
    (* load pointers *)
    pt ACCESS ADR(LIST);
    po ACCESS ADR(RETVAL);

    IF POS > 0 THEN
    	FOR i := 1 TO LIST_LENGTH DO
    		c := pt[i];
    		IF c = 0 THEN
    			po[o] := 0;
    			IF cnt < POS THEN pt[w + 1] := 0; ELSE pt[w] := 0; END_IF
                LIST_RETRIEVE := TRUE;
    			RETURN;
    		ELSIF cnt = POS AND c <> SEP THEN				(* we have found the element *)
    			po[o] := pt[i];
    			o := o + 1;
    		ELSIF cnt >= POS THEN
    			pt[w] := c;
    			w := w + 1;
    		ELSE
    			w := i;
    		END_IF
    		IF c = SEP THEN cnt := cnt + 1; END_IF
    	END_FOR
    ELSE
    	RETVAL := '';
        LIST_RETRIEVE := FALSE;
    END_IF
    

    (* revision histroy
    hm	28. jun. 2008	rev 1.0
    	original release

    hm	19. jan. 2011	rev 1.1
    	changed string(255) to string(LIST_LENGTH)

    hm	21. mar. 2011	rev 2.0
    	all elements start with SEP
    *)	

END_FUNCTION
