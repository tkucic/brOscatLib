FUNCTION_BLOCK HYST_1
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=422*)
    IF in < low THEN
    	Q := FALSE;
    	win := FALSE;
    ELSIF in > high THEN
    	Q := TRUE;
    	win := FALSE;
    ELSE
    	win := TRUE;
    END_IF




    (* revision history
    hm		4.  aug. 2006	rev 1.0
    	original version

    hm		2. jun. 2008	rev 1.1
    	improved performance
    *)
END_FUNCTION_BLOCK
