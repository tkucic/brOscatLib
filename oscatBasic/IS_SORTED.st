FUNCTION IS_SORTED
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=82*)
    stop := UINT_TO_INT(SHR(SIZE,2)-2);
    FOR i := 0 TO stop DO
    	IF PT^[i] > PT^[i+1] THEN
    		IS_SORTED := FALSE;
    		RETURN;
    	END_IF
    END_FOR

    IS_SORTED := TRUE;

    (* revision history

    hm 	29. mar. 2008 	rev 1.0
    	original version

    hm	4. apr. 2008	rev 1.1
    	added type conversion to avoid warnings under codesys 3.0
    *)

END_FUNCTION
