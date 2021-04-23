FUNCTION ARRAY_MIN
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=78*)
    stop := (size - SIZEOF(pt)) / SIZEOF(pt);
    array_min := pt^[0];
    FOR i := 1 TO stop DO
    	IF pt^[i] < array_min THEN array_min := pt^[i]; END_IF
    END_FOR


    (* revision history
    hm		2. oct. 2006
    	original version

    hm		16. mar. 2008
    	changed type of input size to uint

    *)
END_FUNCTION
