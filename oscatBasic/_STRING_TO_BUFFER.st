FUNCTION _STRING_TO_BUFFER
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=479*)
    ps ACCESS ADR(STR);
    end := MIN(POS + LEN(STR), UINT_TO_INT(SIZE));
    IF end > 0 THEN end := end -1; END_IF
    FOR i := POS TO end DO
    	PT[i] := ps;
    	ps ACCESS (ADR(ps) + 1);
    END_FOR

    _STRING_TO_BUFFER := i;

    (* revision History

    hm 	5. mar. 2008	rev 1.0
    	original version

    hm	16. mar. 2008	rev 1.1
    	changed type of input SIZE to uint

    hm	13. may. 2008	rev 1.2
    	changed type of pointer to array[1..32767]
    	changed SIZE of string to STRING_LENGTH

    hm	12. nov. 2009	rev 1.3
    	limit end to SIZE - 1

    hm	2. jan 2012	rev 1.4
    	return the position after the input string when finished
    *)
END_FUNCTION
