FUNCTION_BLOCK HYST_3
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=425*)
    X := HYST * 0.5;
    IF IN < VAL1 - X THEN
    	Q1 := TRUE;
    ELSIF IN > VAL1 + X THEN
    	Q1 := FALSE;
    END_IF
    IF IN < VAL2 - X THEN
    	Q2 := FALSE;
    ELSIF IN > VAL2 + X THEN
    	Q2 := TRUE;
    END_IF



    (* revision history
    hm	22. jan 2007	rev 1.0
    	original version

    hm	27. dec 2007	rev 1.1
    	changed code for better performance

    hm	5. jan 2008	rev 1.2
    	further performance iprovements

    *)

END_FUNCTION_BLOCK
