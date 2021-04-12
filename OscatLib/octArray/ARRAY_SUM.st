FUNCTION ARRAY_SUM
    stop := (size -SIZEOF(pt)) / SIZEOF(pt);
    array_sum := pt^[0];
    FOR i := 1 TO stop DO
    	array_sum := array_sum + pt^[i];
    END_FOR

    (* revision history
    hm 	2. oct. 2006	rev 1.0
    	function created

    hm	16. mar. 2008	rev 1.1
    	changed type of input size to uint

    *)
END_FUNCTION
