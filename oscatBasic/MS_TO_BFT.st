FUNCTION MS_TO_BFT
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=368*)
    MS_TO_BFT := REAL_TO_INT(EXPT(MS * 1.196172, 0.666667));


    (* revision history
    hm	12. 6. 2008		rev 1.0
    	original version

    *)
END_FUNCTION
