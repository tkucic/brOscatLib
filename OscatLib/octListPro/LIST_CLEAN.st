FUNCTION LIST_CLEAN
    pt := ADR(LIST);

    last := sep;
    REPEAT
       pos := pos + 1;
       c := pt^[pos];
       IF last <> sep OR c <> sep THEN
          pw := pw + 1;
          pt^[pw] := c;
       END_IF
       last := c;
    UNTIL pos >= LIST_LENGTH OR c = 0
    END_REPEAT;

    IF pw > 1 THEN
      pw := pw - 1;
      IF pt^[pw] = sep THEN pt^[pw] := 0; END_IF
    END_IF

    (* retrun TRUE *)
    LIST_CLEAN := TRUE;



    (* revision histroy
    hm	28. jun. 2008	rev 1.0
    	original release

    hm	19. jan. 2011	rev 1.1
    	changed string(255) to string(LIST_LENGTH)

    *)	

END_FUNCTION
