FUNCTION AOUT
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=271*)
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
    AOUT := REAL_TO_DWORD((IN2 - LOW) / (HIGH - LOW) * DWORD_TO_REAL(SHL(ff,BITS) -1));
    IF sx THEN AOUT := SHL(ff,SIGN) OR AOUT; END_IF

    (*
    revision history

    hm 18.1.2007		rev 1.1
    	renamed Modul to AOUT.
    	changed Output to 32 Bit max.
    	corrected error with SIGN bit.

    hm	13.9.2007		rev 1.2
    	changed code to avoid warnINg under codesys 2.8.1

    hm	2. dec 2007		rev 1.3
    	changed code for better performance

    hm	23. feb 2008	rev 1.4
    	changed code for better performance
    *)
END_FUNCTION
