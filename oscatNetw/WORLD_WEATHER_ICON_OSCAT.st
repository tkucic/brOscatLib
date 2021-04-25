FUNCTION_BLOCK WORLD_WEATHER_ICON_OSCAT
    (*http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=215*)
    IF ACTIVATE AND act_last = FALSE THEN
    	x := LIMIT(0,WW.CUR.WEATHER_ICON,41);
    	WW.CUR.WEATHER_ICON := dat[x];
    	FOR i := 0 TO 4 DO
    		x := LIMIT(0,WW.DAY[i].WEATHER_ICON,41);
    		WW.DAY[i].WEATHER_ICON := dat[x];
    	END_FOR;
    END_IF;
    act_last := ACTIVATE;

    (* revision history
    ks	04. may. 2011	rev 1.0
    	original version
    *)
END_FUNCTION_BLOCK
