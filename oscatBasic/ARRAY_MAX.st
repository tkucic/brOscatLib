FUNCTION ARRAY_MAX
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=77*)
    stop := (SIZE -SIZEOF(PT)) / SIZEOF(PT);
    ARRAY_MAX := PT[0];
    FOR i := 1 TO stop DO
    	IF PT[i] > ARRAY_MAX THEN ARRAY_MAX := PT[i]; END_IF
    END_FOR

    (* revision history
    hm	2. oct 2006		rev 1.0
    	original version

    hm	16. mar. 2008	rev 1.1
    	changed input SIZE to uint
    *)
END_FUNCTION
