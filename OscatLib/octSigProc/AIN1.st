FUNCTION_BLOCK AIN1
    (* extract error bit *)
    error := ((SHR(in,error_bit) AND 16#0000_0001) = 1) OR (error_code_en AND error_code = in);
    IF error THEN
    	out := error_output;
    	RETURN;
    END_IF

    (* strip off the data input *)
    tb := SHR(SHL(in, 31 - bit_N), 31 - bit_N + Bit_0);

    (* extract overflow bit *)
    overflow := ((SHR(in,overflow_bit) AND 16#0000_0001) = 1) OR (overflow_code_en AND overflow_code = in) OR (tb < code_min OR tb > code_max);
    IF overflow THEN
    	out := overflow_output;
    	RETURN;
    END_IF

    (* extract sign bit *)
    sign := (SHR(in,sign_bit) AND 16#0000_0001) = 1;

    (* convert in to out *)
    out := (DWORD_TO_REAL(tb - code_min) * (out_max - out_min) / DWORD_TO_REAL(code_max - code_min) + out_min);
    IF sign THEN out := out * -1.0; END_IF



    (* revision history
    hm	23. feb 2008	rev 1.0
    	original version

    hm	16. mar 2008	rev 1.1
    	added type conversions to avoid warnngs under codesys 30

    hm	22. apr. 2008	rev 1.2
    	corrected error in formula when code_min was set
    	corrected error when sign bit was used
    	optimized code for better performance

    hm	10. mar. 2009	rev 1.3
    	real constants updated to new systax using dot

    *)
END_FUNCTION_BLOCK
