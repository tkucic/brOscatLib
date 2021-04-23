FUNCTION_BLOCK SW_RECONFIG
    (*http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=57*)
    (* run debounce circuit *)
    t1(IN := IN, PT := TD);

    IF TR > t#0s THEN
    	(* generate output *)
    	Q := t1.Q XOR INv;
    	(* reconfiguration timer *)
    	T2(IN := Q, pt := TR);
    	(* when T2.Q goes high then reverse INV *)
    	IF T2.Q THEN INV := NOT INV; END_IF
    ELSE
    	Q := t1.Q;
    END_IF



    (* revision history
    hm	22.10.2008	rev 1.0
    	origINal version

    *)

END_FUNCTION_BLOCK
