FUNCTION_BLOCK MANUAL_2
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=464*)
    IF ena THEN
    	IF NOT ON AND NOT OFF THEN
    		Q := IN;
    		STATUS := 100;
    	ELSIF on AND NOT off THEN
    		Q := TRUE;
    		STATUS := 101;
    	ELSIF NOT on AND off THEN
    		q := FALSE;
    		STATUS := 102;
    	ELSE
    		Q := MAN;
    		STATUS := 103;
    	END_IF
    ELSE
    	Q := FALSE;
    	STATUS := 104;
    END_IF



    (* revision history
    hm	22. sep. 2008		rev 1.0
    	original version

    *)
END_FUNCTION_BLOCK
