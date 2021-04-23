FUNCTION _BUFFER_INSERT
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=478*)
    lx := LEN(STR);
    end := POS + lx;
    (* first move the upper part of the buffer to make space for the STRing *)
    FOR i := UINT_TO_INT(SIZE) - 1 TO end BY -1 DO
    	PT^[i] := PT^[i-lx];
    END_FOR
    (* copy the STRing *)
    _BUFFER_INSERT := _STRING_TO_BUFFER(STR, POS, PT, SIZE);


    (* revision History
    hm 	9. mar. 2008	rev 1.0
    	original version

    hm	16. mar. 2008	rev 1.1
    	changed type of input SIZE to uint

    hm	13. may. 2008	rev 1.2
    	changed type of pointer to array[1..32767]
    	changed SIZE of STRing to STRING_LENGTH

    hm	23. mar. 2009	rev 1.3
    	avoid writing to input POS

    hm	12. nov. 2009	rev 1.4
    	code oPTimized

    hm 2. jan 2012	rev 1.5
    	function now returns the next POSition after the input STRing

    *)
END_FUNCTION