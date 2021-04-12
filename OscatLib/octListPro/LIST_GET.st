FUNCTION LIST_GET
    (* load pointers *)
    pt := ADR(LIST);
    po := ADR(LIST_GET);

    (* search for the n-th occurence of a separation character and store position in i *)
    WHILE (cnt < pos) AND (i < LIST_LENGTH) AND (pt^[i] > 0) DO
    	IF pt^[i] = sep THEN cnt := cnt + 1; END_IF
    	i := i + 1;
    END_WHILE

    (* copy the list element to output *)
    IF i < LIST_LENGTH THEN c := pt^[i]; END_IF
    WHILE (c <> sep) AND (c > 0) AND (o < LIST_LENGTH) AND (i < LIST_LENGTH) DO
    	po^[o] :=pt^[i];
    	o := o + 1;
    	i := i + 1;
    	c := pt^[i];
    END_WHILE

    (* terminate the output string *)
    po^[o] := 0;



    (* revision histroy
    hm	20. jun. 2008	rev 1.0
    	original release

    hm	19. jan. 2011	rev 1.1
    	changed string(255) to strring(LIST_LENGTH)

    *)	

END_FUNCTION
