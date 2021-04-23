FUNCTION_BLOCK ACTUATOR_UD
    (*http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=17*)
    (* read system time *)
    tx := DWORD_TO_TIME(OSCAT_BASIC.T_PLC_MS());

    IF NOT init THEN
    	(* INITIALIZATION AT FIRST CALL *)
    	last := tx;
    	init := TRUE;
    ELSIF OFF THEN
    	(* emergency shut OFF detected *)
    	YUP := FALSE;
    	yDN := FALSE;
    	last := tx;
    	STATUS := 101;

    (* Watch FOR MIN TON TIME *)
    ELSIF ((YUP OR YDN) AND tx - last < TON) THEN
    	RETURN;
    ELSIF NOT yUP AND NOT yDN AND tx - last < tOFF THEN
    	RETURN;

    (* MANUAL operatiON *)
    ELSIF MANUAL THEN
    	STATUS := 102;
    	(* directiONal chage set both outs 0 first *)
    	IF yUP AND NOT UP OR yDN AND NOT DN THEN
    		yDN := FALSE;
    		yUP := FALSE;
    		last := tx;
    	(* MANUAL UP operatiON *)
    	ELSIF UP AND NOT DN AND NOT OFF THEN
    		YDN := FALSE;
    		YUP := TRUE;
    		last := tx;
    		STATUS := 103;
    	(* MANUAL down operatiON *)
    	ELSIF DN AND NOT UP AND NOT OFF THEN
    		YUP := FALSE;
    		YDN := TRUE;
    		last := tx;
    		STATUS := 104;
    	(* maual mode but no UP or down *)
    	ELSE
    		IF YUP OR YDN THEN LAST := tx; END_IF
    		YUP := FALSE;
    		yDN := FALSE;
    	END_IF

    (* automatic operatiON *)
    ELSE
    	(* directiONal change set outputs low first *)
    	IF yUP AND NOT UD OR yDN AND UD THEN
    		yUP := FALSE;
    		yDN := FALSE;
    		last := tx;
    	(* automatic UP operatiON *)
    	ELSIF UD AND ON AND NOT OFF THEN
    		YDN := FALSE;
    		YUP := TRUE;
    		last := tx;
    		STATUS := 111;

    	(* automatic down operatiON *)
    	ELSIF NOT UD AND ON AND NOT OFF THEN
    		YUP := FALSE;
    		YDN := TRUE;
    		last := tx;
    		STATUS := 112;
    	(* standby mode *)
    	ELSE
    		IF YUP OR YDN THEN last := tx; END_IF
    		YUP := FALSE;
    		YDN := FALSE;
    		STATUS := 110;
    	END_IF
    END_IF

    (* make sure YUP and YDN are never ON at the same time *)
    IF YDN AND YUP_in AND OUT_RETURN THEN
    	YDN := FALSE;
    	STATUS := 1;
    END_IF
    IF YUP AND YDN_in AND OUT_RETURN THEN
    	YUP := FALSE;
    	STATUS := 2;
    END_IF



    (* revisiON history
    hm 22. jan 2007	rev 1.1
    	added STATUS output
    	changed inputs tON, tOFF to cONfig variables
    	added cONfig var OUT_RETURN to enable yUP_in and YDN_in
    	MANUAL mod will override automatic mode 

    hm	15.9.2007	rev 1.2
    	replaced Time() with T_PLC_MS for compatibility and performance reasONs

    hm	17. oct. 2008	rev 1.3
    	deleted unnecessary initializatiON with 0
    *)
END_FUNCTION_BLOCK
