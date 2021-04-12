FUNCTION LIST_INSERT
    (* load pointers *)
    pt := ADR(LIST);

    (* search for the n-th occurence of a separation character and store position in i *)
    c := pt^[1];
    WHILE (cnt < pos) AND (i < LIST_LENGTH) AND (c > 0) DO
    	i := i + 1;
    	c := pt^[i];
    	IF c = sep THEN cnt := cnt + 1; END_IF
    END_WHILE

    (* copy the new element into the list *)
    tmp := CHR_TO_STRING(SEP);
    IF i = 0 THEN
    	tmp := CONCAT(INS,tmp);
    	LIST := INSERT(LIST, tmp, 0);
    ELSE
    	tmp := CONCAT(tmp, INS);
    	LIST := INSERT(LIST, tmp, i - 1);
    END_IF


    LIST_INSERT := TRUE;



    (* revision histroy
    hm	28. jun. 2008	rev 1.0
    	original release

    hm	17. dec. 2008	rev 1.1
    	changes name of function chr to chr_to_string

    hm	19. jan. 2011	rev 1.2
    	changed string(255) to string(LIST_LENGTH)

    *)	

END_FUNCTION
