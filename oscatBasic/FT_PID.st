FUNCTION_BLOCK FT_PID
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=406*)
    (* run INtegrator only if TN > 0 *)
    IF TN > 0.0 THEN
    	INteg(IN := IN, K := 1.0 / TN, RUN := IEN, RST := RST, OUT_MIN := ILIM_L, OUT_MAX := ILIM_H);
    ELSE
    	INteg(RST := FALSE);
    END_IF

    (* run differentiator *)
    diff(IN := IN, K := TV);

    (* combINe both values *)
    Y := KP * (INteg.Out + diff.out + IN);

    (* check if INtegrator has reached its LIMits and set overflow *)
    LIM := INteg.LIM;



    (* revision history
    hm 3. jun. 2008 	rev 2.0
    	origINal version

    hm	11. mar. 2009	rev 2.1
    	real constants updated to new systax usINg dot

    *)
END_FUNCTION_BLOCK
