FUNCTION_BLOCK AIN1
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=270*)
    (* extract ERROR bit *)
    ERROR := ((SHR(IN,ERROR_BIT) AND 16#0000_0001) = 1) OR (ERROR_CODE_EN AND ERROR_CODE = IN);
    IF ERROR THEN
    	OUT := ERROR_OUTPUT;
    	RETURN;
    END_IF

    (* strip off the data INput *)
    tb := SHR(SHL(IN, 31 - bit_N), 31 - bit_N + BIT_0);

    (* extract OVERFLOW bit *)
    OVERFLOW := ((SHR(IN,OVERFLOW_BIT) AND 16#0000_0001) = 1) OR (OVERFLOW_CODE_EN AND OVERFLOW_CODE = IN) OR (tb < code_mIN OR tb > CODE_MAX);
    IF OVERFLOW THEN
    	OUT := OVERFLOW_OUTPUT;
    	RETURN;
    END_IF

    (* extract SIGN bit *)
    SIGN := (SHR(IN,SIGN_BIT) AND 16#0000_0001) = 1;

    (* convert IN to OUT *)
    OUT := (DWORD_TO_REAL(tb - code_mIN) * (OUT_MAX - OUT_mIN) / DWORD_TO_REAL(CODE_MAX - code_mIN) + OUT_mIN);
    IF SIGN THEN OUT := OUT * -1.0; END_IF



    (* revision history
    hm	23. feb 2008	rev 1.0
    	origINal version

    hm	16. mar 2008	rev 1.1
    	added type conversions to avoid warnngs under codesys 30

    hm	22. apr. 2008	rev 1.2
    	corrected ERROR IN formula when code_mIN was set
    	corrected ERROR when SIGN bit was used
    	optimized code for better performance

    hm	10. mar. 2009	rev 1.3
    	real constants updated to new systax usINg dot

    *)
END_FUNCTION_BLOCK
