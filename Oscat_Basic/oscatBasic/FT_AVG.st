FUNCTION_BLOCK FT_AVG
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=98*)
    (* limit n to a max of 32 because delay can do max 32 cycles *)
    buff.N := LIMIT(0, N, 32);

    IF NOT init OR rst THEN
    	FOR i := 1 TO N DO
    		buff(in := in);
    	END_FOR
    	avg := in;
    	init := TRUE;
    ELSIF E THEN
    	buff(in := in);
    	avg := avg + (in - buff.out ) / INT_TO_REAL(N);
    END_IF

    (* revision history

    hm	7. jan. 2007	rev 1.1
    	chaged rst logic to load the buffer with the actual input value instead of 0.
    	added en input to allow better control of signal flow
    	added init to load the buffer with in at startup to avoid rampup at beginning.
    	deleted unused variable cnt.

    hm	14. jun. 2008	rev 1.2
    	set default for input en = TRUE and N = 32

    hm	10. oct. 2008	rev 1.3
    	improved performance

    hm	18. oct. 2008	rev 1.4
    	changed input en to e for compatibility reasons

    hm	10. mar. 2009	rev 1.5
    	added type conversion for compatibility reasons

    *)
END_FUNCTION_BLOCK