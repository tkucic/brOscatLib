FUNCTION DAY_TO_TIME
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=118*)
    DAY_TO_TIME := DWORD_TO_TIME(REAL_TO_DWORD(IN * 86400000.0));


    (* revision history
    hm	4. aug. 2006	rev 1.0
    	origINal release

    hm	24. feb. 2009	rev 1.1
    	renamed INput to IN
    *)
END_FUNCTION
