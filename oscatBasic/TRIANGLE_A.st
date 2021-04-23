FUNCTION TRIANGLE_A
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=107*)
    IF A = 0.0 THEN
    	TRIANGLE_A := SQRT((S1+S2+S3) * (S1+S2-S3) * (S2+S3-S1) * (S3+S1-S2)) * 0.25;
    ELSE
    	TRIANGLE_A := S1 * S2 * SIN(RAD(A)) * 0.5;
    END_IF

    (* revision histroy
    hm	16. oct 2007	rev 1.0
    	original version

    hm	22. feb 2008	rev 1.1
    	improved performance

    hm	10. mar. 2009	rev 1.2
    	changed syntax of real constants to 0.0

    *)
END_FUNCTION
