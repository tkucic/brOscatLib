FUNCTION LIST_GET
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=485*)
    pt ACCESS ADR(LIST);							(* load pointers *)
    po ACCESS ADR(RETVAL);

    REPEAT
    	c := pt[i];
    	IF cnt = POS THEN						(* copy element to output string *)
    		IF c = SEP  THEN EXIT; END_IF		(* next element stop copy and finish *)
    		po[o] := c;
    		o := o + 1;
    	ELSIF c = SEP THEN
    		cnt := cnt + 1;
    	END_IF
    	i := i + 1;
    UNTIL
    	(i = LIST_LENGTH) OR (c = 0)
    END_REPEAT
    po[o] := 0;						(* close the output string *)
    LIST_GET:=TRUE;


    (* revision histroy
    hm	20. jun. 2008	rev 1.0
    	original release

    hm	19. jan. 2011	rev 1.1
    	changed string(255) to strring(LIST_LENGTH)

    hm	21. mar. 2011	rev 2.0
    	all LIST elements start with SEP
    *)	

END_FUNCTION
