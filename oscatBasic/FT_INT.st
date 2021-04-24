FUNCTION_BLOCK FT_INT
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=400*)
    IF RST THEN
    	OUT := 0.0;
    ELSE
    	INTeg(X := IN, E := RUN, K := K, Y := OUT);
    END_IF

    (* limit the outputs *)
    IF OUT >= OUT_MAX THEN
    	OUT := OUT_MAX;
    	LIM := TRUE;
    ELSIF OUT <= OUT_MIN THEN
    	OUT := OUT_MIN;
    	LIM := TRUE;
    ELSE
    	LIM := FALSE;
    END_IF


    (*
    hm 13.12.2006	rev 1.1
    	changed to "trapezregel" which increases accuracy
    	before OUT := OUT + IN * time new: OUT := OUT + (IN + in_last) / 2 * time

    hm 15.1.2007		rev 1.2
    	added default for K to be 1.

    hm	15.9.2007		rev 1.3
    	replaced time() with T_PLC_US for compatibility and performance reason
    	increased internal accuracy to microseconds

    hm 29. oct 2007		rev 1.4
    	changed code so int will not be called is time difference is 0 to increase accuracy on systems
    	with cycle times below 1ms

    hm	2. dec 2007	 	rev 1.5
    	changed code for better performance

    hm	5. jan 2008		rev 1.6
    	further improvements IN performance

    hm	8. feb 2008		rev 1.7
    	deleted limits +/- 1000 now limit is the range of real
    	added variables out1 and out2 to extend the resolution
    	corrected an error with elapsed time
    	deleted unusfull output ET

    hm	13. mar 2008	rev 1.8
    	changed preset value OUT_MIN to -1e37.
    	stop integrator at the limits.

    hm	16. mar 2008	rev 1.9
    	added type conversion to avoid warning under codesys 3.0

    hm	2. jun. 2008	rev 2.0
    	rewritten with clear code
    	limits can now be set without RUN

    hm	3. nov. 2008	rev 2.1
    	optimized code using INTEGRATE and LIMX

    hm	10. mar. 2009	rev 2.2
    	removed nested comments
    *)

END_FUNCTION_BLOCK
