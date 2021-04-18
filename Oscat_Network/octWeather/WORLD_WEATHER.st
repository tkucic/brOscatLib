FUNCTION_BLOCK WORLD_WEATHER
    CASE state OF

    00:
    	IF ACTIVATE AND NOT last_state THEN
    		state := 20;
    		DONE := FALSE;
    		BUSY := TRUE;
    		ERROR_C := DWORD#0;
    		ERROR_T := BYTE#0;
    	END_IF

    20: (* URL for DNS UND HTTP-GET *)
    	(* Example: http://api.worldweatheronline.com/free/v1/weather.ashx?q=48.21,16.37&format=csv&num_of_days=5&key=xxxxxxxxxxxxxxxxxxxxxx *)
    	url_str := CONCAT('http://api.worldweatheronline.com/free/v1/weather.ashx?q=',OSCAT_BASIC.REAL_TO_STRF(LATITUDE,6,D:='.'));
    	url_str := CONCAT(url_str,',');
    	url_str := CONCAT(url_str,OSCAT_BASIC.REAL_TO_STRF(LONGITUDE,6,D:='.'));
    	url_str := CONCAT(url_str,'&format=csv&num_of_days=5&key=');
    	url_str := CONCAT(url_str,key);

    	URL_DATA:=STRING_TO_URL(STR:=url_str, DEFAULT_PROTOCOL:='', DEFAULT_PATH:='' );
    	state := 40;

    40:
    	IF DNS_CLIENT.DONE THEN
    		state := 60;
    	ELSIF (DNS_CLIENT.ERROR > DWORD#00) THEN
    		(* Fehlerbehandlung *)
    		ERROR_C := DNS_CLIENT.ERROR;
    	ERROR_T := BYTE#01;
    		state   := 100;
    	END_IF

    60:
    	IF HTTP_GET.DONE THEN
    		sep := 0;
    		idx := 0;
    		day := 0;
    		cnt := 0;
    		OFFSET := HTTP_GET.BODY_START; (* Start Offset vorgeben *)
    		size := HTTP_GET.BODY_STOP; (* End Position *)
    		run := 1; (* Element suchen *)
    		state := 80;

    	ELSIF (HTTP_GET.ERROR > DWORD#00) THEN
    		(* Fehlerbehandlung *)
    		ERROR_C := HTTP_GET.ERROR;
    		ERROR_T := BYTE#02;
    		state := 100;
    	END_IF

    80:	IF run = 0 THEN (* kein Befehl mehr aktiv ? *)
    		run := 1; (*  nächstes Element suchen  *)
    		IF result = 1 OR result = 2 THEN
    			value_int := 0;
    			value_real := 0.0;
    			(* automatische konvertierung in real und int ausführen *)
    			IF LEN(value) <= 20 THEN
    				v_real:=OSCAT_BASIC.FLOAT_TO_REAL(FLT:=value);
    				IF OSCAT_BASIC.CHK_REAL(v_real) = 0 THEN (* !!! prüft auf gültigen REAL Wert, ansonsten stürzt Twincat ab !!!!  *)
    					value_real := v_real;
    					value_int := REAL_TO_INT(value_real);
    				END_IF
    			END_IF
    			cnt := cnt + 1;


    			IF cnt = 1 AND LEFT(value,1) <> '#' THEN
    				cnt := 0;
    			END_IF

    			IF cnt >=8 AND cnt <= 87 THEN
    				IF cnt > 22 THEN
    					CASE idx OF
    					00:	WW.DAY[day].DATE_OF_DAY := value;
    					01:	WW.DAY[day].TEMP_MAX_C := value_int;
    					02:	WW.DAY[day].TEMP_MAX_F := value_int;
    					03:	WW.DAY[day].TEMP_MIN_C := value_int;
    					04:	WW.DAY[day].TEMP_MIN_F := value_int;
    					05:	WW.DAY[day].WIND_SPEED_MILES := value_int;
    					06:	WW.DAY[day].WIND_SPEED_KMPH := value_int;
    					07:	WW.DAY[day].WIND_DIR_DEGREE := value_int;
    					08:	WW.DAY[day].WIND_DIR16POINT := value;
    					09:	WW.DAY[day].WEATHER_CODE := value_int;
    					10:	pos := FIND(value, '/wsymbol_');
    						WW.DAY[day].WEATHER_ICON := OSCAT_BASIC.DEC_TO_INT(MID(value,4,pos+9));
    					11:	WW.DAY[day].WEATHER_DESC := value;
    					12:	WW.DAY[day].PRECIPMM := value_real;
    					END_CASE
    					idx := idx + 1;
    					IF idx > 12 THEN
    						idx := 0;
    						day := day + 1;
    					END_IF
    				ELSE
    					CASE cnt OF
    					08:	sep :=44; (* ab jetzt mit Trennzeichen arbeiten, *)
    					09:	WW.CUR.OBSERVATION_TIME := value;
    					10:	WW.CUR.TEMP_C := value_int;
    					11:	WW.CUR.WEATHER_CODE := value_int;
    					12:	pos := FIND(value, '/wsymbol_');
    						WW.CUR.WEATHER_ICON := OSCAT_BASIC.DEC_TO_INT(MID(value,4,pos+9));
    					13:	WW.CUR.WEATHER_DESC := value;
    					14:	WW.CUR.WIND_SPEED_MILES := value_int;
    					15:	WW.CUR.WIND_SPEED_KMPH := value_int;
    					16:	WW.CUR.WIND_DIR_DEGREE := value_int;
    					17:	WW.CUR.WIND_DIR16POINT := value;
    					18:	WW.CUR.PRECIPMM := value_real;
    					19:	WW.CUR.HUMIDITY := value_int;
    					20:	WW.CUR.VISIBILITY := value_int;
    					21:	WW.CUR.PRESSURE := value_int;
    					22:	WW.CUR.CLOUDOVER := value_int;
    					END_CASE
    				END_IF
    			END_IF
    		ELSIF result = 10 THEN (* nichts mehr gefunden *)
    			DONE  := TRUE;
    			run := 0; (* Auswertung beenden *)
    			state := 100;
    		END_IF
    	END_IF

    100:
    	(* UNLOCK HTTP DATA *)
    	IF (NOT HTTP_GET.DONE) THEN
    		state := 0;
    		BUSY := FALSE;
    		DONE := ERROR_T = BYTE#0;
    	END_IF

    END_CASE

    (* ---------------- DNS --------------- *)
    DNS_CLIENT(	IP_C:=IP_C,
    			S_BUF:=S_BUF,
    			R_BUF:=R_BUF,
    			DOMAIN:=URL_DATA.DOMAIN,
    			IP4_DNS:=DWORD#00,
    			ACTIVATE:=state=40 (* DNS Start *)
    			);
    (* nicht oder nicht direkt verwendete Parameter *)
    (*	DWORD :=DNS_CLIENT.IP4;
    	BOOL  :=DNS_CLIENT.DONE;
    	BYTE  :=DNS_CLIENT.ERROR; *)
    (* -------------------------------------*)

    (* ------------- HTTP_GET --------------- *)
    HTTP_GET(	IP_C:=IP_C,
    			S_BUF:=S_BUF,
    			R_BUF:=R_BUF,
    			IP4:=DNS_CLIENT.IP4,
    			GET:=state=60,
    			MODE:=BYTE#2, (* HTTP 1.1 mit persistenter Verbindung *)
    			UNLOCK_BUF:=state=100,
    			URL_DATA:=URL_DATA
    			);

    (* nicht oder nicht direkt verwendete Parameter *)
    (*	STRING := HTTP_GET.HTTP_STATUS;
    	UINT :=HTTP_GET.HEADER_START;
    	UINT :=HTTP_GET.HEADER_STOP;
    	UINT :=HTTP_GET.BODY_START;
    	UINT :=HTTP_GET.BODY_STOP;
    	BOOL :=HTTP_GET.DONE;
    	BYTE :=HTTP_GET.ERROR;
    *)
    (* -------------------------------------*)
    CPB(SEP:=sep,RUN:=run,OFFSET:=OFFSET,VALUE:=value,PT:=R_BUF,RESULT=>result); (* CSV PARAMETER BUF *)

    last_state := ACTIVATE;

    (* revision history
    ks	01.oct. 2010	rev 1.0
    	original version

    ks	01.feb. 2011	rev 1.1
    	rücksetzen von cnt 

    ks	07.apr. 2011	rev 1.2
    	neue Domain "free.worldweatheronline.com" (Ab 30.04.2011 notwendig)

    ks	05.jan. 2012	rev 1.3
    	neues datenelement "icon" integriert, REAL_TO_STRF parameter D

    ks	05.oct. 2012	rev 1.4
    	workaround für chunked html data

    ks	11.may. 2013	rev 1.5
    	New worldwaether url and api key required (new API-Services)
    *)
END_FUNCTION_BLOCK