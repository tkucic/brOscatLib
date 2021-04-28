FUNCTION_BLOCK SW_RECONFIG
    (*http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=57*)
    (* run debounce circuit *)
    T1(IN := IN, PT := TD);

    IF TR > t#0s THEN
    	(* generate output *)
    	Q := T1.Q XOR INV;
    	(* reconfiguration timer *)
    	T2(IN := Q, PT := TR);
    	(* when T2.Q goes high then reverse INV *)
    	IF T2.Q THEN INV := NOT INV; END_IF
    ELSE
    	Q := T1.Q;
    END_IF



    (* revision history
    hm	22.10.2008	rev 1.0
    	original version

    *)

END_FUNCTION_BLOCK
