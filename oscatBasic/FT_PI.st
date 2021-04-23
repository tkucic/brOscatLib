FUNCTION_BLOCK FT_PI
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=404*)
    (* run INtegrator *)
    INteg(IN := IN, K := KI, RUN := IEN, RST := RST, OUT_MIN := ILIM_L, OUT_MAX := ILIM_H);

    (* check if INtegrator has reached its LIMits and set overflow *)
    LIM := INteg.LIM;
    Y := KP * IN + INteg.Out;



    (* revision history
    hm 	3. jun. 2008 	rev 2.0
    	origINal version


    *)
END_FUNCTION_BLOCK
