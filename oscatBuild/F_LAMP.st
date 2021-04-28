FUNCTION_BLOCK F_LAMP
    (*http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=54*)
    runtime(IN := SWITCH, SECONDS := ONTIME, CYCLES := CYCLES);

    IF RST THEN
    	ONTIME := 0;
    	CYCLES := 0;
    END_IF
    IF SWITCH THEN
    	IF ONTIME < T_NO_DIMM * 3600 THEN
    		LAMP := 255;
    		STATUS := 111;
    	ELSE
    		LAMP := DIMM;
    		STATUS := 112;
    	END_IF
    ELSE
    	LAMP := 0;
    	STATUS := 110;
    END_IF


    IF ONTIME >= T_MAINTENANCE * 3600 AND T_MAINTENANCE > 0 THEN
    	STATUS := 120;
    END_IF



    (* revision history
    hm	8. feb. 2007	rev 1.1
    	original version

    hm	22. oct. 2008	rev 1.2
    	changed use of ONTIME for ONTIME 2.0
    	ONTIME is now in seconds not hours
    *)


END_FUNCTION_BLOCK
