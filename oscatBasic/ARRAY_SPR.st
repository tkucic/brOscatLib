FUNCTION ARRAY_SPR
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=79*)
    stop := (SIZE -SIZEOF(PT)) / SIZEOF(PT);
    array_min := PT^[0];
    array_max := PT^[0];
    FOR i := 1 TO stop DO
    	IF PT^[i] > array_max THEN array_max := PT^[i];
    	ELSIF PT^[i] < array_min THEN array_min := PT^[i];
    	END_IF
    END_FOR
    array_spr := array_max - array_min;


    (* revision history
    hm 	2. oct. 2006	rev 1.0
    	original version

    hm	16. mar. 2008	rev 1.1
    	changed type of input SIZE to uint

    *)
END_FUNCTION
