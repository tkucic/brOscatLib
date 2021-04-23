FUNCTION_BLOCK FT_PIDW
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=407*)
    (* run the INtegrator *)
    IF TN = 0.0 OR RST THEN
    	INteg(E := FALSE, Y := YI);
    	YI := 0.0;
    ELSE
    	INteg(X := IN, K := 1.0 / TN, E := NOT LIM, Y := YI);
    END_IF

    (* add up INtegrator and lINear part *)
    Y := KP * (IN + YI);

    (* run differentiator *)
    diff(IN := IN, K := TV);

    (* set LIM before differentiator is added to stop INtegrator if necessary *)
    IF Y > LIM_L AND Y < LIM_H THEN
    	LIM := FALSE;
    ELSE
    	LIM := TRUE;
    END_IF

    (* add differential part and LIMit output Y *)

    Y := LIMIT(LIM_L, Y + KP * diff.out, LIM_H);




    (* revision history
    hm 3. jun. 2008 	rev 1.0
    	origINal version

    hm	5. nov. 2008	rev 1.1
    	changed code to use INtegrate

    hm	11. mar. 2009	rev 1.2
    	real constants updated to new systax usINg dot

    *)
END_FUNCTION_BLOCK
