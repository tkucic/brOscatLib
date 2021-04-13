FUNCTION_BLOCK FF_RSE
    IF rst THEN
    	(* asynchronous reset *)
    	Q := FALSE;
    ELSIF CR AND NOT er THEN
    	(* rising edge on CR *)
    	Q := FALSE;
    ELSIF CS AND NOT es THEN
    	(* rising edge on CS *)
    	Q := TRUE;
    END_IF

    es := CS;
    er := CR;

    (* revision history

    hm	16. jul. 2008	rev 1.0
    	original version

    *)




END_FUNCTION_BLOCK