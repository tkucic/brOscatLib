FUNCTION _ARRAY_INIT
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=72*)
    stop := SHR(SIZE,2)-1;
    FOR i := 0 TO stop DO
    	PT^[i] := INIT;
    END_FOR

    _ARRAY_INIT := TRUE;

    (* revision History

    hm 6.1.2007		rev 1.1
    	change type of function to bool
    	added  array_INIT := true to set output true.

    hm	14.11.2007	rev 1.2
    	changed stop calculation to be more efficient

    hm	16.3. 2008		rev 1.3
    	changed type of input SIZE to uint
    *)
END_FUNCTION
