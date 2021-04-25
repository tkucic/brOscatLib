FUNCTION SET_TOD
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=138*)
    SET_TOD := UDINT_TO_TOD(REAL_TO_UDINT(SECOND * 1000.0) + INT_TO_UDINT(MINUTE) * 60000 + INT_TO_UDINT(HOUR) * 3600000);

    (* revision history

    hm		4.aug.2006		rev 1.0
    	original version

    hm		11. sep 2007	rev 1.1
    	changed coding to avoid a compiler warning under twincat.

    hm		1. nov 2007	rev 1.2
    	changed coding to avoid possible overrun situation on möller ecp4

    hm		2. Nov	2007	rev 1.3
    	changed dword to DINT in calcualtion to avoid warnings with some compilers

    hm		14. mar 2008	rev 1.4
    	changed code to avoid rounding problem at last digit of millisecond

    hm		16. mar. 2008	rev 1.5
    	added type conversions to avoid warning under codesys 3.0
    *)
END_FUNCTION
