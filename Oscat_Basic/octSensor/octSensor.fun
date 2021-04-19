FUNCTION MULTI_IN : REAL
    VAR_INPUT
        in_1 : REAL;
        in_2 : REAL;
        in_3 : REAL;
        default : REAL;
        in_min : REAL;
        in_max : REAL;
        mode : BYTE;
    END_VAR
    VAR
        count : INT;
        F1 : BOOL;
        F2 : BOOL;
        F3 : BOOL;
    END_VAR
END_FUNCTION
FUNCTION RES_NI : REAL
    VAR_INPUT
        T : REAL;
        R0 : REAL;
    END_VAR
    VAR
        T2 : REAL;
    END_VAR
    VAR CONSTANT
        A : REAL := 0.5485;
        B : REAL := 0.000665;
        C : REAL := 2.805E-09;
    END_VAR
END_FUNCTION
FUNCTION RES_NTC : REAL
    VAR_INPUT
        T : REAL;
        RN : REAL;
        B : REAL;
    END_VAR
END_FUNCTION
FUNCTION RES_PT : REAL
    VAR_INPUT
        T : REAL;
        R0 : REAL;
    END_VAR
    VAR
        T2 : REAL;
    END_VAR
    VAR CONSTANT
        A : REAL := 0.00390802;
        B : REAL := -5.802E-07;
        C : REAL := -4.2735E-12;
    END_VAR
END_FUNCTION
FUNCTION RES_SI : REAL
    VAR_INPUT
        T : REAL;
        RS : REAL;
        TS : REAL;
    END_VAR
    VAR
        TX : REAL;
    END_VAR
    VAR CONSTANT
        A : REAL := 0.00764;
        B : REAL := 1.66E-05;
    END_VAR
END_FUNCTION
FUNCTION SENSOR_INT : REAL
    VAR_INPUT
        Voltage : REAL;
        Current : REAL;
        RP : REAL;
        RS : REAL;
    END_VAR
    VAR
        RG : REAL;
    END_VAR
END_FUNCTION
FUNCTION TEMP_NI : REAL
    VAR_INPUT
        Res : REAL;
        R0 : REAL;
    END_VAR
END_FUNCTION
FUNCTION TEMP_NTC : REAL
    VAR_INPUT
        RES : REAL;
        RN : REAL;
        B : REAL;
    END_VAR
END_FUNCTION
FUNCTION TEMP_PT : REAL
    VAR_INPUT
        Res : REAL;
        R0 : REAL;
    END_VAR
    VAR
        step : REAL := 50;
        X : REAL;
        Y : REAL;
        t1 : REAL;
        pt : REFERENCE TO DWORD;
    END_VAR
    VAR CONSTANT
        A : REAL := 0.0039083;
        B : REAL := -5.775E-07;
        accuracy : REAL := 0.01;
    END_VAR
END_FUNCTION
FUNCTION TEMP_SI : REAL
    VAR_INPUT
        Res : REAL;
        RS : REAL;
        TS : REAL;
    END_VAR
END_FUNCTION
