FUNCTION AOUT1
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=272*)
    (* if sign bit is defined *)
    IF sign < 32 THEN
    	sx := SIGN_R(in);
    	in2 := ABS(in);
    ELSE
    	in2 := in;
    END_IF;

    (* begrenze in auf die zulässigen werte *)
    in2 := LIMIT(low, in2, high);

    (* Berechne den Ausgangswert *)
    AOUT1 := SHL(REAL_TO_DWORD((in2 - low) / (high - low) * DWORD_TO_REAL(SHL(ff,bit_n - Bit_0 + 1) -1)),Bit_0);
    IF sx THEN AOUT1 := SHL(ff,sign) OR AOUT1; END_IF;


    (* revision history
    hm	23. feb 2008	rev 1.0
    	original version

    *)
END_FUNCTION
