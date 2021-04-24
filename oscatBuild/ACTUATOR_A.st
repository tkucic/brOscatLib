FUNCTION_BLOCK ACTUATOR_A
    (*http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=15*)
    (* run the system timer, if SELF_ACT_TIME = t#0s then state IS set to 0 *)
    timer(T0 := RUNTIME, T1 := RUNTIME, T3 := SELF_ACT_TIME, sl := DX AND NOT dx_EDGE_, sx := 0, S0 := SELF_ACT_TIME > t#0s);
    dx_EDGE_ := DX;

    CASE timer.STATE OF
    	0: 	(* self act min value *)
    		Y := OUT_MIN;
    	1:	(* self_act max value *)
    		Y := OUT_MAX;
    	3:	(* normal operation *)
    		IF RV THEN
    			Y := OUT_MAX - (OUT_MAX - OUT_MIN) * SEL(IS, I1, I2) / 255;
    		ELSE
    			Y := (OUT_MAX - OUT_MIN) * SEL(IS, I1, I2) / 255 + OUT_MIN;
    		END_IF
    END_CASE




    (*
    hm 	8. nov. 2008	rev 1.0
    	original version

    *)
END_FUNCTION_BLOCK
