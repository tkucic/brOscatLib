
FUNCTION_BLOCK ACTUATOR_2P (* Actuators *) (* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=12 *)
	VAR_INPUT
		IN : BYTE;
		TEST : BOOL;
		ARE : BOOL := TRUE;
		CYCLE_TIME : TIME;
		SENS : BYTE;
		SELF_ACT_TIME : TIME;
		SELF_ACT_PULSE : TIME;
		SELF_ACT_CYCLES : INT := 1;
	END_VAR
	VAR_OUTPUT
		OUT : BOOL;
		ARO : BOOL;
	END_VAR
	VAR_IN_OUT
		ARX : BOOL;
	END_VAR
	VAR
		timer : AUTORUN;
		pwgen : GEN_PULSE;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK ACTUATOR_3P (* Actuators *) (* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=13 *)
	VAR_INPUT
		IN : BYTE;
		TEST : BOOL;
		ARE : BOOL := TRUE;
		END_POS : BOOL;
		T_RUN : TIME := TIME#1m0s0ms;
		T_EXT : TIME := TIME#10s0ms;
		T_CAL : TIME := TIME#10m0s0ms;
		T_DIAG : TIME := TIME#14400m0s0ms;
		SWITCH_AVAIL : BOOL;
	END_VAR
	VAR_OUTPUT
		OUT1 : BOOL;
		OUT2 : BOOL;
		POS : BYTE;
		ERROR : BOOL;
		STATUS : BYTE;
	END_VAR
	VAR_IN_OUT
		ARX : BOOL;
	END_VAR
	VAR
		ramp : _RMP_NEXT;
		tx : TIME;
		next_cal : TIME;
		next_diag : TIME;
		last : TIME;
		start : TIME;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK ACTUATOR_A (* Actuators *) (* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=15 *)
	VAR_INPUT
		I1 : BYTE;
		IS : BOOL;
		I2 : BYTE;
		RV : BOOL;
		DX : BOOL;
		RUNTIME : TIME;
		SELF_ACT_TIME : TIME;
		OUT_MIN : WORD;
		OUT_MAX : WORD;
	END_VAR
	VAR_OUTPUT
		Y : WORD;
	END_VAR
	VAR
		timer : CYCLE_4;
		dx_edge : BOOL;
		_OUT_MAX : UINT;
		_OUT_MIN : UINT;
		_I1 : USINT;
		_I2 : USINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK ACTUATOR_COIL (* Actuators *) (* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=16 *)
	VAR_INPUT
		IN : BOOL;
		SELF_ACT_CYCLE : TIME := TIME#14400m0s0ms;
		SELF_ACT_TIME : TIME := TIME#1s0ms;
	END_VAR
	VAR_OUTPUT
		OUT : BOOL;
		STATUS : BYTE;
	END_VAR
	VAR
		last : UDINT;
		init : BOOL;
		tx : UDINT;
		now : UDINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK ACTUATOR_PUMP (* Actuators *) (* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=16 *)
	VAR_INPUT
		IN : BOOL;
		MANUAL : BOOL;
		RST : BOOL;
		MIN_ONTIME : TIME := TIME#10s0ms;
		MIN_OFFTIME : TIME := TIME#10s0ms;
		RUN_EVERY : TIME := TIME#10000m0s0ms;
	END_VAR
	VAR_OUTPUT
		PUMP : BOOL;
	END_VAR
	VAR_IN_OUT
		RUNTIME : UDINT;
		CYCLES : UDINT;
	END_VAR
	VAR
		tx : TIME;
		last_change : TIME;
		meter : ONTIME;
		old_man : BOOL;
		init : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK ACTUATOR_UD (* Actuators *) (* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=17 *)
	VAR_INPUT
		UD : BOOL;
		ON : BOOL;
		MANUAL : BOOL;
		UP : BOOL;
		DN : BOOL;
		OFF : BOOL;
		YUP_IN : BOOL;
		YDN_IN : BOOL;
		TON : TIME;
		TOFF : TIME;
		OUT_RETURN : BOOL;
	END_VAR
	VAR_OUTPUT
		YUP : BOOL;
		YDN : BOOL;
		STATUS : BYTE;
	END_VAR
	VAR
		tx : TIME;
		last : TIME;
		init : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK AUTORUN (* Actuators *) (* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=19 *)
	VAR_INPUT
		IN : BOOL;
		TEST : BOOL;
		ARE : BOOL := TRUE;
		TRUN : TIME;
		TOFF : TIME;
	END_VAR
	VAR_OUTPUT
		OUT : BOOL;
		ARO : BOOL;
	END_VAR
	VAR_IN_OUT
		ARX : BOOL;
	END_VAR
	VAR
		timer : _RMP_B;
		val : BYTE;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK CLICK (* Electrical *) (* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=47 *)
	VAR_INPUT
		IN : BOOL;
		T_DEBOUNCE : TIME := TIME#10ms;
		T_SHORT : TIME := TIME#200ms;
		T_PAUSE : TIME := TIME#500ms;
		T_RECONFIG : TIME := TIME#1m0s0ms;
	END_VAR
	VAR_OUTPUT
		Q : BOOL;
		SINGLE : BOOL;
		DOUBLE : BOOL;
		TRIPLE : BOOL;
		STATUS : BYTE;
	END_VAR
	VAR
		s_in : SW_RECONFIG;
		tx : TIME;
		state : INT;
		last : TIME;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK CLICK_MODE (* Electrical *) (* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=49 *)
	VAR_INPUT
		IN : BOOL;
		T_LONG : TIME := TIME#500ms;
	END_VAR
	VAR_OUTPUT
		SINGLE : BOOL;
		DOUBLE : BOOL;
		LONG : BOOL;
		TP_LONG : BOOL;
	END_VAR
	VAR
		Timer : TP;
		cnt : INT;
		last : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK DEBOUNCE (* Electrical *) (* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=49 *)
	VAR_INPUT
		IN : BOOL;
		TD : TIME;
		PM : BOOL;
	END_VAR
	VAR_OUTPUT
		Q : BOOL;
	END_VAR
	VAR
		deb : TOF;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK DIMM_2 (* Electrical *) (* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=50 *)
	VAR_INPUT
		SET : BOOL;
		VAL : BYTE := 255;
		I1 : BOOL;
		I2 : BOOL;
		RST : BOOL;
		T_DEBOUNCE : TIME := TIME#10ms;
		T_ON_MAX : TIME := TIME#0ms;
		T_DIMM_START : TIME := TIME#1s0ms;
		T_DIMM : TIME := TIME#3s0ms;
		MIN_ON : BYTE := 50;
		MAX_ON : BYTE := 255;
		RST_OUT : BOOL := TRUE;
		SOFT_DIMM : BOOL := TRUE;
		DBL1_TOG : BOOL;
		DBL2_TOG : BOOL;
		DBL1_SET : BOOL;
		DBL2_SET : BOOL;
		DBL1_POS : BYTE;
		DBL2_POS : BYTE;
	END_VAR
	VAR_OUTPUT
		Q : BOOL := FALSE;
		D1 : BOOL;
		D2 : BOOL;
	END_VAR
	VAR_IN_OUT
		OUT : BYTE;
	END_VAR
	VAR
		t1 : TOF;
		t2 : TOF;
		dc1 : CLICK_MODE;
		dc2 : CLICK_MODE;
		t3 : TON;
		dim : _RMP_B;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK DIMM_I (* Electrical *) (* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=52 *)
	VAR_INPUT
		SET : BOOL;
		VAL : BYTE := 255;
		IN : BOOL;
		RST : BOOL;
		T_DEBOUNCE : TIME := TIME#10ms;
		T_RECONFIG : TIME := TIME#10s0ms;
		T_ON_MAX : TIME := TIME#0ms;
		T_DIMM_START : TIME := TIME#1s0ms;
		T_DIMM : TIME := TIME#3s0ms;
		MIN_ON : BYTE := 50;
		MAX_ON : BYTE := 255;
		SOFT_DIMM : BOOL := TRUE;
		DBL_TOGGLE : BOOL;
		RST_OUT : BOOL;
	END_VAR
	VAR_OUTPUT
		Q : BOOL := FALSE;
		DBL : BOOL;
	END_VAR
	VAR_IN_OUT
		OUT : BYTE;
	END_VAR
	VAR
		config : SW_RECONFIG;
		decode : CLICK_MODE;
		t3 : TON;
		dim : _RMP_B;
		dir : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK F_LAMP (* Electrical *) (* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=54 *)
	VAR_INPUT
		SWITCH : BOOL;
		DIMM : BYTE := 255;
		RST : BOOL;
		T_NO_DIMM : UINT := 100;
		T_MAINTENANCE : UINT := 15000;
	END_VAR
	VAR_OUTPUT
		LAMP : BYTE;
		STATUS : BYTE;
	END_VAR
	VAR_IN_OUT
		ONTIME : UDINT;
		CYCLES : UDINT;
	END_VAR
	VAR
		runtime : ONTIME;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK PULSE_LENGTH (* Electrical *) (* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=56 *)
	VAR_INPUT
		IN : BOOL;
		T_SHORT : TIME := TIME#100ms;
		T_LONG : TIME := TIME#1s0ms;
	END_VAR
	VAR_OUTPUT
		SHORT : BOOL;
		MIDDLE : BOOL;
		LONG : BOOL;
	END_VAR
	VAR
		tx : TIME;
		tn : TIME;
		edge_ : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK PULSE_T (* Electrical *) (* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=56 *)
	VAR_INPUT
		IN : BOOL;
		T1 : TIME;
		T2 : TIME;
		RST : BOOL;
	END_VAR
	VAR_OUTPUT
		Q : BOOL;
	END_VAR
	VAR
		init : BOOL;
		last : TIME;
		tx : TIME;
		edge_ : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK SW_RECONFIG (* Electrical *) (* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=57 *)
	VAR_INPUT
		IN : BOOL;
		TD : TIME;
		TR : TIME;
	END_VAR
	VAR_OUTPUT
		Q : BOOL;
	END_VAR
	VAR
		T1 : TON;
		T2 : TON;
		INV : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK SWITCH_I (* Electrical *) (* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=58 *)
	VAR_INPUT
		SET : BOOL;
		IN : BOOL;
		RST : BOOL;
		T_DEBOUNCE : TIME := TIME#10ms;
		T_RECONFIG : TIME := TIME#1s0ms;
		T_ON_MAX : TIME := TIME#0ms;
	END_VAR
	VAR_OUTPUT
		Q : BOOL;
	END_VAR
	VAR
		state : BYTE;
		edge_ : BOOL;
		r_edge : BOOL;
		T_on : TIME;
		tx : TIME;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK SWITCH_X (* Electrical *) (* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=59 *)
	VAR_INPUT
		IN1 : BOOL;
		IN2 : BOOL;
		IN3 : BOOL;
		IN4 : BOOL;
		IN5 : BOOL;
		IN6 : BOOL;
		T_DEBOUNCE : TIME := TIME#50ms;
	END_VAR
	VAR_OUTPUT
		Q1 : BOOL;
		Q2 : BOOL;
		Q3 : BOOL;
		Q4 : BOOL;
		Q5 : BOOL;
		Q6 : BOOL;
		Q31 : BOOL;
		Q41 : BOOL;
		Q51 : BOOL;
		Q61 : BOOL;
		Q32 : BOOL;
		Q42 : BOOL;
		Q52 : BOOL;
		Q62 : BOOL;
	END_VAR
	VAR
		init : BOOL;
		T1 : TOF;
		T2 : TOF;
		T3 : TOF;
		T4 : TOF;
		T5 : TOF;
		T6 : TOF;
		tx : TIME;
		x1 : BOOL;
		x2 : BOOL;
		E1 : BOOL;
		E2 : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK TIMER_1 (* Electrical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=60 *)
	VAR_INPUT
		E : BOOL := TRUE;
		DTI : DATE_AND_TIME;
		START : TIME_OF_DAY;
		DURATION : TIME;
		DAY : BYTE := 2#1111111;
	END_VAR
	VAR_OUTPUT
		Q : BOOL;
		STOP : TIME;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK TIMER_2 (* Electrical *) (* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=60 *)
	VAR_INPUT
		DT_IN : DATE_AND_TIME;
		START : TIME_OF_DAY;
		DURATION : TIME;
		MODE : BYTE;
		HOLIDAY : BOOL;
	END_VAR
	VAR_OUTPUT
		Q : BOOL;
	END_VAR
	VAR
		last_check : TIME;
		dat : DATE;
		daytime : TIME_OF_DAY;
		activation : TIME;
		tx : TIME;
		enabled : BOOL;
		init : BOOL;
		wday : INT;
	END_VAR
	VAR RETAIN
		run_date : DATE;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION TIMER_EVENT_DECODE : BOOL (* Electrical *) (* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=62 *)
	VAR_INPUT
		EVENT : STRING[STRING_LENGTH];
		LANG : INT;
	END_VAR
	VAR_IN_OUT
		RETVAL : TIMER_EVENT; (*Return value of the function*)
	END_VAR
	VAR
		pos : INT;
		start : INT;
		stop : INT;
		pt : REFERENCE TO ARRAY[1..255] OF BYTE;
		step : INT;
		tmp : STRING[60];
	END_VAR
END_FUNCTION

FUNCTION_BLOCK TIMER_EXT (* Electrical *) (* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=63 *)
	VAR_INPUT
		ENA : BOOL := TRUE;
		ON : BOOL;
		OFF : BOOL;
		MAN : BOOL;
		SWITCH : BOOL;
		DT_IN : DATE_AND_TIME;
		SUN_RISE : TIME_OF_DAY;
		SUN_SET : TIME_OF_DAY;
		HOLIDAY : BOOL;
		T_DEBOUNCE : TIME := TIME#100ms;
		T_RISE_START : TIME;
		T_RISE_STOP : TIME;
		T_SET_START : TIME;
		T_SET_STOP : TIME;
		T_DAY_START : TIME_OF_DAY;
		T_DAY_STOP : TIME_OF_DAY;
		ENABLE_SATURDAY : BOOL;
		ENABLE_SUNDAY : BOOL;
		ENABLE_HOLIDAY : BOOL;
	END_VAR
	VAR_OUTPUT
		Q : BOOL;
		STATUS : BYTE;
	END_VAR
	VAR
		mx : MANUAL_2;
		deb : DEBOUNCE;
		tdx : TIME_OF_DAY;
		wdx : INT;
		tc : TIME;
		tx : UDINT;
		tl : UDINT;
		qx : BOOL;
		init : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK TIMER_P4 (* Electrical *) (* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=65 *)
	VAR_INPUT
		DTIME : DATE_AND_TIME;
		TREF_0 : TIME_OF_DAY;
		TREF_1 : TIME_OF_DAY;
		HOLY : BOOL;
		L0 : BOOL;
		L1 : BOOL;
		L2 : BOOL;
		L3 : BOOL;
		OFS : BYTE;
		ENQ : BOOL;
		MAN : BOOL;
		MI : BYTE;
		RST : BOOL;
	END_VAR
	VAR_OUTPUT
		Q0 : BOOL;
		Q1 : BOOL;
		Q2 : BOOL;
		Q3 : BOOL;
		STATUS : BYTE;
	END_VAR
	VAR_IN_OUT
		PROG : ARRAY[0..array_max] OF TIMER_EVENT;
	END_VAR
	VAR CONSTANT
		array_max : INT := 63;
		channel_max : INT := 3;
	END_VAR
	VAR
		day_start : DATE_AND_TIME;
		start : DATE_AND_TIME;
		event : TIMER_EVENT;
		pos : INT;
		last_execute : DATE_AND_TIME;
		current_day : DINT;
		mask : BYTE;
		ma : ARRAY[0..channel_max] OF BYTE;
		mo : ARRAY[0..channel_max] OF BYTE;
		qn : ARRAY[0..channel_max] OF BOOL;
		qs : ARRAY[0..channel_max] OF BOOL;
		channel : INT;
		tx : TIME_OF_DAY;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION AIR_DENSITY : REAL (* HLK *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=426 *)
	VAR_INPUT
		T : REAL;
		P : REAL;
		RH : REAL;
	END_VAR
	VAR CONSTANT
		RL : REAL := 287.05;
		RX : REAL := 0.003773319;
	END_VAR
END_FUNCTION

FUNCTION AIR_ENTHALPY : REAL (* HLK *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=427 *)
	VAR_INPUT
		T : REAL;
		RH : REAL;
	END_VAR
	VAR CONSTANT
		CPL : REAL := 1.00482;
		CW : REAL := 1.86;
		LH : REAL := 2500.78;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK BOILER (* HLK *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=428 *)
	VAR_INPUT
		T_UPPER : REAL;
		T_LOWER : REAL;
		PRESSURE : BOOL := TRUE;
		ENABLE : BOOL := TRUE;
		REQ_1 : BOOL;
		REQ_2 : BOOL;
		BOOST : BOOL;
		T_UPPER_MIN : REAL := 50;
		T_UPPER_MAX : REAL := 60;
		T_LOWER_ENABLE : BOOL;
		T_LOWER_MAX : REAL := 60;
		T_REQUEST_1 : REAL := 70;
		T_REQUEST_2 : REAL := 50;
		T_REQUEST_HYS : REAL := 5;
		T_PROTECT_HIGH : REAL := 80;
		T_PROTECT_LOW : REAL := 10;
	END_VAR
	VAR_OUTPUT
		HEAT : BOOL;
		ERROR : BOOL;
		STATUS : BYTE;
	END_VAR
	VAR
		edge_ : BOOL;
		boost_mode : BOOL;
		flag_0 : BOOL;
		flag_1 : BOOL;
		flag_2 : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK BURNER (* HLK *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=430 *)
	VAR_INPUT
		IN : BOOL;
		STAGE2 : BOOL;
		OVER_TEMP : BOOL;
		OIL_TEMP : BOOL := TRUE;
		FLAME : BOOL;
		RST : BOOL;
		RST_TIMER : BOOL;
		PRE_HEAT_TIME : TIME := TIME#5s0ms;
		PRE_VENT_TIME : TIME := TIME#15s0ms;
		PRE_IGNITE_TIME : TIME := TIME#5s0ms;
		POST_IGNITE_TIME : TIME := TIME#25s0ms;
		STAGE2_DELAY : TIME := TIME#10s0ms;
		SAFETY_TIME : TIME := TIME#5s0ms;
		LOCKOUT_TIME : TIME := TIME#10s0ms;
		MULTIPLE_IGNITION : BOOL := TRUE;
		KW1 : REAL;
		KW2 : REAL;
	END_VAR
	VAR_OUTPUT
		MOTOR : BOOL;
		COIL1 : BOOL;
		COIL2 : BOOL;
		PRE_HEAT : BOOL;
		IGNITE : BOOL;
		KWH : REAL;
		STATUS : BYTE;
		FAIL : BOOL;
	END_VAR
	VAR_IN_OUT
		RUNTIME1 : UDINT;
		RUNTIME2 : UDINT;
		CYCLES : UDINT;
	END_VAR
	VAR
		state : BYTE;
		last : TIME;
		tx : TIME;
		last_change : TIME;
		timer1 : ONTIME;
		timer2 : ONTIME;
		oil_temp_last : BOOL;
		cycles2 : UDINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION DEW_CON : REAL (* HLK *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=434 *)
	VAR_INPUT
		RH : REAL;
		T : REAL;
	END_VAR
END_FUNCTION

FUNCTION DEW_RH : REAL (* HLK *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=435 *)
	VAR_INPUT
		VC : REAL;
		T : REAL;
	END_VAR
END_FUNCTION

FUNCTION DEW_TEMP : REAL (* HLK *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=436 *)
	VAR_INPUT
		RH : REAL;
		T : REAL;
	END_VAR
	VAR CONSTANT
		a : REAL := 7.5;
		b : REAL := 237.3;
	END_VAR
	VAR
		V : REAL;
	END_VAR
END_FUNCTION

FUNCTION HEAT_INDEX : REAL (* HLK *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=436 *)
	VAR_INPUT
		T : REAL;
		RH : REAL;
	END_VAR
	VAR
		RH2 : REAL;
		T2 : REAL;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK HEAT_METER (* HLK *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=436 *)
	VAR_INPUT
		TF : REAL;
		TR : REAL;
		LPH : REAL;
		E : BOOL;
		RST : BOOL;
		CP : REAL;
		DENSITY : REAL;
		CONTENT : REAL;
		PULSE_MODE : BOOL;
		RETURN_METER : BOOL;
		AVG_TIME : TIME := TIME#5s0ms;
	END_VAR
	VAR_OUTPUT
		C : REAL;
	END_VAR
	VAR_IN_OUT
		Y : REAL;
	END_VAR
	VAR
		tx : UDINT;
		last : UDINT;
		int1 : FT_INT2;
		edge_ : BOOL;
		x : REAL;
		init : BOOL;
		y_last : REAL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK HEAT_TEMP (* HLK *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=33 *)
	VAR_INPUT
		T_EXT : REAL;
		T_INT : REAL;
		OFFSET : REAL;
		T_REQ : REAL;
		TY_MAX : REAL := 70;
		TY_MIN : REAL := 25;
		TY_CONFIG : REAL := 70;
		T_INT_CONFIG : REAL := 20;
		T_EXT_CONFIG : REAL := -15;
		T_DIFF : REAL := 10;
		C : REAL := 1.33;
		H : REAL := 3;
	END_VAR
	VAR_OUTPUT
		TY : REAL;
		HEAT : BOOL;
	END_VAR
	VAR
		tr : REAL;
		tx : REAL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK LEGIONELLA (* HLK *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=443 *)
	VAR_INPUT
		MANUAL : BOOL;
		TEMP_BOILER : REAL;
		TEMP_RETURN : REAL := 100;
		DT_IN : DATE_AND_TIME;
		RST : BOOL;
		T_START : TIME_OF_DAY := TIME_OF_DAY#3:0;
		DAY : INT := 7;
		TEMP_SET : REAL := 70;
		TEMP_OFFSET : REAL := 10;
		TEMP_HYS : REAL := 5;
		T_MAX_HEAT : TIME := TIME#10m0s0ms;
		T_MAX_RET : TIME := TIME#10m0s0ms;
		TP_0 : TIME := TIME#5m0s0ms;
		TP_1 : TIME := TIME#5m0s0ms;
		TP_2 : TIME := TIME#5m0s0ms;
		TP_3 : TIME := TIME#5m0s0ms;
		TP_4 : TIME := TIME#5m0s0ms;
		TP_5 : TIME := TIME#5m0s0ms;
		TP_6 : TIME := TIME#5m0s0ms;
		TP_7 : TIME := TIME#5m0s0ms;
	END_VAR
	VAR_OUTPUT
		HEAT : BOOL;
		PUMP : BOOL;
		VALVE0 : BOOL;
		VALVE1 : BOOL;
		VALVE2 : BOOL;
		VALVE3 : BOOL;
		VALVE4 : BOOL;
		VALVE5 : BOOL;
		VALVE6 : BOOL;
		VALVE7 : BOOL;
		RUN : BOOL;
		STATUS : BYTE;
	END_VAR
	VAR
		X1 : TIMER_1;
		x2 : SEQUENCE_8;
		x3 : HYST_1;
		init : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION SDD : REAL (* HLK *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=445 *)
	VAR_INPUT
		T : REAL;
		ICE : BOOL;
	END_VAR
END_FUNCTION

FUNCTION SDD_NH3 : REAL (* HLK *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=446 *)
	VAR_INPUT
		T : REAL;
	END_VAR
END_FUNCTION

FUNCTION SDT_NH3 : REAL (* HLK *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=446 *)
	VAR_INPUT
		P : REAL;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK T_AVG24 (* HLK *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=446 *)
	VAR_INPUT
		TS : INT;
		DTI : DATE_AND_TIME;
		RST : BOOL;
		T_FILTER : TIME := TIME#10m0s0ms;
		SCALE : REAL := 1;
		OFS : REAL;
	END_VAR
	VAR_OUTPUT
		TA : REAL;
		TP : BOOL;
	END_VAR
	VAR_IN_OUT
		T24 : REAL;
		T24_MAX : REAL;
		T24_MIN : REAL;
	END_VAR
	VAR
		samples : ARRAY[0..47] OF INT;
		pos : INT;
		init : BOOL;
		ft1 : FILTER_I;
		sum : DINT;
		last : DATE_AND_TIME;
		tmp_max : INT;
		tmp_min : INT;
		i : INT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK TANK_LEVEL (* HLK *) (* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=41 *)
	VAR_INPUT
		LEVEL : BOOL;
		LEAK : BOOL;
		ACLR : BOOL;
		MAX_VALVE_TIME : TIME;
		LEVEL_DELAY_TIME : TIME;
	END_VAR
	VAR_OUTPUT
		VALVE : BOOL;
		ALARM : BOOL;
		STATUS : BYTE;
	END_VAR
	VAR
		cx : ACTUATOR_COIL;
		tn : TON;
		tl : TONOF;
		open : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION TANK_VOL1 : REAL (* HLK *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=448 *)
	VAR_INPUT
		TR : REAL;
		TL : REAL;
		H : REAL;
	END_VAR
END_FUNCTION

FUNCTION TANK_VOL2 : REAL (* HLK *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=448 *)
	VAR_INPUT
		TR : REAL;
		H : REAL;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK TEMP_EXT (* HLK *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=449 *)
	VAR_INPUT
		T_EXT1 : REAL;
		T_EXT2 : REAL;
		T_EXT3 : REAL;
		T_EXT_CONFIG : BYTE;
		DT_IN : DATE_AND_TIME;
		T_EXT_MIN : REAL := -40;
		T_EXT_MAX : REAL := 60;
		T_EXT_DEFAULT : REAL := -10;
		HEAT_PERIOD_START : DATE := DATE#1970-9-1;
		HEAT_PERIOD_STOP : DATE := DATE#1970-4-30;
		COOL_PERIOD_START : DATE := DATE#1970-4-1;
		COOL_PERIOD_STOP : DATE := DATE#1970-9-30;
		HEAT_START_TEMP_DAY : REAL := 15;
		HEAT_START_TEMP_NIGHT : REAL := 10;
		HEAT_STOP_TEMP : REAL := 18;
		COOL_START_TEMP_DAY : REAL := 26;
		COOL_START_TEMP_NIGHT : REAL := 26;
		COOL_STOP_TEMP : REAL := 24;
		START_DAY : TIME_OF_DAY := TIME_OF_DAY#9:0;
		START_NIGHT : TIME_OF_DAY := TIME_OF_DAY#21:0;
		CYCLE_TIME : TIME := TIME#10m0s0ms;
	END_VAR
	VAR_OUTPUT
		T_EXT : REAL;
		HEAT : BOOL;
		COOL : BOOL;
	END_VAR
	VAR
		tx : TIME;
		last_run : TIME;
		init : BOOL;
		cool_start : DATE;
		cool_stop : DATE;
		heat_start : DATE;
		heat_stop : DATE;
		xdate : DATE;
		day : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION WATER_CP : REAL (* HLK *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=452 *)
	VAR_INPUT
		T : REAL;
	END_VAR
	VAR
		Pts : INT := 10;
		data : ARRAY[1..20,0..1] OF REAL := [0,4.228,5,4.2,10,4.188,15,4.184,50,4.181,60,4.183,70,4.187,80,4.194,90,4.204,100,4.22];
	END_VAR
END_FUNCTION

FUNCTION WATER_DENSITY : REAL (* HLK *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=452 *)
	VAR_INPUT
		T : REAL;
		SAT : BOOL;
	END_VAR
	VAR CONSTANT
		a0 : REAL := 999.83952;
		a1 : REAL := 16.952577;
		a2 : REAL := -0.0079905127;
		a3 : REAL := -4.6241757E-05;
		a4 : REAL := 1.0584601E-07;
		a5 : REAL := -2.8103006E-10;
		b : REAL := 0.0168872;
	END_VAR
	VAR
		T2 : REAL;
		T4 : REAL;
	END_VAR
END_FUNCTION

FUNCTION WATER_ENTHALPY : REAL (* HLK *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=453 *)
	VAR_INPUT
		T : REAL;
	END_VAR
	VAR
		Pts : INT := 11;
		data : ARRAY[1..20,0..1] OF REAL := [0,0.06,10,42.1,20,83.9,30,125.8,40,167.58,50,209.4,60,251.2,70,293.1,80,335,90,377,100,419.1];
	END_VAR
END_FUNCTION

FUNCTION WCT : REAL (* HLK *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=453 *)
	VAR_INPUT
		T : REAL;
		V : REAL;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK BLIND_ACTUATOR (* Jalousie *) (* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=74 *)
	VAR_INPUT
		UP : BOOL;
		DN : BOOL;
		S_IN : BYTE;
		T_UD : TIME := TIME#10s0ms;
		T_ANGLE : TIME := TIME#3s0ms;
		T_LOCKOUT : TIME := TIME#100ms;
	END_VAR
	VAR_OUTPUT
		POS : BYTE;
		ANG : BYTE;
		QU : BOOL;
		QD : BOOL;
		STATUS : BYTE;
	END_VAR
	VAR
		position : RMP_B;
		angle : RMP_B;
		lock : INTERLOCK;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK BLIND_CONTROL (* Jalousie *) (* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=75 *)
	VAR_INPUT
		UP : BOOL;
		DN : BOOL;
		S_IN : BYTE;
		PI : BYTE;
		AI : BYTE;
		T_UD : TIME;
		T_ANGLE : TIME;
		SENS : BYTE := 5;
		T_LOCKOUT : TIME := TIME#100ms;
	END_VAR
	VAR_OUTPUT
		POS : BYTE;
		ANG : BYTE;
		MU : BOOL;
		MD : BOOL;
		STATUS : BYTE;
	END_VAR
	VAR
		act : BLIND_ACTUATOR;
		delta : BYTE;
		bTimeTest : BOOL := FALSE;
		iPos : BYTE;
		iAngel : BYTE;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK BLIND_CONTROL_S (* Jalousie *) (* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=78 *)
	VAR_INPUT
		UP : BOOL;
		DN : BOOL;
		S_IN : BYTE := 125;
		PI : BYTE;
		T_UP : TIME;
		T_DN : TIME;
		RU : BOOL;
		RD : BOOL;
		T_LOCKOUT : TIME := TIME#100ms;
		T_EXT : TIME;
		EXT_TRIG : BYTE := 5;
		R_POS_TOP : BYTE := 255;
		R_POS_BOT : BYTE;
	END_VAR
	VAR_OUTPUT
		POS : BYTE;
		MU : BOOL;
		MD : BOOL;
		STATUS : BYTE;
	END_VAR
	VAR
		rmp : _RMP_NEXT;
		tx : TIME;
		last : TIME;
		PI_last : BYTE;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK BLIND_INPUT (* Jalousie *) (* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=80 *)
	VAR_INPUT
		POS : BYTE;
		ANG : BYTE;
		S1 : BOOL;
		S2 : BOOL;
		IN : BOOL;
		PI : BYTE;
		AI : BYTE;
		SINGLE_SWITCH : BOOL;
		CLICK_EN : BOOL := TRUE;
		CLICK_TIME : TIME := TIME#500ms;
		MAX_RUNTIME : TIME := TIME#1m0s0ms;
		MANUAL_TIMEOUT : TIME := TIME#60m0s0ms;
		DEBOUNCE_TIME : TIME := TIME#20ms;
		DBL_CLK1 : BOOL := FALSE;
		DBL_POS1 : BYTE;
		DBL_ANG1 : BYTE;
		DBL_CLK2 : BOOL := FALSE;
		DBL_POS2 : BYTE := 255;
		DBL_ANG2 : BYTE := 255;
		D1_TOGGLE : BOOL := TRUE;
		D2_TOGGLE : BOOL := TRUE;
		MASTER_MODE : BOOL;
	END_VAR
	VAR_OUTPUT
		QU : BOOL := TRUE;
		QD : BOOL := TRUE;
		STATUS : BYTE;
		PO : BYTE := 255;
		AO : BYTE := 255;
		D1 : BOOL;
		D2 : BOOL;
	END_VAR
	VAR
		s1e : TOF;
		s2e : TOF;
		s1d : CLICK_MODE;
		s2d : CLICK_MODE;
		dir : BOOL;
		tx : TIME;
		last : TIME;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK BLIND_NIGHT (* Jalousie *) (* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=84 *)
	VAR_INPUT
		UP : BOOL;
		DN : BOOL;
		S_IN : BYTE;
		PI : BYTE;
		AI : BYTE;
		E_NIGHT : BOOL := TRUE;
		E_DAY : BOOL := TRUE;
		DTIN : DATE_AND_TIME;
		SUNRISE : TIME_OF_DAY;
		SUNSET : TIME_OF_DAY;
		SUNRISE_OFFSET : TIME;
		SUNSET_OFFSET : TIME;
		NIGHT_POSITION : BYTE;
		NIGHT_ANGLE : BYTE;
	END_VAR
	VAR_OUTPUT
		QU : BOOL;
		QD : BOOL;
		STATUS : BYTE;
		PO : BYTE;
		AO : BYTE;
	END_VAR
	VAR
		night : BOOL;
		last_night : DATE;
		last_day : DATE;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK BLIND_SCENE (* Jalousie *) (* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=87 *)
	VAR_INPUT
		UP : BOOL;
		DN : BOOL;
		S_IN : BYTE;
		PI : BYTE;
		AI : BYTE;
		ENABLE : BOOL;
		SWRITE : BOOL;
		SCENE : BYTE;
	END_VAR
	VAR_OUTPUT
		QU : BOOL;
		QD : BOOL;
		STATUS : BYTE;
		PO : BYTE;
		AO : BYTE;
	END_VAR
	VAR RETAIN
		sx : ARRAY[0..15,0..2] OF BYTE;
	END_VAR
	VAR
		x : USINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK BLIND_SECURITY (* Jalousie *) (* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=89 *)
	VAR_INPUT
		UP : BOOL;
		DN : BOOL;
		S_IN : BYTE;
		PI : BYTE;
		AI : BYTE;
		FIRE : BOOL;
		WIND : BOOL;
		ALARM : BOOL;
		DOOR : BOOL;
		RAIN : BOOL;
		ALARM_UP : BOOL := TRUE;
		WIND_UP : BOOL := TRUE;
		RAIN_UP : BOOL := FALSE;
	END_VAR
	VAR_OUTPUT
		QU : BOOL;
		QD : BOOL;
		STATUS : BYTE;
		PO : BYTE;
		AO : BYTE;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK BLIND_SET (* Jalousie *) (* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=91 *)
	VAR_INPUT
		UP : BOOL;
		DN : BOOL;
		S_IN : BYTE;
		PI : BYTE;
		AI : BYTE;
		IN : BOOL;
		PX : BYTE;
		AX : BYTE;
		OVERRIDE_MANUAL : BOOL;
		RESTORE_POSITION : BOOL;
		RESTORE_TIME : TIME := TIME#1m0s0ms;
	END_VAR
	VAR_OUTPUT
		QU : BOOL;
		QD : BOOL;
		STATUS : BYTE;
		PO : BYTE;
		AO : BYTE;
	END_VAR
	VAR
		tx : TIME;
		ps : BYTE;
		as : BYTE;
		last : TIME;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK BLIND_SHADE (* Jalousie *) (* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=93 *)
	VAR_INPUT
		UP : BOOL;
		DN : BOOL;
		S_IN : BYTE;
		PI : BYTE;
		AI : BYTE;
		ENABLE : BOOL;
		SUN : BOOL;
		SUNRISE_OFFSET : TIME := TIME#60m0s0ms;
		SUNSET_PRESET : TIME := TIME#60m0s0ms;
		DIRECTION : REAL := 180;
		ANGLE_OFFSET : REAL := 80;
		SLAT_WIDTH : REAL := 80;
		SLAT_SPACING : REAL := 60;
		SHADE_DELAY : TIME := TIME#1m0s0ms;
		SHADE_POS : BYTE;
	END_VAR
	VAR_OUTPUT
		QU : BOOL;
		QD : BOOL;
		STATUS : BYTE;
		PO : BYTE;
		AO : BYTE;
	END_VAR
	VAR_IN_OUT
		CX : CALENDAR;
	END_VAR
	VAR
		angle : REAL;
		sun_delay : TOF;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK BLIND_SHADE_S (* Jalousie *) (* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=96 *)
	VAR_INPUT
		UP : BOOL;
		DN : BOOL;
		S_IN : BYTE;
		PI : BYTE;
		ENABLE : BOOL;
		SUN : BOOL;
		HORZ1 : REAL := 100;
		HORZ2 : REAL := 260;
		VERT : REAL := 90;
		ALERT : BOOL := FALSE;
		SUNRISE_OFFSET : TIME := TIME#60m0s0ms;
		SUNSET_PRESET : TIME := TIME#60m0s0ms;
		SHADE_DELAY : TIME := TIME#1m0s0ms;
		SHADE_POS : BYTE;
	END_VAR
	VAR_OUTPUT
		QU : BOOL;
		QD : BOOL;
		STATUS : BYTE;
		PO : BYTE;
	END_VAR
	VAR_IN_OUT
		CX : CALENDAR;
	END_VAR
	VAR
		sun_delay : TOF;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION BUILDING_VERSION : DWORD (* Other *) (* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=11 *)
	VAR_INPUT
		IN : BOOL;
	END_VAR
END_FUNCTION
