FUNCTION_BLOCK BLIND_SHADE
    (*http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=93*)
    (* the input SUN is sent through tof which will delay the shade for the time SHADE_DELAY *)
    sun_delay(IN := SUN, PT := SHADE_DELAY);

    IF UP AND DN AND ENABLE AND sun_delay.Q AND CX.SUN_HOR > DIRECTION - ANGLE_OFFSET AND CX.SUN_HOR < DIRECTION + ANGLE_OFFSET AND
    	DT_TO_TOD(CX.UTC) > CX.SUN_RISE + SUNRISE_OFFSET AND DT_TO_TOD(CX.UTC) < CX.SUN_SET - SUNSET_PRESET THEN
    	STATUS := 151;
    	QU := UP;
    	QD := DN;
    	(* position is predefined *)
    	PO := SHADE_POS;
    	(* shading is active now calculate the slat angle *)
    	(* calculate the max angle for the blind *)
    	angle := OSCAT_BASIC.DEG(ATAN(SLAT_SPACING / SLAT_WIDTH));
    	(* check if SUN angle is between 0 and max angle *)
    	IF CX.SUN_VER > 0.0 AND CX.SUN_VER < angle THEN
    		angle := CX.SUN_VER + OSCAT_BASIC.DEG(ACOS(COS(OSCAT_BASIC.RAD(CX.SUN_VER))*SLAT_SPACING / SLAT_WIDTH));
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
    	added SHADE_DELAY to avoid constant UP and down if SUN is out parcially

    hm	8. feb 2009	rev 1.3
    	added shading position SHADE_POS to be configured
    	changed inputs to utilize calendar data structure

    hm	13. mar. 2009	rev 1.4
    	improved code

    *)
END_FUNCTION_BLOCK
