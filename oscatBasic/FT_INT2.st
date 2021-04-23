FUNCTION_BLOCK FT_INT2
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=402*)
    IF RST THEN
    	val := R2_SET(0.0);
    	OUT := 0.0;
    ELSE
    	INteg(X := IN, E := RUN, K := K, Y := ix);
    	val := R2_ADD(val, ix);
    	ix := 0.0;
    	OUT := val.RX;
    END_IF

    (* check OUTput for LIMits *)
    IF OUT > OUT_MIN AND OUT < OUT_MAX THEN
    	LIM := FALSE;
    ELSE
    	OUT := LIMIT(OUT_MIN, OUT, OUT_MAX);
    	val := R2_SET(OUT);
    	LIM := TRUE;
    END_IF



    (*	revision history
    hm	2. jun. 2008	rev 1.0
    	origINal version

    hm	5. nov. 2008	rev 1.1
    	rewritten code usINg INtegrate

    hm	11. mar. 2009	rev 1.2
    	real constants updated to new systax usINg dot

    *)

END_FUNCTION_BLOCK
