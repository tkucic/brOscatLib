FUNCTION REPLACE_CHARS
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=177*)
    REPLACE_CHARS := STR;
    (* make sure REP and SRC are of same length and length is > 0 *)
    a := LEN(SRC);
    b := LEN(REP);
    IF a < b THEN
    	REP := LEFT(REP, a);
    ELSIF b < a THEN
    	SRC := LEFT(SRC, b);
    END_IF

    (* search the STRing and REPlace if necessary *)
    stp := LEN(STR);
    FOR a := 1 TO stp DO
    	c := MID(REPLACE_CHARS, 1, a);
    	b := FIND(SRC, c);
    	IF b > 0 THEN
    		REPLACE_CHARS := REPLACE(REPLACE_CHARS, MID(REP, 1, b), 1, a);
    	END_IF
    END_FOR



    (* revision history
    hm	14. may. 2008	rev 1.0
    	original version

    *)

END_FUNCTION
