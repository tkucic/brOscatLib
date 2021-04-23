FUNCTION ARRAY_SUM
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=80*)
    stop := (SIZE -SIZEOF(PT)) / SIZEOF(PT);
    array_sum := PT^[0];
    FOR i := 1 TO stop DO
    	array_sum := array_sum + PT^[i];
    END_FOR

    (* revision history
    hm 	2. oct. 2006	rev 1.0
    	function created

    hm	16. mar. 2008	rev 1.1
    	changed type of input SIZE to uint

    *)
END_FUNCTION
