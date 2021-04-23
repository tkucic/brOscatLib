FUNCTION ISC_UPPER
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=172*)
    IF setup.EXTENDED_ASCII THEN
    	ISC_UPPER :=  ((IN > 64) AND (IN < 91)) OR (((IN > 191) AND (IN < 223)) AND (IN <> 215));
    ELSE
    	ISC_UPPER := ((IN > 64) AND (IN < 91));
    END_IF


    (* revision history
    hm	6. mar. 2008	rev 1.0
    	origINal version

    hm	19. oct. 2008	rev 1.1
    	changes setup constants

    *)
END_FUNCTION
