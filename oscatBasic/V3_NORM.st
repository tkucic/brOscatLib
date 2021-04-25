FUNCTION V3_NORM
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=110*)
    la := V3_ABS(A);
    IF la > 0.0 THEN
    	V3_SMUL(A, 1.0 / la, RETVAL);
        V3_NORM := TRUE;
    ELSE
        V3_NORM := FALSE;
    END_IF
    
    
    (* revision history
    hm	11 dec 2007	rev 1.0
    	original version

    hm	10. mar. 2009	rev 1.1
    	changed syntax of real constants to 0.0

    *)
END_FUNCTION
