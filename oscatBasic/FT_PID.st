FUNCTION_BLOCK FT_PID
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=406*)
    (* run integrator only if TN > 0 *)
    IF TN > 0.0 THEN
    	integ(IN := IN, K := 1.0 / TN, RUN := IEN, RST := RST, OUT_MIN := ILIM_L, OUT_MAX := ILIM_H);
    ELSE
    	integ(RST := FALSE);
    END_IF

    (* run differentiator *)
    diff(IN := IN, K := TV);

    (* combine both values *)
    Y := KP * (integ.OUT + diff.OUT + IN);

    (* check if integrator has reached its limits and set overflow *)
    LIM := integ.LIM;



    (* revision history
    hm 3. jun. 2008 	rev 2.0
    	original version

    hm	11. mar. 2009	rev 2.1
    	real constants updated to new systax using dot

    *)
END_FUNCTION_BLOCK
