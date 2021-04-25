FUNCTION REPLACE_CHARS
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=177*)
    REPLACE_CHARS := STR;
    (* make sure rep and src are of same length and length is > 0 *)
    a := LEN(src);
    b := LEN(rep);
    IF a < b THEN
    	rep := LEFT(rep, a);
    ELSIF b < a THEN
    	src := LEFT(src, b);
    END_IF;

    (* search the string and replace if necessary *)
    stp := LEN(str);
    FOR a := 1 TO stp DO
    	c := MID(REPLACE_CHARS, 1, a);
    	b := FIND(src, c);
    	IF b > 0 THEN
    		REPLACE_CHARS := REPLACE(REPLACE_CHARS, MID(rep, 1, b), 1, a);
    	END_IF;
    END_FOR;



    (* revision history
    hm	14. may. 2008	rev 1.0
    	original version

    *)

END_FUNCTION
