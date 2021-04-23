FUNCTION SECOND_TO_TIME
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=136*)
    SECOND_TO_TIME := DWORD_TO_TIME(REAL_TO_DWORD(IN * 1000.0));

    (* revision history
    hm	4. aug. 2006	rev 1.0
    	origINal version

    hm	14. mar. 2008	rev 1.1
    	rounded the INput after the last digit

    hm	24. feb. 2009	rev 1.2
    	changed INput to IN
    *)
END_FUNCTION
