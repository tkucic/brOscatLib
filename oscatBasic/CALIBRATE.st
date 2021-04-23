FUNCTION_BLOCK CALIBRATE
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=337*)
    (* check for calibration *)
    IF CO THEN
    	OFFSET := Y_Offset - X;
    ELSIF CS THEN
    	SCALE := Y_SCALE / (X + OFFSET);
    END_IF
    (* calculate output *)
    Y := (X + OFFSET) * SCALE;


    (* revision history
    hm 22.2.2007		rev 1.2
    	changed VAR RETAIN PERSISTENT to VAR RETAIN for better COmpatibility
    	wago lon COntollers do not support persisitent

    hm	11. mar. 2009	rev 1.3
    	changed real COnstants to use dot syntax

    *)
END_FUNCTION_BLOCK
