FUNCTION ARRAY_GAV
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=76*)
    stop := SHR(SIZE,2)-1;
    ARRAY_GAV := 1.0;
    FOR i := 0 TO stop DO
    	IF PT^[i] > 0.0 THEN
    		ARRAY_GAV := ARRAY_GAV * PT^[i];
    	ELSE
    		ARRAY_GAV := 0.0;
    		RETURN;
    	END_IF
    END_FOR
    ARRAY_GAV := SQRTN(ARRAY_GAV,UINT_TO_INT(stop)+1);


    (* revision history
    hm	2. apr 2008	rev 1.0
    	original version

    hm	10. mar. 2009	rev 1.1
    	real constants updated to new systax using dot

    *)
END_FUNCTION
