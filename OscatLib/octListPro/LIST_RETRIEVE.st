FUNCTION LIST_RETRIEVE
    (* load pointers *)
    pt := ADR(LIST);
    po := ADR(LIST_RETRIEVE);
    l := LEN(LIST);

    (* search for the n-th occurence of a separation character and store position in i *)
    WHILE (cnt < pos) AND (i < LIST_LENGTH) AND (pt^[i] > 0) DO
    	IF pt^[i] = sep THEN cnt := cnt + 1; END_IF
    	i := i + 1;
    END_WHILE

    p := i;	(* store position for deletion in list *)

    (* copy the list element to output *)
    IF i < LIST_LENGTH THEN c := pt^[i]; END_IF
    WHILE (c <> sep) AND (c > 0) AND (o < LIST_LENGTH) AND (i < LIST_LENGTH) DO
    	po^[o] :=pt^[i];
    	o := o + 1;
    	i := i + 1;
    	c := pt^[i];
    END_WHILE

    IF cnt = pos THEN
    	IF i = L THEN
    		LIST := LEFT(LIST, p - 1);
    	ELSE
    		LIST := DELETE(LIST, i - p + 1, p + 1);
    	END_IF
    END_IF


    (* terminate the output string *)
    po^[o] := 0;



    (* revision histroy
    hm	28. jun. 2008	rev 1.0
    	original release

    hm	19. jan. 2011	rev 1.1
    	changed string(255) to string(LIST_LENGTH)

    *)	

END_FUNCTION
