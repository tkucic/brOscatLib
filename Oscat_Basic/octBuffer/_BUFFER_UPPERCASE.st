FUNCTION _BUFFER_UPPERCASE
    pos := 0;
    WHILE pos < size DO
    	PT^[pos] := TO_UPPER(pt^[pos]);
    	pos := pos + 1;
    END_WHILE

    _BUFFER_UPPERCASE := TRUE;

    (* revision History
    hm 	20. jan. 2011	rev 1.0
    	original version

    *)
END_FUNCTION