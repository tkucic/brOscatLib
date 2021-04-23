FUNCTION_BLOCK CALIBRATE
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=337*)
    (* check for calibration *)
    IF CO THEN
    	offset := Y_Offset - X;
    ELSIF CS THEN
<<<<<<< HEAD:oscatBasic/CALIBRATE.st
    	SCALE := Y_SCALE / (X + OFFSET);
=======
    	Scale := Y_Scale / (X + offset);
>>>>>>> 800137518c97e6c8be9a9f286ec9de596d141e5a:Oscat_Basic/octMeasure/CALIBRATE.st
    END_IF
    (* calculate output *)
    Y := (X + offset) * Scale;


    (* revision history
    hm 22.2.2007		rev 1.2
    	changed VAR RETAIN PERSISTENT to VAR RETAIN for better COmpatibility
    	wago lon COntollers do not support persisitent

    hm	11. mar. 2009	rev 1.3
    	changed real COnstants to use dot syntax

    *)
END_FUNCTION_BLOCK
