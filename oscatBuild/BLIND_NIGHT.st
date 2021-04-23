FUNCTION_BLOCK BLIND_NIGHT
    (*http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=84*)
    IF NOT (UP AND DN) AND night THEN
    	(* manual operation at night will cancel operation for one night *)
    	night := FALSE;
    ELSIF (DT_TO_TOD(DTIN) > SUNSET + SUNSET_offset) AND (last_night < DT_TO_DATE(DTIN)) AND NOT night AND E_NIGHT THEN
    	(* enable night *)
    	night := TRUE;
    	last_night := DT_TO_DATE(DTIN);
    ELSIF (DT_TO_TOD(DTIN) > SUNRISE + SUNRISE_offset) AND (last_day < DT_TO_DATE(DTIN)) AND night AND E_DAY AND (last_night < DT_TO_DATE(DTIN)) THEN
    	(* disable night *)
    	night := FALSE;
    	last_day := DT_TO_DATE(DTIN);
    END_IF

    (* shade at night only in auto mode and enable = true *)
    IF UP AND DN AND night THEN
    	STATUS := 141;
    	PO := NIGHT_POSITION;
    	AO := NIGHT_ANGLE;
    ELSE
    	QU := UP;
    	QD := DN;
    	PO := PI;
    	AO := AI;
    	STATUS := S_IN;
    END_IF


    (* revision history
    hm	29. sep 2007	rev 1.0
    	original version

    hm	5. oct 2007		rev 1.1
    	added enable input

    hm	6. oct 2007		rev 1.2
    	added POs and angle inputs and outputs
    	night POsition and angle can now be configured
    	any manual operation at night will cancel night operation

    *)
END_FUNCTION_BLOCK
