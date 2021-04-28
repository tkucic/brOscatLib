FUNCTION_BLOCK AIN1
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=270*)
    (*Convert all dwords to udint as its not possible to do dword math*)
    _CODE_MIN := DWORD_TO_UDINT(CODE_MIN);
    _CODE_MAX := DWORD_TO_UDINT(CODE_MAX);
    (* extract ERROR bit *)
    ERROR := ((SHR(IN,ERROR_BIT) AND 16#0000_0001) = 1) OR (ERROR_CODE_EN AND ERROR_CODE = IN);
    IF ERROR THEN
    	OUT := ERROR_OUTPUT;
    	RETURN;
    END_IF

    (* strip off the data input *)
    tB := SHR(SHL(DWORD_TO_UDINT(IN), 31 - BIT_N), 31 - BIT_N + BIT_0);

    (* extract OVERFLOW bit *)
    OVERFLOW := ((SHR(IN,OVERFLOW_BIT) AND 16#0000_0001) = 1) OR (OVERFLOW_CODE_EN AND OVERFLOW_CODE = IN) OR (tB < _CODE_MIN OR tB > _CODE_MAX);
    IF OVERFLOW THEN
    	OUT := OVERFLOW_OUTPUT;
    	RETURN;
    END_IF

    (* extract SIGN bit *)
    SIGN := (SHR(IN,SIGN_BIT) AND 16#0000_0001) = 1;

    (* convert IN to OUT *)
    OUT := (UDINT_TO_REAL(tB - _CODE_MIN) * (OUT_MAX - OUT_MIN) / UDINT_TO_REAL(_CODE_MAX - _CODE_MIN) + OUT_MIN);
    IF SIGN THEN OUT := OUT * -1.0; END_IF



    (* revision history
    hm	23. feb 2008	rev 1.0
    	original version

    hm	16. mar 2008	rev 1.1
    	added type conversions to avoid warnngs under codesys 30

    hm	22. apr. 2008	rev 1.2
    	corrected ERROR IN formula when CODE_MIN was set
    	corrected ERROR when SIGN bit was used
    	optimized code for better performance

    hm	10. mar. 2009	rev 1.3
    	real constants updated to new systax using dot

    *)
END_FUNCTION_BLOCK
