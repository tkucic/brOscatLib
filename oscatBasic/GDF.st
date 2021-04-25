FUNCTION GDF
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=54*)
    IF X = 0.0 THEN
    	GDF := 0.0;
    ELSIF X > 15.0 THEN
    	GDF := cPI05;
    ELSIF X < -15.0 THEN
    	GDF := -cPI05;
    ELSE
    	GDF := ATAN(EXP(X)) * 2.0 - cPI05;
    END_IF

    (* revision history
    hm	27. apr. 2008	rev 1.0
    	original version

    hm	18. oct. 2008	rev 1.1
    	using math constants

    hm	10. mar. 2009	rev 1.2
    	real constants updated to new systax using dot

    *)

END_FUNCTION
