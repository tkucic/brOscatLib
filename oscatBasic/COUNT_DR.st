FUNCTION_BLOCK COUNT_DR
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=237*)
    IF RST THEN
    	CNT := 0;
    ELSIF SET THEN
    	CNT := LIMIT(0,IN,MX);
    ELSIF UP AND NOT last_UP THEN
    	IF STEP > MX - CNT THEN
    		CNT := CNT - MX + STEP - 1;
    	ELSE
    		CNT := CNT + STEP;
    	END_IF
    ELSIF DN AND NOT last_DN THEN
    	IF STEP > CNT THEN
    		CNT := CNT - STEP + MX + 1;
    	ELSE
    		CNT := CNT - STEP;
    	END_IF
    END_IF
    last_UP := UP;
    last_DN := DN;

    (* revision history
    hm	12. jun 2008	rev 1.0
    	origINal version

    hm	20. jan. 2011	rev 1.1
    	corrected INit value of MX to 16#FFFFFFFF

    *)
END_FUNCTION_BLOCK
