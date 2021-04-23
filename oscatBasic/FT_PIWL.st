FUNCTION_BLOCK FT_PIWL
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=412*)
    (* INitialize at power_up *)
    IF NOT INit OR RST THEN
    	INit := TRUE;
    	IN_last := IN;
    	t_last := T_PLC_US();
    	i := 0.0;
    	tc := 0.0;
    ELSE
    	(* read last cycle time IN Microseconds *)
    	tx := T_PLC_US();
    	tc := DWORD_TO_REAL(tx - t_last);
    	t_last := tx;

    	(* calculate proportional part *)
    	p := KP * IN;

    	(* run INtegrator *)
    	i := (IN + IN_last) * 5.0E-7 * KI * tc + i;
    	IN_last := IN;

    	(* calculate output Y *)
    	Y := p + i;

    	(* check output for LIMits *)
    	IF Y >= LIM_H THEN
    		Y := LIM_H;
    		IF KI <> 0.0 THEN
    			i := LIM_H - p;
    		ELSE
    			i := 0.0;
    		END_IF
    		LIM := TRUE;
    	ELSIF Y <= LIM_L THEN
    		Y := LIM_L;
    		IF KI <> 0.0 THEN
    			i := LIM_L - p;
    		ELSE
    			i := 0.0;
    		END_IF
    		LIM := TRUE;
    	ELSE
    		LIM := FALSE;
    	END_IF
    END_IF




    (* revision history
    hm 13. jun. 2008 	rev 1.0
    	origINal version

    hm	27. oct. 2008	rev 1.1
    	INtegrator will not be adjusted when KI = 0

    hm	25. jan 2009	rev 1.2
    	module will also work with negative K

    hm	11. mar. 2009	rev 1.3
    	real constants updated to new systax usINg dot

    *)
END_FUNCTION_BLOCK
