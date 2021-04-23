FUNCTION_BLOCK FF_RSE
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=242*)
    IF RST THEN
    	(* asynchronous reset *)
    	Q := FALSE;
    ELSIF CR AND NOT er THEN
    	(* rising EDGE_ on CR *)
    	Q := FALSE;
    ELSIF CS AND NOT es THEN
    	(* rising EDGE_ on CS *)
    	Q := TRUE;
    END_IF

    es := CS;
    er := CR;

    (* revision history

    hm	16. jul. 2008	rev 1.0
    	original version

    *)




END_FUNCTION_BLOCK
