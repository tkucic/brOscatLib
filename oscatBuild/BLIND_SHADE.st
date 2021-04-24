FUNCTION_BLOCK BLIND_SHADE
    (*http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=93*)
    (* the input SUN is sent through tof which will delay the shade for the time shade_delay *)
    sun_delay(IN := SUN, PT := shade_delay);

    IF UP AND DN AND ENABLE AND sun_delay.Q AND CX.SUN_HOR > direction - angle_offset AND CX.SUN_HOR < direction + angle_offset AND
    	DT_TO_TOD(CX.UTC) > CX.SUN_RISE + sunrise_offset AND DT_TO_TOD(CX.UTC) < CX.SUN_SET - sunset_preset THEN
    	STATUS := 151;
    	QU := UP;
    	QD := DN;
    	(* position is predefined *)
    	PO := shade_pos;
    	(* shading is active now calculate the slat angle *)
    	(* calculate the max angle for the blind *)
    	angle := OSCAT_BASIC.DEG(ATAN(slat_spacing / slat_width));
    	(* check if SUN angle is between 0 and max angle *)
    	IF CX.SUN_VER > 0.0 AND CX.SUN_VER < angle THEN
    		angle := CX.SUN_VER + OSCAT_BASIC.DEG(ACOS(COS(OSCAT_BASIC.RAD(CX.SUN_VER))*slat_spacing / Slat_width));
    		AO := INT_TO_BYTE(DINT_TO_INT(LIMIT(0,TRUNC(angle * 2.833333333), 255)));
    	ELSE
    		AO := 255;
    	END_IF
    ELSE
    	QU := UP;
    	QD := DN;
    	PO := PI;
    	AO := AI;
    	STATUS := S_IN;
    END_IF

    (* revision history
    hm	15 oct. 2007	rev 1.0
    	original version

    hm	19. oct 2007	rev 1.1
    	manual mode was not detected because outputs were checked and not inputs UP and DN

    hm	24. nov 2007	rev 1.2
    	added shade_delay to avoid constant UP and down if SUN is out parcially

    hm	8. feb 2009	rev 1.3
    	added shading position shade_pos to be configured
    	changed inputs to utilize calendar data structure

    hm	13. mar. 2009	rev 1.4
    	improved code

    *)
END_FUNCTION_BLOCK
