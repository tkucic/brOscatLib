
FUNCTION ACOSH : REAL (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=39 *)
	VAR_INPUT
		X : REAL;
	END_VAR
END_FUNCTION

FUNCTION ACOTH : REAL (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=39 *)
	VAR_INPUT
		X : REAL;
	END_VAR
END_FUNCTION

FUNCTION AGDF : REAL (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=39 *)
	VAR_INPUT
		X : REAL;
	END_VAR
END_FUNCTION

FUNCTION AIN : REAL (* Signal processing *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=269 *)
	VAR_INPUT
		IN : DWORD;
		BITS : BYTE;
		SIGN : BYTE := 255;
		LOW : REAL;
		HIGH : REAL := 10;
	END_VAR
	VAR CONSTANT
		ff : DWORD := 16#FFFFFFFF;
	END_VAR
	VAR
		temp1 : DWORD;
		temp2 : DWORD;
		sx : BOOL;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK AIN1 (* Signal processing *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=270 *)
	VAR_INPUT
		IN : DWORD;
		SIGN_BIT : INT := 255;
		ERROR_BIT : INT := 255;
		ERROR_CODE_EN : BOOL;
		ERROR_CODE : DWORD;
		OVERFLOW_BIT : INT := 255;
		OVERFLOW_CODE_EN : BOOL;
		OVERFLOW_CODE : DWORD;
		BIT_0 : INT;
		BIT_N : INT := 31;
		OUT_MIN : REAL;
		OUT_MAX : REAL := 10;
		CODE_MIN : DWORD;
		CODE_MAX : DWORD := 16#FFFFFFFF;
		ERROR_OUTPUT : REAL;
		OVERFLOW_OUTPUT : REAL := 10;
	END_VAR
	VAR_OUTPUT
		OUT : REAL;
		SIGN : BOOL;
		ERROR : BOOL;
		OVERFLOW : BOOL;
	END_VAR
	VAR
		tB : UDINT;
		_CODE_MIN : UDINT;
		_CODE_MAX : UDINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK ALARM_2 (* Measurements *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=333 *)
	VAR_INPUT
		X : REAL;
		LO_1 : REAL;
		HI_1 : REAL;
		LO_2 : REAL;
		HI_2 : REAL;
		HYS : REAL;
	END_VAR
	VAR_OUTPUT
		Q1_LO : BOOL;
		Q1_HI : BOOL;
		Q2_LO : BOOL;
		Q2_HI : BOOL;
	END_VAR
	VAR
		tmp : REAL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION AOUT : DWORD (* Signal processing *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=271 *)
	VAR_INPUT
		IN : REAL;
		BITS : BYTE;
		SIGN : BYTE := 255;
		LOW : REAL;
		HIGH : REAL := 10;
	END_VAR
	VAR CONSTANT
		ff : UDINT := 2#1;
	END_VAR
	VAR
		in2 : REAL;
		sx : BOOL;
	END_VAR
END_FUNCTION

FUNCTION AOUT1 : DWORD (* Signal processing *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=272 *)
	VAR_INPUT
		IN : REAL;
		BIT_0 : INT;
		BIT_N : INT := 31;
		SIGN : INT := 255;
		LOW : REAL;
		HIGH : REAL := 10;
	END_VAR
	VAR CONSTANT
		ff : UDINT := 2#1;
	END_VAR
	VAR
		sx : BOOL;
		in2 : REAL;
	END_VAR
END_FUNCTION

FUNCTION ARRAY_AVG : REAL (* Array *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=76 *)
	VAR_INPUT
		PT : REFERENCE TO ARRAY[0..32000] OF REAL;
		SIZE : UINT;
	END_VAR
	VAR
		i : UINT;
		stop : UINT;
	END_VAR
END_FUNCTION

FUNCTION ARRAY_GAV : REAL (* Array *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=76 *)
	VAR_INPUT
		PT : REFERENCE TO ARRAY[0..32000] OF REAL;
		SIZE : UINT;
	END_VAR
	VAR
		i : UINT;
		stop : UINT;
	END_VAR
END_FUNCTION

FUNCTION ARRAY_HAV : REAL (* Array *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=77 *)
	VAR_INPUT
		PT : REFERENCE TO ARRAY[0..32000] OF REAL;
		SIZE : UINT;
	END_VAR
	VAR
		i : UINT;
		stop : UINT;
	END_VAR
END_FUNCTION

FUNCTION ARRAY_MAX : REAL (* Array *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=77 *)
	VAR_INPUT
		PT : REFERENCE TO ARRAY[0..32000] OF REAL;
		SIZE : UINT;
	END_VAR
	VAR
		i : UDINT;
		stop : UDINT;
	END_VAR
END_FUNCTION

FUNCTION ARRAY_MIN : REAL (* Array *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=78 *)
	VAR_INPUT
		PT : REFERENCE TO ARRAY[0..32000] OF REAL;
		SIZE : UINT;
	END_VAR
	VAR
		i : UDINT;
		stop : UDINT;
	END_VAR
END_FUNCTION

FUNCTION ARRAY_SDV : REAL (* Array *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=79 *)
	VAR_INPUT
		PT : REFERENCE TO ARRAY[0..32000] OF REAL;
		SIZE : UINT;
	END_VAR
END_FUNCTION

FUNCTION ARRAY_SPR : REAL (* Array *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=79 *)
	VAR_INPUT
		PT : REFERENCE TO ARRAY[0..32000] OF REAL;
		SIZE : UINT;
	END_VAR
	VAR
		i : UDINT;
		stop : UDINT;
		array_max : REAL;
		array_min : REAL;
	END_VAR
END_FUNCTION

FUNCTION ARRAY_SUM : REAL (* Array *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=80 *)
	VAR_INPUT
		PT : REFERENCE TO ARRAY[0..32000] OF REAL;
		SIZE : UINT;
	END_VAR
	VAR
		i : UDINT;
		stop : UDINT;
	END_VAR
END_FUNCTION

FUNCTION ARRAY_TREND : REAL (* Array *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=81 *)
	VAR_INPUT
		PT : REFERENCE TO ARRAY[0..32000] OF REAL;
		SIZE : UINT;
	END_VAR
	VAR
		i : UINT;
		stop : UINT;
		x : REAL;
		stop2 : UINT;
	END_VAR
END_FUNCTION

FUNCTION ARRAY_VAR : REAL (* Array *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=81 *)
	VAR_INPUT
		PT : REFERENCE TO ARRAY[0..32000] OF REAL;
		SIZE : UINT;
	END_VAR
	VAR
		avg : REAL;
		i : UINT;
		stop : UINT;
	END_VAR
END_FUNCTION

FUNCTION ASINH : REAL (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=40 *)
	VAR_INPUT
		X : REAL;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK ASTRO (* Conversion *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=354 *)
	VAR_INPUT
		M : REAL;
		AE : REAL;
		PC : REAL;
		LJ : REAL;
	END_VAR
	VAR_OUTPUT
		YM : REAL;
		YAE : REAL;
		YPC : REAL;
		YLJ : REAL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION ATAN2 : REAL (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=40 *)
	VAR_INPUT
		Y : REAL;
		X : REAL;
	END_VAR
END_FUNCTION

FUNCTION ATANH : REAL (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=41 *)
	VAR_INPUT
		X : REAL;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK A_TRIG (* Generators *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=188 *)
	VAR_INPUT
		IN : REAL;
		RES : REAL;
	END_VAR
	VAR_OUTPUT
		Q : BOOL;
		D : REAL;
	END_VAR
	VAR
		last_in : REAL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION BAND_B : BYTE (* Control *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=377 *)
	VAR_INPUT
		X : BYTE;
		B : BYTE;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK BAR_GRAPH (* Measurements *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=333 *)
	VAR_INPUT
		X : REAL;
		RST : BOOL;
		TRIGGER_LOW : REAL;
		TRIGGER_HIGH : REAL;
		ALARM_LOW : BOOL;
		ALARM_HIGH : BOOL;
		LOG_SCALE : BOOL;
	END_VAR
	VAR_OUTPUT
		LOW : BOOL;
		Q1 : BOOL;
		Q2 : BOOL;
		Q3 : BOOL;
		Q4 : BOOL;
		Q5 : BOOL;
		Q6 : BOOL;
		HIGH : BOOL;
		ALARM : BOOL;
		STATUS : BYTE;
	END_VAR
	VAR
		init : BOOL;
		T1 : REAL;
		T2 : REAL;
		T3 : REAL;
		T4 : REAL;
		T5 : REAL;
		temp : REAL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION BCDC_TO_INT : INT (* Gate logic *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=210 *)
	VAR_INPUT
		IN : BYTE;
	END_VAR
END_FUNCTION

FUNCTION BETA : REAL (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=41 *)
	VAR_INPUT
		X : REAL;
		Y : REAL;
	END_VAR
END_FUNCTION

FUNCTION BFT_TO_MS : REAL (* Conversion *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=354 *)
	VAR_INPUT
		BFT : INT;
	END_VAR
END_FUNCTION

FUNCTION BINOM : DINT (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=42 *)
	VAR_INPUT
		N : INT;
		K : INT;
	END_VAR
	VAR
		i : INT;
	END_VAR
END_FUNCTION

FUNCTION BIN_TO_BYTE : BYTE (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=145 *)
	VAR_INPUT
		BIN : STRING[12];
	END_VAR
	VAR
		pt : REFERENCE TO BYTE;
		i : INT;
		X : BYTE;
		stop : INT;
	END_VAR
END_FUNCTION

FUNCTION BIN_TO_DWORD : DWORD (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=145 *)
	VAR_INPUT
		BIN : STRING[40];
	END_VAR
	VAR
		pt : REFERENCE TO BYTE;
		i : INT;
		X : BYTE;
		stop : INT;
	END_VAR
END_FUNCTION

FUNCTION BIT_COUNT : INT (* Gate logic *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=210 *)
	VAR_INPUT
		IN : DWORD;
	END_VAR
END_FUNCTION

FUNCTION BIT_LOAD_B : BYTE (* Gate logic *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=210 *)
	VAR_INPUT
		IN : BYTE;
		VAL : BOOL;
		POS : INT;
	END_VAR
	VAR CONSTANT
		dat : BYTE := 1;
	END_VAR
END_FUNCTION

FUNCTION BIT_LOAD_B2 : BYTE (* Gate logic *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=211 *)
	VAR_INPUT
		I : BYTE;
		D : BOOL;
		P : INT;
		N : INT;
	END_VAR
END_FUNCTION

FUNCTION BIT_LOAD_DW : DWORD (* Gate logic *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=211 *)
	VAR_INPUT
		IN : DWORD;
		VAL : BOOL;
		POS : INT;
	END_VAR
	VAR CONSTANT
		dat : DWORD := 1;
	END_VAR
END_FUNCTION

FUNCTION BIT_LOAD_DW2 : DWORD (* Gate logic *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=212 *)
	VAR_INPUT
		I : DWORD;
		D : BOOL;
		P : INT;
		N : INT;
	END_VAR
END_FUNCTION

FUNCTION BIT_LOAD_W : WORD (* Gate logic *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=212 *)
	VAR_INPUT
		IN : WORD;
		VAL : BOOL;
		POS : INT;
	END_VAR
	VAR CONSTANT
		dat : WORD := 1;
	END_VAR
END_FUNCTION

FUNCTION BIT_LOAD_W2 : WORD (* Gate logic *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=213 *)
	VAR_INPUT
		I : WORD;
		D : BOOL;
		P : INT;
		N : INT;
	END_VAR
END_FUNCTION

FUNCTION BIT_OF_DWORD : BOOL (* Gate logic *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=213 *)
	VAR_INPUT
		IN : DWORD;
		N : INT;
	END_VAR
END_FUNCTION

FUNCTION BIT_TOGGLE_B : BYTE (* Gate logic *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=214 *)
	VAR_INPUT
		IN : BYTE;
		POS : INT;
	END_VAR
END_FUNCTION

FUNCTION BIT_TOGGLE_DW : DWORD (* Gate logic *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=214 *)
	VAR_INPUT
		IN : DWORD;
		POS : INT;
	END_VAR
END_FUNCTION

FUNCTION BIT_TOGGLE_W : WORD (* Gate logic *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=215 *)
	VAR_INPUT
		IN : WORD;
		POS : INT;
	END_VAR
END_FUNCTION

FUNCTION BUFFER_COMP : INT (* Buffer Management *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=480 *)
	VAR_INPUT
		PT1 : REFERENCE TO ARRAY[0..32767] OF BYTE;
		SIZE1 : INT;
		PT2 : REFERENCE TO ARRAY[0..32767] OF BYTE;
		SIZE2 : INT;
		START : INT;
	END_VAR
	VAR
		i : INT;
		j : INT;
		end : INT;
		firstbyte : BYTE;
	END_VAR
END_FUNCTION

FUNCTION BUFFER_SEARCH : INT (* Buffer Management *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=481 *)
	VAR_INPUT
		PT : REFERENCE TO ARRAY[0..32767] OF BYTE;
		SIZE : INT;
		STR : STRING[STRING_LENGTH];
		POS : INT;
		IGN : BOOL;
	END_VAR
	VAR
		ps : REFERENCE TO ARRAY[0..STRING_LENGTH] OF BYTE;
		chx : BYTE;
		i : INT;
		end : INT;
		k : INT;
		lx : INT;
	END_VAR
END_FUNCTION

FUNCTION BUFFER_TO_STRING : BOOL (* Buffer Management *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=482 *)
	VAR_INPUT
		PT : REFERENCE TO ARRAY[0..32767] OF BYTE;
		SIZE : UINT;
		START : UINT;
		STOP : UINT;
	END_VAR
	VAR_IN_OUT
		RETVAL : STRING[STRING_LENGTH]; (*Return value of the function*)
	END_VAR
	VAR
		ps : REFERENCE TO BYTE;
		i : UINT;
		stp : UINT;
		sta : UINT;
	END_VAR
END_FUNCTION

FUNCTION BYTE_OF_BIT : BYTE (* Gate logic *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=215 *)
	VAR_INPUT
		B0 : BOOL;
		B1 : BOOL;
		B2 : BOOL;
		B3 : BOOL;
		B4 : BOOL;
		B5 : BOOL;
		B6 : BOOL;
		B7 : BOOL;
	END_VAR
END_FUNCTION

FUNCTION BYTE_OF_DWORD : BYTE (* Gate logic *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=216 *)
	VAR_INPUT
		IN : DWORD;
		N : BYTE;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK BYTE_TO_BITS (* Gate logic *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=216 *)
	VAR_INPUT
		IN : BYTE;
	END_VAR
	VAR_OUTPUT
		B0 : BOOL;
		B1 : BOOL;
		B2 : BOOL;
		B3 : BOOL;
		B4 : BOOL;
		B5 : BOOL;
		B6 : BOOL;
		B7 : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION BYTE_TO_GRAY : BYTE (* Gate logic *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=217 *)
	VAR_INPUT
		IN : BYTE;
	END_VAR
END_FUNCTION

FUNCTION BYTE_TO_RANGE : REAL (* Signal processing *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=273 *)
	VAR_INPUT
		X : BYTE;
		LOW : REAL;
		HIGH : REAL;
	END_VAR
END_FUNCTION

FUNCTION BYTE_TO_STRB : BOOL (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=145 *)
	VAR_INPUT
		IN : BYTE;
	END_VAR
	VAR_IN_OUT
		RETVAL : STRING[8]; (*Return value of the function*)
	END_VAR
	VAR
		i : INT;
		pt : REFERENCE TO BYTE;
	END_VAR
END_FUNCTION

FUNCTION BYTE_TO_STRH : BOOL (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=146 *)
	VAR_INPUT
		IN : BYTE;
	END_VAR
	VAR_IN_OUT
		RETVAL : STRING[2]; (*Return value of the function*)
	END_VAR
	VAR
		temp : BYTE;
		PT : REFERENCE TO BYTE;
		intTemp : USINT;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK B_TRIG (* Generators *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=188 *)
	VAR_INPUT
		CLK : BOOL;
	END_VAR
	VAR_OUTPUT
		Q : BOOL;
	END_VAR
	VAR
		edge_ : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION CABS : REAL (* Complex *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=83 *)
	VAR_INPUT
		X : COMPLEX;
	END_VAR
END_FUNCTION

FUNCTION CACOS : BOOL (* Complex *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=83 *)
	VAR_INPUT
		X : COMPLEX;
	END_VAR
	VAR_IN_OUT
		RETVAL : COMPLEX; (*Return value of the function*)
	END_VAR
	VAR
		Y : COMPLEX;
	END_VAR
END_FUNCTION

FUNCTION CACOSH : BOOL (* Complex *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=84 *)
	VAR_INPUT
		X : COMPLEX;
	END_VAR
	VAR_IN_OUT
		RETVAL : COMPLEX; (*Return value of the function*)
	END_VAR
	VAR
		Y : COMPLEX;
	END_VAR
END_FUNCTION

FUNCTION CADD : BOOL (* Complex *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=84 *)
	VAR_INPUT
		X : COMPLEX;
		Y : COMPLEX;
	END_VAR
	VAR_IN_OUT
		RETVAL : COMPLEX; (*Return value of the function*)
	END_VAR
END_FUNCTION

FUNCTION_BLOCK CALENDAR_CALC (* Time and date *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=114 *)
	VAR_INPUT
		SPE : BOOL;
		H : REAL := -0.83333333333;
	END_VAR
	VAR_IN_OUT
		XCAL : CALENDAR;
		HOLIDAYS : ARRAY[0..29] OF HOLIDAY_DATA;
	END_VAR
	VAR
		last : DATE_AND_TIME;
		last_day : DINT;
		holy : HOLIDAY;
		sun : SUN_TIME;
		last_hour : INT;
		utod : TIME_OF_DAY;
		pos : SUN_POS;
		plast : DATE_AND_TIME;
		dtemp : DINT;
		tmp : INT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK CALIBRATE (* Measurements *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=337 *)
	VAR_INPUT
		X : REAL;
		CO : BOOL;
		CS : BOOL;
		Y_OFFSET : REAL;
		Y_SCALE : REAL;
	END_VAR
	VAR_OUTPUT
		Y : REAL;
	END_VAR
	VAR RETAIN
		offset : REAL;
		Scale : REAL := 1;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION CAPITALIZE : BOOL (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=146 *)
	VAR_INPUT
		STR : STRING[STRING_LENGTH];
	END_VAR
	VAR_IN_OUT
		RETVAL : STRING[STRING_LENGTH]; (*Return value of the function*)
	END_VAR
	VAR
		PT : REFERENCE TO BYTE;
		pos : INT;
		L : INT;
		first : BOOL := TRUE;
	END_VAR
END_FUNCTION

FUNCTION CARG : REAL (* Complex *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=84 *)
	VAR_INPUT
		X : COMPLEX;
	END_VAR
END_FUNCTION

FUNCTION CASIN : BOOL (* Complex *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=85 *)
	VAR_INPUT
		X : COMPLEX;
	END_VAR
	VAR_IN_OUT
		RETVAL : COMPLEX; (*Return value of the function*)
	END_VAR
	VAR
		Y : COMPLEX;
	END_VAR
END_FUNCTION

FUNCTION CASINH : BOOL (* Complex *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=85 *)
	VAR_INPUT
		X : COMPLEX;
	END_VAR
	VAR_IN_OUT
		RETVAL : COMPLEX; (*Return value of the function*)
	END_VAR
	VAR
		Y : COMPLEX;
	END_VAR
END_FUNCTION

FUNCTION CATAN : BOOL (* Complex *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=86 *)
	VAR_INPUT
		X : COMPLEX;
	END_VAR
	VAR_IN_OUT
		RETVAL : COMPLEX; (*Return value of the function*)
	END_VAR
	VAR
		r2 : REAL;
		num : REAL;
		den : REAL;
	END_VAR
END_FUNCTION

FUNCTION CATANH : BOOL (* Complex *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=86 *)
	VAR_INPUT
		X : COMPLEX;
	END_VAR
	VAR_IN_OUT
		RETVAL : COMPLEX; (*Return value of the function*)
	END_VAR
	VAR
		i2 : REAL;
		num : REAL;
		den : REAL;
	END_VAR
END_FUNCTION

FUNCTION CAUCHY : REAL (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=42 *)
	VAR_INPUT
		X : REAL;
		T : REAL;
		U : REAL;
	END_VAR
	VAR
		tmp : REAL;
	END_VAR
END_FUNCTION

FUNCTION CAUCHYCD : REAL (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=43 *)
	VAR_INPUT
		X : REAL;
		T : REAL;
		U : REAL;
	END_VAR
END_FUNCTION

FUNCTION CCON : BOOL (* Complex *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=86 *)
	VAR_INPUT
		X : COMPLEX;
	END_VAR
	VAR_IN_OUT
		RETVAL : COMPLEX; (*Return value of the function*)
	END_VAR
END_FUNCTION

FUNCTION CCOS : BOOL (* Complex *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=87 *)
	VAR_INPUT
		X : COMPLEX;
	END_VAR
	VAR_IN_OUT
		RETVAL : COMPLEX; (*Return value of the function*)
	END_VAR
	VAR
		temp : COMPLEX;
	END_VAR
END_FUNCTION

FUNCTION CCOSH : BOOL (* Complex *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=87 *)
	VAR_INPUT
		X : COMPLEX;
	END_VAR
	VAR_IN_OUT
		RETVAL : COMPLEX; (*Return value of the function*)
	END_VAR
END_FUNCTION

FUNCTION CDIV : BOOL (* Complex *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=87 *)
	VAR_INPUT
		X : COMPLEX;
		Y : COMPLEX;
	END_VAR
	VAR_IN_OUT
		RETVAL : COMPLEX; (*Return value of the function*)
	END_VAR
	VAR
		Temp : REAL;
	END_VAR
END_FUNCTION

FUNCTION CEIL : INT (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=43 *)
	VAR_INPUT
		X : REAL;
	END_VAR
END_FUNCTION

FUNCTION CEIL2 : DINT (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=44 *)
	VAR_INPUT
		X : REAL;
	END_VAR
END_FUNCTION

FUNCTION CEXP : BOOL (* Complex *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=88 *)
	VAR_INPUT
		X : COMPLEX;
	END_VAR
	VAR_IN_OUT
		RETVAL : COMPLEX; (*Return value of the function*)
	END_VAR
	VAR
		Temp : REAL;
	END_VAR
END_FUNCTION

FUNCTION CHARCODE : BYTE (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=147 *)
	VAR_INPUT
		STR : STRING[10];
	END_VAR
	VAR
		found : STRING[1];
		search : STRING[10];
		pos : INT;
		i : INT;
	END_VAR
	VAR CONSTANT
		cCHARNAMES : ARRAY[1..4] OF STRING[253] := [4('')];
	END_VAR
END_FUNCTION

FUNCTION CHARNAME : BOOL (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=147 *)
	VAR_INPUT
		C : BYTE;
	END_VAR
	VAR_IN_OUT
		RETVAL : STRING[10]; (*Return value of the function*)
	END_VAR
	VAR
		pos : INT;
		i : INT;
	END_VAR
	VAR CONSTANT
		cCHARNAMES : ARRAY[1..4] OF STRING[253] := [4('')];
	END_VAR
END_FUNCTION

FUNCTION CHECK_PARITY : BOOL (* Gate logic *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=217 *)
	VAR_INPUT
		IN : DWORD;
		P : BOOL;
	END_VAR
END_FUNCTION

FUNCTION CHK_REAL : BYTE (* Gate logic *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=217 *)
	VAR_INPUT
		X : REAL;
	END_VAR
	VAR
		pt : REFERENCE TO DWORD;
		tmp : DWORD;
	END_VAR
END_FUNCTION

FUNCTION CHR_TO_STRING : BOOL (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=148 *)
	VAR_INPUT
		C : BYTE;
	END_VAR
	VAR_IN_OUT
		RETVAL : STRING[1]; (*Return value of the function*)
	END_VAR
	VAR
		PT : REFERENCE TO BYTE;
	END_VAR
END_FUNCTION

FUNCTION CINV : BOOL (* Complex *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=88 *)
	VAR_INPUT
		X : COMPLEX;
	END_VAR
	VAR_IN_OUT
		RETVAL : COMPLEX; (*Return value of the function*)
	END_VAR
	VAR
		temp : REAL;
	END_VAR
END_FUNCTION

FUNCTION CIRCLE_A : REAL (* Geometry *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=104 *)
	VAR_INPUT
		RX : REAL;
		AX : REAL;
	END_VAR
END_FUNCTION

FUNCTION CIRCLE_C : REAL (* Geometry *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=104 *)
	VAR_INPUT
		RX : REAL;
		AX : REAL;
	END_VAR
END_FUNCTION

FUNCTION CIRCLE_SEG : REAL (* Geometry *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=105 *)
	VAR_INPUT
		RX : REAL;
		HX : REAL;
	END_VAR
END_FUNCTION

FUNCTION CLEAN : BOOL (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=149 *)
	VAR_INPUT
		IN : STRING[STRING_LENGTH];
		CX : STRING[80];
	END_VAR
	VAR_IN_OUT
		RETVAL : STRING[STRING_LENGTH]; (*Return value of the function*)
	END_VAR
	VAR
		pos : INT := 1;
		stop : INT;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK CLICK_CNT (* Generators *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=189 *)
	VAR_INPUT
		IN : BOOL;
		N : INT;
		TC : TIME;
	END_VAR
	VAR_OUTPUT
		Q : BOOL;
	END_VAR
	VAR
		tx : TP;
		edge_ : BOOL;
		cnt : INT := -1;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK CLICK_DEC (* Generators *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=190 *)
	VAR_INPUT
		IN : BOOL;
		TC : TIME;
	END_VAR
	VAR_OUTPUT
		Q0 : BOOL;
		Q1 : BOOL;
		Q2 : BOOL;
		Q3 : BOOL;
	END_VAR
	VAR
		tx : TP;
		edge_ : BOOL;
		cnt : INT := -1;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK CLK_DIV (* Generators *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=190 *)
	VAR_INPUT
		CLK : BOOL;
		RST : BOOL;
	END_VAR
	VAR_OUTPUT
		Q0 : BOOL;
		Q1 : BOOL;
		Q2 : BOOL;
		Q3 : BOOL;
		Q4 : BOOL;
		Q5 : BOOL;
		Q6 : BOOL;
		Q7 : BOOL;
	END_VAR
	VAR
		cnt : USINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK CLK_N (* Generators *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=192 *)
	VAR_INPUT
		N : INT;
	END_VAR
	VAR_OUTPUT
		Q : BOOL;
	END_VAR
	VAR
		edge_ : BOOL;
		stime : UDINT;
		clk : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK CLK_PRG (* Generators *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=192 *)
	VAR_INPUT
		PT : TIME := TIME#10ms;
	END_VAR
	VAR_OUTPUT
		Q : BOOL;
	END_VAR
	VAR
		init : BOOL;
		last : TIME;
		tx : TIME;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK CLK_PULSE (* Generators *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=193 *)
	VAR_INPUT
		PT : TIME;
		N : INT;
		RST : BOOL;
	END_VAR
	VAR_OUTPUT
		Q : BOOL;
		CNT : INT;
		RUN : BOOL;
	END_VAR
	VAR
		tx : UDINT;
		tn : UDINT;
		init : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION CLOG : BOOL (* Complex *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=88 *)
	VAR_INPUT
		X : COMPLEX;
	END_VAR
	VAR_IN_OUT
		RETVAL : COMPLEX; (*Return value of the function*)
	END_VAR
END_FUNCTION

FUNCTION CMP : BOOL (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=44 *)
	VAR_INPUT
		X : REAL;
		Y : REAL;
		N : INT;
	END_VAR
	VAR
		tmp : REAL;
	END_VAR
END_FUNCTION

FUNCTION CMUL : BOOL (* Complex *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=89 *)
	VAR_INPUT
		X : COMPLEX;
		Y : COMPLEX;
	END_VAR
	VAR_IN_OUT
		RETVAL : COMPLEX; (*Return value of the function*)
	END_VAR
END_FUNCTION

FUNCTION CODE : BYTE (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=149 *)
	VAR_INPUT
		STR : STRING[STRING_LENGTH];
		POS : INT;
	END_VAR
	VAR
		PT : REFERENCE TO BYTE;
	END_VAR
END_FUNCTION

FUNCTION CONE_V : REAL (* Geometry *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=105 *)
	VAR_INPUT
		RX : REAL;
		HX : REAL;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK CONTROL_SET1 (* Control *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=377 *)
	VAR_INPUT
		KT : REAL;
		TT : REAL;
		PI : BOOL;
		PID : BOOL;
		P_K : REAL := 0.5;
		PI_K : REAL := 0.45;
		PI_TN : REAL := 0.83;
		PID_K : REAL := 0.6;
		PID_TN : REAL := 0.5;
		PID_TV : REAL := 0.125;
	END_VAR
	VAR_OUTPUT
		KP : REAL;
		TN : REAL;
		TV : REAL;
		KI : REAL;
		KD : REAL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK CONTROL_SET2 (* Control *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=379 *)
	VAR_INPUT
		KS : REAL;
		TU : REAL;
		TG : REAL;
		PI : BOOL;
		PID : BOOL;
		P_K : REAL := 1;
		PI_K : REAL := 0.9;
		PI_TN : REAL := 3.33;
		PID_K : REAL := 1.2;
		PID_TN : REAL := 2;
		PID_TV : REAL := 0.5;
	END_VAR
	VAR_OUTPUT
		KP : REAL;
		TN : REAL;
		TV : REAL;
		KI : REAL;
		KD : REAL;
	END_VAR
	VAR
		TX : REAL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION COSH : REAL (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=45 *)
	VAR_INPUT
		X : REAL;
	END_VAR
	VAR
		t : REAL;
	END_VAR
END_FUNCTION

FUNCTION COTH : REAL (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=45 *)
	VAR_INPUT
		X : REAL;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK COUNT_BR (* FF Edge triggered *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=236 *)
	VAR_INPUT
		SET : BOOL;
		IN : BYTE;
		UP : BOOL;
		DN : BOOL;
		STEP : BYTE := 1;
		MX : BYTE := 255;
		RST : BOOL;
	END_VAR
	VAR_OUTPUT
		CNT : BYTE;
	END_VAR
	VAR
		last_up : BOOL;
		last_dn : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION COUNT_CHAR : INT (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=150 *)
	VAR_INPUT
		STR : STRING[STRING_LENGTH];
		CHR : BYTE;
	END_VAR
	VAR
		l : INT;
		pt : REFERENCE TO BYTE;
		pos : INT;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK COUNT_DR (* FF Edge triggered *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=237 *)
	VAR_INPUT
		SET : BOOL;
		IN : DWORD;
		UP : BOOL;
		DN : BOOL;
		STEP : DWORD := 1;
		MX : DWORD := 16#FFFFFFFF;
		RST : BOOL;
	END_VAR
	VAR_OUTPUT
		CNT : DWORD;
	END_VAR
	VAR
		last_up : BOOL;
		last_dn : BOOL;
		_MX : UDINT;
		_STEP : UDINT;
		_IN : UDINT;
		_CNT : UDINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION COUNT_SUBSTRING : INT (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=150 *)
	VAR_INPUT
		SEARCH : STRING[255];
		STR : STRING[255];
	END_VAR
	VAR
		pos : INT;
		size : INT;
	END_VAR
END_FUNCTION

FUNCTION CPOL : BOOL (* Complex *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=89 *)
	VAR_INPUT
		L : REAL;
		A : REAL;
	END_VAR
	VAR_IN_OUT
		RETVAL : COMPLEX; (*Return value of the function*)
	END_VAR
END_FUNCTION

FUNCTION CPOW : BOOL (* Complex *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=89 *)
	VAR_INPUT
		X : COMPLEX;
		Y : COMPLEX;
	END_VAR
	VAR_IN_OUT
		RETVAL : COMPLEX; (*Return value of the function*)
	END_VAR
	VAR
		temp : COMPLEX;
		temp2 : COMPLEX;
	END_VAR
END_FUNCTION

FUNCTION CRC_GEN : DWORD (* Others *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=219 *)
	VAR_INPUT
		PT : REFERENCE TO ARRAY[0..32000] OF BYTE;
		SIZE : INT;
		PL : INT;
		PN : DWORD;
		INIT : DWORD;
		REV_IN : BOOL;
		REV_OUT : BOOL;
		XOR_OUT : DWORD;
	END_VAR
	VAR
		pos : INT;
		shift : INT;
		dx : BYTE;
		bits : INT;
	END_VAR
END_FUNCTION

FUNCTION CSET : BOOL (* Complex *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=90 *)
	VAR_INPUT
		RE : REAL;
		IM : REAL;
	END_VAR
	VAR_IN_OUT
		RETVAL : COMPLEX; (*Return value of the function*)
	END_VAR
END_FUNCTION

FUNCTION CSIN : BOOL (* Complex *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=90 *)
	VAR_INPUT
		X : COMPLEX;
	END_VAR
	VAR_IN_OUT
		RETVAL : COMPLEX; (*Return value of the function*)
	END_VAR
END_FUNCTION

FUNCTION CSINH : BOOL (* Complex *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=90 *)
	VAR_INPUT
		X : COMPLEX;
	END_VAR
	VAR_IN_OUT
		RETVAL : COMPLEX; (*Return value of the function*)
	END_VAR
END_FUNCTION

FUNCTION CSQRT : BOOL (* Complex *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=91 *)
	VAR_INPUT
		X : COMPLEX;
	END_VAR
	VAR_IN_OUT
		RETVAL : COMPLEX; (*Return value of the function*)
	END_VAR
	VAR
		temp : REAL;
	END_VAR
END_FUNCTION

FUNCTION CSUB : BOOL (* Complex *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=91 *)
	VAR_INPUT
		X : COMPLEX;
		Y : COMPLEX;
	END_VAR
	VAR_IN_OUT
		RETVAL : COMPLEX; (*Return value of the function*)
	END_VAR
END_FUNCTION

FUNCTION CTAN : BOOL (* Complex *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=91 *)
	VAR_INPUT
		X : COMPLEX;
	END_VAR
	VAR_IN_OUT
		RETVAL : COMPLEX; (*Return value of the function*)
	END_VAR
	VAR
		temp : REAL;
		xi2 : REAL;
		xr2 : REAL;
	END_VAR
END_FUNCTION

FUNCTION CTANH : BOOL (* Complex *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=92 *)
	VAR_INPUT
		X : COMPLEX;
	END_VAR
	VAR_IN_OUT
		RETVAL : COMPLEX; (*Return value of the function*)
	END_VAR
	VAR
		temp : REAL;
		xi2 : REAL;
		xr2 : REAL;
	END_VAR
END_FUNCTION

FUNCTION CTRL_IN : REAL (* Control *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=380 *)
	VAR_INPUT
		SET_POINT : REAL;
		ACTUAL : REAL;
		NOISE : REAL;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK CTRL_OUT (* Control *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=381 *)
	VAR_INPUT
		CI : REAL;
		OFFSET : REAL;
		MAN_IN : REAL;
		LIM_L : REAL;
		LIM_H : REAL;
		MANUAL : BOOL;
	END_VAR
	VAR_OUTPUT
		Y : REAL;
		LIM : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK CTRL_PI (* Control *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=382 *)
	VAR_INPUT
		ACT : REAL;
		SET : REAL;
		SUP : REAL;
		OFS : REAL;
		M_I : REAL;
		MAN : BOOL;
		RST : BOOL;
		KP : REAL := 1;
		KI : REAL := 1;
		LL : REAL := -1000;
		LH : REAL := 1000;
	END_VAR
	VAR_OUTPUT
		Y : REAL;
		DIFF : REAL;
		LIM : BOOL;
	END_VAR
	VAR
		pi : FT_PIWL;
		co : CTRL_OUT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK CTRL_PID (* Control *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=384 *)
	VAR_INPUT
		ACT : REAL;
		SET : REAL;
		SUP : REAL;
		OFS : REAL;
		M_I : REAL;
		MAN : BOOL;
		RST : BOOL;
		KP : REAL := 1;
		TN : REAL := 1;
		TV : REAL := 1;
		LL : REAL := -1000;
		LH : REAL := 1000;
	END_VAR
	VAR_OUTPUT
		Y : REAL;
		DIFF : REAL;
		LIM : BOOL;
	END_VAR
	VAR
		pid : FT_PIDWL;
		co : CTRL_OUT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK CTRL_PWM (* Control *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=386 *)
	VAR_INPUT
		CI : REAL;
		MAN_IN : REAL;
		MANUAL : BOOL;
		F : REAL;
	END_VAR
	VAR_OUTPUT
		Q : BOOL;
	END_VAR
	VAR
		PW : PWM_DC;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK CYCLE_4 (* Generators *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=194 *)
	VAR_INPUT
		E : BOOL := TRUE;
		T0 : TIME;
		T1 : TIME;
		T2 : TIME;
		T3 : TIME;
		S0 : BOOL;
		SX : INT;
		SL : BOOL;
	END_VAR
	VAR_OUTPUT
		STATE : INT;
	END_VAR
	VAR
		tx : TIME;
		last : TIME;
		init : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK CYCLE_TIME (* Measurements *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=338 *)
	VAR_INPUT
		RST : BOOL;
	END_VAR
	VAR_OUTPUT
		CT_MIN : TIME;
		CT_MAX : TIME;
		CT_LAST : TIME;
		SYSTIME : TIME;
		SYSDAYS : INT;
		CYCLES : UDINT;
	END_VAR
	VAR
		last_cycle : TIME;
		tx : TIME;
		init : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION C_TO_F : REAL (* Conversion *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=356 *)
	VAR_INPUT
		CELSIUS : REAL;
	END_VAR
END_FUNCTION

FUNCTION C_TO_K : REAL (* Conversion *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=356 *)
	VAR_INPUT
		CELSIUS : REAL;
	END_VAR
END_FUNCTION

FUNCTION DATE_ADD : DATE (* Time and date *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=115 *)
	VAR_INPUT
		IDATE : DATE;
		D : INT;
		W : INT;
		M : INT;
		Y : INT;
	END_VAR
	VAR
		mo : INT;
		yr : INT;
		dm : INT;
	END_VAR
END_FUNCTION

FUNCTION DAYS_DELTA : DINT (* Time and date *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=118 *)
	VAR_INPUT
		DATE_1 : DATE;
		DATE_2 : DATE;
	END_VAR
END_FUNCTION

FUNCTION DAYS_IN_MONTH : INT (* Time and date *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=119 *)
	VAR_INPUT
		IDATE : DATE;
	END_VAR
END_FUNCTION

FUNCTION DAYS_IN_YEAR : INT (* Time and date *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=119 *)
	VAR_INPUT
		IDATE : DATE;
	END_VAR
END_FUNCTION

FUNCTION DAY_OF_DATE : DINT (* Time and date *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=116 *)
	VAR_INPUT
		IDATE : DATE;
	END_VAR
END_FUNCTION

FUNCTION DAY_OF_MONTH : INT (* Time and date *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=116 *)
	VAR_INPUT
		IDATE : DATE;
	END_VAR
	VAR
		leap : INT;
	END_VAR
	VAR CONSTANT
		cMTH_OFS : ARRAY[1..12] OF INT := [0,31,59,90,120,151,181,212,243,273,304,334];
	END_VAR
END_FUNCTION

FUNCTION DAY_OF_WEEK : INT (* Time and date *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=117 *)
	VAR_INPUT
		IDATE : DATE;
	END_VAR
END_FUNCTION

FUNCTION DAY_OF_YEAR : INT (* Time and date *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=117 *)
	VAR_INPUT
		IDATE : DATE;
	END_VAR
END_FUNCTION

FUNCTION DAY_TO_TIME : TIME (* Time and date *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=118 *)
	VAR_INPUT
		IN : REAL;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK DCF77 (* Time and date *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=119 *)
	VAR_INPUT
		REC : BOOL;
		SET : BOOL;
		SDT : DATE_AND_TIME;
		DSI : BOOL;
		SYNC_TIMEOUT : TIME := TIME#2m0s0ms;
		TIME_OFFSET : INT := 1;
		DST_EN : BOOL := TRUE;
	END_VAR
	VAR_OUTPUT
		TP : BOOL;
		DS : BOOL;
		WDAY : INT;
		ERROR : BOOL := TRUE;
		RTC : DATE_AND_TIME;
		RTC1 : DATE_AND_TIME;
		MSEC : INT;
		SYNC : BOOL;
	END_VAR
	VAR
		mez : DATE_AND_TIME;
		utc : DATE_AND_TIME;
		state : INT;
		edge_ : BOOL;
		tx : TIME;
		ty : TIME;
		last : TIME;
		bits : ARRAY[0..58] OF BOOL;
		cnt : INT;
		i : INT;
		old_time : DATE_AND_TIME;
		minute : INT;
		hour : INT;
		day : INT;
		month : INT;
		year : INT;
		last_sync : TIME;
		t1 : TIME;
		tz : TIME;
		init : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION DEAD_BAND : REAL (* Control *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=387 *)
	VAR_INPUT
		X : REAL;
		L : REAL;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK DEAD_BAND_A (* Control *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=393 *)
	VAR_INPUT
		X : REAL;
		T : TIME;
		KL : REAL := 1;
		LM : REAL;
	END_VAR
	VAR_OUTPUT
		Y : REAL;
		L : REAL;
	END_VAR
	VAR
		tp1 : FT_PT1;
		tp2 : FT_PT1;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION DEAD_ZONE : REAL (* Control *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=394 *)
	VAR_INPUT
		X : REAL;
		L : REAL;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK DEAD_ZONE2 (* Control *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=395 *)
	VAR_INPUT
		X : REAL;
		L : REAL;
	END_VAR
	VAR_OUTPUT
		Y : REAL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION DEC1 : INT (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=46 *)
	VAR_INPUT
		X : INT;
		N : INT;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK DEC_2 (* Gate logic *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=222 *)
	VAR_INPUT
		D : BOOL;
		A : BOOL;
	END_VAR
	VAR_OUTPUT
		Q0 : BOOL;
		Q1 : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK DEC_4 (* Gate logic *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=222 *)
	VAR_INPUT
		D : BOOL;
		A0 : BOOL;
		A1 : BOOL;
	END_VAR
	VAR_OUTPUT
		Q0 : BOOL;
		Q1 : BOOL;
		Q2 : BOOL;
		Q3 : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK DEC_8 (* Gate logic *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=223 *)
	VAR_INPUT
		D : BOOL;
		A0 : BOOL;
		A1 : BOOL;
		A2 : BOOL;
	END_VAR
	VAR_OUTPUT
		Q0 : BOOL;
		Q1 : BOOL;
		Q2 : BOOL;
		Q3 : BOOL;
		Q4 : BOOL;
		Q5 : BOOL;
		Q6 : BOOL;
		Q7 : BOOL;
	END_VAR
	VAR
		X : INT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION DEC_TO_BYTE : BYTE (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=150 *)
	VAR_INPUT
		DEC : STRING[10];
	END_VAR
	VAR
		pt : REFERENCE TO BYTE;
		i : INT;
		X : BYTE;
		stop : INT;
		intX : USINT;
	END_VAR
END_FUNCTION

FUNCTION DEC_TO_DWORD : DWORD (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=150 *)
	VAR_INPUT
		DEC : STRING[20];
	END_VAR
	VAR
		pt : REFERENCE TO BYTE;
		i : INT;
		X : BYTE;
		stop : INT;
		intX : USINT;
	END_VAR
END_FUNCTION

FUNCTION DEC_TO_INT : INT (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=151 *)
	VAR_INPUT
		DEC : STRING[10];
	END_VAR
	VAR
		pt : REFERENCE TO BYTE;
		i : INT;
		X : BYTE;
		sign : BOOL;
		stop : INT;
		intX : USINT;
	END_VAR
END_FUNCTION

FUNCTION DEG : REAL (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=46 *)
	VAR_INPUT
		RAD : REAL;
	END_VAR
END_FUNCTION

FUNCTION DEG_TO_DIR : BOOL (* Conversion *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=356 *)
	VAR_INPUT
		DEG : INT;
		N : INT;
		L : INT;
	END_VAR
	VAR_IN_OUT
		RETVAL : STRING[3]; (*Return value of the function*)
	END_VAR
	VAR
		ly : INT;
		cDIRS : ARRAY[1..3,0..15] OF STRING[3] := ['N','NNE','NE','ENE','E','ESE','SE','SSE','S','SSW','SW','WSW','W','WNW','NW','NNW','N','NNO','NO','ONO','O','OSO','SO','SSO','S','SSW','SW','WSW','W','WNW','NW','NNW','N','NNO','NO','ONO','O','OSO','SO','SSO','S','SSW','SW','WSW','W','WNW','NW','NNW'];
	END_VAR
END_FUNCTION

FUNCTION_BLOCK DELAY (* Signal processing *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=274 *)
	VAR_INPUT
		IN : REAL;
		N : INT;
		RST : BOOL;
	END_VAR
	VAR_OUTPUT
		OUT : REAL;
	END_VAR
	VAR
		buf : ARRAY[0..31] OF REAL;
		i : INT;
		init : BOOL;
		stop : INT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK DELAY_4 (* Signal processing *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=275 *)
	VAR_INPUT
		IN : REAL;
	END_VAR
	VAR_OUTPUT
		OUT1 : REAL;
		OUT2 : REAL;
		OUT3 : REAL;
		OUT4 : REAL;
	END_VAR
	VAR
		temp : REAL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION DEL_CHARS : BOOL (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=151 *)
	VAR_INPUT
		IN : STRING[STRING_LENGTH];
		CX : STRING[80];
	END_VAR
	VAR_IN_OUT
		RETVAL : STRING[STRING_LENGTH]; (*Return value of the function*)
	END_VAR
	VAR
		pos : INT := 1;
		stop : INT;
	END_VAR
END_FUNCTION

FUNCTION DIFFER : BOOL (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=47 *)
	VAR_INPUT
		IN1 : REAL;
		IN2 : REAL;
		X : REAL;
	END_VAR
END_FUNCTION

FUNCTION DIR_TO_DEG : INT (* Conversion *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=360 *)
	VAR_INPUT
		DIR : STRING[3];
		L : INT;
	END_VAR
	VAR
		ly : INT;
		i : INT;
		cDIRS : ARRAY[1..3,0..15] OF STRING[3] := ['N','NNE','NE','ENE','E','ESE','SE','SSE','S','SSW','SW','WSW','W','WNW','NW','NNW','N','NNO','NO','ONO','O','OSO','SO','SSO','S','SSW','SW','WSW','W','WNW','NW','NNW','N','NNO','NO','ONO','O','OSO','SO','SSO','S','SSW','SW','WSW','W','WNW','NW','NNW'];
	END_VAR
END_FUNCTION

FUNCTION_BLOCK DRIVER_1 (* Automation *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=454 *)
	VAR_INPUT
		TOGGLE_MODE : BOOL;
		TIMEOUT : TIME;
		SET : BOOL;
		IN : BOOL;
		RST : BOOL;
	END_VAR
	VAR_OUTPUT
		Q : BOOL;
	END_VAR
	VAR
		off : TON;
		edge_ : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK DRIVER_4 (* Automation *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=454 *)
	VAR_INPUT
		TOGGLE_MODE : BOOL;
		TIMEOUT : TIME;
		SET : BOOL;
		IN0 : BOOL;
		IN1 : BOOL;
		IN2 : BOOL;
		IN3 : BOOL;
		RST : BOOL;
	END_VAR
	VAR_OUTPUT
		Q0 : BOOL;
		Q1 : BOOL;
		Q2 : BOOL;
		Q3 : BOOL;
	END_VAR
	VAR
		d0 : DRIVER_1;
		d1 : DRIVER_1;
		d2 : DRIVER_1;
		d3 : DRIVER_1;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK DRIVER_4C (* Automation *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=455 *)
	VAR_INPUT
		IN : BOOL;
		RST : BOOL;
		TIMEOUT : TIME;
		SX : ARRAY[1..7] OF BYTE := [1,3,7,15];
	END_VAR
	VAR_OUTPUT
		SN : INT;
		Q0 : BOOL;
		Q1 : BOOL;
		Q2 : BOOL;
		Q3 : BOOL;
	END_VAR
	VAR
		off : TON;
		edge_ : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION DST : BOOL (* Time and date *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=121 *)
	VAR_INPUT
		UTC : DATE_AND_TIME;
	END_VAR
	VAR
		yr : INT;
		yr4 : UDINT;
		ltc : UDINT;
		idate : UDINT;
	END_VAR
END_FUNCTION

FUNCTION DT2_TO_SDT : BOOL (* Time and date *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=121 *)
	VAR_INPUT
		DI : DATE;
		TI : TIME_OF_DAY;
	END_VAR
	VAR_IN_OUT
		RETVAL : SDT; (*Return value of the function*)
	END_VAR
END_FUNCTION

FUNCTION_BLOCK DT_SIMU (* Measurements *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=338 *)
	VAR_INPUT
		START : DATE_AND_TIME;
		SPEED : REAL := 1;
	END_VAR
	VAR_OUTPUT
		DTS : DATE_AND_TIME;
	END_VAR
	VAR
		tc : UDINT;
		init : BOOL;
		last : UDINT;
		tx : UDINT;
		td : UDINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION DT_TO_SDT : BOOL (* Time and date *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=122 *)
	VAR_INPUT
		DTI : DATE_AND_TIME;
	END_VAR
	VAR_IN_OUT
		RETVAL : SDT; (*Return value of the function*)
	END_VAR
	VAR
		tmp : DATE;
		tdt : UDINT;
	END_VAR
END_FUNCTION

FUNCTION DT_TO_STRF : BOOL (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=152 *)
	VAR_INPUT
		DTI : DATE_AND_TIME;
		MS : INT;
		FMT : STRING[255];
		LANG : INT;
	END_VAR
	VAR_IN_OUT
		RETVAL : STRING[255]; (*Return value of the function*)
	END_VAR
	VAR CONSTANT
		FILL : STRING[1] := '0';
		BLANK : STRING[1] := ' ';
	END_VAR
	VAR
		ly : INT;
		dx : DATE;
		fs : STRING[10];
		td : TIME_OF_DAY;
		tmp : INT;
		pos : INT;
		f : INT;
	END_VAR
END_FUNCTION

FUNCTION DWORD_OF_BYTE : DWORD (* Gate logic *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=225 *)
	VAR_INPUT
		B3 : BYTE;
		B2 : BYTE;
		B1 : BYTE;
		B0 : BYTE;
	END_VAR
END_FUNCTION

FUNCTION DWORD_OF_WORD : DWORD (* Gate logic *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=226 *)
	VAR_INPUT
		W1 : WORD;
		W0 : WORD;
	END_VAR
END_FUNCTION

FUNCTION DWORD_TO_STRB : BOOL (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=153 *)
	VAR_INPUT
		IN : DWORD;
	END_VAR
	VAR_IN_OUT
		RETVAL : STRING[32]; (*Return value of the function*)
	END_VAR
	VAR
		pt : REFERENCE TO BYTE;
		i : INT;
	END_VAR
END_FUNCTION

FUNCTION DWORD_TO_STRF : BOOL (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=154 *)
	VAR_INPUT
		IN : DWORD;
		N : INT;
	END_VAR
	VAR_IN_OUT
		RETVAL : STRING[20]; (*Return value of the function*)
	END_VAR
	VAR
		temp : STRING[80];
	END_VAR
END_FUNCTION

FUNCTION DWORD_TO_STRH : BOOL (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=154 *)
	VAR_INPUT
		IN : DWORD;
	END_VAR
	VAR_IN_OUT
		RETVAL : STRING[8]; (*Return value of the function*)
	END_VAR
	VAR
		i : INT;
		temp : BYTE;
		pt : REFERENCE TO BYTE;
		intTemp : USINT;
	END_VAR
END_FUNCTION

FUNCTION DW_TO_REAL : REAL (* Gate logic *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=225 *)
	VAR_INPUT
		X : DWORD;
	END_VAR
	VAR
		pt : REFERENCE TO REAL;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK D_TRIG (* Generators *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=195 *)
	VAR_INPUT
		IN : DWORD;
	END_VAR
	VAR_OUTPUT
		Q : BOOL;
		X : DWORD;
	END_VAR
	VAR
		last_in : DWORD;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION D_TRUNC : DINT (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=46 *)
	VAR_INPUT
		X : REAL;
	END_VAR
END_FUNCTION

FUNCTION EASTER : DATE (* Time and date *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=122 *)
	VAR_INPUT
		YEAR : INT;
	END_VAR
	VAR
		b : INT;
		c : INT;
		oday : INT;
	END_VAR
END_FUNCTION

FUNCTION ELLIPSE_A : REAL (* Geometry *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=105 *)
	VAR_INPUT
		R1 : REAL;
		R2 : REAL;
	END_VAR
END_FUNCTION

FUNCTION ELLIPSE_C : REAL (* Geometry *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=106 *)
	VAR_INPUT
		R1 : REAL;
		R2 : REAL;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK ENERGY (* Conversion *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=361 *)
	VAR_INPUT
		J : REAL;
		C : REAL;
		WH : REAL;
	END_VAR
	VAR_OUTPUT
		YJ : REAL;
		YC : REAL;
		YWH : REAL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION ERF : REAL (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=47 *)
	VAR_INPUT
		X : REAL;
	END_VAR
	VAR
		x2 : REAL;
		ax2 : REAL;
	END_VAR
END_FUNCTION

FUNCTION ERFC : REAL (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=48 *)
	VAR_INPUT
		X : REAL;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK ESR_COLLECT (* Other *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=33 *)
	VAR_INPUT
		ESR_0 : ARRAY[0..3] OF ESR_DATA;
		ESR_1 : ARRAY[0..3] OF ESR_DATA;
		ESR_2 : ARRAY[0..3] OF ESR_DATA;
		ESR_3 : ARRAY[0..3] OF ESR_DATA;
		ESR_4 : ARRAY[0..3] OF ESR_DATA;
		ESR_5 : ARRAY[0..3] OF ESR_DATA;
		ESR_6 : ARRAY[0..3] OF ESR_DATA;
		ESR_7 : ARRAY[0..3] OF ESR_DATA;
		RST : BOOL;
	END_VAR
	VAR_OUTPUT
		ESR_OUT : ARRAY[0..31] OF ESR_DATA;
	END_VAR
	VAR_IN_OUT
		POS : INT;
	END_VAR
	VAR CONSTANT
		max_in : INT := 3; (* max limit of input array *)
		max_out : INT := 32; (* number of elements in array *)
	END_VAR
	VAR
		cnt : INT := -1;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK ESR_MON_B8 (* Other *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=35 *)
	VAR_INPUT
		S0 : BOOL;
		S1 : BOOL;
		S2 : BOOL;
		S3 : BOOL;
		S4 : BOOL;
		S5 : BOOL;
		S6 : BOOL;
		S7 : BOOL;
		DT_IN : DATE_AND_TIME;
		A0 : STRING[10];
		A1 : STRING[10];
		A2 : STRING[10];
		A3 : STRING[10];
		A4 : STRING[10];
		A5 : STRING[10];
		A6 : STRING[10];
		A7 : STRING[10];
	END_VAR
	VAR_OUTPUT
		ESR_FLAG : BOOL;
	END_VAR
	VAR_IN_OUT
		ESR_OUT : ARRAY[0..3] OF ESR_DATA;
	END_VAR
	VAR
		x0 : BOOL;
		x1 : BOOL;
		x2 : BOOL;
		x3 : BOOL;
		x4 : BOOL;
		x5 : BOOL;
		x6 : BOOL;
		x7 : BOOL;
		tx : TIME;
		cnt : INT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK ESR_MON_R4 (* Other *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=35 *)
	VAR_INPUT
		R0 : REAL;
		R1 : REAL;
		R2 : REAL;
		R3 : REAL;
		DT_IN : DATE_AND_TIME;
		A0 : STRING[10];
		A1 : STRING[10];
		A2 : STRING[10];
		A3 : STRING[10];
		S0 : REAL;
		S1 : REAL;
		S2 : REAL;
		S3 : REAL;
	END_VAR
	VAR_OUTPUT
		ESR_FLAG : BOOL;
	END_VAR
	VAR_IN_OUT
		ESR_OUT : ARRAY[0..3] OF ESR_DATA;
	END_VAR
	VAR
		p0 : REFERENCE TO DWORD;
		p1 : REFERENCE TO DWORD;
		p2 : REFERENCE TO DWORD;
		p3 : REFERENCE TO DWORD;
		x0 : REAL;
		x1 : REAL;
		x2 : REAL;
		x3 : REAL;
		tx : TIME;
		cnt : INT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK ESR_MON_X8 (* Other *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=36 *)
	VAR_INPUT
		S0 : BYTE;
		S1 : BYTE;
		S2 : BYTE;
		S3 : BYTE;
		S4 : BYTE;
		S5 : BYTE;
		S6 : BYTE;
		S7 : BYTE;
		DT_IN : DATE_AND_TIME;
		MODE : BYTE := 3;
		A0 : STRING[10];
		A1 : STRING[10];
		A2 : STRING[10];
		A3 : STRING[10];
		A4 : STRING[10];
		A5 : STRING[10];
		A6 : STRING[10];
		A7 : STRING[10];
	END_VAR
	VAR_OUTPUT
		ESR_FLAG : BOOL;
	END_VAR
	VAR_IN_OUT
		ESR_OUT : ARRAY[0..3] OF ESR_DATA;
	END_VAR
	VAR
		x0 : BYTE;
		x1 : BYTE;
		x2 : BYTE;
		x3 : BYTE;
		x4 : BYTE;
		x5 : BYTE;
		x6 : BYTE;
		x7 : BYTE;
		tx : TIME;
		cnt : INT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION EVEN : BOOL (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=48 *)
	VAR_INPUT
		IN : DINT;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK EVENTS (* Time and date *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=122 *)
	VAR_INPUT
		DATE_IN : DATE;
		ENA : BOOL;
	END_VAR
	VAR_OUTPUT
		Y : BOOL;
		NAME : STRING[30];
	END_VAR
	VAR_IN_OUT
		ELIST : ARRAY[0..49] OF HOLIDAY_DATA;
	END_VAR
	VAR
		i : INT;
		last_active : DATE;
		size : INT := 49;
		day_in : DINT;
		cyr : INT;
		lday : DINT;
		check : HOLIDAY_DATA;
		y_int : BOOL;
		name_int : STRING[30];
	END_VAR
END_FUNCTION_BLOCK

FUNCTION EXEC : BOOL (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=155 *)
	VAR_INPUT
		STR : STRING[STRING_LENGTH];
	END_VAR
	VAR_IN_OUT
		RETVAL : STRING[STRING_LENGTH]; (*Return value of the function*)
	END_VAR
	VAR
		pos : INT;
		R1 : REAL;
		R2 : REAL;
		operator : STRING[10];
		temp : STRING[80];
	END_VAR
END_FUNCTION

FUNCTION EXP10 : REAL (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=49 *)
	VAR_INPUT
		X : REAL;
	END_VAR
END_FUNCTION

FUNCTION EXPN : REAL (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=49 *)
	VAR_INPUT
		X : REAL;
		N : INT;
	END_VAR
	VAR
		sign : BOOL;
	END_VAR
END_FUNCTION

FUNCTION FACT : DINT (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=49 *)
	VAR_INPUT
		X : INT;
	END_VAR
	VAR CONSTANT
		cFACTS : ARRAY[0..12] OF DINT := [1,1,2,6,24,120,720,5040,40320,362880,3628800,39916800,479001600];
	END_VAR
END_FUNCTION

FUNCTION_BLOCK FADE (* Signal processing *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=276 *)
	VAR_INPUT
		IN1 : REAL;
		IN2 : REAL;
		F : BOOL;
		TF : TIME;
		RST : BOOL;
	END_VAR
	VAR_OUTPUT
		Y : REAL;
	END_VAR
	VAR
		rmx : RMP_W;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK FF_D2E (* FF Edge triggered *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=238 *)
	VAR_INPUT
		D0 : BOOL;
		D1 : BOOL;
		CLK : BOOL;
		RST : BOOL;
	END_VAR
	VAR_OUTPUT
		Q0 : BOOL;
		Q1 : BOOL;
	END_VAR
	VAR
		edge_ : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK FF_D4E (* FF Edge triggered *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=239 *)
	VAR_INPUT
		D0 : BOOL;
		D1 : BOOL;
		D2 : BOOL;
		D3 : BOOL;
		CLK : BOOL;
		RST : BOOL;
	END_VAR
	VAR_OUTPUT
		Q0 : BOOL;
		Q1 : BOOL;
		Q2 : BOOL;
		Q3 : BOOL;
	END_VAR
	VAR
		edge_ : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK FF_DRE (* FF Edge triggered *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=240 *)
	VAR_INPUT
		SET : BOOL;
		D : BOOL;
		CLK : BOOL;
		RST : BOOL;
	END_VAR
	VAR_OUTPUT
		Q : BOOL;
	END_VAR
	VAR
		edge_ : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK FF_JKE (* FF Edge triggered *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=241 *)
	VAR_INPUT
		SET : BOOL;
		J : BOOL;
		CLK : BOOL;
		K : BOOL;
		RST : BOOL;
	END_VAR
	VAR_OUTPUT
		Q : BOOL;
	END_VAR
	VAR
		edge_ : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK FF_RSE (* FF Edge triggered *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=242 *)
	VAR_INPUT
		CS : BOOL;
		CR : BOOL;
		RST : BOOL;
	END_VAR
	VAR_OUTPUT
		Q : BOOL;
	END_VAR
	VAR
		es : BOOL;
		er : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION FIB : DINT (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=50 *)
	VAR_INPUT
		X : INT;
	END_VAR
	VAR
		t1 : DINT;
		t2 : DINT;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK FIFO_16 (* Memory *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=184 *)
	VAR_INPUT
		DIN : DWORD;
		E : BOOL := TRUE;
		RD : BOOL;
		WD : BOOL;
		RST : BOOL;
	END_VAR
	VAR_OUTPUT
		DOUT : DWORD;
		EMPTY : BOOL := TRUE;
		FULL : BOOL;
	END_VAR
	VAR
		fifo : ARRAY[0..n] OF DWORD;
		pr : INT;
		pw : INT;
	END_VAR
	VAR CONSTANT
		n : INT := 16; (* changing this value will chage the number of stored elements in the fifo *)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK FIFO_32 (* Memory *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=184 *)
	VAR_INPUT
		DIN : DWORD;
		E : BOOL := TRUE;
		RD : BOOL;
		WD : BOOL;
		RST : BOOL;
	END_VAR
	VAR_OUTPUT
		DOUT : DWORD;
		EMPTY : BOOL := TRUE;
		FULL : BOOL;
	END_VAR
	VAR
		fifo : ARRAY[0..n] OF DWORD;
		pr : INT;
		pw : INT;
	END_VAR
	VAR CONSTANT
		n : INT := 32; (* changing this value will chage the number of stored elements in the fifo *)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION FILL : BOOL (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=155 *)
	VAR_INPUT
		C : BYTE;
		L : INT;
	END_VAR
	VAR_IN_OUT
		RETVAL : STRING[STRING_LENGTH]; (*Return value of the function*)
	END_VAR
	VAR
		i : INT;
		sx : STRING[1];
	END_VAR
END_FUNCTION

FUNCTION_BLOCK FILTER_DW (* Signal processing *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=277 *)
	VAR_INPUT
		X : UDINT;
		T : TIME;
	END_VAR
	VAR_OUTPUT
		Y : UDINT;
	END_VAR
	VAR
		last : UDINT;
		tx : UDINT;
		init : BOOL;
		Yi : REAL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK FILTER_I (* Signal processing *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=278 *)
	VAR_INPUT
		X : INT;
		T : TIME;
	END_VAR
	VAR_OUTPUT
		Y : INT;
	END_VAR
	VAR
		Yi : DINT;
		last : UDINT;
		tx : UDINT;
		init : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK FILTER_MAV_DW (* Signal processing *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=278 *)
	VAR_INPUT
		X : DWORD;
		N : UINT;
		RST : BOOL;
	END_VAR
	VAR_OUTPUT
		Y : DWORD;
	END_VAR
	VAR
		init : BOOL;
		buffer : ARRAY[0..31] OF UDINT;
		i : INT;
		tmp : INT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK FILTER_MAV_W (* Signal processing *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=279 *)
	VAR_INPUT
		X : WORD;
		N : UINT;
		RST : BOOL;
	END_VAR
	VAR_OUTPUT
		Y : WORD;
	END_VAR
	VAR
		init : BOOL;
		buffer : ARRAY[1..32] OF UINT;
		i : INT;
		sum : UDINT;
		tmp : INT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK FILTER_W (* Signal processing *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=280 *)
	VAR_INPUT
		X : WORD;
		T : TIME;
	END_VAR
	VAR_OUTPUT
		Y : WORD;
	END_VAR
	VAR
		last : UDINT;
		tx : UDINT;
		init : BOOL;
		tmp : UDINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK FILTER_WAV (* Signal processing *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=280 *)
	VAR_INPUT
		X : REAL;
		W : ARRAY[0..15] OF REAL;
		RST : BOOL;
	END_VAR
	VAR_OUTPUT
		Y : REAL;
	END_VAR
	VAR
		init : BOOL;
		buffer : ARRAY[0..15] OF REAL;
		i : INT;
		n : INT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION FINDB : INT (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=158 *)
	VAR_INPUT
		STR1 : STRING[STRING_LENGTH];
		STR2 : STRING[STRING_LENGTH];
	END_VAR
	VAR
		pos : INT;
		length : INT;
	END_VAR
END_FUNCTION

FUNCTION FINDB_NONUM : INT (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=158 *)
	VAR_INPUT
		STR : STRING[STRING_LENGTH];
	END_VAR
	VAR
		pos : INT;
		pt : REFERENCE TO BYTE;
	END_VAR
END_FUNCTION

FUNCTION FINDB_NUM : INT (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=159 *)
	VAR_INPUT
		STR : STRING[STRING_LENGTH];
	END_VAR
	VAR
		pos : INT;
		pt : REFERENCE TO BYTE;
	END_VAR
END_FUNCTION

FUNCTION FINDP : INT (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=159 *)
	VAR_INPUT
		STR : STRING[STRING_LENGTH];
		SRC : STRING[STRING_LENGTH];
		POS : INT;
	END_VAR
	VAR
		i : INT;
		ls : INT;
		lx : INT;
		stp : INT;
	END_VAR
END_FUNCTION

FUNCTION FIND_CHAR : INT (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=156 *)
	VAR_INPUT
		STR : STRING[STRING_LENGTH];
		POS : INT;
	END_VAR
	VAR
		i : INT;
		pt : REFERENCE TO ARRAY[1..255] OF BYTE;
		stop : INT;
		X : BYTE;
	END_VAR
END_FUNCTION

FUNCTION FIND_CTRL : INT (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=157 *)
	VAR_INPUT
		STR : STRING[STRING_LENGTH];
		POS : INT;
	END_VAR
	VAR
		i : INT;
		pt : REFERENCE TO ARRAY[1..255] OF BYTE;
		stop : INT;
		x : BYTE;
	END_VAR
END_FUNCTION

FUNCTION FIND_NONUM : INT (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=157 *)
	VAR_INPUT
		STR : STRING[STRING_LENGTH];
		POS : INT;
	END_VAR
	VAR
		i : INT;
		pt : REFERENCE TO ARRAY[1..255] OF BYTE;
		end : INT;
		X : BYTE;
	END_VAR
END_FUNCTION

FUNCTION FIND_NUM : INT (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=157 *)
	VAR_INPUT
		STR : STRING[STRING_LENGTH];
		POS : INT;
	END_VAR
	VAR
		i : INT;
		pt : REFERENCE TO ARRAY[1..255] OF BYTE;
		stop : INT;
		X : BYTE;
	END_VAR
END_FUNCTION

FUNCTION FIX : BOOL (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=160 *)
	VAR_INPUT
		STR : STRING[STRING_LENGTH];
		L : INT;
		C : BYTE;
		M : INT;
	END_VAR
	VAR_IN_OUT
		RETVAL : STRING[STRING_LENGTH]; (*Return value of the function*)
	END_VAR
	VAR
		N : INT;
		SX : STRING[STRING_LENGTH];
	END_VAR
END_FUNCTION

FUNCTION FLOAT_TO_REAL : REAL (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=160 *)
	VAR_INPUT
		FLT : STRING[20];
	END_VAR
	VAR
		pt : REFERENCE TO ARRAY[1..20] OF BYTE;
		i : INT;
		X : BYTE;
		sign : INT := 1;
		stop : INT;
		tmp : DINT;
		d : INT;
		intX : USINT;
	END_VAR
END_FUNCTION

FUNCTION FLOOR : INT (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=50 *)
	VAR_INPUT
		X : REAL;
	END_VAR
END_FUNCTION

FUNCTION FLOOR2 : DINT (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=51 *)
	VAR_INPUT
		X : REAL;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK FLOW_CONTROL (* Automation *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=456 *)
	VAR_INPUT
		IN : BOOL;
		REQ : BOOL;
		ENQ : BOOL;
		RST : BOOL;
		T_AUTO : TIME := TIME#60m0s0ms;
		T_DELAY : TIME := TIME#1380m0s0ms;
	END_VAR
	VAR_OUTPUT
		Q : BOOL;
		STATUS : BYTE;
	END_VAR
	VAR
		timer : TP_1D;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK FLOW_METER (* Measurements *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=339 *)
	VAR_INPUT
		VX : REAL;
		E : BOOL;
		RST : BOOL;
		PULSE_MODE : BOOL;
		UPDATE_TIME : TIME := TIME#1s0ms;
	END_VAR
	VAR_OUTPUT
		F : REAL;
	END_VAR
	VAR_IN_OUT
		X : REAL;
		Y : UDINT;
	END_VAR
	VAR
		tx : TIME;
		tl : TIME;
		int1 : INTEGRATE;
		init : BOOL;
		e_last : BOOL;
		tmp : INT;
		x_last : REAL;
		y_last : UDINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION FRACT : REAL (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=51 *)
	VAR_INPUT
		X : REAL;
	END_VAR
END_FUNCTION

FUNCTION FRMP_B : BYTE (* Functions *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=98 *)
	VAR_INPUT
		START : BYTE;
		DIR : BOOL;
		TD : TIME;
		TR : TIME;
	END_VAR
END_FUNCTION

FUNCTION FSTRING_TO_BYTE : BYTE (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=161 *)
	VAR_INPUT
		IN : STRING[12];
	END_VAR
	VAR
		temp : STRING[STRING_LENGTH];
	END_VAR
END_FUNCTION

FUNCTION FSTRING_TO_DT : DATE_AND_TIME (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=161 *)
	VAR_INPUT
		SDT : STRING[60];
		FMT : STRING[60];
	END_VAR
	VAR CONSTANT
		ignore : STRING[1] := '*'; (* ignore character is * *)
		fchar : STRING[1] := '#'; (* format character is # *)
	END_VAR
	VAR
		c : STRING[1];
		tmp : STRING[20];
		end : INT;
		dy : INT := 1970;
		dm : INT := 1;
		dd : INT := 1;
		th : INT;
		tm : INT;
		ts : INT;
	END_VAR
END_FUNCTION

FUNCTION FSTRING_TO_DWORD : DWORD (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=162 *)
	VAR_INPUT
		IN : STRING[40];
	END_VAR
	VAR
		temp : STRING[STRING_LENGTH];
	END_VAR
END_FUNCTION

FUNCTION FSTRING_TO_MONTH : INT (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=162 *)
	VAR_INPUT
		MTH : STRING[20];
		LANG : INT;
	END_VAR
	VAR
		lx : INT;
	END_VAR
	VAR CONSTANT
		cMONTHS : ARRAY[1..3,1..12] OF STRING[10] := ['January','February','March','April','May','June','July','August','September','October','November','December','Januar','Februar','März','April','Mai','Juni','Juli','August','September','Oktober','November','Dezember','Janvier','Février','mars','Avril','Mai','Juin','Juillet','Août','Septembre','Octobre','Novembre','Decembre'];
		cMONTHS3 : ARRAY[1..3,1..12] OF STRING[3] := ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec','Jan','Feb','Mrz','Apr','Mai','Jun','Jul','Aug','Sep','Okt','Nov','Dez','Jan','Fev','Mar','Avr','Mai','Jun','Jul','Aou','Sep','Oct','Nov','Dec'];
	END_VAR
END_FUNCTION

FUNCTION FSTRING_TO_WEEK : BYTE (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=163 *)
	VAR_INPUT
		WEEK : STRING[60];
		LANG : INT;
	END_VAR
	VAR
		pos : INT;
	END_VAR
END_FUNCTION

FUNCTION FSTRING_TO_WEEKDAY : INT (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=164 *)
	VAR_INPUT
		WDAY : STRING[20];
		LANG : INT;
	END_VAR
	VAR
		tmp : STRING[2];
		i : INT;
		ly : INT;
	END_VAR
	VAR CONSTANT
		cWEEKDAYS2 : ARRAY[1..3,1..7] OF STRING[2] := ['Mo','Tu','We','Th','Fr','Sa','Su','Mo','Di','Mi','Do','Fr','Sa','So','Lu','Ma','Me','Je','Ve','Sa','Di'];
	END_VAR
END_FUNCTION

FUNCTION_BLOCK FT_AVG (* Functions *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=98 *)
	VAR_INPUT
		IN : REAL;
		E : BOOL := TRUE;
		N : INT := 32;
		RST : BOOL;
	END_VAR
	VAR_OUTPUT
		AVG : REAL;
	END_VAR
	VAR
		buff : DELAY;
		i : INT;
		init : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK FT_DERIV (* Control *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=396 *)
	VAR_INPUT
		IN : REAL;
		K : REAL := 1;
		RUN : BOOL := TRUE;
	END_VAR
	VAR_OUTPUT
		OUT : REAL;
	END_VAR
	VAR
		old : REAL;
		tx : UDINT;
		last : UDINT;
		init : BOOL;
		tc : REAL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK FT_IMP (* Control *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=399 *)
	VAR_INPUT
		IN : REAL;
		T : TIME;
		K : REAL := 1;
	END_VAR
	VAR_OUTPUT
		OUT : REAL;
	END_VAR
	VAR
		t1 : FT_PT1;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK FT_INT (* Control *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=400 *)
	VAR_INPUT
		IN : REAL;
		K : REAL := 1;
		RUN : BOOL := TRUE;
		RST : BOOL;
		OUT_MIN : REAL := -1.0E37;
		OUT_MAX : REAL := 1.0E37;
	END_VAR
	VAR_OUTPUT
		OUT : REAL;
		LIM : BOOL;
	END_VAR
	VAR
		INTeg : INTEGRATE;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK FT_INT2 (* Control *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=402 *)
	VAR_INPUT
		IN : REAL;
		K : REAL := 1;
		RUN : BOOL := TRUE;
		RST : BOOL;
		OUT_MIN : REAL := -1.0E38;
		OUT_MAX : REAL := 1.0E38;
	END_VAR
	VAR_OUTPUT
		OUT : REAL;
		LIM : BOOL;
	END_VAR
	VAR
		integ : INTEGRATE;
		ix : REAL;
		val : REAL2;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK FT_MIN_MAX (* Functions *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=99 *)
	VAR_INPUT
		IN : REAL;
		RST : BOOL;
	END_VAR
	VAR_OUTPUT
		MX : REAL;
		MN : REAL;
	END_VAR
	VAR
		init : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK FT_PD (* Control *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=403 *)
	VAR_INPUT
		IN : REAL;
		KP : REAL := 1;
		TV : REAL := 1;
	END_VAR
	VAR_OUTPUT
		Y : REAL;
	END_VAR
	VAR
		diff : FT_DERIV;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK FT_PDT1 (* Control *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=403 *)
	VAR_INPUT
		IN : REAL;
		KP : REAL := 1;
		TV : REAL := 1;
		T1 : REAL := 1;
	END_VAR
	VAR_OUTPUT
		Y : REAL;
	END_VAR
	VAR
		diff : FT_DERIV;
		TP : FT_PT1;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK FT_PI (* Control *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=404 *)
	VAR_INPUT
		IN : REAL;
		KP : REAL := 1;
		KI : REAL := 1;
		ILIM_L : REAL := -1.0E38;
		ILIM_H : REAL := 1.0E38;
		IEN : BOOL := TRUE;
		RST : BOOL;
	END_VAR
	VAR_OUTPUT
		Y : REAL;
		LIM : BOOL;
	END_VAR
	VAR
		integ : FT_INT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK FT_PID (* Control *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=406 *)
	VAR_INPUT
		IN : REAL;
		KP : REAL := 1;
		TN : REAL := 1;
		TV : REAL := 1;
		ILIM_L : REAL := -1.0E38;
		ILIM_H : REAL := 1.0E38;
		IEN : BOOL := TRUE;
		RST : BOOL;
	END_VAR
	VAR_OUTPUT
		Y : REAL;
		LIM : BOOL;
	END_VAR
	VAR
		integ : FT_INT;
		diff : FT_DERIV;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK FT_PIDW (* Control *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=407 *)
	VAR_INPUT
		IN : REAL;
		KP : REAL := 1;
		TN : REAL := 1;
		TV : REAL := 1;
		LIM_L : REAL := -1.0E38;
		LIM_H : REAL := 1.0E38;
		RST : BOOL;
	END_VAR
	VAR_OUTPUT
		Y : REAL;
		LIM : BOOL;
	END_VAR
	VAR
		integ : INTEGRATE;
		diff : FT_DERIV;
		YI : REAL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK FT_PIDWL (* Control *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=409 *)
	VAR_INPUT
		IN : REAL;
		KP : REAL := 1;
		TN : REAL := 1;
		TV : REAL := 1;
		LIM_L : REAL := -1.0E38;
		LIM_H : REAL := 1.0E38;
		RST : BOOL;
	END_VAR
	VAR_OUTPUT
		Y : REAL;
		LIM : BOOL;
	END_VAR
	VAR
		piwl : FT_PIWL;
		diff : FT_DERIV;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK FT_PIW (* Control *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=411 *)
	VAR_INPUT
		IN : REAL;
		KP : REAL := 1;
		KI : REAL := 1;
		LIM_L : REAL := -1.0E38;
		LIM_H : REAL := 1.0E38;
		RST : BOOL;
	END_VAR
	VAR_OUTPUT
		Y : REAL;
		LIM : BOOL;
	END_VAR
	VAR
		integ : FT_INT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK FT_PIWL (* Control *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=412 *)
	VAR_INPUT
		IN : REAL;
		KP : REAL := 1;
		KI : REAL := 1;
		LIM_L : REAL := -1.0E38;
		LIM_H : REAL := 1.0E38;
		RST : BOOL;
	END_VAR
	VAR_OUTPUT
		Y : REAL;
		LIM : BOOL;
	END_VAR
	VAR
		init : BOOL;
		tx : UDINT;
		tc : REAL;
		t_last : UDINT;
		in_last : REAL;
		i : REAL;
		p : REAL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK FT_Profile (* Automation *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=457 *)
	VAR_INPUT
		K : REAL := 1;
		O : REAL;
		M : REAL := 1;
		E : BOOL;
		VALUE_0 : REAL;
		TIME_1 : TIME;
		VALUE_1 : REAL;
		TIME_2 : TIME;
		VALUE_2 : REAL;
		TIME_3 : TIME;
		VALUE_3 : REAL;
		TIME_10 : TIME;
		VALUE_10 : REAL;
		TIME_11 : TIME;
		VALUE_11 : REAL;
		TIME_12 : TIME;
		VALUE_12 : REAL;
		TIME_13 : TIME;
		VALUE_13 : REAL;
	END_VAR
	VAR_OUTPUT
		Y : REAL;
		RUN : BOOL;
		ET : TIME;
	END_VAR
	VAR
		tx : TIME;
		edge_ : BOOL;
		state : USINT;
		ta : TIME;
		tb : TIME;
		t0 : TIME;
		temp : REAL;
		va : REAL;
		vb : REAL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK FT_PT1 (* Control *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=414 *)
	VAR_INPUT
		IN : REAL;
		T : TIME;
		K : REAL := 1;
	END_VAR
	VAR_OUTPUT
		OUT : REAL;
	END_VAR
	VAR
		last : UDINT;
		tx : UDINT;
		init : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK FT_PT2 (* Control *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=415 *)
	VAR_INPUT
		IN : REAL;
		T : TIME;
		D : REAL;
		K : REAL := 1;
	END_VAR
	VAR_OUTPUT
		OUT : REAL;
	END_VAR
	VAR
		init : BOOL;
		int1 : INTEGRATE;
		int2 : INTEGRATE;
		tn : REAL;
		I1 : REAL;
		I2 : REAL;
		tn2 : REAL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK FT_RMP (* Functions *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=100 *)
	VAR_INPUT
		RMP : BOOL := TRUE;
		IN : REAL;
		KR : REAL;
		KF : REAL;
	END_VAR
	VAR_OUTPUT
		OUT : REAL;
		BUSY : BOOL;
		UD : BOOL;
	END_VAR
	VAR
		tx : TIME;
		last : TIME;
		init : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK FT_TN8 (* Control *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=420 *)
	VAR_INPUT
		IN : REAL;
		T : TIME;
	END_VAR
	VAR_OUTPUT
		OUT : REAL;
		TRIG : BOOL;
	END_VAR
	VAR
		length : INT := 8;
		X : ARRAY[0..7] OF REAL;
		cnt : INT;
		last : TIME;
		tx : TIME;
		init : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK FT_TN16 (* Control *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=416 *)
	VAR_INPUT
		IN : REAL;
		T : TIME;
	END_VAR
	VAR_OUTPUT
		OUT : REAL;
		TRIG : BOOL;
	END_VAR
	VAR
		length : INT := 16;
		X : ARRAY[0..15] OF REAL;
		cnt : INT;
		last : TIME;
		tx : TIME;
		init : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK FT_TN64 (* Control *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=419 *)
	VAR_INPUT
		IN : REAL;
		T : TIME;
	END_VAR
	VAR_OUTPUT
		OUT : REAL;
		TRIG : BOOL;
	END_VAR
	VAR
		length : INT := 64;
		X : ARRAY[0..63] OF REAL;
		cnt : INT;
		last : TIME;
		tx : TIME;
		init : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION F_LIN : REAL (* Functions *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=96 *)
	VAR_INPUT
		X : REAL;
		A : REAL;
		B : REAL;
	END_VAR
END_FUNCTION

FUNCTION F_LIN2 : REAL (* Functions *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=96 *)
	VAR_INPUT
		X : REAL;
		X1 : REAL;
		Y1 : REAL;
		X2 : REAL;
		Y2 : REAL;
	END_VAR
END_FUNCTION

FUNCTION F_POLY : REAL (* Functions *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=97 *)
	VAR_INPUT
		X : REAL;
		C : ARRAY[0..7] OF REAL;
	END_VAR
END_FUNCTION

FUNCTION F_POWER : REAL (* Functions *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=97 *)
	VAR_INPUT
		A : REAL;
		X : REAL;
		N : REAL;
	END_VAR
END_FUNCTION

FUNCTION F_QUAD : REAL (* Functions *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=97 *)
	VAR_INPUT
		X : REAL;
		A : REAL;
		B : REAL;
		C : REAL;
	END_VAR
END_FUNCTION

FUNCTION F_TO_C : REAL (* Conversion *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=361 *)
	VAR_INPUT
		FAHRENHEIT : REAL;
	END_VAR
END_FUNCTION

FUNCTION F_TO_OM : REAL (* Conversion *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=362 *)
	VAR_INPUT
		F : REAL;
	END_VAR
END_FUNCTION

FUNCTION F_TO_PT : TIME (* Conversion *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=362 *)
	VAR_INPUT
		F : REAL;
	END_VAR
END_FUNCTION

FUNCTION GAMMA : REAL (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=52 *)
	VAR_INPUT
		X : REAL;
	END_VAR
END_FUNCTION

FUNCTION GAUSS : REAL (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=52 *)
	VAR_INPUT
		X : REAL;
		U : REAL;
		SI : REAL;
	END_VAR
	VAR
		temp : REAL;
		si_inv : REAL;
	END_VAR
END_FUNCTION

FUNCTION GAUSSCD : REAL (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=53 *)
	VAR_INPUT
		X : REAL;
		U : REAL;
		SI : REAL;
	END_VAR
END_FUNCTION

FUNCTION GCD : INT (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=53 *)
	VAR_INPUT
		A : DINT;
		B : DINT;
	END_VAR
	VAR
		t : DINT;
	END_VAR
END_FUNCTION

FUNCTION GDF : REAL (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=54 *)
	VAR_INPUT
		X : REAL;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK GEN_BIT (* Generators *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=196 *)
	VAR_INPUT
		IN0 : DWORD;
		IN1 : DWORD;
		IN2 : DWORD;
		IN3 : DWORD;
		CLK : BOOL;
		STEPS : INT;
		REP : INT;
		RST : BOOL;
	END_VAR
	VAR_OUTPUT
		Q0 : BOOL;
		Q1 : BOOL;
		Q2 : BOOL;
		Q3 : BOOL;
		CNT : INT;
		RUN : BOOL;
	END_VAR
	VAR
		r0 : DWORD;
		r1 : DWORD;
		r2 : DWORD;
		r3 : DWORD;
		rx : INT := 1;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK GEN_PULSE (* Signal generators *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=257 *)
	VAR_INPUT
		ENQ : BOOL := TRUE;
		PTH : TIME;
		PTL : TIME;
	END_VAR
	VAR_OUTPUT
		Q : BOOL;
	END_VAR
	VAR
		tx : TIME;
		tn : TIME;
		init : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK GEN_PW2 (* Signal generators *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=258 *)
	VAR_INPUT
		ENQ : BOOL;
		TH1 : TIME;
		TL1 : TIME;
		TH2 : TIME;
		TL2 : TIME;
		TS : BOOL;
	END_VAR
	VAR_OUTPUT
		Q : BOOL;
		TH : TIME;
		TL : TIME;
	END_VAR
	VAR
		t_high : TIME;
		t_low : TIME;
		tx : TIME;
		start : TIME;
		init : BOOL;
		et : TIME;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK GEN_RDM (* Signal generators *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=258 *)
	VAR_INPUT
		PT : TIME;
		AM : REAL := 1;
		OS : REAL;
	END_VAR
	VAR_OUTPUT
		Q : BOOL;
		OUT : REAL;
	END_VAR
	VAR
		tx : TIME;
		last : TIME;
		init : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK GEN_RDT (* Signal generators *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=259 *)
	VAR_INPUT
		ENABLE : BOOL := TRUE;
		MIN_TIME_MS : TIME := TIME#1s0ms; (* min Taktzeit *)
		MAX_TIME_MS : TIME := TIME#1s200ms; (* Max Taktzeit *)
		TP_Q : TIME := TIME#100ms; (* Zeit Ausgang auf TRUE *)
	END_VAR
	VAR_OUTPUT
		XQ : BOOL;
	END_VAR
	VAR
		tonRDMTimer : TON; (* Zeitbaustein Taktgenerator *)
		tof_xQ : TOF; (* Ausschaltverzögerung Taktgenerator *)
		tRDMTime : TIME; (* Sollzeit *)
		rRDMTime : REAL; (* Zufalswert Timer *)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK GEN_RMP (* Signal generators *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=260 *)
	VAR_INPUT
		PT : TIME := TIME#1s0ms;
		AM : REAL := 1;
		OS : REAL;
		DL : REAL;
	END_VAR
	VAR_OUTPUT
		Q : BOOL;
		OUT : REAL;
	END_VAR
	VAR
		tx : TIME;
		last : TIME;
		init : BOOL;
		temp : REAL;
		ltemp : REAL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK GEN_SIN (* Signal generators *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=261 *)
	VAR_INPUT
		PT : TIME;
		AM : REAL := 1;
		OS : REAL;
		DL : REAL;
	END_VAR
	VAR_OUTPUT
		Q : BOOL;
		OUT : REAL;
	END_VAR
	VAR
		tx : TIME;
		last : TIME;
		init : BOOL;
		temp : REAL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK GEN_SQ (* Generators *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=197 *)
	VAR_INPUT
		PT : TIME;
	END_VAR
	VAR_OUTPUT
		Q : BOOL;
	END_VAR
	VAR
		tn : UDINT;
		tx : UDINT;
		init : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK GEN_SQR (* Signal generators *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=262 *)
	VAR_INPUT
		PT : TIME;
		AM : REAL := 1;
		OS : REAL;
		DC : REAL := 0.5;
		DL : REAL;
	END_VAR
	VAR_OUTPUT
		Q : BOOL;
		OUT : REAL;
	END_VAR
	VAR
		tx : TIME;
		last : TIME;
		init : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION GEO_TO_DEG : REAL (* Conversion *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=362 *)
	VAR_INPUT
		D : INT;
		M : INT;
		SEC : REAL;
	END_VAR
END_FUNCTION

FUNCTION GOLD : REAL (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=54 *)
	VAR_INPUT
		X : REAL;
	END_VAR
END_FUNCTION

FUNCTION GRAY_TO_BYTE : BYTE (* Gate logic *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=226 *)
	VAR_INPUT
		IN : BYTE;
	END_VAR
END_FUNCTION

FUNCTION HEX_TO_BYTE : BYTE (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=164 *)
	VAR_INPUT
		HEX : STRING[5];
	END_VAR
	VAR
		pt : REFERENCE TO BYTE;
		i : INT;
		X : BYTE;
		stop : INT;
		intX : USINT;
	END_VAR
END_FUNCTION

FUNCTION HEX_TO_DWORD : DWORD (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=165 *)
	VAR_INPUT
		HEX : STRING[20];
	END_VAR
	VAR
		pt : REFERENCE TO BYTE;
		i : INT;
		X : BYTE;
		stop : INT;
		intX : USINT;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK HOLIDAY (* Time and date *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=123 *)
	VAR_INPUT
		DATE_IN : DATE;
		LANGU : INT;
		FRIDAY : BOOL;
		SATURDAY : BOOL;
		SUNDAY : BOOL;
	END_VAR
	VAR_OUTPUT
		Y : BOOL;
		NAME : STRING[30];
	END_VAR
	VAR_IN_OUT
		HOLIDAYS : ARRAY[0..29] OF HOLIDAY_DATA;
	END_VAR
	VAR CONSTANT
		SIZE : INT := 29;
	END_VAR
	VAR
		last_active : DATE;
		ostern : DATE;
		i : INT;
		jahr : INT;
		x_date : DATE;
		lx : INT;
		wdx : INT;
	END_VAR
	VAR CONSTANT
		cWEEKDAYS : ARRAY[1..3,1..7] OF STRING[10] := ['Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday','Montag','Dienstag','Mittwoch','Donnerstag','Freitag','Samstag','Sonntag','Lundi','Mardi','Mercredi','Jeudi','Vendredi','Samedi','Dimanche'];
		cLANGUAGE : ARRAY[1..5] OF INT := [2,2,3,2,2];
	END_VAR
END_FUNCTION_BLOCK

FUNCTION HOUR : INT (* Time and date *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=124 *)
	VAR_INPUT
		ITOD : TIME_OF_DAY;
	END_VAR
END_FUNCTION

FUNCTION HOUR_OF_DT : INT (* Time and date *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=125 *)
	VAR_INPUT
		XDT : DATE_AND_TIME;
	END_VAR
END_FUNCTION

FUNCTION HOUR_TO_TIME : TIME (* Time and date *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=125 *)
	VAR_INPUT
		IN : REAL;
	END_VAR
END_FUNCTION

FUNCTION HOUR_TO_TOD : TIME_OF_DAY (* Time and date *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=125 *)
	VAR_INPUT
		IN : REAL;
	END_VAR
END_FUNCTION

FUNCTION HYPOT : REAL (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=55 *)
	VAR_INPUT
		X : REAL;
		Y : REAL;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK HYST (* Control *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=421 *)
	VAR_INPUT
		IN : REAL;
		ON : REAL;
		OFF : REAL;
	END_VAR
	VAR_OUTPUT
		Q : BOOL;
		WIN : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK HYST_1 (* Control *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=422 *)
	VAR_INPUT
		IN : REAL;
		HIGH : REAL;
		LOW : REAL;
	END_VAR
	VAR_OUTPUT
		Q : BOOL;
		WIN : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK HYST_2 (* Control *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=424 *)
	VAR_INPUT
		IN : REAL;
		VAL : REAL;
		HYS : REAL;
	END_VAR
	VAR_OUTPUT
		Q : BOOL;
		WIN : BOOL;
	END_VAR
	VAR
		tmp : REAL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK HYST_3 (* Control *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=425 *)
	VAR_INPUT
		IN : REAL;
		HYST : REAL;
		VAL1 : REAL;
		VAL2 : REAL;
	END_VAR
	VAR_OUTPUT
		Q1 : BOOL;
		Q2 : BOOL;
	END_VAR
	VAR
		X : REAL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION INC : INT (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=55 *)
	VAR_INPUT
		X : INT;
		D : INT;
		M : INT;
	END_VAR
END_FUNCTION

FUNCTION INC1 : INT (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=56 *)
	VAR_INPUT
		X : INT;
		N : INT;
	END_VAR
END_FUNCTION

FUNCTION INC2 : INT (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=56 *)
	VAR_INPUT
		X : INT;
		D : INT;
		L : INT;
		U : INT;
	END_VAR
	VAR
		tmp : INT;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK INC_DEC (* Automation *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=459 *)
	VAR_INPUT
		CHA : BOOL;
		CHB : BOOL;
		RST : BOOL;
	END_VAR
	VAR_OUTPUT
		DIR : BOOL;
		CNT : INT;
	END_VAR
	VAR
		edgea : BOOL;
		clk : BOOL;
		clka : BOOL;
		clkb : BOOL;
		edgeb : BOOL;
		axb : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK INTEGRATE (* Control *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=426 *)
	VAR_INPUT
		E : BOOL := TRUE;
		X : REAL;
		K : REAL := 1;
	END_VAR
	VAR_IN_OUT
		Y : REAL;
	END_VAR
	VAR
		X_last : REAL;
		init : BOOL;
		last : UDINT;
		tx : UDINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK INTERLOCK (* Automation *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=461 *)
	VAR_INPUT
		I1 : BOOL;
		I2 : BOOL;
		TL : TIME;
	END_VAR
	VAR_OUTPUT
		Q1 : BOOL;
		Q2 : BOOL;
	END_VAR
	VAR
		T1 : TOF;
		T2 : TOF;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK INTERLOCK_4 (* Automation *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=462 *)
	VAR_INPUT
		I0 : BOOL;
		I1 : BOOL;
		I2 : BOOL;
		I3 : BOOL;
		E : BOOL;
		MODE : INT;
	END_VAR
	VAR_OUTPUT
		OUT : BYTE;
		TP : BOOL;
	END_VAR
	VAR
		in : BYTE;
		last : BYTE;
		old : BYTE;
		lmode : INT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION INT_TO_BCDC : BYTE (* Gate logic *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=227 *)
	VAR_INPUT
		IN : INT;
	END_VAR
END_FUNCTION

FUNCTION INV : REAL (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=57 *)
	VAR_INPUT
		X : REAL;
	END_VAR
END_FUNCTION

FUNCTION ISC_ALPHA : BOOL (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=169 *)
	VAR_INPUT
		IN : BYTE;
	END_VAR
END_FUNCTION

FUNCTION ISC_CTRL : BOOL (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=170 *)
	VAR_INPUT
		IN : BYTE;
	END_VAR
END_FUNCTION

FUNCTION ISC_HEX : BOOL (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=170 *)
	VAR_INPUT
		IN : BYTE;
	END_VAR
END_FUNCTION

FUNCTION ISC_LOWER : BOOL (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=171 *)
	VAR_INPUT
		IN : BYTE;
	END_VAR
END_FUNCTION

FUNCTION ISC_NUM : BOOL (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=171 *)
	VAR_INPUT
		IN : BYTE;
	END_VAR
END_FUNCTION

FUNCTION ISC_UPPER : BOOL (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=172 *)
	VAR_INPUT
		IN : BYTE;
	END_VAR
END_FUNCTION

FUNCTION IS_ALNUM : BOOL (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=165 *)
	VAR_INPUT
		STR : STRING[STRING_LENGTH];
	END_VAR
	VAR
		L : INT;
		pt : REFERENCE TO BYTE;
		pos : INT;
	END_VAR
END_FUNCTION

FUNCTION IS_ALPHA : BOOL (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=165 *)
	VAR_INPUT
		STR : STRING[STRING_LENGTH];
	END_VAR
	VAR
		L : INT;
		pt : REFERENCE TO BYTE;
		pos : INT;
	END_VAR
END_FUNCTION

FUNCTION IS_CC : BOOL (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=166 *)
	VAR_INPUT
		STR : STRING[STRING_LENGTH];
		CMP : STRING[STRING_LENGTH];
	END_VAR
	VAR
		L : INT;
		pos : INT;
	END_VAR
END_FUNCTION

FUNCTION IS_CTRL : BOOL (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=166 *)
	VAR_INPUT
		STR : STRING[STRING_LENGTH];
	END_VAR
	VAR
		L : INT;
		pt : REFERENCE TO BYTE;
		pos : INT;
	END_VAR
END_FUNCTION

FUNCTION IS_HEX : BOOL (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=167 *)
	VAR_INPUT
		STR : STRING[STRING_LENGTH];
	END_VAR
	VAR
		L : INT;
		pt : REFERENCE TO BYTE;
		pos : INT;
	END_VAR
END_FUNCTION

FUNCTION IS_LOWER : BOOL (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=167 *)
	VAR_INPUT
		STR : STRING[STRING_LENGTH];
	END_VAR
	VAR
		l : INT;
		pt : REFERENCE TO BYTE;
		pos : INT;
	END_VAR
END_FUNCTION

FUNCTION IS_NCC : BOOL (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=168 *)
	VAR_INPUT
		STR : STRING[STRING_LENGTH];
		CMP : STRING[STRING_LENGTH];
	END_VAR
	VAR
		L : INT;
		pos : INT;
	END_VAR
END_FUNCTION

FUNCTION IS_NUM : BOOL (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=168 *)
	VAR_INPUT
		STR : STRING[STRING_LENGTH];
	END_VAR
	VAR
		L : INT;
		pt : REFERENCE TO BYTE;
		pos : INT;
	END_VAR
END_FUNCTION

FUNCTION IS_SORTED : BOOL (* Array *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=82 *)
	VAR_INPUT
		PT : REFERENCE TO ARRAY[0..32000] OF REAL;
		SIZE : UINT;
	END_VAR
	VAR
		stop : INT;
		i : INT;
	END_VAR
END_FUNCTION

FUNCTION IS_UPPER : BOOL (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=169 *)
	VAR_INPUT
		STR : STRING[STRING_LENGTH];
	END_VAR
	VAR
		L : INT;
		pt : REFERENCE TO BYTE;
		pos : INT;
	END_VAR
END_FUNCTION

FUNCTION JD2000 : REAL (* Time and date *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=126 *)
	VAR_INPUT
		DTI : DATE_AND_TIME;
	END_VAR
END_FUNCTION

FUNCTION KMH_TO_MS : REAL (* Conversion *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=366 *)
	VAR_INPUT
		KMH : REAL;
	END_VAR
END_FUNCTION

FUNCTION K_TO_C : REAL (* Conversion *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=366 *)
	VAR_INPUT
		KELVIN : REAL;
	END_VAR
END_FUNCTION

FUNCTION LAMBERT_W : REAL (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=58 *)
	VAR_INPUT
		X : REAL;
	END_VAR
	VAR
		w : REAL;
		i : INT;
		we : REAL;
		w1e : REAL;
		last : DWORD;
		ewx : REAL;
	END_VAR
END_FUNCTION

FUNCTION LANGEVIN : REAL (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=58 *)
	VAR_INPUT
		X : REAL;
	END_VAR
END_FUNCTION

FUNCTION LEAP_DAY : BOOL (* Time and date *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=126 *)
	VAR_INPUT
		IDATE : DATE;
	END_VAR
END_FUNCTION

FUNCTION LEAP_OF_DATE : BOOL (* Time and date *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=127 *)
	VAR_INPUT
		IDATE : DATE;
	END_VAR
END_FUNCTION

FUNCTION LEAP_YEAR : BOOL (* Time and date *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=127 *)
	VAR_INPUT
		YR : INT;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK LENGTH (* Conversion *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=367 *)
	VAR_INPUT
		M : REAL;
		P : REAL;
		IN : REAL;
		FT : REAL;
		YD : REAL;
		MILE : REAL;
		SM : REAL;
		FM : REAL;
	END_VAR
	VAR_OUTPUT
		YM : REAL;
		YP : REAL;
		YIN : REAL;
		YFT : REAL;
		YYD : REAL;
		YMILE : REAL;
		YSM : REAL;
		YFM : REAL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION LINEAR_INT : REAL (* Functions *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=101 *)
	VAR_INPUT
		X : REAL;
		XY : ARRAY[1..20,0..1] OF REAL;
		PTS : INT;
	END_VAR
	VAR
		i : INT;
	END_VAR
END_FUNCTION

FUNCTION LIST_CLEAN : BOOL (* List Processing *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=485 *)
	VAR_INPUT
		SEP : BYTE;
	END_VAR
	VAR_IN_OUT
		LIST : STRING[LIST_LENGTH];
	END_VAR
	VAR
		pt : REFERENCE TO ARRAY[1..LIST_LENGTH] OF BYTE;
		read : INT := 1;
		write : INT := 1;
		last : BYTE;
		c : BYTE;
	END_VAR
END_FUNCTION

FUNCTION LIST_GET : BOOL (* List Processing *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=485 *)
	VAR_INPUT
		SEP : BYTE;
		POS : INT;
	END_VAR
	VAR_IN_OUT
		LIST : STRING[LIST_LENGTH];
		RETVAL : STRING[LIST_LENGTH]; (*Return value of the function*)
	END_VAR
	VAR
		i : INT := 1;
		o : INT := 1;
		pt : REFERENCE TO ARRAY[1..LIST_LENGTH] OF BYTE;
		po : REFERENCE TO ARRAY[1..LIST_LENGTH] OF BYTE;
		cnt : INT := 0;
		c : BYTE;
	END_VAR
END_FUNCTION

FUNCTION LIST_INSERT : BOOL (* List Processing *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=486 *)
	VAR_INPUT
		SEP : BYTE;
		POS : INT;
		INS : STRING[LIST_LENGTH];
	END_VAR
	VAR_IN_OUT
		LIST : STRING[LIST_LENGTH];
	END_VAR
	VAR
		pt : REFERENCE TO ARRAY[1..LIST_LENGTH] OF BYTE;
		read : INT := 1;
		cnt : INT := 1;
		sx : STRING[1];
	END_VAR
END_FUNCTION

FUNCTION LIST_LEN : INT (* List Processing *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=487 *)
	VAR_INPUT
		SEP : BYTE;
	END_VAR
	VAR_IN_OUT
		LIST : STRING[LIST_LENGTH];
	END_VAR
	VAR
		pt : REFERENCE TO ARRAY[1..LIST_LENGTH] OF BYTE;
		pos : INT := 1;
		c : BYTE;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK LIST_NEXT (* List Processing *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=487 *)
	VAR_INPUT
		SEP : BYTE;
		RST : BOOL;
	END_VAR
	VAR_OUTPUT
		LEL : STRING[LIST_LENGTH];
		NUL : BOOL;
	END_VAR
	VAR_IN_OUT
		LIST : STRING[LIST_LENGTH];
	END_VAR
	VAR
		pos : INT := 1;
		pt : REFERENCE TO ARRAY[1..LIST_LENGTH] OF BYTE;
		po : REFERENCE TO ARRAY[1..LIST_LENGTH] OF BYTE;
		c : BYTE;
		write : INT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION LIST_RETRIEVE : BOOL (* List Processing *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=488 *)
	VAR_INPUT
		SEP : BYTE;
		POS : INT;
	END_VAR
	VAR_IN_OUT
		LIST : STRING[LIST_LENGTH];
		RETVAL : STRING[LIST_LENGTH]; (*Return value of the function*)
	END_VAR
	VAR
		i : INT;
		o : INT := 1;
		w : INT := 1;
		pt : REFERENCE TO ARRAY[1..LIST_LENGTH] OF BYTE;
		po : REFERENCE TO ARRAY[1..LIST_LENGTH] OF BYTE;
		cnt : INT := 0;
		c : BYTE;
	END_VAR
END_FUNCTION

FUNCTION LOWERCASE : BOOL (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=172 *)
	VAR_INPUT
		STR : STRING[STRING_LENGTH];
	END_VAR
	VAR_IN_OUT
		RETVAL : STRING[STRING_LENGTH]; (*Return value of the function*)
	END_VAR
	VAR
		PT : REFERENCE TO BYTE;
		pos : INT;
		l : INT;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK LTCH (* FF pulse triggered *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=242 *)
	VAR_INPUT
		D : BOOL;
		L : BOOL;
		RST : BOOL;
	END_VAR
	VAR_OUTPUT
		Q : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK LTCH_4 (* FF pulse triggered *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=246 *)
	VAR_INPUT
		D0 : BOOL;
		D1 : BOOL;
		D2 : BOOL;
		D3 : BOOL;
		L : BOOL;
		RST : BOOL;
	END_VAR
	VAR_OUTPUT
		Q0 : BOOL;
		Q1 : BOOL;
		Q2 : BOOL;
		Q3 : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION LTIME_TO_UTC : DATE_AND_TIME (* Time and date *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=128 *)
	VAR_INPUT
		LOCAL_TIME : DATE_AND_TIME;
		DST : BOOL;
		TIME_ZONE_OFFSET : INT;
	END_VAR
END_FUNCTION

FUNCTION MANUAL : BOOL (* Automation *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=463 *)
	VAR_INPUT
		IN : BOOL;
		ON : BOOL;
		OFF : BOOL;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK MANUAL_1 (* Automation *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=464 *)
	VAR_INPUT
		IN : BOOL;
		MAN : BOOL;
		M_I : BOOL;
		SET : BOOL;
		RST : BOOL;
	END_VAR
	VAR_OUTPUT
		Q : BOOL;
		STATUS : BYTE;
	END_VAR
	VAR
		S_edge : BOOL;
		r_edge : BOOL;
		edge_ : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MANUAL_2 (* Automation *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=464 *)
	VAR_INPUT
		IN : BOOL;
		ENA : BOOL;
		ON : BOOL;
		OFF : BOOL;
		MAN : BOOL;
	END_VAR
	VAR_OUTPUT
		Q : BOOL;
		STATUS : BYTE;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MANUAL_4 (* Automation *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=465 *)
	VAR_INPUT
		I0 : BOOL;
		I1 : BOOL;
		I2 : BOOL;
		I3 : BOOL;
		MAN : BOOL;
		STP : BOOL;
		M0 : BOOL;
		M1 : BOOL;
		M2 : BOOL;
		M3 : BOOL;
	END_VAR
	VAR_OUTPUT
		Q0 : BOOL;
		Q1 : BOOL;
		Q2 : BOOL;
		Q3 : BOOL;
		STATUS : BYTE;
	END_VAR
	VAR
		edge_ : BOOL;
		pos : INT;
		tog : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MATRIX (* Others *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=227 *)
	VAR_INPUT
		X1 : BOOL;
		X2 : BOOL;
		X3 : BOOL;
		X4 : BOOL;
		X5 : BOOL;
		RELEASE : BOOL;
	END_VAR
	VAR_OUTPUT
		CODE : BYTE;
		TP : BOOL;
		Y1 : BOOL := TRUE;
		Y2 : BOOL;
		Y3 : BOOL;
		Y4 : BOOL;
	END_VAR
	VAR
		line : USINT;
		X : ARRAY[0..3] OF BYTE; (* scan line inputs *)
		L : ARRAY[0..3] OF BYTE; (* scan line status *)
		i : INT;
		temp : BYTE;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION MAX3 : REAL (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=59 *)
	VAR_INPUT
		IN1 : REAL;
		IN2 : REAL;
		IN3 : REAL;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK MESSAGE_4R (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=173 *)
	VAR_INPUT
		M0 : STRING[STRING_LENGTH];
		M1 : STRING[STRING_LENGTH];
		M2 : STRING[STRING_LENGTH];
		M3 : STRING[STRING_LENGTH];
		MM : INT := 3;
		ENQ : BOOL := TRUE;
		CLK : BOOL := TRUE;
		T1 : TIME := TIME#3s0ms;
	END_VAR
	VAR_OUTPUT
		MX : STRING[STRING_LENGTH];
		MN : INT;
		TR : BOOL;
	END_VAR
	VAR
		timer : TON;
		edge_ : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MESSAGE_8 (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=173 *)
	VAR_INPUT
		IN1 : BOOL;
		IN2 : BOOL;
		IN3 : BOOL;
		IN4 : BOOL;
		IN5 : BOOL;
		IN6 : BOOL;
		IN7 : BOOL;
		IN8 : BOOL;
		S1 : STRING[STRING_LENGTH];
		S2 : STRING[STRING_LENGTH];
		S3 : STRING[STRING_LENGTH];
		S4 : STRING[STRING_LENGTH];
		S5 : STRING[STRING_LENGTH];
		S6 : STRING[STRING_LENGTH];
		S7 : STRING[STRING_LENGTH];
		S8 : STRING[STRING_LENGTH];
	END_VAR
	VAR_OUTPUT
		M : STRING[STRING_LENGTH];
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK METER (* Measurements *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=343 *)
	VAR_INPUT
		M1 : REAL;
		M2 : REAL;
		I1 : BOOL;
		I2 : BOOL;
		D : REAL := 1;
		RST : BOOL;
	END_VAR
	VAR_IN_OUT
		MX : REAL;
	END_VAR
	VAR
		MR : REAL2;
		MX1 : REAL; (* current consumption value on M1 and M2 *)
		MX2 : REAL; (* current consumption value on M1 and M2 *)
		tx : UDINT;
		last : UDINT;
		tc : REAL;
		init : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK METER_STAT (* Measurements *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=345 *)
	VAR_INPUT
		IN : REAL;
		DI : DATE;
		RST : BOOL;
	END_VAR
	VAR_IN_OUT
		LAST_DAY : REAL;
		CURRENT_DAY : REAL;
		LAST_WEEK : REAL;
		CURRENT_WEEK : REAL;
		LAST_MONTH : REAL;
		CURRENT_MONTH : REAL;
		LAST_YEAR : REAL;
		CURRENT_YEAR : REAL;
	END_VAR
	VAR RETAIN
		Year_Start : REAL;
		Month_Start : REAL;
		Week_Start : REAL;
		Day_Start : REAL;
		last_run : DATE;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION MID3 : REAL (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=59 *)
	VAR_INPUT
		IN1 : REAL;
		IN2 : REAL;
		IN3 : REAL;
	END_VAR
END_FUNCTION

FUNCTION MIN3 : REAL (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=60 *)
	VAR_INPUT
		IN1 : REAL;
		IN2 : REAL;
		IN3 : REAL;
	END_VAR
END_FUNCTION

FUNCTION MINUTE : INT (* Time and date *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=128 *)
	VAR_INPUT
		ITOD : TIME_OF_DAY;
	END_VAR
END_FUNCTION

FUNCTION MINUTE_OF_DT : INT (* Time and date *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=128 *)
	VAR_INPUT
		XDT : DATE_AND_TIME;
	END_VAR
END_FUNCTION

FUNCTION MINUTE_TO_TIME : TIME (* Time and date *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=129 *)
	VAR_INPUT
		IN : REAL;
	END_VAR
END_FUNCTION

FUNCTION MIRROR : BOOL (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=174 *)
	VAR_INPUT
		STR : STRING[STRING_LENGTH];
	END_VAR
	VAR_IN_OUT
		RETVAL : STRING[STRING_LENGTH]; (*Return value of the function*)
	END_VAR
	VAR
		pi : REFERENCE TO ARRAY[1..255] OF BYTE;
		po : REFERENCE TO BYTE;
		lx : INT;
		i : INT;
	END_VAR
END_FUNCTION

FUNCTION MIX : REAL (* Signal processing *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=281 *)
	VAR_INPUT
		A : REAL;
		B : REAL;
		M : REAL;
	END_VAR
END_FUNCTION

FUNCTION MODR : REAL (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=60 *)
	VAR_INPUT
		IN : REAL;
		DIVI : REAL;
	END_VAR
END_FUNCTION

FUNCTION MONTH_BEGIN : DATE (* Time and date *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=129 *)
	VAR_INPUT
		IDATE : DATE;
	END_VAR
END_FUNCTION

FUNCTION MONTH_END : DATE (* Time and date *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=130 *)
	VAR_INPUT
		IDATE : DATE;
	END_VAR
END_FUNCTION

FUNCTION MONTH_OF_DATE : INT (* Time and date *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=130 *)
	VAR_INPUT
		IDATE : DATE;
	END_VAR
END_FUNCTION

FUNCTION MONTH_TO_STRING : BOOL (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=175 *)
	VAR_INPUT
		MTH : INT;
		LANG : INT;
		LX : INT;
	END_VAR
	VAR_IN_OUT
		RETVAL : STRING[10]; (*Return value of the function*)
	END_VAR
	VAR
		ly : INT;
	END_VAR
	VAR CONSTANT
		cMONTHS : ARRAY[1..3,1..12] OF STRING[10] := ['January','February','March','April','May','June','July','August','September','October','November','December','Januar','Februar','März','April','Mai','Juni','Juli','August','September','Oktober','November','Dezember','Janvier','Février','mars','Avril','Mai','Juin','Juillet','Août','Septembre','Octobre','Novembre','Decembre'];
		cMONTHS3 : ARRAY[1..3,1..12] OF STRING[3] := ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec','Jan','Feb','Mrz','Apr','Mai','Jun','Jul','Aug','Sep','Okt','Nov','Dez','Jan','Fev','Mar','Avr','Mai','Jun','Jul','Aou','Sep','Oct','Nov','Dec'];
	END_VAR
END_FUNCTION

FUNCTION MS_TO_BFT : INT (* Conversion *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=368 *)
	VAR_INPUT
		MS : REAL;
	END_VAR
END_FUNCTION

FUNCTION MS_TO_KMH : REAL (* Conversion *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=369 *)
	VAR_INPUT
		MS : REAL;
	END_VAR
END_FUNCTION

FUNCTION MULTIME : TIME (* Time and date *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=130 *)
	VAR_INPUT
		T : TIME;
		M : REAL;
	END_VAR
END_FUNCTION

FUNCTION MULTI_IN : REAL (* Sensor *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=317 *)
	VAR_INPUT
		IN_1 : REAL;
		IN_2 : REAL;
		IN_3 : REAL;
		DEFAULT : REAL;
		IN_MIN : REAL;
		IN_MAX : REAL;
		MODE : USINT;
	END_VAR
	VAR
		count : INT;
		F1 : BOOL;
		F2 : BOOL;
		F3 : BOOL;
	END_VAR
END_FUNCTION

FUNCTION MUL_ADD : REAL (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=61 *)
	VAR_INPUT
		X : REAL;
		K : REAL;
		O : REAL;
	END_VAR
END_FUNCTION

FUNCTION MUX_2 : BOOL (* Gate logic *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=229 *)
	VAR_INPUT
		D0 : BOOL;
		D1 : BOOL;
		A0 : BOOL;
	END_VAR
END_FUNCTION

FUNCTION MUX_4 : BOOL (* Gate logic *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=229 *)
	VAR_INPUT
		D0 : BOOL;
		D1 : BOOL;
		D2 : BOOL;
		D3 : BOOL;
		A0 : BOOL;
		A1 : BOOL;
	END_VAR
END_FUNCTION

FUNCTION MUX_R2 : REAL (* Signal processing *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=281 *)
	VAR_INPUT
		IN0 : REAL;
		IN1 : REAL;
		A : BOOL;
	END_VAR
END_FUNCTION

FUNCTION MUX_R4 : REAL (* Signal processing *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=282 *)
	VAR_INPUT
		IN0 : REAL;
		IN1 : REAL;
		IN2 : REAL;
		IN3 : REAL;
		A0 : BOOL;
		A1 : BOOL;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK M_D (* Measurements *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=341 *)
	VAR_INPUT
		START : BOOL;
		STOP : BOOL;
		TMAX : TIME := TIME#14400m0s0ms;
		RST : BOOL;
	END_VAR
	VAR_OUTPUT
		PT : TIME;
		ET : TIME;
		RUN : BOOL;
	END_VAR
	VAR
		edge_ : BOOL;
		T0 : TIME;
		tx : TIME;
		startup : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK M_T (* Measurements *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=342 *)
	VAR_INPUT
		IN : BOOL;
		TMAX : TIME := TIME#14400m0s0ms;
		RST : BOOL;
	END_VAR
	VAR_OUTPUT
		PT : TIME;
		ET : TIME;
	END_VAR
	VAR
		edge_ : BOOL;
		start : TIME;
		tx : TIME;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK M_TX (* Measurements *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=342 *)
	VAR_INPUT
		IN : BOOL;
		TMAX : TIME := TIME#14400m0s0ms;
		RST : BOOL;
	END_VAR
	VAR_OUTPUT
		TH : TIME;
		TL : TIME;
		DC : REAL;
		F : REAL;
		ET : TIME;
	END_VAR
	VAR
		edge_ : BOOL;
		start : TIME;
		stop : TIME;
		tx : TIME;
		rise : BOOL;
		fall : BOOL;
		startup : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION NEGX : REAL (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=61 *)
	VAR_INPUT
		X : REAL;
	END_VAR
END_FUNCTION

FUNCTION OCT_TO_BYTE : BYTE (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=175 *)
	VAR_INPUT
		OCT : STRING[10];
	END_VAR
	VAR
		pt : REFERENCE TO BYTE;
		i : INT;
		X : BYTE;
		stop : INT;
		intX : USINT;
	END_VAR
END_FUNCTION

FUNCTION OCT_TO_DWORD : DWORD (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=176 *)
	VAR_INPUT
		OCT : STRING[20];
	END_VAR
	VAR
		pt : REFERENCE TO BYTE;
		i : INT;
		X : BYTE;
		stop : INT;
		intX : USINT;
	END_VAR
END_FUNCTION

FUNCTION OFFSET : REAL (* Signal processing *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=282 *)
	VAR_INPUT
		X : REAL;
		O1 : BOOL;
		O2 : BOOL;
		O3 : BOOL;
		O4 : BOOL;
		D : BOOL;
		OFFSET_1 : REAL;
		OFFSET_2 : REAL;
		OFFSET_3 : REAL;
		OFFSET_4 : REAL;
		DEFAULT : REAL;
	END_VAR
END_FUNCTION

FUNCTION OFFSET2 : REAL (* Signal processing *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=285 *)
	VAR_INPUT
		X : REAL;
		O1 : BOOL;
		O2 : BOOL;
		O3 : BOOL;
		O4 : BOOL;
		D : BOOL;
		OFFSET_1 : REAL;
		OFFSET_2 : REAL;
		OFFSET_3 : REAL;
		OFFSET_4 : REAL;
		DEFAULT : REAL;
	END_VAR
END_FUNCTION

FUNCTION OM_TO_F : REAL (* Conversion *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=369 *)
	VAR_INPUT
		OM : REAL;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK ONTIME (* Measurements *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=346 *)
	VAR_INPUT
		IN : BOOL;
		RST : BOOL;
	END_VAR
	VAR_IN_OUT
		SECONDS : UDINT;
		CYCLES : UDINT;
	END_VAR
	VAR
		tx : UDINT;
		last : UDINT;
		edge_ : BOOL;
		init : BOOL;
		ms : UDINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION OSCAT_VERSION : DWORD (* Other *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=37 *)
	VAR_INPUT
		IN : BOOL;
	END_VAR
END_FUNCTION

FUNCTION OVERRIDE : REAL (* Signal processing *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=286 *)
	VAR_INPUT
		X1 : REAL;
		X2 : REAL;
		X3 : REAL;
		E1 : BOOL;
		E2 : BOOL;
		E3 : BOOL;
	END_VAR
END_FUNCTION

FUNCTION PARITY : BOOL (* Gate logic *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=230 *)
	VAR_INPUT
		IN : DWORD;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK PARSET (* Automation *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=466 *)
	VAR_INPUT
		A0 : BOOL;
		A1 : BOOL;
		X01 : REAL;
		X02 : REAL;
		X03 : REAL;
		X04 : REAL;
		X11 : REAL;
		X12 : REAL;
		X13 : REAL;
		X14 : REAL;
		X21 : REAL;
		X22 : REAL;
		X23 : REAL;
		X24 : REAL;
		X31 : REAL;
		X32 : REAL;
		X33 : REAL;
		X34 : REAL;
		TC : TIME;
	END_VAR
	VAR_OUTPUT
		P1 : REAL;
		P2 : REAL;
		P3 : REAL;
		P4 : REAL;
	END_VAR
	VAR
		X : ARRAY[0..3,1..4] OF REAL;
		S1 : REAL;
		S2 : REAL;
		S3 : REAL;
		S4 : REAL;
		tx : UDINT;
		last : UDINT;
		start : BOOL;
		set : USINT;
		init : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK PARSET2 (* Automation *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=467 *)
	VAR_INPUT
		X : REAL;
		X01 : REAL;
		X02 : REAL;
		X03 : REAL;
		X04 : REAL;
		X11 : REAL;
		X12 : REAL;
		X13 : REAL;
		X14 : REAL;
		X21 : REAL;
		X22 : REAL;
		X23 : REAL;
		X24 : REAL;
		X31 : REAL;
		X32 : REAL;
		X33 : REAL;
		X34 : REAL;
		L1 : REAL;
		L2 : REAL;
		L3 : REAL;
		TC : TIME;
	END_VAR
	VAR_OUTPUT
		P1 : REAL;
		P2 : REAL;
		P3 : REAL;
		P4 : REAL;
	END_VAR
	VAR
		Pset : PARSET;
		init : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION PERIOD : BOOL (* Time and date *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=131 *)
	VAR_INPUT
		D1 : DATE;
		DX : DATE;
		D2 : DATE;
	END_VAR
	VAR
		day1 : INT;
		day2 : INT;
		dayx : INT;
	END_VAR
END_FUNCTION

FUNCTION PERIOD2 : BOOL (* Time and date *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=131 *)
	VAR_INPUT
		DP : ARRAY[0..3,0..1] OF DATE;
		DX : DATE;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK PIN_CODE (* Others *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=231 *)
	VAR_INPUT
		CB : BYTE;
		E : BOOL;
		PIN : STRING[8];
	END_VAR
	VAR_OUTPUT
		TP : BOOL;
	END_VAR
	VAR
		POS : INT := 1;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION POLYNOM_INT : REAL (* Functions *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=102 *)
	VAR_INPUT
		X : REAL;
		XY : ARRAY[1..5,0..1] OF REAL;
		PTS : INT;
	END_VAR
	VAR
		I : INT;
		J : INT;
		stop : INT;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK PRESSURE (* Conversion *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=371 *)
	VAR_INPUT
		MWS : REAL;
		TORR : REAL;
		ATT : REAL;
		ATM : REAL;
		PA : REAL;
		BAR : REAL;
	END_VAR
	VAR_OUTPUT
		YMWS : REAL;
		YTORR : REAL;
		YATT : REAL;
		YATM : REAL;
		YPA : REAL;
		YBAR : REAL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION PT_TO_F : REAL (* Conversion *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=372 *)
	VAR_INPUT
		PT : TIME;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK PWM_DC (* Signal generators *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=263 *)
	VAR_INPUT
		F : REAL;
		DC : REAL;
	END_VAR
	VAR_OUTPUT
		Q : BOOL;
	END_VAR
	VAR
		clk : CLK_PRG;
		pulse : TP_X;
		tmp : REAL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK PWM_PW (* Signal generators *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=264 *)
	VAR_INPUT
		F : REAL;
		PW : TIME;
	END_VAR
	VAR_OUTPUT
		Q : BOOL;
	END_VAR
	VAR
		clk : CLK_PRG;
		pulse : TP_X;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION R2_ABS : BOOL (* Double Precision *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=93 *)
	VAR_INPUT
		X : REAL2;
	END_VAR
	VAR_IN_OUT
		RETVAL : REAL2; (*Return value of the function*)
	END_VAR
END_FUNCTION

FUNCTION R2_ADD : BOOL (* Double Precision *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=93 *)
	VAR_INPUT
		X : REAL2;
		Y : REAL;
	END_VAR
	VAR_IN_OUT
		RETVAL : REAL2; (*Return value of the function*)
	END_VAR
	VAR
		temp : REAL;
	END_VAR
END_FUNCTION

FUNCTION R2_ADD2 : BOOL (* Double Precision *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=94 *)
	VAR_INPUT
		X : REAL2;
		Y : REAL2;
	END_VAR
	VAR_IN_OUT
		RETVAL : REAL2; (*Return value of the function*)
	END_VAR
END_FUNCTION

FUNCTION R2_MUL : BOOL (* Double Precision *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=94 *)
	VAR_INPUT
		X : REAL2;
		Y : REAL;
	END_VAR
	VAR_IN_OUT
		RETVAL : REAL2; (*Return value of the function*)
	END_VAR
END_FUNCTION

FUNCTION R2_SET : BOOL (* Double Precision *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=95 *)
	VAR_INPUT
		X : REAL;
	END_VAR
	VAR_IN_OUT
		RETVAL : REAL2; (*Return value of the function*)
	END_VAR
END_FUNCTION

FUNCTION RAD : REAL (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=61 *)
	VAR_INPUT
		DEG : REAL;
	END_VAR
END_FUNCTION

FUNCTION RANGE_TO_BYTE : BYTE (* Signal processing *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=288 *)
	VAR_INPUT
		X : REAL;
		LOW : REAL;
		HIGH : REAL;
	END_VAR
END_FUNCTION

FUNCTION RANGE_TO_WORD : WORD (* Signal processing *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=288 *)
	VAR_INPUT
		X : REAL;
		LOW : REAL;
		HIGH : REAL;
	END_VAR
END_FUNCTION

FUNCTION RDM : REAL (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=62 *)
	VAR_INPUT
		LAST : REAL;
	END_VAR
	VAR
		tn : UDINT;
		tc : INT;
	END_VAR
END_FUNCTION

FUNCTION RDM2 : INT (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=62 *)
	VAR_INPUT
		LAST : INT;
		LOW : INT;
		HIGH : INT;
	END_VAR
END_FUNCTION

FUNCTION RDMDW : DWORD (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=63 *)
	VAR_INPUT
		LAST : DWORD;
	END_VAR
	VAR
		RX : REAL;
		M : REAL;
	END_VAR
END_FUNCTION

FUNCTION REAL_TO_DW : DWORD (* Gate logic *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=231 *)
	VAR_INPUT
		X : REAL;
	END_VAR
	VAR
		pt : REFERENCE TO DWORD;
	END_VAR
END_FUNCTION

FUNCTION REAL_TO_FRAC : BOOL (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=64 *)
	VAR_INPUT
		X : REAL; (* in einen Bruch umzuwandelnder Wert *)
		N : INT; (* maximale Größe des Nenners *)
	END_VAR
	VAR_IN_OUT
		RETVAL : FRACTION; (*Return value of the function*)
	END_VAR
	VAR
		temp : DINT; (* Merker für Berechnungen *)
		sign : BOOL; (* Vorzeichen vom Eingangswert *)
		X_gerundet : DINT; (* Wert von Bruch, auf ganze Zahl gerundet *)
		X_ohne_Nachkomma : REAL; (* Wert von Bruch, ohne Nachkommastellen *)
		Numerator : DINT := 1; (* Initialwert Zaehler  *)
		Denominator : DINT := 0; (* Initialwert Nenner *)
		Numerator_old : DINT := 0; (* Initialwert Zaehler der letzten Berechnung  *)
		Denominator_old : DINT := 1; (* Initialwert Zaehler der letzten Berechnung   *)
	END_VAR
END_FUNCTION

FUNCTION REAL_TO_STRF : BOOL (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=176 *)
	VAR_INPUT
		IN : REAL;
		N : INT;
		D : STRING[1];
	END_VAR
	VAR_IN_OUT
		RETVAL : STRING[20]; (*Return value of the function*)
	END_VAR
	VAR
		O : REAL;
		i : INT;
	END_VAR
END_FUNCTION

FUNCTION REFLECT : DWORD (* Gate logic *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=232 *)
	VAR_INPUT
		D : DWORD;
		L : INT;
	END_VAR
	VAR
		i : INT;
	END_VAR
END_FUNCTION

FUNCTION REFRACTION : REAL (* Time and date *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=132 *)
	VAR_INPUT
		ELEV : REAL;
	END_VAR
END_FUNCTION

FUNCTION REPLACE_ALL : BOOL (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=177 *)
	VAR_INPUT
		STR : STRING[STRING_LENGTH];
		SRC : STRING[STRING_LENGTH];
		REP : STRING[STRING_LENGTH];
	END_VAR
	VAR_IN_OUT
		RETVAL : STRING[STRING_LENGTH]; (*Return value of the function*)
	END_VAR
	VAR
		pos : INT;
		lp : INT;
		lx : INT;
	END_VAR
END_FUNCTION

FUNCTION REPLACE_CHARS : BOOL (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=177 *)
	VAR_INPUT
		STR : STRING[STRING_LENGTH];
		SRC : STRING[255];
		REP : STRING[255];
	END_VAR
	VAR_IN_OUT
		RETVAL : STRING[STRING_LENGTH]; (*Return value of the function*)
	END_VAR
	VAR
		a : INT;
		b : INT;
		c : STRING[1];
		stp : INT;
	END_VAR
END_FUNCTION

FUNCTION REPLACE_UML : BOOL (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=178 *)
	VAR_INPUT
		STR : STRING[STRING_LENGTH];
	END_VAR
	VAR_IN_OUT
		RETVAL : STRING[STRING_LENGTH]; (*Return value of the function*)
	END_VAR
	VAR
		L : INT;
		pt : REFERENCE TO BYTE;
		pto : REFERENCE TO BYTE;
		ptm : REFERENCE TO BYTE;
		pt1 : REFERENCE TO BYTE;
		pt2 : REFERENCE TO BYTE;
		su : STRING[2];
		pos : INT;
	END_VAR
END_FUNCTION

FUNCTION RES_NI : REAL (* Sensor *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=318 *)
	VAR_INPUT
		T : REAL;
		R0 : REAL;
	END_VAR
	VAR CONSTANT
		A : REAL := 0.5485;
		B : REAL := 0.000665;
		C : REAL := 2.805E-09;
	END_VAR
	VAR
		T2 : REAL;
	END_VAR
END_FUNCTION

FUNCTION RES_NTC : REAL (* Sensor *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=319 *)
	VAR_INPUT
		T : REAL;
		RN : REAL;
		B : REAL;
	END_VAR
END_FUNCTION

FUNCTION RES_PT : REAL (* Sensor *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=322 *)
	VAR_INPUT
		T : REAL;
		R0 : REAL;
	END_VAR
	VAR CONSTANT
		A : REAL := 0.00390802;
		B : REAL := -5.802E-07;
		C : REAL := -4.2735E-12;
	END_VAR
	VAR
		T2 : REAL;
	END_VAR
END_FUNCTION

FUNCTION RES_SI : REAL (* Sensor *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=323 *)
	VAR_INPUT
		T : REAL;
		RS : REAL;
		TS : REAL;
	END_VAR
	VAR CONSTANT
		A : REAL := 0.00764;
		B : REAL := 1.66E-05;
	END_VAR
	VAR
		TX : REAL;
	END_VAR
END_FUNCTION

FUNCTION REVERSE : BYTE (* Gate logic *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=232 *)
	VAR_INPUT
		IN : BYTE;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK RMP_B (* Signal generators *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=264 *)
	VAR_INPUT
		SET : BOOL;
		PT : TIME;
		E : BOOL := TRUE;
		UP : BOOL := TRUE;
		RST : BOOL;
	END_VAR
	VAR_OUTPUT
		OUT : BYTE;
		BUSY : BOOL;
		HIGH : BOOL;
		LOW : BOOL;
	END_VAR
	VAR
		rmp : _RMP_B;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK RMP_SOFT (* Signal generators *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=266 *)
	VAR_INPUT
		IN : BOOL;
		VAL : BYTE;
		PT_ON : TIME;
		PT_OFF : TIME;
	END_VAR
	VAR_OUTPUT
		OUT : BYTE;
	END_VAR
	VAR
		rmp : _RMP_B;
		tmp : BYTE;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK RMP_W (* Signal generators *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=267 *)
	VAR_INPUT
		SET : BOOL;
		PT : TIME;
		E : BOOL := TRUE;
		UP : BOOL := TRUE;
		RST : BOOL;
	END_VAR
	VAR_OUTPUT
		OUT : WORD;
		BUSY : BOOL;
		HIGH : BOOL;
		LOW : BOOL;
	END_VAR
	VAR
		rmp : _RMP_W;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION RND : REAL (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=64 *)
	VAR_INPUT
		X : REAL;
		N : INT;
	END_VAR
	VAR
		M : REAL;
	END_VAR
END_FUNCTION

FUNCTION ROUND : REAL (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=65 *)
	VAR_INPUT
		IN : REAL;
		N : INT;
	END_VAR
	VAR
		X : REAL;
	END_VAR
	VAR CONSTANT
		cDECADES : ARRAY[0..8] OF REAL := [1,10,100,1000,10000,100000,1000000,10000000,100000000];
	END_VAR
END_FUNCTION

FUNCTION_BLOCK RTC_2 (* Time and date *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=133 *)
	VAR_INPUT
		SET : BOOL;
		SDT : DATE_AND_TIME;
		SMS : INT;
		DEN : BOOL;
		OFS : INT;
	END_VAR
	VAR_OUTPUT
		UDT : DATE_AND_TIME;
		LOCAL_DT : DATE_AND_TIME;
		DSO : BOOL;
		XMS : INT;
	END_VAR
	VAR
		RT : RTC_MS;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK RTC_MS (* Time and date *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=134 *)
	VAR_INPUT
		SET : BOOL;
		SDT : DATE_AND_TIME;
		SMS : INT;
	END_VAR
	VAR_OUTPUT
		XDT : DATE_AND_TIME;
		XMS : INT;
	END_VAR
	VAR
		init : BOOL;
		last : UDINT;
		Tx : UDINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION SCALE : REAL (* Signal processing *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=288 *)
	VAR_INPUT
		X : REAL;
		K : REAL;
		O : REAL;
		MX : REAL;
		MN : REAL;
	END_VAR
END_FUNCTION

FUNCTION SCALE_B : REAL (* Signal processing *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=289 *)
	VAR_INPUT
		X : BYTE;
		I_LO : BYTE;
		I_HI : BYTE;
		O_LO : REAL;
		O_HI : REAL;
	END_VAR
	VAR
		_I_HI : USINT;
		_I_LO : USINT;
	END_VAR
END_FUNCTION

FUNCTION SCALE_B2 : REAL (* Signal processing *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=290 *)
	VAR_INPUT
		IN1 : BYTE;
		IN2 : BYTE;
		K : REAL;
		O : REAL;
		IN1_MIN : REAL;
		IN1_MAX : REAL := 1000;
		IN2_MIN : REAL;
		IN2_MAX : REAL := 1000;
	END_VAR
END_FUNCTION

FUNCTION SCALE_B4 : REAL (* Signal processing *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=291 *)
	VAR_INPUT
		IN1 : BYTE;
		IN2 : BYTE;
		IN3 : BYTE;
		IN4 : BYTE;
		K : REAL;
		O : REAL;
		IN1_MIN : REAL;
		IN1_MAX : REAL := 1000;
		IN2_MIN : REAL;
		IN2_MAX : REAL := 1000;
		IN3_MIN : REAL;
		IN3_MAX : REAL := 1000;
		IN4_MIN : REAL;
		IN4_MAX : REAL := 1000;
	END_VAR
END_FUNCTION

FUNCTION SCALE_B8 : REAL (* Signal processing *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=292 *)
	VAR_INPUT
		IN1 : BYTE;
		IN2 : BYTE;
		IN3 : BYTE;
		IN4 : BYTE;
		IN5 : BYTE;
		IN6 : BYTE;
		IN7 : BYTE;
		IN8 : BYTE;
		K : REAL;
		O : REAL;
		IN1_MIN : REAL;
		IN1_MAX : REAL := 1000;
		IN2_MIN : REAL;
		IN2_MAX : REAL := 1000;
		IN3_MIN : REAL;
		IN3_MAX : REAL := 1000;
		IN4_MIN : REAL;
		IN4_MAX : REAL := 1000;
		IN5_MIN : REAL;
		IN5_MAX : REAL := 1000;
		IN6_MIN : REAL;
		IN6_MAX : REAL := 1000;
		IN7_MIN : REAL;
		IN7_MAX : REAL := 1000;
		IN8_MIN : REAL;
		IN8_MAX : REAL := 1000;
	END_VAR
END_FUNCTION

FUNCTION SCALE_D : REAL (* Signal processing *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=293 *)
	VAR_INPUT
		X : DWORD;
		I_LO : DWORD;
		I_HI : DWORD;
		O_LO : REAL;
		O_HI : REAL;
	END_VAR
	VAR
		_I_HI : UDINT;
		_I_LO : UDINT;
	END_VAR
END_FUNCTION

FUNCTION SCALE_R : REAL (* Signal processing *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=294 *)
	VAR_INPUT
		X : REAL;
		I_LO : REAL;
		I_HI : REAL;
		O_LO : REAL;
		O_HI : REAL;
	END_VAR
END_FUNCTION

FUNCTION SCALE_X2 : REAL (* Signal processing *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=295 *)
	VAR_INPUT
		IN1 : BOOL;
		IN2 : BOOL;
		K : REAL;
		O : REAL;
		IN1_MIN : REAL;
		IN1_MAX : REAL := 1000;
		IN2_MIN : REAL;
		IN2_MAX : REAL := 1000;
	END_VAR
END_FUNCTION

FUNCTION SCALE_X4 : REAL (* Signal processing *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=296 *)
	VAR_INPUT
		IN1 : BOOL;
		IN2 : BOOL;
		IN3 : BOOL;
		IN4 : BOOL;
		K : REAL;
		O : REAL;
		IN1_MIN : REAL;
		IN1_MAX : REAL := 1000;
		IN2_MIN : REAL;
		IN2_MAX : REAL := 1000;
		IN3_MIN : REAL;
		IN3_MAX : REAL := 1000;
		IN4_MIN : REAL;
		IN4_MAX : REAL := 1000;
	END_VAR
END_FUNCTION

FUNCTION SCALE_X8 : REAL (* Signal processing *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=297 *)
	VAR_INPUT
		IN1 : BOOL;
		IN2 : BOOL;
		IN3 : BOOL;
		IN4 : BOOL;
		IN5 : BOOL;
		IN6 : BOOL;
		IN7 : BOOL;
		IN8 : BOOL;
		K : REAL;
		O : REAL;
		IN1_MIN : REAL;
		IN1_MAX : REAL := 1000;
		IN2_MIN : REAL;
		IN2_MAX : REAL := 1000;
		IN3_MIN : REAL;
		IN3_MAX : REAL := 1000;
		IN4_MIN : REAL;
		IN4_MAX : REAL := 1000;
		IN5_MIN : REAL;
		IN5_MAX : REAL := 1000;
		IN6_MIN : REAL;
		IN6_MAX : REAL := 1000;
		IN7_MIN : REAL;
		IN7_MAX : REAL := 1000;
		IN8_MIN : REAL;
		IN8_MAX : REAL := 1000;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK SCHEDULER (* Generators *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=198 *)
	VAR_INPUT
		E0 : BOOL;
		E1 : BOOL;
		E2 : BOOL;
		E3 : BOOL;
		T0 : TIME;
		T1 : TIME;
		T2 : TIME;
		T3 : TIME;
	END_VAR
	VAR_OUTPUT
		Q0 : BOOL;
		Q1 : BOOL;
		Q2 : BOOL;
		Q3 : BOOL;
	END_VAR
	VAR
		init : BOOL;
		s0 : TIME;
		s1 : TIME;
		s2 : TIME;
		s3 : TIME;
		tx : TIME;
		c : INT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK SCHEDULER_2 (* Generators *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=198 *)
	VAR_INPUT
		E0 : BOOL;
		E1 : BOOL;
		E2 : BOOL;
		E3 : BOOL;
		C0 : UINT;
		C1 : UINT;
		C2 : UINT;
		C3 : UINT;
		O0 : UINT;
		O1 : UINT;
		O2 : UINT;
		O3 : UINT;
	END_VAR
	VAR_OUTPUT
		Q0 : BOOL;
		Q1 : BOOL;
		Q2 : BOOL;
		Q3 : BOOL;
	END_VAR
	VAR
		sx : UINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION SDT_TO_DATE : DATE (* Time and date *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=134 *)
	VAR_INPUT
		DTI : SDT;
	END_VAR
END_FUNCTION

FUNCTION SDT_TO_DT : DATE_AND_TIME (* Time and date *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=135 *)
	VAR_INPUT
		DTI : SDT;
	END_VAR
END_FUNCTION

FUNCTION SDT_TO_TOD : TIME_OF_DAY (* Time and date *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=135 *)
	VAR_INPUT
		DTI : SDT;
	END_VAR
END_FUNCTION

FUNCTION SECOND : REAL (* Time and date *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=135 *)
	VAR_INPUT
		ITOD : TIME_OF_DAY;
	END_VAR
END_FUNCTION

FUNCTION SECOND_OF_DT : INT (* Time and date *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=136 *)
	VAR_INPUT
		XDT : DATE_AND_TIME;
	END_VAR
END_FUNCTION

FUNCTION SECOND_TO_TIME : TIME (* Time and date *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=136 *)
	VAR_INPUT
		IN : REAL;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK SEL2_OF_3 (* Signal processing *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=298 *)
	VAR_INPUT
		IN1 : REAL;
		IN2 : REAL;
		IN3 : REAL;
		D : REAL;
	END_VAR
	VAR_OUTPUT
		Y : REAL;
		W : INT;
		E : BOOL;
	END_VAR
	VAR
		D12 : BOOL;
		D23 : BOOL;
		D31 : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK SEL2_OF_3B (* Signal processing *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=299 *)
	VAR_INPUT
		IN1 : BOOL;
		IN2 : BOOL;
		IN3 : BOOL;
		TD : TIME;
	END_VAR
	VAR_OUTPUT
		Q : BOOL;
		W : BOOL;
	END_VAR
	VAR
		TDEL : TON;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK SELECT_8 (* FF Edge triggered *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=247 *)
	VAR_INPUT
		E : BOOL;
		SET : BOOL;
		IN : BYTE;
		UP : BOOL;
		DN : BOOL;
		RST : BOOL;
	END_VAR
	VAR_OUTPUT
		Q0 : BOOL;
		Q1 : BOOL;
		Q2 : BOOL;
		Q3 : BOOL;
		Q4 : BOOL;
		Q5 : BOOL;
		Q6 : BOOL;
		Q7 : BOOL;
		STATE : INT;
	END_VAR
	VAR
		last_up : BOOL;
		last_dn : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION SENSOR_INT : REAL (* Sensor *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=324 *)
	VAR_INPUT
		VOLTAGE : REAL;
		CURRENT : REAL;
		RP : REAL;
		RS : REAL;
	END_VAR
	VAR
		RG : REAL;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK SEQUENCE_4 (* Generators *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=199 *)
	VAR_INPUT
		IN0 : BOOL := TRUE;
		IN1 : BOOL := TRUE;
		IN2 : BOOL := TRUE;
		IN3 : BOOL := TRUE;
		START : BOOL;
		RST : BOOL;
		WAIT0 : TIME;
		DELAY0 : TIME;
		WAIT1 : TIME;
		DELAY1 : TIME;
		WAIT2 : TIME;
		DELAY2 : TIME;
		WAIT3 : TIME;
		DELAY3 : TIME;
		STOP_ON_ERROR : BOOL;
	END_VAR
	VAR_OUTPUT
		Q0 : BOOL;
		Q1 : BOOL;
		Q2 : BOOL;
		Q3 : BOOL;
		QX : BOOL;
		RUN : BOOL;
		STEP : INT := -1;
		STATUS : BYTE;
	END_VAR
	VAR
		last : TIME;
		edge_ : BOOL;
		tx : TIME;
		init : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK SEQUENCE_8 (* Generators *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=203 *)
	VAR_INPUT
		IN0 : BOOL := TRUE;
		IN1 : BOOL := TRUE;
		IN2 : BOOL := TRUE;
		IN3 : BOOL := TRUE;
		IN4 : BOOL := TRUE;
		IN5 : BOOL := TRUE;
		IN6 : BOOL := TRUE;
		IN7 : BOOL := TRUE;
		START : BOOL;
		RST : BOOL;
		WAIT0 : TIME;
		DELAY0 : TIME;
		WAIT1 : TIME;
		DELAY1 : TIME;
		WAIT2 : TIME;
		DELAY2 : TIME;
		WAIT3 : TIME;
		DELAY3 : TIME;
		WAIT4 : TIME;
		DELAY4 : TIME;
		WAIT5 : TIME;
		DELAY5 : TIME;
		WAIT6 : TIME;
		DELAY6 : TIME;
		WAIT7 : TIME;
		DELAY7 : TIME;
		STOP_ON_ERROR : BOOL;
	END_VAR
	VAR_OUTPUT
		Q0 : BOOL;
		Q1 : BOOL;
		Q2 : BOOL;
		Q3 : BOOL;
		Q4 : BOOL;
		Q5 : BOOL;
		Q6 : BOOL;
		Q7 : BOOL;
		QX : BOOL;
		RUN : BOOL;
		STEP : INT := -1;
		STATUS : BYTE;
	END_VAR
	VAR
		last : TIME;
		edge_ : BOOL;
		tx : TIME;
		init : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK SEQUENCE_64 (* Generators *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=202 *)
	VAR_INPUT
		START : BOOL;
		SMAX : INT;
		PROG : ARRAY[0..63] OF TIME;
		RST : BOOL;
	END_VAR
	VAR_OUTPUT
		STATE : INT := -1;
		TRIG : BOOL;
	END_VAR
	VAR
		tx : TIME;
		edge_ : BOOL;
		last : TIME;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION SET_DATE : DATE (* Time and date *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=136 *)
	VAR_INPUT
		YEAR : INT;
		MONTH : INT;
		DAY : INT;
	END_VAR
	VAR
		ofs : ARRAY[1..12] OF INT := [0,31,59,90,120,151,181,212,243,273,304,334];
	END_VAR
END_FUNCTION

FUNCTION SET_DT : DATE_AND_TIME (* Time and date *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=137 *)
	VAR_INPUT
		YEAR : INT;
		MONTH : INT;
		DAY : INT;
		HOUR : INT;
		MINUTE : INT;
		SECOND : INT;
	END_VAR
END_FUNCTION

FUNCTION SET_TOD : TIME_OF_DAY (* Time and date *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=138 *)
	VAR_INPUT
		HOUR : INT;
		MINUTE : INT;
		SECOND : REAL;
	END_VAR
END_FUNCTION

FUNCTION SGN : INT (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=65 *)
	VAR_INPUT
		X : REAL;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK SH (* Signal processing *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=299 *)
	VAR_INPUT
		IN : REAL;
		CLK : BOOL;
	END_VAR
	VAR_OUTPUT
		OUT : REAL;
		TRIG : BOOL;
	END_VAR
	VAR
		edge_ : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION SHL1 : DWORD (* Gate logic *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=233 *)
	VAR_INPUT
		IN : DWORD;
		N : INT;
	END_VAR
	VAR CONSTANT
		temp : DWORD := 16#FFFFFFFF;
	END_VAR
END_FUNCTION

FUNCTION SHR1 : DWORD (* Gate logic *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=233 *)
	VAR_INPUT
		IN : DWORD;
		N : INT;
	END_VAR
	VAR CONSTANT
		temp : DWORD := 16#FFFFFFFF;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK SHR_4E (* FF Edge triggered *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=249 *)
	VAR_INPUT
		SET : BOOL;
		D0 : BOOL;
		CLK : BOOL;
		RST : BOOL;
	END_VAR
	VAR_OUTPUT
		Q0 : BOOL;
		Q1 : BOOL;
		Q2 : BOOL;
		Q3 : BOOL;
	END_VAR
	VAR
		trig : R_TRIG;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK SHR_4UDE (* FF Edge triggered *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=250 *)
	VAR_INPUT
		SET : BOOL;
		D0 : BOOL;
		D3 : BOOL;
		CLK : BOOL;
		DN : BOOL;
		RST : BOOL;
	END_VAR
	VAR_OUTPUT
		Q0 : BOOL;
		Q1 : BOOL;
		Q2 : BOOL;
		Q3 : BOOL;
	END_VAR
	VAR
		trig : R_TRIG;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK SHR_8PLE (* FF Edge triggered *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=251 *)
	VAR_INPUT
		DIN : BOOL;
		DLOAD : BYTE;
		CLK : BOOL;
		UP : BOOL := 1;
		LOAD : BOOL;
		RST : BOOL;
	END_VAR
	VAR_OUTPUT
		DOUT : BOOL;
	END_VAR
	VAR
		edge_ : BOOL := 1;
		register : BYTE;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK SHR_8UDE (* FF Edge triggered *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=252 *)
	VAR_INPUT
		SET : BOOL;
		D0 : BOOL;
		D7 : BOOL;
		CLK : BOOL;
		DN : BOOL;
		RST : BOOL;
	END_VAR
	VAR_OUTPUT
		Q0 : BOOL;
		Q1 : BOOL;
		Q2 : BOOL;
		Q3 : BOOL;
		Q4 : BOOL;
		Q5 : BOOL;
		Q6 : BOOL;
		Q7 : BOOL;
	END_VAR
	VAR
		trig : R_TRIG;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK SH_1 (* Signal processing *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=300 *)
	VAR_INPUT
		IN : REAL;
		PT : TIME;
	END_VAR
	VAR_OUTPUT
		OUT : REAL;
		TRIG : BOOL;
	END_VAR
	VAR
		last : TIME;
		tx : TIME;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK SH_2 (* Signal processing *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=301 *)
	VAR_INPUT
		IN : REAL;
		PT : TIME;
		N : INT := 16;
		DISC : INT;
	END_VAR
	VAR_OUTPUT
		OUT : REAL;
		TRIG : BOOL;
		AVG : REAL;
		HIGH : REAL;
		LOW : REAL;
	END_VAR
	VAR
		M : INT;
		buf : ARRAY[0..15] OF REAL;
		buf2 : ARRAY[0..15] OF REAL;
		last : TIME;
		i : INT;
		start : INT;
		temp : REAL;
		stop : INT;
		tx : TIME;
		d2 : INT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK SH_T (* Signal processing *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=303 *)
	VAR_INPUT
		IN : REAL;
		E : BOOL;
	END_VAR
	VAR_OUTPUT
		OUT : REAL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION SIGMOID : REAL (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=66 *)
	VAR_INPUT
		X : REAL;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK SIGNAL (* Automation *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=468 *)
	VAR_INPUT
		IN : BOOL;
		SIG : BYTE;
		TS : TIME;
	END_VAR
	VAR_OUTPUT
		Q : BOOL;
	END_VAR
	VAR
		tx : UDINT;
		step : BYTE;
	END_VAR
	VAR CONSTANT
		one : BYTE := 1;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK SIGNAL_4 (* Automation *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=469 *)
	VAR_INPUT
		IN1 : BOOL;
		IN2 : BOOL;
		IN3 : BOOL;
		IN4 : BOOL;
		TS : TIME;
		S1 : BYTE := 2#11111111;
		S2 : BYTE := 2#11110000;
		S3 : BYTE := 2#10101010;
		S4 : BYTE := 2#10100000;
	END_VAR
	VAR_OUTPUT
		Q : BOOL;
	END_VAR
	VAR
		sig : SIGNAL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION SIGN_I : BOOL (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=66 *)
	VAR_INPUT
		IN : DINT;
	END_VAR
END_FUNCTION

FUNCTION SIGN_R : BOOL (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=67 *)
	VAR_INPUT
		IN : REAL;
	END_VAR
END_FUNCTION

FUNCTION SINC : REAL (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=67 *)
	VAR_INPUT
		X : REAL;
	END_VAR
END_FUNCTION

FUNCTION SINH : REAL (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=67 *)
	VAR_INPUT
		X : REAL;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK SPEED (* Conversion *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=372 *)
	VAR_INPUT
		MS : REAL;
		KMH : REAL;
		KN : REAL;
		MH : REAL;
	END_VAR
	VAR_OUTPUT
		YMS : REAL;
		YKMH : REAL;
		YKN : REAL;
		YMH : REAL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION SPHERE_V : REAL (* Geometry *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=106 *)
	VAR_INPUT
		RX : REAL;
	END_VAR
END_FUNCTION

FUNCTION SQRTN : REAL (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=68 *)
	VAR_INPUT
		X : REAL;
		N : INT;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK SRAMP (* Automation *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=470 *)
	VAR_INPUT
		X : REAL;
		A_UP : REAL;
		A_DN : REAL;
		VU_MAX : REAL;
		VD_MAX : REAL;
		LIMIT_HIGH : REAL;
		LIMIT_LOW : REAL;
		RST : BOOL;
	END_VAR
	VAR_OUTPUT
		Y : REAL;
		V : REAL;
	END_VAR
	VAR
		cycle_time : TC_S;
		init : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK STACK_16 (* Memory *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=185 *)
	VAR_INPUT
		DIN : DWORD;
		E : BOOL := TRUE;
		RD : BOOL;
		WD : BOOL;
		RST : BOOL;
	END_VAR
	VAR_OUTPUT
		DOUT : DWORD;
		EMPTY : BOOL := TRUE;
		FULL : BOOL;
	END_VAR
	VAR
		stack : ARRAY[0..n] OF DWORD;
		pt : INT;
	END_VAR
	VAR CONSTANT
		n : INT := 15; (* changing this value will chage the number of stored elements in the fifo *)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK STACK_32 (* Memory *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=186 *)
	VAR_INPUT
		DIN : DWORD;
		E : BOOL := TRUE;
		RD : BOOL;
		WD : BOOL;
		RST : BOOL;
	END_VAR
	VAR_OUTPUT
		DOUT : DWORD;
		EMPTY : BOOL := TRUE;
		FULL : BOOL;
	END_VAR
	VAR
		stack : ARRAY[0..n] OF DWORD;
		pt : INT;
	END_VAR
	VAR CONSTANT
		n : INT := 31; (* changing this value will chage the number of stored elements in the fifo *)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION STAIR : REAL (* Signal processing *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=304 *)
	VAR_INPUT
		X : REAL;
		D : REAL;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK STAIR2 (* Signal processing *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=304 *)
	VAR_INPUT
		X : REAL;
		D : REAL;
	END_VAR
	VAR_OUTPUT
		Y : REAL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION STATUS_TO_ESR : BOOL (* Other *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=38 *)
	VAR_INPUT
		STATUS : BYTE;
		ADRESS : STRING[10];
		DT_IN : DATE_AND_TIME;
		TS : TIME;
	END_VAR
	VAR_IN_OUT
		RETVAL : ESR_DATA; (*Return value of the function*)
	END_VAR
END_FUNCTION

FUNCTION_BLOCK STORE_8 (* FF pulse triggered *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=253 *)
	VAR_INPUT
		SET : BOOL;
		D0 : BOOL;
		D1 : BOOL;
		D2 : BOOL;
		D3 : BOOL;
		D4 : BOOL;
		D5 : BOOL;
		D6 : BOOL;
		D7 : BOOL;
		CLR : BOOL;
		RST : BOOL;
	END_VAR
	VAR_OUTPUT
		Q0 : BOOL;
		Q1 : BOOL;
		Q2 : BOOL;
		Q3 : BOOL;
		Q4 : BOOL;
		Q5 : BOOL;
		Q6 : BOOL;
		Q7 : BOOL;
	END_VAR
	VAR
		edge_ : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION SUN_MIDDAY : TIME_OF_DAY (* Time and date *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=138 *)
	VAR_INPUT
		LON : REAL;
		UTC : DATE;
	END_VAR
	VAR
		T : REAL;
		OFFSET : REAL;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK SUN_POS (* Time and date *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=138 *)
	VAR_INPUT
		LATITUDE : REAL; (* latitude of geographical position  *)
		LONGITUDE : REAL; (* longitude of geographical position  *)
		UTC : DATE_AND_TIME; (*	world time				*)
	END_VAR
	VAR_OUTPUT
		B : REAL;
		H : REAL;
		HR : REAL;
	END_VAR
	VAR
		g : REAL;
		a : REAL;
		d : REAL;
		t1 : REAL;
		n : REAL;
		e : REAL;
		c : REAL;
		tau : REAL;
		sin_d : REAL;
		rlat : REAL;
		sin_lat : REAL;
		cos_lat : REAL;
		cos_tau : REAL;
		cos_d : REAL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK SUN_TIME (* Time and date *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=139 *)
	VAR_INPUT
		LATITUDE : REAL; (* latitude of geographical position  *)
		LONGITUDE : REAL; (* longitude of geographical position  *)
		UTC : DATE; (*	world time	*)
		H : REAL := -0.83333333333; (* heighth above horizon for sunrise *)
	END_VAR
	VAR_OUTPUT
		MIDDAY : TIME_OF_DAY; (*	astrological midday in hours when sun stands at south direction	*)
		SUN_RISE : TIME_OF_DAY; (*	sun rise for current day in local time *)
		SUN_SET : TIME_OF_DAY; (*	sun set for current day in local time *)
		SUN_DECLINATION : REAL; (*	sun declination above horizon at midday in degrees	*)
	END_VAR
	VAR
		dk : REAL; (* sun declination at midday *)
		delta : TIME; (* delta from midday for sunrise and sunset  *)
		b : REAL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION SWAP_BYTE : WORD (* Gate logic *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=234 *)
	VAR_INPUT
		IN : WORD;
	END_VAR
END_FUNCTION

FUNCTION SWAP_BYTE2 : DWORD (* Gate logic *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=234 *)
	VAR_INPUT
		IN : DWORD;
	END_VAR
END_FUNCTION

FUNCTION TANC : REAL (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=68 *)
	VAR_INPUT
		X : REAL;
	END_VAR
END_FUNCTION

FUNCTION TANH : REAL (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=69 *)
	VAR_INPUT
		X : REAL;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK TC_MS (* Measurements *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=352 *)
	VAR_OUTPUT
		TC : UDINT;
	END_VAR
	VAR
		init : BOOL;
		tx : UDINT;
		last : UDINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK TC_S (* Measurements *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=353 *)
	VAR_OUTPUT
		TC : REAL;
	END_VAR
	VAR
		init : BOOL;
		tx : UDINT;
		last : UDINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK TC_US (* Measurements *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=353 *)
	VAR_OUTPUT
		TC : UDINT;
	END_VAR
	VAR
		init : BOOL;
		tx : UDINT;
		last : UDINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK TEMPERATURE (* Conversion *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=374 *)
	VAR_INPUT
		K : REAL;
		C : REAL := -273.15;
		F : REAL := -459.67;
		RE : REAL := -218.52;
		RA : REAL;
	END_VAR
	VAR_OUTPUT
		YK : REAL;
		YC : REAL;
		YF : REAL;
		YRE : REAL;
		YRA : REAL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION TEMP_NI : REAL (* Sensor *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=325 *)
	VAR_INPUT
		RES : REAL;
		R0 : REAL;
	END_VAR
END_FUNCTION

FUNCTION TEMP_NTC : REAL (* Sensor *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=326 *)
	VAR_INPUT
		RES : REAL;
		RN : REAL;
		B : REAL;
	END_VAR
END_FUNCTION

FUNCTION TEMP_PT : REAL (* Sensor *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=326 *)
	VAR_INPUT
		RES : REAL;
		R0 : REAL;
	END_VAR
	VAR CONSTANT
		A : REAL := 0.0039083;
		B : REAL := -5.775E-07;
		accuracy : REAL := 0.01;
	END_VAR
	VAR
		step : REAL := 50;
		X : REAL;
		Y : REAL;
		t1 : REAL;
		pt : REFERENCE TO UDINT;
	END_VAR
END_FUNCTION

FUNCTION TEMP_SI : REAL (* Sensor *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=331 *)
	VAR_INPUT
		RES : REAL;
		RS : REAL;
		TS : REAL;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK TICKER (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=178 *)
	VAR_INPUT
		N : INT;
		PT : TIME;
	END_VAR
	VAR_OUTPUT
		DISPLAY : STRING[STRING_LENGTH];
	END_VAR
	VAR_IN_OUT
		TEXT : STRING[STRING_LENGTH];
	END_VAR
	VAR
		delay : TP;
		step : INT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION TIMECHECK : BOOL (* Time and date *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=141 *)
	VAR_INPUT
		TD : TIME_OF_DAY;
		START : TIME_OF_DAY;
		STOP : TIME_OF_DAY;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK TMAX (* Generators *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=204 *)
	VAR_INPUT
		IN : BOOL;
		PT : TIME;
	END_VAR
	VAR_OUTPUT
		Q : BOOL;
		Z : BOOL;
	END_VAR
	VAR
		tx : TIME;
		start : TIME;
		last_in : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK TMIN (* Generators *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=205 *)
	VAR_INPUT
		IN : BOOL;
		PT : TIME;
	END_VAR
	VAR_OUTPUT
		Q : BOOL;
	END_VAR
	VAR
		pm : TP;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK TOF_1 (* Generators *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=205 *)
	VAR_INPUT
		IN : BOOL;
		PT : TIME;
		RST : BOOL;
	END_VAR
	VAR_OUTPUT
		Q : BOOL;
	END_VAR
	VAR
		tx : TIME;
		start : TIME;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK TOGGLE (* FF Edge triggered *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=254 *)
	VAR_INPUT
		CLK : BOOL;
		RST : BOOL;
	END_VAR
	VAR_OUTPUT
		Q : BOOL;
	END_VAR
	VAR
		edge_ : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK TONOF (* Generators *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=206 *)
	VAR_INPUT
		IN : BOOL;
		T_ON : TIME;
		T_OFF : TIME;
	END_VAR
	VAR_OUTPUT
		Q : BOOL;
	END_VAR
	VAR
		X : TON;
		old : BOOL;
		mode : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION TO_LOWER : BYTE (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=179 *)
	VAR_INPUT
		IN : BYTE;
	END_VAR
	VAR
		byteAsInt : USINT;
	END_VAR
END_FUNCTION

FUNCTION TO_UML : BOOL (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=180 *)
	VAR_INPUT
		IN : BYTE;
	END_VAR
	VAR_IN_OUT
		RETVAL : STRING[2]; (*Return value of the function*)
	END_VAR
END_FUNCTION

FUNCTION TO_UPPER : BYTE (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=180 *)
	VAR_INPUT
		IN : BYTE;
	END_VAR
	VAR
		byteAsInt : USINT;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK TP_1 (* Generators *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=207 *)
	VAR_INPUT
		IN : BOOL;
		PT : TIME;
		RST : BOOL;
	END_VAR
	VAR_OUTPUT
		Q : BOOL;
	END_VAR
	VAR
		tx : TIME;
		start : TIME;
		ix : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK TP_1D (* Generators *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=208 *)
	VAR_INPUT
		IN : BOOL;
		PT1 : TIME;
		PTD : TIME;
		RST : BOOL;
	END_VAR
	VAR_OUTPUT
		Q : BOOL;
		W : BOOL;
	END_VAR
	VAR
		tx : TIME;
		start : TIME;
		ix : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK TP_X (* Generators *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=208 *)
	VAR_INPUT
		IN : BOOL;
		PT : TIME;
	END_VAR
	VAR_OUTPUT
		Q : BOOL;
		ET : TIME;
	END_VAR
	VAR
		edge_ : BOOL;
		start : TIME;
		tx : TIME;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK TREND (* Signal processing *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=305 *)
	VAR_INPUT
		X : REAL;
	END_VAR
	VAR_OUTPUT
		Q : BOOL;
		TU : BOOL;
		TD : BOOL;
		D : REAL;
	END_VAR
	VAR
		last_X : REAL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK TREND_DW (* Signal processing *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=315 *)
	VAR_INPUT
		X : DWORD;
	END_VAR
	VAR_OUTPUT
		Q : BOOL;
		TU : BOOL;
		TD : BOOL;
		D : DWORD;
	END_VAR
	VAR
		last_X : UDINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION TRIANGLE_A : REAL (* Geometry *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=107 *)
	VAR_INPUT
		S1 : REAL;
		A : REAL;
		S2 : REAL;
		S3 : REAL;
	END_VAR
END_FUNCTION

FUNCTION TRIM : BOOL (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=181 *)
	VAR_INPUT
		STR : STRING[STRING_LENGTH];
	END_VAR
	VAR_IN_OUT
		RETVAL : STRING[STRING_LENGTH]; (*Return value of the function*)
	END_VAR
	VAR
		pos : INT;
	END_VAR
END_FUNCTION

FUNCTION TRIM1 : BOOL (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=181 *)
	VAR_INPUT
		STR : STRING[STRING_LENGTH];
	END_VAR
	VAR_IN_OUT
		RETVAL : STRING[STRING_LENGTH]; (*Return value of the function*)
	END_VAR
	VAR
		pos : INT;
	END_VAR
END_FUNCTION

FUNCTION TRIME : BOOL (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=181 *)
	VAR_INPUT
		STR : STRING[STRING_LENGTH];
	END_VAR
	VAR_IN_OUT
		RETVAL : STRING[STRING_LENGTH]; (*Return value of the function*)
	END_VAR
END_FUNCTION

FUNCTION_BLOCK TUNE (* Automation *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=472 *)
	VAR_INPUT
		SET : BOOL;
		SU : BOOL;
		SD : BOOL;
		RST : BOOL;
		SS : REAL := 0.1;
		LIMIT_L : REAL;
		LIMIT_H : REAL := 100;
		RST_VAL : REAL;
		SET_VAL : REAL := 100;
		T1 : TIME := TIME#500ms;
		T2 : TIME := TIME#2s0ms;
		S1 : REAL := 2;
		S2 : REAL := 10;
	END_VAR
	VAR_OUTPUT
		Y : REAL;
	END_VAR
	VAR
		tx : UDINT;
		start : UDINT;
		start2 : UDINT;
		state : INT;
		in : BOOL;
		step : REAL;
		SPEED : REAL;
		Y_start : REAL;
		Y_start2 : REAL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK TUNE2 (* Automation *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=475 *)
	VAR_INPUT
		SET : BOOL;
		SU : BOOL;
		SD : BOOL;
		FU : BOOL;
		FD : BOOL;
		RST : BOOL;
		SS : REAL := 0.1;
		FS : REAL := 5;
		LIMIT_L : REAL;
		LIMIT_H : REAL := 100;
		RST_VAL : REAL;
		SET_VAL : REAL := 100;
		TR : TIME := TIME#500ms;
		S1 : REAL := 2;
		S2 : REAL := 10;
	END_VAR
	VAR_OUTPUT
		Y : REAL;
	END_VAR
	VAR
		tx : UDINT;
		start : UDINT;
		state : INT;
		in : BOOL;
		step : REAL;
		SPEED : REAL;
		Y_start : REAL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION T_PLC_MS : UDINT (* Measurements *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=348 *)
	VAR CONSTANT
		debug : BOOL := 0;
		N : INT := 0;
		offset : UDINT := 0;
	END_VAR
	VAR
		tx : TIME;
	END_VAR
END_FUNCTION

FUNCTION T_PLC_US : UDINT (* Measurements *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=351 *)
	VAR CONSTANT
		debug : BOOL := 0;
		N : INT := 0;
		offset : UDINT := 0;
	END_VAR
	VAR
		tx : TIME;
	END_VAR
END_FUNCTION

FUNCTION UPPERCASE : BOOL (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=182 *)
	VAR_INPUT
		STR : STRING[STRING_LENGTH];
	END_VAR
	VAR_IN_OUT
		RETVAL : STRING[STRING_LENGTH]; (*Return value of the function*)
	END_VAR
	VAR
		pt : REFERENCE TO BYTE;
		pos : INT;
		l : INT;
	END_VAR
END_FUNCTION

FUNCTION UTC_TO_LTIME : DATE_AND_TIME (* Time and date *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=142 *)
	VAR_INPUT
		UTC : DATE_AND_TIME;
		DST_ENABLE : BOOL;
		TIME_ZONE_OFFSET : INT;
	END_VAR
	VAR
		tmp : INT;
	END_VAR
END_FUNCTION

FUNCTION V3_ABS : REAL (* Vector math *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=108 *)
	VAR_INPUT
		A : VECTOR_3;
	END_VAR
END_FUNCTION

FUNCTION V3_ADD : BOOL (* Vector math *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=108 *)
	VAR_INPUT
		A : VECTOR_3;
		B : VECTOR_3;
	END_VAR
	VAR_IN_OUT
		RETVAL : VECTOR_3; (*Return value of the function*)
	END_VAR
END_FUNCTION

FUNCTION V3_ANG : REAL (* Vector math *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=109 *)
	VAR_INPUT
		A : VECTOR_3;
		B : VECTOR_3;
	END_VAR
	VAR
		d : REAL;
	END_VAR
END_FUNCTION

FUNCTION V3_DPRO : REAL (* Vector math *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=109 *)
	VAR_INPUT
		A : VECTOR_3;
		B : VECTOR_3;
	END_VAR
END_FUNCTION

FUNCTION V3_NORM : BOOL (* Vector math *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=110 *)
	VAR_INPUT
		A : VECTOR_3;
	END_VAR
	VAR_IN_OUT
		RETVAL : VECTOR_3; (*Return value of the function*)
	END_VAR
	VAR
		la : REAL;
	END_VAR
END_FUNCTION

FUNCTION V3_NUL : BOOL (* Vector math *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=110 *)
	VAR_INPUT
		A : VECTOR_3;
	END_VAR
END_FUNCTION

FUNCTION V3_PAR : BOOL (* Vector math *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=110 *)
	VAR_INPUT
		A : VECTOR_3;
		B : VECTOR_3;
	END_VAR
	VAR
		temp : VECTOR_3;
	END_VAR
END_FUNCTION

FUNCTION V3_REV : BOOL (* Vector math *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=111 *)
	VAR_INPUT
		A : VECTOR_3;
	END_VAR
	VAR_IN_OUT
		RETVAL : VECTOR_3; (*Return value of the function*)
	END_VAR
END_FUNCTION

FUNCTION V3_SMUL : BOOL (* Vector math *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=111 *)
	VAR_INPUT
		A : VECTOR_3;
		M : REAL;
	END_VAR
	VAR_IN_OUT
		RETVAL : VECTOR_3; (*Return value of the function*)
	END_VAR
END_FUNCTION

FUNCTION V3_SUB : BOOL (* Vector math *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=112 *)
	VAR_INPUT
		A : VECTOR_3;
		B : VECTOR_3;
	END_VAR
	VAR_IN_OUT
		RETVAL : VECTOR_3; (*Return value of the function*)
	END_VAR
END_FUNCTION

FUNCTION V3_XANG : REAL (* Vector math *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=112 *)
	VAR_INPUT
		A : VECTOR_3;
	END_VAR
	VAR
		la : REAL;
	END_VAR
END_FUNCTION

FUNCTION V3_XPRO : BOOL (* Vector math *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=112 *)
	VAR_INPUT
		A : VECTOR_3;
		B : VECTOR_3;
	END_VAR
	VAR_IN_OUT
		RETVAL : VECTOR_3; (*Return value of the function*)
	END_VAR
END_FUNCTION

FUNCTION V3_YANG : REAL (* Vector math *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=113 *)
	VAR_INPUT
		A : VECTOR_3;
	END_VAR
	VAR
		la : REAL;
	END_VAR
END_FUNCTION

FUNCTION V3_ZANG : REAL (* Vector math *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=113 *)
	VAR_INPUT
		A : VECTOR_3;
	END_VAR
	VAR
		la : REAL;
	END_VAR
END_FUNCTION

FUNCTION WEEKDAY_TO_STRING : BOOL (* String *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=182 *)
	VAR_INPUT
		WDAY : INT;
		LANG : INT;
		LX : INT;
	END_VAR
	VAR_IN_OUT
		RETVAL : STRING[10]; (*Return value of the function*)
	END_VAR
	VAR
		ly : INT;
	END_VAR
	VAR CONSTANT
		cWEEKDAYS : ARRAY[1..3,1..7] OF STRING[10] := ['Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday','Montag','Dienstag','Mittwoch','Donnerstag','Freitag','Samstag','Sonntag','Lundi','Mardi','Mercredi','Jeudi','Vendredi','Samedi','Dimanche'];
		cWEEKDAYS2 : ARRAY[1..3,1..7] OF STRING[2] := ['Mo','Tu','We','Th','Fr','Sa','Su','Mo','Di','Mi','Do','Fr','Sa','So','Lu','Ma','Me','Je','Ve','Sa','Di'];
	END_VAR
END_FUNCTION

FUNCTION WINDOW : BOOL (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=69 *)
	VAR_INPUT
		LOW : REAL;
		IN : REAL;
		HIGH : REAL;
	END_VAR
END_FUNCTION

FUNCTION WINDOW2 : BOOL (* Mathematical *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=69 *)
	VAR_INPUT
		LOW : REAL;
		IN : REAL;
		HIGH : REAL;
	END_VAR
END_FUNCTION

FUNCTION WORD_OF_BYTE : WORD (* Gate logic *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=234 *)
	VAR_INPUT
		B1 : BYTE;
		B0 : BYTE;
	END_VAR
END_FUNCTION

FUNCTION WORD_OF_DWORD : WORD (* Gate logic *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=235 *)
	VAR_INPUT
		IN : DWORD;
		N : BYTE;
	END_VAR
END_FUNCTION

FUNCTION WORD_TO_RANGE : REAL (* Signal processing *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=316 *)
	VAR_INPUT
		X : WORD;
		LOW : REAL;
		HIGH : REAL;
	END_VAR
END_FUNCTION

FUNCTION WORK_WEEK : INT (* Time and date *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=142 *)
	VAR_INPUT
		IDATE : DATE;
	END_VAR
	VAR
		d1 : DATE;
		w1 : INT;
		ds : UDINT;
		yr : INT;
		w31 : INT;
		w01 : INT;
		wm : INT;
	END_VAR
END_FUNCTION

FUNCTION YEAR_BEGIN : DATE (* Time and date *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=143 *)
	VAR_INPUT
		Y : INT;
	END_VAR
END_FUNCTION

FUNCTION YEAR_END : DATE (* Time and date *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=143 *)
	VAR_INPUT
		Y : INT;
	END_VAR
END_FUNCTION

FUNCTION YEAR_OF_DATE : INT (* Time and date *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=144 *)
	VAR_INPUT
		IDATE : DATE;
	END_VAR
END_FUNCTION

FUNCTION _ARRAY_ABS : BOOL (* Array *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=71 *)
	VAR_INPUT
		PT : REFERENCE TO ARRAY[0..32000] OF REAL;
		SIZE : UINT;
	END_VAR
	VAR
		i : UINT;
		stop : UINT;
	END_VAR
END_FUNCTION

FUNCTION _ARRAY_ADD : BOOL (* Array *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=71 *)
	VAR_INPUT
		PT : REFERENCE TO ARRAY[0..32000] OF REAL;
		SIZE : UINT;
		X : REAL;
	END_VAR
	VAR
		i : UINT;
		stop : UINT;
	END_VAR
END_FUNCTION

FUNCTION _ARRAY_INIT : BOOL (* Array *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=72 *)
	VAR_INPUT
		PT : REFERENCE TO ARRAY[0..32000] OF REAL;
		SIZE : UINT;
		INIT : REAL;
	END_VAR
	VAR
		i : UINT;
		stop : UINT;
	END_VAR
END_FUNCTION

FUNCTION _ARRAY_MEDIAN : REAL (* Array *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=73 *)
	VAR_INPUT
		PT : REFERENCE TO ARRAY[0..32000] OF REAL;
		SIZE : UINT;
	END_VAR
	VAR
		i : UINT;
		stop : UINT;
	END_VAR
END_FUNCTION

FUNCTION _ARRAY_MUL : BOOL (* Array *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=73 *)
	VAR_INPUT
		PT : REFERENCE TO ARRAY[0..32000] OF REAL;
		SIZE : UINT;
		X : REAL;
	END_VAR
	VAR
		i : UINT;
		stop : UINT;
	END_VAR
END_FUNCTION

FUNCTION _ARRAY_SHUFFLE : BOOL (* Array *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=74 *)
	VAR_INPUT
		PT : REFERENCE TO ARRAY[0..32000] OF REAL;
		SIZE : UINT;
	END_VAR
	VAR
		temp : REAL;
		pos : INT;
		i : INT;
		stop : INT;
	END_VAR
END_FUNCTION

FUNCTION _ARRAY_SORT : BOOL (* Array *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=75 *)
	VAR_INPUT
		PT : REFERENCE TO ARRAY[1..32000] OF REAL;
		SIZE : UINT;
	END_VAR
	VAR
		stack_count : UINT; (* Laufvariable Stack*)
		stack : ARRAY[1..32] OF UINT; (* Stackgröße~ 1,6*Log(n)/log(2) *)
		links : UINT; (* Anfangselement des Arrays *)
		rechts : UINT; (* Endelement des Arrays *)
		pivot : REAL; (* temporärer Schwellwert für Tauschbedingung *)
		i : UINT; (* Laufvariable1 *)
		j : UINT; (* Laufvariable2 *)
		ende_innen : BOOL; (* Ende innere Schleife *)
		ende_aussen : BOOL; (* Ende äußere Schleife *)
		tmp : REAL; (* Hilfsvariable zum Tauschen von Werten *)
	END_VAR
END_FUNCTION

FUNCTION _BUFFER_CLEAR : BOOL (* Buffer Management *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=477 *)
	VAR_INPUT
		PT : REFERENCE TO BYTE;
		SIZE : UINT;
	END_VAR
	VAR
		ptw : REFERENCE TO DWORD;
		temp : UDINT;
		end : UDINT;
		end32 : UDINT;
	END_VAR
END_FUNCTION

FUNCTION _BUFFER_INIT : BOOL (* Buffer Management *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=477 *)
	VAR_INPUT
		PT : REFERENCE TO BYTE;
		SIZE : UINT;
		INIT : BYTE;
	END_VAR
	VAR
		ptw : REFERENCE TO DWORD;
		temp : UDINT;
		end : UDINT;
		end32 : UDINT;
	END_VAR
END_FUNCTION

FUNCTION _BUFFER_INSERT : INT (* Buffer Management *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=478 *)
	VAR_INPUT
		STR : STRING[STRING_LENGTH];
		POS : INT;
		PT : REFERENCE TO ARRAY[0..32767] OF BYTE;
		SIZE : UINT;
	END_VAR
	VAR
		end : INT;
		lx : INT;
		i : INT;
	END_VAR
END_FUNCTION

FUNCTION _BUFFER_UPPERCASE : BOOL (* Buffer Management *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=479 *)
	VAR_INPUT
		PT : REFERENCE TO ARRAY[0..32000] OF BYTE;
		SIZE : INT;
	END_VAR
	VAR
		pos : INT;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK _RMP_B (* Signal generators *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=255 *)
	VAR_INPUT
		DIR : BOOL; (* true = up *)
		E : BOOL := TRUE;
		TR : TIME;
	END_VAR
	VAR_IN_OUT
		RMP : BYTE;
	END_VAR
	VAR
		tx : TIME;
		tl : TIME;
		tn : TIME;
		init : BOOL;
		last_dir : BOOL;
		start : BYTE;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK _RMP_NEXT (* Signal generators *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=255 *)
	VAR_INPUT
		E : BOOL := TRUE;
		IN : BYTE;
		TR : TIME;
		TF : TIME;
		TL : TIME;
	END_VAR
	VAR_OUTPUT
		DIR : BOOL; (* upwards = TRUE *)
		UP : BOOL;
		DN : BOOL;
	END_VAR
	VAR_IN_OUT
		OUT : BYTE;
	END_VAR
	VAR
		rmx : _RMP_B;
		dirx : TREND_DW;
		t_lock : TP;
		xen : BOOL;
		xdir : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK _RMP_W (* Signal generators *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=256 *)
	VAR_INPUT
		DIR : BOOL;
		E : BOOL := TRUE;
		TR : TIME;
	END_VAR
	VAR_IN_OUT
		RMP : WORD;
	END_VAR
	VAR
		tx : UDINT;
		tl : UDINT;
		step : DINT;
		init : BOOL;
		last_dir : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION _STRING_TO_BUFFER : INT (* Buffer Management *) (* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=479 *)
	VAR_INPUT
		STR : STRING[STRING_LENGTH];
		POS : INT;
		PT : REFERENCE TO ARRAY[0..32767] OF BYTE;
		SIZE : UINT;
	END_VAR
	VAR
		ps : REFERENCE TO BYTE;
		i : INT;
		end : INT;
	END_VAR
END_FUNCTION
