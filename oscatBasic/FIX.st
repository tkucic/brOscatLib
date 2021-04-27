FUNCTION FIX
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=160*)
    (* make sure L does not exceed the limits of a string *)
    N := LIMIT(0,L,STRING_LENGTH) - LEN(STR);
    IF N <= 0 THEN
    	(* truncate the string at length N *)
    	IF M = 1 THEN
    		RETVAL := RIGHT(STR,L);
    	ELSE
    		RETVAL := LEFT(STR,L);
    	END_IF
    ELSIF M = 1 THEN
    	(* connect fill characters at the beginning *)
    	FILL(C,N, SX);
    	RETVAL := CONCAT(SX,STR);
    ELSIF M = 2 THEN
    	(* center STR beween fill characters *)
    	(* for an uneven number of fill characters, there is one more at the end *)
    	FILL(C,SHR(N+1,1), SX);
    	RETVAL := CONCAT(STR,SX);
    	SX := LEFT(SX,SHR(N,1));
    	RETVAL := CONCAT(SX,RETVAL);
    ELSE
    	(* connect fill characters at the end *)
    	FILL(C,N, SX);
    	RETVAL := CONCAT(STR,SX);
    END_IF
    FIX := TRUE;

    (* revision histroy
    hm	29. mar. 2008	rev 1.0
    	original release

    *)
END_FUNCTION
