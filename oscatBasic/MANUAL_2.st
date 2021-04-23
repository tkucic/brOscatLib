FUNCTION_BLOCK MANUAL_2
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=464*)
    IF ENA THEN
    	IF NOT ON AND NOT OFF THEN
    		Q := IN;
    		STATUS := 100;
    	ELSIF ON AND NOT OFF THEN
    		Q := TRUE;
    		STATUS := 101;
    	ELSIF NOT ON AND OFF THEN
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



    (* revisiON history
    hm	22. sep. 2008		rev 1.0
    	origINal versiON

    *)
END_FUNCTION_BLOCK
