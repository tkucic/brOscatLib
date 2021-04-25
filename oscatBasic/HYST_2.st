FUNCTION_BLOCK HYST_2
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=424*)
    tmp := val - hys * 0.5;
    IF in < tmp THEN
    	Q := FALSE;
    	win := FALSE;
    ELSIF in > tmp + hys THEN
    	Q := TRUE;
    	win := FALSE;
    ELSE
    	win := TRUE;
    END_IF;



    (* revision history
    hm		4. aug 2006	rev 1.0
    	original version

    hm		5. jan 2008	rev 1.1
    	improved code for better performance

    hm		2. jun. 2008	rev 1.2
    	improved performance
    *)
END_FUNCTION_BLOCK
