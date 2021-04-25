FUNCTION_BLOCK CLICK_CNT
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=189*)
    (* Q shall only be active for one cycle only *)
    Q := FALSE;

    IF IN AND NOT edge_ AND NOT tx.Q THEN
    	(* a rising edge_ on IN sets the counter to 0 *)
    	cnt := 0;
    ELSIF tx.Q AND NOT IN AND edge_ THEN
    	(* count falling edges when tp.Q is true *)
    	cnt := cnt + 1;
    ELSIF NOT tx.Q THEN
    	Q := cnt = N;
    	cnt := -1;
    END_IF

    (* remember the status of IN *)
    edge_ := IN;
    tx(IN := IN, PT := TC);


    (* revision history

    hm 	16. jul. 2008	rev 1.0
    	original version released


    *)
END_FUNCTION_BLOCK
