FUNCTION_BLOCK BLIND_SHADE_S
    (*http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=96*)
    (* STATUS definition
       151 = shadow               move shutter down for shadowing
       152 = ALERT                  move shutter UP by setting QU:=TRUE when door is open.
    *)

    (* the input SUN is sent through tof which will delay the shade for the time shade_delay *)
    SUN_delay(IN := SUN, PT := shade_delay);

    IF ALERT THEN
       QU := TRUE;
       QD := FALSE;
       STATUS := 152;
    ELSIF UP AND DN AND ENABLE AND SUN_delay.Q
    AND (CX.SUN_HOR > HORZ1) AND (CX.SUN_HOR < HORZ2)
    AND (CX.SUN_VER < VERT)
    AND (DT_TO_TOD(CX.UTC) > CX.SUN_RISE + SUNrise_offset) AND (DT_TO_TOD(CX.UTC) < CX.SUN_SET - SUNset_preset) THEN
       QU := UP;
       QD := DN;
       STATUS := 151;
       (* Calculate POsition, must be shade_POs or less *)
       PO := MIN(PI, shade_POs);
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
