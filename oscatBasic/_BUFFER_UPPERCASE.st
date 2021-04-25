FUNCTION _BUFFER_UPPERCASE
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=479*)
    pos := 0;
    WHILE pos < SIZE DO
    	PT[pos] := TO_UPPER(PT[pos]);
    	pos := pos + 1;
    END_WHILE

    _BUFFER_UPPERCASE := TRUE;

    (* revision History
    hm 	20. jan. 2011	rev 1.0
    	original version

    *)
END_FUNCTION
