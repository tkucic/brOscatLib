FUNCTION SET_DATE
    (* calculate the amount of days to 31.12. the year before *)
    count := SHR(INT_TO_DWORD(YEAR) * 1461 - 2878172, 2) + INT_TO_DWORD(DAY + setup.MTH_OFS[LIMIT(1,month,12)]);
    (* for leap years and month > february then add one more day *)
    IF MONTH < 3 AND LEAP_YEAR(YEAR) THEN
    	SET_DATE := DWORD_TO_DATE((count - 1) * 86400);
    ELSE
    	SET_DATE := DWORD_TO_DATE(count * 86400);
    END_IF


    (* revision history
    hm	4. aug. 2006	rev 1.0
    	original version

    hm	19 sep. 2007	rev 1.1
    	use function leap_year to calculate leap year, more exceptions are handled

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
    *)
END_FUNCTION
