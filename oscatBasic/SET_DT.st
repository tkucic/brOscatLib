FUNCTION SET_DT
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=137*)
    SET_DT := UDINT_TO_DT(DATE_TO_UDINT(SET_DATE(YEAR, MONTH, DAY)) + INT_TO_UDINT(SECOND) + INT_TO_UDINT(MINUTE) * 60 + INT_TO_UDINT(HOUR) * 3600);


    (* revision history
    hm	4. aug. 2006		rev 1.0
    	original version

    hm		19 sep. 2007	rev 1.1
    	use function leap_year to calculate leap YEAR, more exceptions are handled

    hm		1. okt 2007		rev 1.2
    	added step7 compatibility
    	call function set_date

    hm		8. oct 2007		rev 1.3
    	deleted unused variables count and leap

    hm		1. 11 2007		rev 1.4
    	converted HOUR type integer to dword in calculation to avoid overrun on möller ecp4

    hm		16. mar 2008	rev 1.5
    	added type conversions to avoid warnings under codesys 3.0
    *)


END_FUNCTION
