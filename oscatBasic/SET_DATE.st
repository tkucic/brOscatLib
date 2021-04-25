FUNCTION SET_DATE
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=136*)
    IF (MONTH > 2) AND (SHL(YEAR,14) = 0)
    THEN (* we add one DAY for leap YEAR *)
    	SET_DATE := UDINT_TO_DATE((INT_TO_UDINT(ofs[MONTH] + DAY ) + SHR(INT_TO_UDINT(YEAR) * 1461 - 2878169, 2))*86400);
    ELSE
    	SET_DATE := UDINT_TO_DATE((INT_TO_UDINT(ofs[MONTH] + DAY - 1 ) + SHR(INT_TO_UDINT(YEAR) * 1461 - 2878169, 2))*86400);
    END_IF


    (* old code
    IF MONTH > 2 THEN
    	count := (MONTH - 1) * 30;
    	IF MONTH > 7 THEN count := count + SHR(MONTH - 3,1); ELSE count := count + SHR(MONTH - 4,1); END_IF
    	(* chech for leap YEAR and add one DAY if true 
    	IF SHL(YEAR,14) = 0 THEN count := count + 1; END_IF
    ELSE
    	count := (MONTH - 1) * 31;
    END_IF

    SET_DATE := UDINT_TO_DATE((INT_TO_UDINT(count + DAY - 1) + SHR(INT_TO_UDINT(YEAR) * 1461 - 2878169, 2)) * 86400);
    *)

    (* revision history
    hm	4. aug. 2006	rev 1.0
    	original version

    hm	19 sep. 2007	rev 1.1
    	use function leap_year to calculate leap YEAR, more exceptions are handled

    hm	1. okt	2007	rev 1.2
    	added compatibility to step7

    hm	16.dec 2007		rev 1.3
    	changed code to improove performance

    hm	3. jan. 2008	rev 1.4
    	further improvements in performance

    hm	16. mar. 2008	rev 1.5
    	added type conversions to avoid warnings under codesys 3.0

    hm	7. apr. 2008	rev 1.6
    	deleted unused step7 code

    hm	14. oct. 2008	rev 1.7
    	optimized code for better performance

    hm	25. oct. 2008	rev 2.0
    	new code using setup constants

    hm	16. nov. 2008	rev 2.1
    	added typecasts to avoid warnings

    hm	22. jan. 2011	rev 2.2
    	improved performance

    hm	29. dec. 2011	rev 2.3
    	improved performance

    hm 3. FEB 2021 rev 2.4
    	new code to be more readable
    *)
END_FUNCTION
