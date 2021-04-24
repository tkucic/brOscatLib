FUNCTION ISC_ALPHA
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=169*)
    IF setup.EXTENDED_ASCII THEN
    	ISC_ALPHA := (IN > 64 AND IN < 91) OR (IN > 191  AND IN <> 215 AND IN <> 247) OR (IN > 96 AND IN < 123);
    ELSE
    	ISC_ALPHA := (IN > 64 AND IN < 91) OR (IN > 96 AND IN < 123);
    END_IF

    (* revision history
    hm	6. mar. 2008	rev 1.0
    	original version

    hm	19. oct. 2008	rev 1.1
    	changes setup constants
    *)

END_FUNCTION
