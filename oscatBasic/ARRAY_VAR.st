FUNCTION ARRAY_VAR
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=81*)
    (* at first we calualte the arithmetic average of the array *)

    stop := SHR(SIZE,2)-1;
    avg := PT[0];
    FOR i := 1 TO stop DO
    	avg := avg + PT[i];
    END_FOR
    avg := avg / UINT_TO_REAL(stop + 1);

    (* in a second run we calculate the variance of the array *)

    ARRAY_VAR := (PT[0] - avg) * (PT[0] - avg);
    FOR i := 1 TO stop DO
    	ARRAY_VAR := ARRAY_VAR + (PT[i] - avg) * (PT[i] - avg);
    END_FOR
    ARRAY_VAR := ARRAY_VAR / UINT_TO_REAL(stop);

    (* revision history
    hm 	1.4.2007	rev 1.0
    	function created

    hm	12.12.2007	rev 1.1
    	changed code for better performance

    hm	16. mar. 2008	rev 1.2
    	changed type of input SIZE to uint

    hm	10. mar. 2009	rev 1.3
    	added type conversions for compatibility reasons
    *)
END_FUNCTION
