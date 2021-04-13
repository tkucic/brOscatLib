FUNCTION FIX
    (* make sure L does not exceed the limits of a string *)
    N := LIMIT(0,L,STRING_LENGTH) - LEN(str);
    IF N <= 0 THEN
    	(* truncate the string at length N *)
    	IF M = 1 THEN
    		FIX := RIGHT(str,L);
    	ELSE
    		FIX := LEFT(str,L);
    	END_IF
    ELSIF M = 1 THEN
    	(* connect fill characters at the beginning *)
    	sx := FILL(C,N);
    	FIX := CONCAT(sx,str);
    ELSIF M = 2 THEN
    	(* center str beween fill characters *)
    	(* for an uneven number of fill characters, there is one more at the end *)
    	sx := FILL(C,SHR(N+1,1));
    	FIX := CONCAT(str,sx);
    	SX := LEFT(sx,SHR(N,1));
    	FIX := CONCAT(sx,FIX);
    ELSE
    	(* connect fill characters at the end *)
    	SX := FILL(C,N);
    	FIX := CONCAT(str,SX);
    END_IF


    (* revision histroy
    hm	29. mar. 2008	rev 1.0
    	original release

    *)
END_FUNCTION