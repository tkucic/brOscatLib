FUNCTION DEAD_ZONE
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=394*)
    IF ABS(X) > L THEN
    	DEAD_ZONE := X;
    ELSE
    	DEAD_ZONE := 0.0;
    END_IF

    (* revision history
    hm	12. feb. 2007	rev 1.0
    	original version

    hm	14. jun. 2008	rev 1.1
    	improved performance

    hm	11. mar. 2009	rev 1.2
    	real constants updated to new systax using dot

    *)
END_FUNCTION
