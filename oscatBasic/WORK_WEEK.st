FUNCTION WORK_WEEK
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=142*)
    (* berechne den 1.1 des jahres von IDATE. *)
    yr := YEAR_OF_DATE(IDATE);
    d1 := YEAR_BEGIN(yr);
    (* wochentag von d1 *)
    w1 := DAY_OF_WEEK(d1);
    (* offset des montags der eletzten KW des vorjahres *)
    (* wenn der erste tag des jahres größer als donnerstag ist dann beginnt die letzte kw am montag davor *)
    (* wenn der erste tag des jahres ein donnerstag oder kleiner ist beginnt die erste kw 2 montage davor *)
    IF w1 < 5 THEN
    	ds := DATE_TO_UDINT(d1) - INT_TO_UDINT(w1+6) * 86400;
    ELSE
    	ds := DATE_TO_UDINT(d1) - INT_TO_UDINT(w1-1) * 86400;
    END_IF

    (* kalenderwoche des eingangsdatums *)
    WORK_WEEK := UDINT_TO_INT((DATE_TO_UDINT(IDATE) - ds) / 604800);

    (* korrektur wenn WORK_WEEK = 0 *)
    IF WORK_WEEK = 0 THEN
    	(* WORK_WEEK needs to be 53 when 1.jan of the year before is thursday or dec 31. is thursday. *)
    	(* first and last weekday of a year is equal and one more day for a LEAP_YEAR. *)
    	IF w1 > 1 THEN w31 := w1 - 1; ELSE w31 := 7; END_IF
    	IF LEAP_YEAR(yr - 1) AND w31 > 1 THEN w01 := w31 - 1; ELSE w1 := 7; END_IF
    	(* if first or last day of a year is a thursday, the year has 53 weeks *)
    	WORK_WEEK := 52 + BOOL_TO_INT(w31 = 4 OR w01 = 4);
    ELSE
    	(* end of year calculation *)
    	(* calculated the first and last weekday *)
    	IF LEAP_YEAR(yr) THEN
    		IF w1 < 7 THEN w31 := w1 + 1; ELSE w31 := 1; END_IF
    	ELSE
    		w31 := w1;
    	END_IF
    	(* if first or last day is thursday then the year has 53 weeks otherwise only 52 *)
    	wm := 52 + BOOL_TO_INT(w31 = 4 OR w1 = 4);
    	IF WORK_WEEK > wm THEN WORK_WEEK := 1; END_IF
    END_IF



    (* revision history

    hm 	17.1.2007		rev 1.1
    	deleted unused variable yday

    hm	19. dec 2007	rev 1.2
    	changed code for better performance
    	changed code to comply with ISO8601

    hm	16. mar 2008	rev 1.3
    	added type conversions to avoid warnings under codesys 3.0

    hm	7. oct. 2008	rev 1.4
    	changed function year to year_of_date
    	changed function weekday to day_of_week

    hm	25. oct. 2008	rev 1.5
    	optimized code for performance
    *)
END_FUNCTION
