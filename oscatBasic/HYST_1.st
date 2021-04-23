FUNCTION_BLOCK HYST_1
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=422*)
    IF IN < LOW THEN
    	Q := FALSE;
    	wIN := FALSE;
    ELSIF IN > HIGH THEN
    	Q := TRUE;
    	wIN := FALSE;
    ELSE
    	wIN := TRUE;
    END_IF




    (* revision history
    hm		4.  aug. 2006	rev 1.0
    	origINal version

    hm		2. jun. 2008	rev 1.1
    	improved performance
    *)
END_FUNCTION_BLOCK
