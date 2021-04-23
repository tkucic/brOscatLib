FUNCTION_BLOCK D_TRIG
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=195*)
    Q := IN <> last_IN;
    X := IN - last_IN;
    last_IN := IN;


    (* revision history

    hm 	4.09.2007		rev 1.0
    	origINal version released

    hm	19. feb. 2008	rev 1.1
    	performance improvement
    *)
END_FUNCTION_BLOCK
