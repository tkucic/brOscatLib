FUNCTION_BLOCK ACTUATOR_A
    (*http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=15*)
    (* run the system timer, if SELF_ACT_TIME = t#0s then state IS set to 0 *)
    timer(T0 := RUNTIME, T1 := RUNTIME, T3 := SELF_ACT_TIME, SL := DX AND NOT dx_edge, SX := 0, S0 := SELF_ACT_TIME > t#0s);
    dx_edge := DX;

    CASE timer.STATE OF
    	0: 	(* self act min value *)
    		Y := OUT_MIN;
    	1:	(* self_act max value *)
    		Y := OUT_MAX;
    	3:	(* normal operation *)
            _OUT_MAX := WORD_TO_UINT(OUT_MAX);
            _OUT_MIN := WORD_TO_UINT(OUT_MIN);
            _I1 := BYTE_TO_USINT(I1);
            _I2 := BYTE_TO_USINT(I2);
    		IF RV THEN
    			Y := UINT_TO_WORD((_OUT_MAX - (_OUT_MAX - _OUT_MIN) * SEL(IS, _I1, _I1)) / 255);
    		ELSE
    			Y := UINT_TO_WORD((_OUT_MAX - _OUT_MIN) * SEL(IS, _I1, _I1) / 255 + _OUT_MIN);
    		END_IF
    END_CASE




    (*
    hm 	8. nov. 2008	rev 1.0
    	original version

    *)
END_FUNCTION_BLOCK
