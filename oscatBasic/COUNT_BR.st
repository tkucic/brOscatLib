FUNCTION_BLOCK COUNT_BR
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=236*)
    IF RST THEN
    	CNT := 0;
    ELSIF SET THEN
    	CNT := LIMIT(0,IN,MX);
    ELSIF UP AND NOT last_up THEN
    	CNT := INT_TO_BYTE(INC(CNT,STEP,MX));
    ELSIF DN AND NOT last_dn THEN
    	CNT := INT_TO_BYTE(INC(CNT,-STEP,MX));
    END_IF
    last_up := UP;
    last_dn := DN;

    (* revision history
    hm	16. jan 2008	rev 1.0
    	original version

    *)
END_FUNCTION_BLOCK
