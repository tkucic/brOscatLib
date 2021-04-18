FUNCTION MD5_AUX
    CASE N OF
    	1: w := (B AND C) OR (NOT(B) AND D);
    	2: w := (B AND D) OR (C AND NOT D);
    	3: w := (B XOR C XOR D);
    	4: w := (C XOR (B OR  NOT(D)));
    END_CASE

    MD5_AUX := B + ROL(A + w + X + T,U);

    (* revision history

    ks	6. dec. 2009 rev 1.0
    	original version

    *)
END_FUNCTION
