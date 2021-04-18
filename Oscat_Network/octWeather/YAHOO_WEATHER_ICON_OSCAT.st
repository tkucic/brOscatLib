FUNCTION_BLOCK YAHOO_WEATHER_ICON_OSCAT
    IF ACTIVATE AND act_last = FALSE THEN
    	x := MIN(YW.CUR_CONDITIONS_CODE,48);
    	YW.CUR_CONDITIONS_ICON := dat[x];
    	x := MIN(YW.FORECAST_TODAY_CODE,48);
    	YW.FORECAST_TODAY_ICON := dat[x];
    	FOR idx := 1 TO 9 DO
    		x := MIN(YW.FORECAST_DAY[idx].CODE,48);
    		YW.FORECAST_DAY[idx].ICON := dat[x];
    	END_FOR
    END_IF
    act_last := ACTIVATE;

    (* revision history
    ks	04. may. 2011	rev 1.0
    	original version

    ks	01. jun. 2016	rev 1.1
    	komplette überarbeitung auf neue yahoo-api
    *)
END_FUNCTION_BLOCK
