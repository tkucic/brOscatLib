FUNCTION_BLOCK COUNT_BR
    IF rst THEN
    	cnt := 0;
    ELSIF set THEN
    	cnt := LIMIT(0,in,mx);
    ELSIF up AND NOT last_up THEN
    	cnt := INT_TO_BYTE(INC(cnt,step,mx));
    ELSIF dn AND NOT last_dn THEN
    	cnt := INT_TO_BYTE(inc(cnt,-step,mx));
    END_IF
    last_up := up;
    last_dn := dn;

    (* revision history
    hm	16. jan 2008	rev 1.0
    	original version

    *)
END_FUNCTION_BLOCK
