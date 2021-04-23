FUNCTION _ARRAY_ABS
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=71*)
    stop := SHR(size,2)-1;
    FOR i := 0 TO stop DO
    	PT^[i] := ABS(PT^[i]);
    END_FOR
    _ARRAY_ABS := TRUE;


    (* revision history
    hm	2. apr 2008		rev 1.0
    	original version

    *)
END_FUNCTION
