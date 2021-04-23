FUNCTION ISC_LOWER
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=171*)
    IF setup.EXTENDED_ASCII THEN
    	ISC_LOWER := ((in > 96) AND (in < 123)) OR ((in > 222) AND (in <> 247));
    ELSE
    	ISC_LOWER := ((in > 96) AND (in < 123));
    END_IF

    (* revision history
    hm	6. mar. 2008	rev 1.0
    	original version

    hm	19. oct. 2008	rev 1.1
    	changes setup constants
    *)
END_FUNCTION
