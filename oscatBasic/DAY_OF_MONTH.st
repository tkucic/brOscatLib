FUNCTION DAY_OF_MONTH
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=116*)
    (* calculate the day in the year *)
    DAY_OF_MONTH := DAY_OF_YEAR(IDATE);
    (* leap will be set to one for a leap year *)
    leap := BOOL_TO_INT(LEAP_OF_DATE(IDATE));
    (* if leap year deduct one from the days of the year *)
    DAY_OF_MONTH := DAY_OF_MONTH - leap;
    (* search if we are in month december to march ? *)
    IF DAY_OF_MONTH > cMTH_OFS[9] THEN
    	IF DAY_OF_MONTH > cMTH_OFS[11] THEN
    		IF DAY_OF_MONTH > cMTH_OFS[12] THEN
    			DAY_OF_MONTH := DAY_OF_MONTH - cMTH_OFS[12];
    		ELSE
    			DAY_OF_MONTH := DAY_OF_MONTH - cMTH_OFS[11];
    		END_IF
    	ELSE
    		IF DAY_OF_MONTH > cMTH_OFS[10] THEN
    			DAY_OF_MONTH := DAY_OF_MONTH - cMTH_OFS[10];
    		ELSE
    			DAY_OF_MONTH := DAY_OF_MONTH - cMTH_OFS[9];
    		END_IF
    	END_IF
    ELSIF DAY_OF_MONTH > cMTH_OFS[5] THEN
    	IF DAY_OF_MONTH > cMTH_OFS[7] THEN
    		IF DAY_OF_MONTH > cMTH_OFS[8] THEN
    			DAY_OF_MONTH := DAY_OF_MONTH - cMTH_OFS[8];
    		ELSE
    			DAY_OF_MONTH := DAY_OF_MONTH - cMTH_OFS[7];
    		END_IF
    	ELSE
    		IF DAY_OF_MONTH > cMTH_OFS[6] THEN
    			DAY_OF_MONTH := DAY_OF_MONTH - cMTH_OFS[6];
    		ELSE
    			DAY_OF_MONTH := DAY_OF_MONTH - cMTH_OFS[5];
    		END_IF
    	END_IF
    ELSIF DAY_OF_MONTH > cMTH_OFS[3] THEN
    	IF DAY_OF_MONTH > cMTH_OFS[4] THEN
    		DAY_OF_MONTH := DAY_OF_MONTH - cMTH_OFS[4];
    	ELSE
    		DAY_OF_MONTH := DAY_OF_MONTH - cMTH_OFS[3];
    	END_IF
    ELSE
    	(* since now we must be in february or january we need to add leap again *)
    	DAY_OF_MONTH := DAY_OF_MONTH + leap;
    	IF DAY_OF_MONTH > cMTH_OFS[2] THEN DAY_OF_MONTH := DAY_OF_MONTH - cMTH_OFS[2]; END_IF
    	(* since nothing was true before, DAY_OF_MONTH must already be good *)
    END_IF


    (*
    Revision history

    hm 22.1.2007		rev 1.1
    	deleted unused variable day_in_year and day_in_year_begin

    hm	1. okt 2007	rev 1.2
    	changed code to use day_of_year and leap_of_date
    	added compatibility to STEP7

    hm	8. oct 2007	rev 1.3
    	deleted unused variable yr

    hm	8. jan 2008	rev 1.4
    	improved performance

    hm	25. oct. 2008	rev 2.0
    	new code using setup constants

    hm	10. mar. 2009	rev 2.1
    	removed nested comments

    *)


END_FUNCTION
