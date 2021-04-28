FUNCTION LIST_CLEAN
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=485*)
    pt ACCESS ADR(LIST);

    FOR read := 1 TO LIST_LENGTH DO
    	c := pt[read];								(* read character from LIST *)
    	IF c = 0 THEN EXIT;						(* exit the loop if character definbes end of string *)
    	ELSIF c <> SEP OR SEP <> last THEN	(* copy element from read to write position unless a double SEP character is present *)
    		pt[write] := c;
    		write := write + 1;
    	END_IF
    	last := c;									(* remember last character *)
    END_FOR

    IF last = SEP THEN write := write - 1; END_IF		(* if last character is SEP then delete empty element at end *)
    IF write <= STRING_LENGTH THEN pt[write] := 0;	 END_IF		(* terminate string with 0 *)

    LIST_CLEAN := TRUE;						(* retrun TRUE *)


    (* revision histroy
    hm	28. jun. 2008	rev 1.0
    	original release

    hm	19. jan. 2011	rev 1.1
    	changed string(255) to string(LIST_LENGTH)

    hm	21. mar. 2011	rev 2.0
    	all elements start with SEP

    *)	

END_FUNCTION
