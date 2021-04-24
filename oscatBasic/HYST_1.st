FUNCTION_BLOCK HYST_1
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=422*)
    IF IN < LOW THEN
    	Q := FALSE;
    	WIN := FALSE;
    ELSIF IN > HIGH THEN
    	Q := TRUE;
    	WIN := FALSE;
    ELSE
    	WIN := TRUE;
    END_IF




    (* revision history
    hm		4.  aug. 2006	rev 1.0
    	original version

    hm		2. jun. 2008	rev 1.1
    	improved performance
    *)
END_FUNCTION_BLOCK
