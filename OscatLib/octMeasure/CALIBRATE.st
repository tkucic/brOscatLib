FUNCTION_BLOCK CALIBRATE
    (* check for calibration *)
    IF CO THEN
    	OFFSET := Y_Offset - X;
    ELSIF CS THEN
    	SCALE := Y_scale / (X + OFFSET);
    END_IF
    (* calculate output *)
    Y := (X + OFFSET) * SCALE;


    (* revision history
    hm 22.2.2007		rev 1.2
    	changed VAR RETAIN PERSISTENT to VAR RETAIN for better compatibility
    	wago lon contollers do not support persisitent

    hm	11. mar. 2009	rev 1.3
    	changed real constants to use dot syntax

    *)
END_FUNCTION_BLOCK
