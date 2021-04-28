FUNCTION BUFFER_SEARCH
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=481*)
    ps ACCESS ADR(STR);
    lx := LEN(STR);
    end := MIN(SIZE - lx, SIZE - 1);
    lx := lx - 1;
    FOR i := POS TO end DO
    	FOR k := 0 TO lx DO
    		IF IGN THEN chx := TO_UPPER(PT[i+k]); ELSE chx := PT[i+k]; END_IF
    		IF ps[k] <> chx THEN EXIT; END_IF
    	END_FOR
    	IF k > lx THEN
    		BUFFER_SEARCH := i;
    		RETURN;
    	END_IF
    END_FOR
    BUFFER_SEARCH := -1;


    (* revision History

    hm 5. mar. 2008	rev 1.0
    	original version

    hm	16. mar. 2008	rev 1.1
    	chaged type of input SIZE to uint

    hm	13. may. 2008	rev 1.2
    	changed type of pointer to array[1..32767]
    	changed SIZE of string to STRING_LENGTH

    hm	12. nov. 2009	rev 1.3
    	limit end to array SIZE

    hm	25. jan. 2011	rev 1.4
    	IGN = True will now ignore case
    	return -1 if nothing found
    *)
END_FUNCTION
