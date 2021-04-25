FUNCTION YEAR_OF_DATE
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=144*)
    YEAR_OF_DATE := UDINT_TO_INT((DATE_TO_UDINT(IDATE) + 43200) / 31557600 + 1970);


    (* revision history
    hm	4. aug 2006		rev 1.0
    	original version

    hm	1. okt 2007		rev 1.1
    	corrected error in algorithm
    	adjustment for S7 compatibility

    hm	23.12.2007		rev 1.2
    	changed code for better performance

    hm	7. apr. 2008	rev 1.3
    	deleted unused step7 code

    hm	7. oct. 2008	rev 1.4
    	renamed function (year) to YEAR_OF_DATE

    *)
END_FUNCTION
