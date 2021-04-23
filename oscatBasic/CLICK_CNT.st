FUNCTION_BLOCK CLICK_CNT
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=189*)
    (* Q shall only be active for one cycle only *)
    Q := FALSE;

    IF IN AND NOT edge AND NOT tx.q THEN
    	(* a risINg edge on IN sets the counter to 0 *)
    	cnt := 0;
    ELSIF tx.Q AND NOT IN AND edge THEN
    	(* count fallINg edges when tp.q is true *)
    	cnt := cnt + 1;
    ELSIF NOT tx.Q THEN
    	Q := cnt = N;
    	cnt := -1;
    END_IF

    (* remember the status of IN *)
    edge := IN;
    tx(IN := IN, pt := TC);


    (* revision history

    hm 	16. jul. 2008	rev 1.0
    	origINal version released


    *)
END_FUNCTION_BLOCK
