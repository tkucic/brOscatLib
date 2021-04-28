FUNCTION AOUT1
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=272*)
    (* if SIGN bit is defined *)
    IF SIGN < 32 THEN
    	sx := SIGN_R(IN);
    	in2 := ABS(IN);
    ELSE
    	in2 := IN;
    END_IF

    (* begrenze IN auf die zulässigen werte *)
    in2 := LIMIT(LOW, in2, HIGH);

    (* Berechne den Ausgangswert *)
    AOUT1 := SHL(REAL_TO_DWORD((in2 - LOW) / (HIGH - LOW) * UDINT_TO_REAL(SHL(ff,BIT_N - BIT_0 + 1) -1)),BIT_0);
    IF sx THEN AOUT1 := UDINT_TO_DWORD(SHL(ff,SIGN) OR DWORD_TO_UDINT(AOUT1)); END_IF


    (* revision history
    hm	23. feb 2008	rev 1.0
    	original version

    *)
END_FUNCTION
