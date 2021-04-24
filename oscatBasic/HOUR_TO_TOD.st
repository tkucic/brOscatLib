FUNCTION HOUR_TO_TOD
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=125*)
    HOUR_TO_TOD := DWORD_TO_TOD(REAL_TO_DWORD(IN * 3600000));


    (* revision history
    hm	4. aug. 2006	rev 1.0
    	original version

    hm	14. mar. 2008	rev 1.1
    	rounded the input after the last digit

    hm	24. feb. 2009	rev 1.2
    	changed input to IN
    *)
END_FUNCTION
