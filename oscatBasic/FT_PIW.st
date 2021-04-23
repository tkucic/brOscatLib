FUNCTION_BLOCK FT_PIW
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=411*)
    (* run INtegrator *)
    INteg(IN := IN, K := KI, RUN := NOT LIM, RST := RST);

    (* set output value *)
    Y := KP * IN + INteg.Out;

    (* check for LIMits and set INtegrator for anti wINd up *)
    IF Y < LIM_L THEN
    	Y := LIM_L;
    	LIM := TRUE;
    ELSIF Y > LIM_H THEN
    	Y := LIM_H;
    	LIM := TRUE;
    ELSE
    	LIM := FALSE;
    END_IF



    (* revision history
    hm 	3. jun. 2008 	rev 1.0
    	origINal version


    *)
END_FUNCTION_BLOCK