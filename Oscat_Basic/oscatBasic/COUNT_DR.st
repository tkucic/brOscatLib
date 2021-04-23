FUNCTION_BLOCK COUNT_DR
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=237*)
    IF rst THEN
    	cnt := 0;
    ELSIF set THEN
    	cnt := LIMIT(0,in,mx);
    ELSIF up AND NOT last_up THEN
    	IF STEP > MX - CNT THEN
    		CNT := CNT - MX + STEP - 1;
    	ELSE
    		CNT := CNT + STEP;
    	END_IF
    ELSIF dn AND NOT last_dn THEN
    	IF STEP > CNT THEN
    		CNT := CNT - STEP + MX + 1;
    	ELSE
    		CNT := CNT - STEP;
    	END_IF
    END_IF
    last_up := up;
    last_dn := dn;

    (* revision history
    hm	12. jun 2008	rev 1.0
    	original version

    hm	20. jan. 2011	rev 1.1
    	corrected init value of MX to 16#FFFFFFFF

    *)
END_FUNCTION_BLOCK
