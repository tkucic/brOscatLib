FUNCTION_BLOCK FT_INT
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=400*)
    IF RST THEN
    	OUT := 0.0;
    ELSE
    	INteg(X := IN, E := RUN, K := K, Y := OUT);
    END_IF

    (* LIMit the OUTputs *)
    IF OUT >= OUT_MAX THEN
    	OUT := OUT_MAX;
    	LIM := TRUE;
    ELSIF OUT <= OUT_mIN THEN
    	OUT := OUT_mIN;
    	LIM := TRUE;
    ELSE
    	LIM := FALSE;
    END_IF


    (*
    hm 13.12.2006	rev 1.1
    	changed to "trapezregel" which INcreases accuracy
    	before OUT := OUT + IN * time new: OUT := OUT + (IN + IN_last) / 2 * time

    hm 15.1.2007		rev 1.2
    	added default for k to be 1.

    hm	15.9.2007		rev 1.3
    	replaced time() with T_PLC_US for compatibility and performance reason
    	INcreased INternal accuracy to microseconds

    hm 29. oct 2007		rev 1.4
    	changed code so INt will not be called is time difference is 0 to INcrease accuracy on systems
    	with cycle times below 1ms

    hm	2. dec 2007	 	rev 1.5
    	changed code for better performance

    hm	5. jan 2008		rev 1.6
    	further improvements IN performance

    hm	8. feb 2008		rev 1.7
    	deleted LIMits +/- 1000 now LIMit is the range of real
    	added variables OUT1 and OUT2 to extend the resolution
    	corrected an error with elapsed time
    	deleted unusfull OUTput ET

    hm	13. mar 2008	rev 1.8
    	changed preset value OUT_mIN to -1e37.
    	stop INtegrator at the LIMits.

    hm	16. mar 2008	rev 1.9
    	added type conversion to avoid warnINg under codesys 3.0

    hm	2. jun. 2008	rev 2.0
    	rewritten with clear code
    	LIMits can now be set withOUT RUN

    hm	3. nov. 2008	rev 2.1
    	optimized code usINg INTEGRATE and LIMX

    hm	10. mar. 2009	rev 2.2
    	removed nested comments
    *)

END_FUNCTION_BLOCK
