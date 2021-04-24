FUNCTION_BLOCK BLIND_SHADE_S
    (*http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=96*)
    (* STATUS definition
       151 = shadow               move shutter down for shadowing
       152 = ALERT                  move shutter UP by setting QU:=TRUE when door is open.
    *)

    (* the input SUN is sent through tof which will delay the shade for the time SHADE_DELAY *)
    sun_delay(IN := SUN, PT := SHADE_DELAY);

    IF ALERT THEN
       QU := TRUE;
       QD := FALSE;
       STATUS := 152;
    ELSIF UP AND DN AND ENABLE AND sun_delay.Q
    AND (CX.SUN_HOR > HORZ1) AND (CX.SUN_HOR < HORZ2)
    AND (CX.SUN_VER < VERT)
    AND (DT_TO_TOD(CX.UTC) > CX.SUN_RISE + SUNRISE_OFFSET) AND (DT_TO_TOD(CX.UTC) < CX.SUN_SET - SUNSET_PRESET) THEN
       QU := UP;
       QD := DN;
       STATUS := 151;
       (* Calculate Position, must be SHADE_POS or less *)
       PO := MIN(PI, SHADE_POS);
    ELSE
       QU := UP;
       QD := DN;
       PO := PI;
       STATUS := S_IN;
    END_IF



    (* revision history
    hf	12 nov. 2009	rev 1.0
    	original version

    *)
END_FUNCTION_BLOCK
