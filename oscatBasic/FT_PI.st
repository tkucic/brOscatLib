FUNCTION_BLOCK FT_PI
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=404*)
    (* run integrator *)
    integ(IN := IN, K := KI, RUN := IEN, RST := RST, OUT_MIN := ILIM_L, OUT_MAX := ILIM_H);

    (* check if integrator has reached its limits and set overflow *)
    LIM := integ.LIM;
    Y := KP * IN + integ.OUT;



    (* revision history
    hm 	3. jun. 2008 	rev 2.0
    	original version


    *)
END_FUNCTION_BLOCK
