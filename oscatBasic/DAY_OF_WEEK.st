FUNCTION DAY_OF_WEEK
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=117*)
    DAY_OF_WEEK := UDINT_TO_INT((DATE_TO_UDINT(IDATE) / 86400 + 3) MOD 7) + 1;


    (* revision history
    hm 	21.8.06 		rev 1.1
    	corrected a miscalculation

    hm	23.12.2007		rev 1.2
    	correction for step7

    hm	7. apr. 2008	rev 1.3
    	deleted unused step7 code

    hm	7. oct. 2008	rev 1.4
    	changed name of function from weekday to DAY_OF_WEEK

    *)




END_FUNCTION
