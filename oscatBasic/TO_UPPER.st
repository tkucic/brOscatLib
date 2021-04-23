FUNCTION TO_UPPER
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=180*)
    IF IN > 96 AND IN < 123 THEN
       TO_UPPER := IN AND 16#DF;
    ELSIF IN > 223 AND IN <> 247 AND IN <> 255 AND setup.EXTENDED_ASCII THEN
       TO_UPPER := IN AND 16#DF;
    ELSE
       TO_UPPER := IN;
    END_IF




    (* revision history
    hm	6. mar. 2008	rev 1.0
    	origINal version

    hm	19. oct. 2008	rev 1.1
    	changed setup constants

    ks	25. oct. 2008	rev 1.2
    	optimized code

    hm 16. jan 2009	rev 1.3
    	corrected an error IN module

    *)
END_FUNCTION
