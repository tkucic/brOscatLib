FUNCTION_BLOCK CALENDAR_CALC
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=114*)
    IF XCAL.UTC <> last THEN
    	(* run once per second *)
    	(* update utc last calculated  *)
    	last := XCAL.UTC;
    	utod := DT_TO_TOD(XCAL.UTC);

    	(* calculate ltc from utc *)
    	XCAL.LOCAL_DT := UTC_TO_LTIME(XCAL.UTC, XCAL.DST_EN, XCAL.OFFSET);
    	XCAL.LOCAL_DATE := DT_TO_DATE(XCAL.LOCAL_DT);
    	XCAL.LOCAL_TOD := DT_TO_TOD(XCAL.LOCAL_DT);
    	dtemp := DAY_OF_DATE(XCAL.LOCAL_DATE);
    	XCAL.NIGHT := XCAL.LOCAL_TOD < XCAL.SUN_RISE OR XCAL.LOCAL_TOD > XCAL.SUN_SET;

    	(* run once per hour *)
    	tmp := HOUR(XCAL.LOCAL_TOD);
    	IF  tmp <> last_hour THEN
    		XCAL.DST_ON := DST(XCAL.UTC) AND XCAL.DST_EN;
    		last_hour := tmp;
    	END_IF

    	(* run once per day *)
    	IF dtemp <> last_day THEN
    		last_day := dtemp;
    		(* a new day has started, recalculate daily events *)
    		XCAL.YEAR := YEAR_OF_DATE(XCAL.LOCAL_DATE);
    		XCAL.MONTH := MONTH_OF_DATE(XCAL.LOCAL_DATE);
    		XCAL.DAY := DAY_OF_MONTH(XCAL.LOCAL_DATE);
    		XCAL.WEEKDAY := DAY_OF_WEEK(XCAL.LOCAL_DATE);
    		holy(DATE_IN := XCAL.LOCAL_DATE, LANGU := XCAL.LANGUAGE, HOLIDAYS := HOLIDAYS);
    		XCAL.HOLIDAY := holy.Y;
    		XCAL.HOLY_NAME := holy.NAME;
    		sun(LATITUDE := XCAL.LATITUDE, LONGITUDE := XCAL.LONGITUDE, UTC := DT_TO_DATE(XCAL.UTC), H := H);
    		XCAL.SUN_RISE := DINT_TO_TOD(TOD_TO_DINT(sun.SUN_RISE) + XCAL.OFFSET * DINT#60000 + SEL(XCAL.DST_ON,DINT#0,3600000));
    		XCAL.SUN_SET := DINT_TO_TOD(TOD_TO_DINT(sun.SUN_SET) + XCAL.OFFSET * DINT#60000 + SEL(XCAL.DST_ON,DINT#0,3600000));
    		XCAL.SUN_MIDDAY := DINT_TO_TOD(TOD_TO_DINT(sun.MIDDAY) + XCAL.OFFSET * DINT#60000 + SEL(XCAL.DST_ON,DINT#0,3600000));
    		XCAL.SUN_HEIGTH := sun.SUN_DECLINATION;
    		XCAL.WORK_WEEK := WORK_WEEK(XCAL.LOCAL_DATE);
    	END_IF

    	(* calculate the suns position every 10 seconds when SPE = TRUE *)
    	IF SPE AND XCAL.UTC -  plast >= t#25s THEN
    		plast := last;
    		pos(LATITUDE := XCAL.LATITUDE, LONGITUDE := XCAL.LONGITUDE, UTC := XCAL.UTC);
    		XCAL.SUN_HOR := pos.B;
    		XCAL.SUN_VER := pos.HR;
    	END_IF
    END_IF



    (* revision history

    hm 23. oct. 2008	rev 1.0
    	original version

    hm	8. feb. 2009	rev 1.1
    	night was calculated wrong
    	added sun position data

    hm	10. mar. 2009	rev 1.2
    	added work_week, sun_midday, sun_heigth
    	sun_position will only be calculated evey 25 seconds
    	dst will only become true when dst_en = true

    hm	23. jan 2010	rev 1.3
    	sun_rise, sun_set and sun_midday are now calculated in local time

    hm	18. jan. 2011	rev 1.4
    	added input HOLIDAYS to specify local HOLIDAYS
    	changed call for function sun_time

    hm	2. feb. 2011	rev 1.5
    	added input H to specify twilight

    hm	6. apr. 2011	rev 1.6
    	night was calculated wrong

    HM 3. Feb 2021    rev 1.7
       chaged LDT >> LOCAL_DT, LDATE >> LOCAL_DT, LTOD >> LOCAL_TOD

    *)
END_FUNCTION_BLOCK
