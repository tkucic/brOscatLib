FUNCTION FIX
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=160*)
    (* make sure L does not exceed the limits of a string *)
    N := LIMIT(0,L,STRING_LENGTH) - LEN(STR);
    IF N <= 0 THEN
    	(* truncate the string at length N *)
    	IF M = 1 THEN
    		FIX := RIGHT(STR,L);
    	ELSE
    		FIX := LEFT(STR,L);
    	END_IF
    ELSIF M = 1 THEN
    	(* connect fill characters at the beginning *)
    	SX := FILL(C,N);
    	FIX := CONCAT(SX,STR);
    ELSIF M = 2 THEN
    	(* center STR beween fill characters *)
    	(* for an uneven number of fill characters, there is one more at the end *)
    	SX := FILL(C,SHR(N+1,1));
    	FIX := CONCAT(STR,SX);
    	SX := LEFT(SX,SHR(N,1));
    	FIX := CONCAT(SX,FIX);
    ELSE
    	(* connect fill characters at the end *)
    	SX := FILL(C,N);
    	FIX := CONCAT(STR,SX);
    END_IF


    (* revision histroy
    hm	29. mar. 2008	rev 1.0
    	original release

    *)
END_FUNCTION
