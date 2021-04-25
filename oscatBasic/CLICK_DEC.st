FUNCTION_BLOCK CLICK_DEC
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=190*)
    (* Q shall only be active for one cycle only *)
    IF IN = FALSE THEN
    	Q0 := FALSE;
    	Q1 := FALSE;
    	Q2:= FALSE;
    	Q3 := FALSE;
    END_IF

    IF IN AND NOT edge_ AND NOT tx.Q THEN
    	(* a rising edge_ on IN sets the counter to 0 *)
    	cnt := 0;
    ELSIF tx.Q AND NOT IN AND edge_ THEN
    	(* count falling edges when tp.q is true *)
    	cnt := cnt + 1;
    ELSIF NOT tx.Q THEN
    	CASE cnt OF
    		0 : Q0 := TRUE;
    		1 : Q1 := TRUE;
    		2 : Q2 := TRUE;
    		3 : Q3 := TRUE;
    	END_CASE
    	cnt := -1;
    END_IF

    (* remember the status of IN *)
    edge_ := IN;
    tx(IN := IN, PT := TC);



    (* revision history

    hm 17. jul. 2008	rev 1.0
    	original version released

    hm	14. mar. 2009	rev 1.1
    	removed double assignments

    *)
END_FUNCTION_BLOCK
