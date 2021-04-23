FUNCTION MODR
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=60*)
    IF DIVI = 0.0 THEN
    	MODR := 0.0;
    ELSE
    	MODR := IN - DINT_TO_REAL(FLOOR2(IN / DIVI)) * DIVI;
    END_IF

    (* revision history

    hm	4. aug.2006		rev 1.0

    hm	28. jan.2007	rev 1.1
    	MODR(x,0) will deliver the result 0

    hm	21. mar 2008	rev 1.2
    	use D_trunc for compatibility reasons

    hm	4. apr. 2008	rev 1.3
    	added type conversion to avoid warnINgs under codesys 3.0

    hm	31. oct. 2008	rev 1.4
    	changed algorithm to the more common version usINg floor INstead of TRUNC

    hm	10. mar. 2009	rev 1.5
    	real constants updated to new systax usINg dot

    *)
END_FUNCTION
