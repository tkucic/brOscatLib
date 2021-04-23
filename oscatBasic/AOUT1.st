FUNCTION AOUT1
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=272*)
    (* if SIGN bit is defINed *)
    IF SIGN < 32 THEN
    	sx := SIGN_R(IN);
    	IN2 := ABS(IN);
    ELSE
    	IN2 := IN;
    END_IF

    (* begrenze IN auf die zulässigen werte *)
    IN2 := LIMIT(LOW, IN2, HIGH);

    (* Berechne den Ausgangswert *)
    AOUT1 := SHL(REAL_TO_DWORD((IN2 - LOW) / (HIGH - LOW) * DWORD_TO_REAL(SHL(ff,BIT_N - Bit_0 + 1) -1)),Bit_0);
    IF sx THEN AOUT1 := SHL(ff,SIGN) OR AOUT1; END_IF


    (* revision history
    hm	23. feb 2008	rev 1.0
    	origINal version

    *)
END_FUNCTION
