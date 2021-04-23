FUNCTION_BLOCK A_TRIG
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=188*)
    D := IN - LAST_IN;
    Q := ABS(D) > RES;
    IF Q THEN last_IN := IN; END_IF
    D := IN - LAST_IN;


    (* revision history

    hm 	16. jul. 2008	rev 1.0
    	origINal version released

    hm	25. oct. 2008	rev 1.1
    	code optimization
    	a_trig now also works for RES = 0

    *)
END_FUNCTION_BLOCK
