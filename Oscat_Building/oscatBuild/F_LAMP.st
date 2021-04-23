FUNCTION_BLOCK F_LAMP
    (*http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=54*)
    runtime(in := switch, seconds := ontime, cycles := cycles);

    IF RST THEN
    	ONTIME := 0;
    	CYCLES := 0;
    END_IF
    IF SWITCH THEN
    	IF ontime < T_NO_DIMM * 3600 THEN
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


    IF ontime >= T_maintenance * 3600 AND T_Maintenance > 0 THEN
    	status := 120;
    END_IF



    (* revision history
    hm	8. feb. 2007	rev 1.1
    	original version

    hm	22. oct. 2008	rev 1.2
    	changed use of ontime for ontime 2.0
    	ontime is now in seconds not hours
    *)


END_FUNCTION_BLOCK