FUNCTION_BLOCK CALIBRATE
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=337*)
    (* check for calibration *)
    IF CO THEN
    	offset := Y_OFFSET - X;
    ELSIF CS THEN
    	Scale := Y_SCALE / (X + offset);
    END_IF
    (* calculate output *)
    Y := (X + offset) * Scale;


    (* revision history
    hm 22.2.2007		rev 1.2
    	changed VAR RETAIN PERSISTENT to VAR RETAIN for better compatibility
    	wago lon contollers do not support persisitent

    hm	11. mar. 2009	rev 1.3
    	changed real constants to use dot syntax

    *)
END_FUNCTION_BLOCK
