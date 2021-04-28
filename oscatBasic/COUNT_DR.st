FUNCTION_BLOCK COUNT_DR
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=237*)
    _MX := DWORD_TO_UDINT(MX);
    _STEP := DWORD_TO_UDINT(STEP);
    _IN := DWORD_TO_UDINT(IN);
    IF RST THEN
    	_CNT := 0;
    ELSIF SET THEN
    	_CNT := LIMIT(0,_IN,_MX);
    ELSIF UP AND NOT last_up THEN
    	IF _STEP > _MX - _CNT THEN
    		_CNT := _CNT - _MX + _STEP - 1;
    	ELSE
    		_CNT := _CNT + _STEP;
    	END_IF
    ELSIF DN AND NOT last_dn THEN
    	IF _STEP > _CNT THEN
    		_CNT := _CNT - _STEP + _MX + 1;
    	ELSE
    		_CNT := _CNT - _STEP;
    	END_IF
    END_IF
    last_up := UP;
    last_dn := DN;
    CNT := UDINT_TO_DWORD(_CNT);
    (* revision history
    hm	12. jun 2008	rev 1.0
    	original version

    hm	20. jan. 2011	rev 1.1
    	corrected init value of MX to 16#FFFFFFFF

    *)
END_FUNCTION_BLOCK
