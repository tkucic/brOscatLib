FUNCTION LEAP_YEAR
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=127*)
    LEAP_YEAR := SHL(YR,14) = 0;

    (* this code was used prior to rev 1.1

    IF YR MOD 400 = 0 THEN LEAP_YEAR := TRUE;
    ELSIF YR MOD 100 = 0 THEN LEAP_YEAR := FALSE;
    ELSIF YR MOD 4 =0 THEN LEAP_YEAR := TRUE;
    ELSE LEAP_YEAR := FALSE;
    END_IF

    *)

    (* change history

    hm 	2.10.2006		rev 1.1
    	the function now works for any year from 1970 up to 2100

    hm	1. oct 2007		rev 1.2
    	chaged code for higher performance
    *)
END_FUNCTION
