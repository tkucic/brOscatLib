
TYPE
	UNI_CIRCULAR_BUF :ARRAY[0..8191]OF BYTE;
	PRINTF_DATA :ARRAY[1..11]OF STRING[LOG_SIZE];
	NW_BUF_SHORT :ARRAY[0..NETWORK_BUFFER_SHORT_SIZE]OF BYTE;
	NW_BUF_LONG :ARRAY[0..NETWORK_BUFFER_LONG_SIZE]OF BYTE;
	DLOG_CRON_DATA : 	STRUCT 
		CE : ARRAY[0..5]OF DLOG_CRON_ELEMENT;
	END_STRUCT;
	DLOG_CRON_ELEMENT : 	STRUCT 
		ELEMENTS : ARRAY[0..59]OF BOOL;
		VALUE : INT;
		VALUE_MIN : INT;
		VALUE_MAX : INT;
		ALL_SELECTED : BOOL;
	END_STRUCT;
	DLOG_DATA : 	STRUCT 
		STORE_TYPE : BYTE;
		ADD_COM : INT;
		ADD_DATA_REQ : BOOL;
		CLOCK_TRIG : BOOL;
		ID_MAX : USINT;
		DTI : DATE_AND_TIME;
		UCB : UNI_CIRCULAR_BUFFER_DATA;
		LOAD_TIME_MAX : TIME;
		NEW_FILE : STRING[255];
		NEW_FILE_SIZE : UDINT;
		NEW_FILE_RTRIG : BOOL;
	END_STRUCT;
	DLOG_REAL_ARRAY_ELEMENT : 	STRUCT 
		VALUE : REAL;
		DELTA : REAL;
		COLUMN : STRING[10];
		_DELTA_LAST : REAL;
		_VALUE_LAST : REAL;
	END_STRUCT;
	DLOG_RETAIN : 	STRUCT 
		FN_REM : STRING[255];
		COLOR : BOOL;
		HEAD : BOOL;
		TRIG_CNT : UDINT;
		TRIG_CNT_TOTAL : UDINT;
	END_STRUCT;
	DLOG_SAVE : 	STRUCT 
		FN_REM : STRING[255];
		COLOR : BOOL;
		HEAD : BOOL;
		TRIG_CNT : UDINT;
		TRIG_CNT_TOTAL : UDINT;
	END_STRUCT;
	LOG_CONTROL : 	STRUCT 
		NEW_MSG : STRING[LOG_SIZE]; (* neue Nachricht für den Datenbuffer *)
		NEW_MSG_OPTION : DWORD;
		LEVEL : BYTE;
		SIZE : INT := LOG_MAX; (* Anzahl der Strings im LOG_DATA *)
		RESET : BOOL; (* Nachrichtenbuffer löschen *)
		PRINTF : PRINTF_DATA; (* Array PRINTF Parameter *)
		MSG : ARRAY[0..LOG_MAX]OF STRING[LOG_SIZE]; (* Array Message *)
		MSG_OPTION : ARRAY[0..LOG_MAX]OF DWORD; (* Array Options *)
		UPDATE_COUNT : UINT; (* Updatezähler *)
		IDX : INT; (* aktueller Nachrichten-Index *)
		RING_MODE : BOOL; (* Bufferüberlauf erkannt *)
	END_STRUCT;
	UNI_CIRCULAR_BUFFER_DATA : 	STRUCT 
		D_MODE : INT;
		D_SIZE : INT;
		D_HEAD : WORD;
		D_STRING : STRING[STRING_LENGTH];
		D_REAL : REAL;
		D_DWORD : DWORD;
		BUF_SIZE : UINT;
		BUF_COUNT : UINT;
		BUF_USED : USINT;
		BUF_USED_MAX : USINT;
		BUF_DATA_CNT : UDINT;
		BUF_DATA_LOST : UDINT;
		BUF : UNI_CIRCULAR_BUF;
		_GetStart : UINT;
		_GetEnd : UINT;
		_Last : UINT;
		_First : UINT;
	END_STRUCT;
	us_LOG_VIEWPORT : 	STRUCT 
		LINE_ARRAY : ARRAY[1..40]OF INT;
		COUNT : INT; (* Anzahl der sichtbaren Nachtrichten *)
		UPDATE_COUNT : UINT; (* Updatezähler *)
		MOVE_TO_X : INT; (* Steuerung der Nachrichtenanzeige *)
		UPDATE : BOOL; (* Daten wurden geändert -> neuzeichnen *)
	END_STRUCT;
	MYSQL_COM : 	STRUCT 
		S_BUF : NETWORK_BUFFER;
		R_BUF : NETWORK_BUFFER;
		SQL_CON : BOOL;
		SQL_URL : STRING[STRING_LENGTH];
		SQL_PACKET_NO : BYTE;
		TIMEOUT : TIME;
		DNS_IP4 : DWORD;
		SQL_RCV_STATE : BYTE;
		ERROR_C : DWORD;
		ERROR_T : BYTE;
	END_STRUCT;
	MYSQL_INFO : 	STRUCT 
		SERVER_PROTOCOL_VERSION : BYTE;
		SERVER_CAPABILITIES : WORD;
		SERVER_STATUS : WORD;
		SERVER_LANGUAGE : BYTE;
		SQL_CONNECTED : BOOL;
		SQL_ERROR : STRING[STRING_LENGTH];
		DATA_INSERT_AKTIV : BOOL;
		DATA_INSERT_OK_CNT : UDINT;
		DATA_INSERT_NOK_CNT : UDINT;
	END_STRUCT;
	FILE_PATH_DATA : 	STRUCT 
		DRIVE : STRING[3];
		DIRECTORY : STRING[STRING_LENGTH];
		FILENAME : STRING[255];
	END_STRUCT;
	FILE_SERVER_DATA : 	STRUCT 
		FILE_OPEN : BOOL;
		FILENAME : STRING[255];
		MODE : BYTE;
		OFFSET : UDINT;
		FILE_SIZE : UDINT;
		ERROR : BYTE;
		RUNTIME : FILE_SERVER_RUNTIME_DATA;
	END_STRUCT;
	FILE_SERVER_RUNTIME_DATA : 	STRUCT 
		TIME_FILE_OPEN_CUR : UDINT;
		TIME_FILE_OPEN_MAX : UDINT;
		TIME_FILE_OPEN_MIN : UDINT;
		TIME_FILE_CLOSE_CUR : UDINT;
		TIME_FILE_CLOSE_MAX : UDINT;
		TIME_FILE_CLOSE_MIN : UDINT;
		TIME_FILE_READ_CUR : UDINT;
		TIME_FILE_READ_MAX : UDINT;
		TIME_FILE_READ_MIN : UDINT;
		TIME_FILE_WRITE_CUR : UDINT;
		TIME_FILE_WRITE_MAX : UDINT;
		TIME_FILE_WRITE_MIN : UDINT;
		TIME_FILE_SEEK_CUR : UDINT;
		TIME_FILE_SEEK_MAX : UDINT;
		TIME_FILE_SEEK_MIN : UDINT;
		TIME_FILE_TELL_CUR : UDINT;
		TIME_FILE_TELL_MAX : UDINT;
		TIME_FILE_TELL_MIN : UDINT;
		TIME_FILE_DELETE_CUR : UDINT;
		TIME_FILE_DELETE_MAX : UDINT;
		TIME_FILE_DELETE_MIN : UDINT;
	END_STRUCT;
	NET_VAR_DATA : 	STRUCT 
		CYCLE : UDINT;
		STATE : BYTE;
		INDEX : INT;
		ID_MAX : USINT;
		ERROR_ID : BYTE;
		BUF_SIZE : UINT;
		S_BUF : NETWORK_BUFFER;
		R_BUF : NETWORK_BUFFER;
	END_STRUCT;
	IP2GEO_DATA : 	STRUCT 
		STATE : BOOL;
		IP4 : DWORD;
		COUNTRY_CODE : STRING[2];
		COUNTRY_NAME : STRING[20];
		REGION_CODE : STRING[2];
		REGION_NAME : STRING[20];
		CITY : STRING[20];
		GEO_LATITUDE : REAL;
		GEO_LONGITUDE : REAL;
		TIME_ZONE_NAME : STRING[20];
		GMT_OFFSET : INT;
		IS_DST : BOOL;
	END_STRUCT;
	IP_C : 	STRUCT 
		C_MODE : BYTE; (*W Mode: TCP/UCP AKTIV/PASSIV                               *)
		C_PORT : WORD; (*W Portnummer                                               *)
		C_IP : DWORD; (*W IP-Adresse gepackt wwxxyyzz = www.xxx.yyy.zzz            *)
		C_STATE : BYTE; (*R Verbindungsstatus ON/OFF + Flanke ON/OFF                 *)
		C_ENABLE : BOOL; (*W Freigabe für Connect                                     *)
		R_OBSERVE : BOOL; (*W Empfang ueberwachen                                      *)
		TIME_RESET : BOOL; (*W Alle Timer ruecksetzen                                   *)
		ERROR : DWORD; (*R vvwwxxyy (vv = CON_ERROR, ww = SEN_ERROR, xx = REC_ERROR *)
		FIFO : IP_FIFO_DATA; (*I IP FIFO Struktur                                         *)
		MAILBOX : ARRAY[1..16]OF BYTE; (*I Mailbox: Datenbereich für Bausteindatenaustausch         *)
	END_STRUCT;
	IP_FIFO_DATA : 	STRUCT 
		X : ARRAY[1..128]OF BYTE; (* IP_ID FIFO Speicher          *)
		Y : ARRAY[1..128]OF BYTE; (* IP_ID Zähler                 *)
		ID : BYTE; (* höchste vergabene id         *)
		MAX_ID : BYTE; (* maximal Anmeldungen pro ID   *)
		INIT : BOOL; (* Initialisierung durchgeführt *)
		EMPTY : BOOL; (* FIFO leer                    *)
		FULL : BOOL; (* FIFO voll                    *)
		TOP : INT; (* maximale anzahl in FIFO      *)
		NW : INT; (* Schreibzeiger                *)
		NR : INT; (* Lesezeiger                   *)
	END_STRUCT;
	NETWORK_BUFFER : 	STRUCT 
		SIZE : UINT;
		BUFFER : NW_BUF_LONG;
	END_STRUCT;
	NETWORK_BUFFER_SHORT : 	STRUCT 
		SIZE : UINT;
		BUFFER : NW_BUF_SHORT;
	END_STRUCT;
	URL : 	STRUCT 
		PROTOCOL : STRING[10];
		USER : STRING[32];
		PASSWORD : STRING[32];
		DOMAIN : STRING[80];
		PORT : WORD;
		PATH : STRING[80];
		QUERY : STRING[STRING_LENGTH];
		ANCHOR : STRING[40];
		HEADER : STRING[160];
	END_STRUCT;
	VMAP_DATA : 	STRUCT 
		FC : DWORD;
		V_ADR : INT;
		V_SIZE : INT;
		P_ADR : INT;
		TIME_OUT : TIME;
	END_STRUCT;
	XML_CONTROL : 	STRUCT 
		COMMAND : WORD;
		WATCHDOG : TIME;
		START_POS : UINT;
		STOP_POS : UINT;
		COUNT : UINT;
		TYP : INT;
		LEVEL : UINT;
		PATH : STRING[STRING_LENGTH];
		ELEMENT : STRING[STRING_LENGTH];
		ATTRIBUTE : STRING[STRING_LENGTH];
		VALUE : STRING[STRING_LENGTH];
		BLOCK1_START : UINT;
		BLOCK1_STOP : UINT;
		BLOCK2_START : UINT;
		BLOCK2_STOP : UINT;
	END_STRUCT;
	us_TN_INPUT_CONTROL : 	STRUCT 
		bo_Enable : BOOL; (* Bearbeitung freigeben/sperren *)
		bo_Update_all : BOOL; (* All Elemente neu zeichnen *)
		bo_Reset_Fokus : BOOL; (* Fokus auf 1. Element setzen *)
		in_Focus_at : INT; (* Controlelement mit aktivem Fokus *)
		in_Count : INT; (* Anzahl der benutzen Control-Elemente *)
		in_ToolTip_X : INT; (* Tooltip Text X-Offset *)
		in_ToolTip_Y : INT; (* Tooltip Text Y-Offset *)
		by_ToolTip_Attr : BYTE; (* Tooltip Text Attribute *)
		in_ToolTip_Size : INT; (* Tooltip Text länge *)
		usa_TN_INPUT_CONTROL_DATA : ARRAY[1..20]OF us_TN_INPUT_CONTROL_DATA;
	END_STRUCT;
	us_TN_INPUT_CONTROL_DATA : 	STRUCT 
		by_Input_Exten_Code : BYTE;
		by_Input_ASCII_Code : BYTE;
		bo_Input_ASCII_IsNum : BOOL;
		in_Title_X_Offset : INT; (* Title Text X-Offset *)
		in_Title_Y_Offset : INT; (* Title Text Y-Offset *)
		by_Title_Attr : BYTE; (* Title Text Attribute *)
		st_Title_String : STRING[255]; (* Title Text String *)
		in_Cursor_X : INT; (* aktuelle Cursor X-Position *)
		in_Cursor_Y : INT; (* aktuelle Cursor Y-Position *)
		in_Type : INT; (* Type des Elements *)
		in_X : INT; (* Element X-Position *)
		in_Y : INT; (* Element Y-Position *)
		in_Cursor_Pos : INT; (* aktuelle Cursorposition *)
		by_Attr_mF : BYTE; (* Text Attribute mit Fokus *)
		by_Attr_oF : BYTE; (* Text Attribute ohne Fokus *)
		in_selected : INT; (* Text Item wurde ausgewählt *)
		st_Input_Mask : STRING[255]; (* Text Eingabemaske *)
		st_Input_Data : STRING[STRING_LENGTH]; (* Text aktuelle Eingabedaten *)
		st_Input_String : STRING[255]; (* Text Kopie nach Return-Taste *)
		st_Input_ToolTip : STRING[255]; (* Text ToolTip (Eingabeinformation) *)
		in_Input_Option : INT; (* Text Ausgabe-Optionen *)
		bo_Input_Entered : BOOL; (* RETURN-Taste wurde betätigt *)
		bo_Input_Hidden : BOOL; (* Text versteckete Eingabe mit '*' *)
		bo_Input_Only_Num : BOOL; (* Text nur Nummerneingabe zulassen *)
		bo_Focus : BOOL; (* Element besitzt den Fokus *)
		bo_Update_Input : BOOL; (* Element wegen Benutzereingabe neuzeichnen *)
		bo_Update_All : BOOL; (* Element komplett neuzeichnen *)
	END_STRUCT;
	us_TN_MENU : 	STRUCT 
		st_Menu_Text : STRING[STRING_LENGTH]; (* X Menue Texte *)
		in_Menu_E_Count : INT; (* Menue Elemente Anzahl *)
		in_Y : INT; (* Menue Zeilennummer  Y-Position *)
		in_X : INT; (* Menue Spaltennummer X-Position *)
		by_Attr_mF : BYTE; (* Text Attribute mit Fokus *)
		by_Attr_oF : BYTE; (* Text Attribute ohne Fokus *)
		in_X_SM_new : INT; (* neue Sub-Menu X-Position *)
		in_Y_SM_new : INT; (* neue Sub-Menu Y-Position *)
		in_X_SM_old : INT; (* alte Sub-Menu X-Position *)
		in_Y_SM_old : INT; (* alte Sub-Menu Y-Position *)
		in_Cur_Menu_Item : INT; (* aktuelles Haupt-Menue *)
		in_Cur_Sub_Item : INT; (* aktuelles Sub-Menue *)
		in_State : INT; (*   Menu status   *)
		in_Menu_Selected : INT; (* X Menu-Item mit Enter angewwählt *)
		bo_Create : BOOL; (* X Menu erzeugen *)
		bo_Destroy : BOOL; (* X Menu entfernen *)
		bo_Update : BOOL; (* X Menu updaten *)
	END_STRUCT;
	us_TN_MENU_POPUP : 	STRUCT 
		st_Menu_Text : STRING[STRING_LENGTH]; (* X Menue Texte *)
		in_Menu_E_Count : INT; (* Menue Elemente Anzahl *)
		in_X : INT; (* X Menue X-Position *)
		in_Y : INT; (* X Menue Y-Position *)
		in_Cols : INT; (* Menue Spaltenanzahl *)
		in_Rows : INT; (* Menue Zeilenanzahl *)
		in_Cur_Item : INT; (* X aktuelles Sub-Menue *)
		by_Attr_mF : BYTE; (* X Text Attribute mit Fokus	*)
		by_Attr_oF : BYTE; (* X Text Attribute ohne Fokus *)
		by_Input_Exten_Code : BYTE; (* X Tastencode: Sondertasten *)
		bo_Create : BOOL; (* X Popup-Menu erzeugen *)
		bo_Destroy : BOOL; (* X Popup-Menu entfernen *)
		bo_Update : BOOL; (* X Popup-Menu updaten *)
		bo_Activ : BOOL; (*   Popup-Menu ist aktiv *)
	END_STRUCT;
	us_TN_SCREEN : 	STRUCT 
		bya_CHAR : ARRAY[0..1919]OF BYTE;
		bya_COLOR : ARRAY[0..1919]OF BYTE;
		bya_BACKUP : ARRAY[0..1919]OF BYTE;
		bya_Line_Update : ARRAY[0..23]OF BOOL;
		by_Input_Exten_Code : BYTE;
		by_Input_ASCII_Code : BYTE;
		bo_Input_ASCII_IsNum : BOOL;
		in_Page_Number : INT; (* aktive Seiten-Nr. *)
		in_Cursor_X : INT; (* Cursor X-Position *)
		in_Cursor_Y : INT; (* Cursor Y-Position *)
		in_EOS_Offset : INT; (* End of String Offset *)
		by_Clear_Screen_Attr : BYTE; (* Clear-Screen Attr *)
		bo_Clear_Screen : BOOL; (* Clear-Screen auslösen *)
		bo_Modal_Dialog : BOOL; (* Modaler Dialog ist aktiv *)
		bo_Menue_Bar_Dialog : BOOL; (* Menue Dialog ist aktiv *)
	END_STRUCT;
	WORLD_WEATHER_CUR : 	STRUCT 
		OBSERVATION_TIME : STRING[8];
		TEMP_C : INT;
		WEATHER_CODE : INT;
		WEATHER_DESC : STRING[60];
		WEATHER_ICON : INT;
		WIND_SPEED_MILES : INT;
		WIND_SPEED_KMPH : INT;
		WIND_DIR_DEGREE : INT;
		WIND_DIR16POINT : STRING[3];
		PRECIPMM : REAL;
		HUMIDITY : INT;
		VISIBILITY : INT;
		PRESSURE : INT;
		CLOUDOVER : INT;
	END_STRUCT;
	WORLD_WEATHER_DATA : 	STRUCT 
		CUR : WORLD_WEATHER_CUR;
		DAY : ARRAY[0..4]OF WORLD_WEATHER_DAY;
	END_STRUCT;
	WORLD_WEATHER_DAY : 	STRUCT 
		DATE_OF_DAY : STRING[10];
		TEMP_MAX_C : INT;
		TEMP_MAX_F : INT;
		TEMP_MIN_C : INT;
		TEMP_MIN_F : INT;
		WIND_SPEED_MILES : INT;
		WIND_SPEED_KMPH : INT;
		WIND_DIR_DEGREE : INT;
		WIND_DIR16POINT : STRING[3];
		WEATHER_CODE : INT;
		WEATHER_DESC : STRING[60];
		WEATHER_ICON : INT;
		PRECIPMM : REAL;
	END_STRUCT;
	YAHOO_WEATHER_DATA : 	STRUCT 
		LOCATION_CITY : STRING[40]; (* THE LOCATION OF THIS FORECAST: CITY: CITY NAME  *)
		LOCATION_REGION : STRING[20]; (* THE LOCATION OF THIS FORECAST: REGION: STATE, TERRITORY, OR REGION, IF GIVEN *)
		LOCATION_COUNTRY : STRING[20]; (* THE LOCATION OF THIS FORECAST: COUNTRY: TWO-CHARACTER COUNTRY CODE *)
		UNIT_TEMPERATURE : STRING[1]; (* TEMPERATURE: DEGREE UNITS, F FOR FAHRENHEIT OR C FOR CELSIUS *)
		UNIT_DISTANCE : STRING[2]; (* DISTANCE: UNITS FOR DISTANCE, MI FOR MILES OR KM FOR KILOMETERS *)
		UNIT_PRESSURE : STRING[2]; (* PRESSURE: UNITS OF BAROMETRIC PRESSURE, IN FOR POUNDS PER SQUARE INCH OR MB FOR MILLIBARS *)
		UNIT_SPEED : STRING[4]; (* SPEED: UNITS OF SPEED, MPH FOR MILES PER HOUR OR KPH FOR KILOMETERS PER HOUR *)
		WIND_CHILL : INT; (* FORECAST INFORMATION ABOUT WIND CHILL IN DEGREES *)
		WIND_DIRECTION : INT; (* FORECAST INFORMATION ABOUT WIND DIRECTION, IN DEGREES *)
		WIND_SPEED : REAL; (* FORECAST INFORMATION ABOUT WIND SPEED, IN THE UNITS (MPH OR KPH)*)
		ATMOSPHERE_HUMIDITY : INT; (* FORECAST INFORMATION ABOUT CURRENT ATMOSPHERIC HUMIDITY: HUMIDITY, IN PERCENT  *)
		ATMOSPHERE_PRESSURE : REAL; (* FORECAST INFORMATION ABOUT CURRENT ATMOSPHERIC PRESSURE: BAROMETRIC PRESSURE, IN THE UNITS (IN OR MB) *)
		ATMOSPHERE_VISIBILITY : REAL; (* FORECAST INFORMATION ABOUT CURRENT ATMOSPHERIC VISIBILITY, IN THE UNITS (MI OR KM) *)
		ATMOSPHERE_RISING : INT; (* FORECAST INFORMATION ABOUT RISING: STATE OF THE BAROMETRIC PRESSURE: STEADY (0), RISING (1), OR FALLING (2). (INTEGER: 0, 1, 2) *)
		ASTRONOMY_SUNRISE : STRING[10]; (* SUNRISE: TODAY'S SUNRISE TIME. THE TIME IS A STRING IN A LOCAL TIME FORMAT OF "H:MM AM/PM" *)
		ASTRONOMY_SUNSET : STRING[10]; (* SUNSET: TODAY'S SUNSET TIME. THE TIME IS A STRING IN A LOCAL TIME FORMAT OF "H:MM AM/PM", *)
		GEO_LATITUDE : REAL; (* THE LATITUDE OF THE LOCATION *)
		GEO_LONGITUDE : REAL; (* THE LONGITUDE OF THE LOCATION *)
		CUR_CONDITIONS_TEMP : INT; (* THE CURRENT WEATHER CONDITIONS: TEMP: THE CURRENT TEMPERATURE, IN THE UNITS (F OR C) *)
		CUR_CONDITIONS_TEXT : STRING[40]; (* THE CURRENT WEATHER CONDITIONS: TEXT: A TEXTUAL DESCRIPTION OF CONDITIONS *)
		CUR_CONDITIONS_CODE : INT; (* THE CURRENT WEATHER CONDITIONS: CODE: THE CONDITION CODE FOR THIS FORECAST *)
		CUR_CONDITIONS_ICON : INT; (* THE CURRENT WEATHER CONDITIONS: ICON: THE CONDITION ICON FOR THIS FORECAST *)
		FORECAST_TODAY_LOW_TEMP : INT; (* THE FORECAST TODAY WEATHER CONDITIONS: THE FORECASTED LOW TEMPERATURE FOR THIS DAY IN THE UNITS (F OR C) *)
		FORECAST_TODAY_HIGH_TEMP : INT; (* THE FORECAST TODAY WEATHER CONDITIONS: THE FORECASTED HIGH TEMPERATURE FOR THIS DAY IN THE UNITS (F OR C) *)
		FORECAST_TODAY_TEXT : STRING[40]; (* THE FORECAST TODAY WEATHER CONDITIONS: TEXT: A TEXTUAL DESCRIPTION OF CONDITIONS *)
		FORECAST_TODAY_CODE : INT; (* THE CURRENT WEATHER CONDITIONS: CODE: THE CONDITION CODE FOR THIS FORECAST *)
		FORECAST_TODAY_ICON : INT; (* THE CURRENT WEATHER CONDITIONS: ICON: THE CONDITION ICON FOR THIS FORECAST *)
		FORECAST_TODAY_DATE_LONG : STRING[20]; (* THE CURRENT WEATHER CONDITIONS: DATE: DATE OF THE DAY *)
		FORECAST_DAY : ARRAY[1..9]OF YAHOO_WEATHER_FORECAST_DAY; (* THE CURRENT WEATHER DAYS ARRAY *)
	END_STRUCT;
	YAHOO_WEATHER_FORECAST_DAY : 	STRUCT 
		LOW_TEMP : INT; (* THE FORECAST WEATHER CONDITIONS: THE FORECASTED LOW TEMPERATURE FOR THIS DAY IN THE UNITS (F OR C) *)
		HIGH_TEMP : INT; (* THE FORECAST WEATHER CONDITIONS: THE FORECASTED HIGH TEMPERATURE FOR THIS DAY IN THE UNITS (F OR C) *)
		TEXT : STRING[40]; (* THE FORECAST WEATHER CONDITIONS: TEXT: A TEXTUAL DESCRIPTION OF CONDITIONS *)
		DATE_LONG : STRING[20]; (* THE FORECAST WEATHER CONDITIONS: DATE: DATE OF THE DAY *)
		CODE : INT; (* THE FORECAST WEATHER CONDITIONS: CODE: THE CONDITION CODE FOR THIS FORECAST *)
		ICON : INT; (* THE FORECAST WEATHER CONDITIONS: ICON: THE CONDITION ICON FOR THIS FORECAST *)
	END_STRUCT;
END_TYPE
