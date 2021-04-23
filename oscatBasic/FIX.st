FUNCTION FIX
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=160*)
    (* make sure L does not exceed the limits of a STRing *)
    N := LIMIT(0,L,STRING_LENGTH) - LEN(STR);
    IF N <= 0 THEN
    	(* truncate the STRing at length N *)
    	IF M = 1 THEN
    		FIX := RIGHT(STR,L);
    	ELSE
    		FIX := LEFT(STR,L);
    	END_IF
    ELSIF M = 1 THEN
    	(* connect fill characters at the beginning *)
    	sx := FILL(C,N);
    	FIX := CONCAT(sx,STR);
    ELSIF M = 2 THEN
    	(* center STR beween fill characters *)
    	(* for an uneven number of fill characters, there is one more at the end *)
    	sx := FILL(C,SHR(N+1,1));
    	FIX := CONCAT(STR,sx);
    	SX := LEFT(sx,SHR(N,1));
    	FIX := CONCAT(sx,FIX);
    ELSE
    	(* connect fill characters at the end *)
    	SX := FILL(C,N);
    	FIX := CONCAT(STR,SX);
    END_IF


    (* revision hiSTRoy
    hm	29. mar. 2008	rev 1.0
    	original release

    *)
END_FUNCTION
