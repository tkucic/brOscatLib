FUNCTION ARRAY_MIN
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=78*)
    stop := (SIZE - SIZEOF(PT)) / SIZEOF(PT);
    array_min := PT^[0];
    FOR i := 1 TO stop DO
    	IF PT^[i] < array_min THEN array_min := PT^[i]; END_IF
    END_FOR


    (* revision history
    hm		2. oct. 2006
    	original version

    hm		16. mar. 2008
    	changed type of input SIZE to uint

    *)
END_FUNCTION
