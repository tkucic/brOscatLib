FUNCTION DAYS_IN_YEAR
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=119*)
    IF LEAP_OF_DATE(IDATE) THEN
    	DAYS_IN_YEAR := 366;
    ELSE
    	DAYS_IN_YEAR := 365;
    END_IF


    (* revision history
    hm	27. mar. 2009		rev 1.0
    	original version

    *)
END_FUNCTION