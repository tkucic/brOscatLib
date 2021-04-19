FUNCTION_BLOCK NET_VAR_BOOL8
    VAR_INPUT
        IN1 : BOOL;
        IN2 : BOOL;
        IN3 : BOOL;
        IN4 : BOOL;
        IN5 : BOOL;
        IN6 : BOOL;
        IN7 : BOOL;
        IN8 : BOOL;
    END_VAR
    VAR_OUTPUT
        OUT1 : BOOL;
        OUT2 : BOOL;
        OUT3 : BOOL;
        OUT4 : BOOL;
        OUT5 : BOOL;
        OUT6 : BOOL;
        OUT7 : BOOL;
        OUT8 : BOOL;
        ID : BYTE;
    END_VAR
    VAR_IN_OUT
        X : NET_VAR_DATA;
    END_VAR
    VAR
        init : BOOL;
        index : INT;
        index2 : INT;
        BYTE_TO_BITS : BYTE_TO_BITS;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK NET_VAR_BUFFER
    VAR_OUTPUT
        ID : BYTE;
    END_VAR
    VAR_IN_OUT
        BUF_IN : ARRAY[1..64] OF BYTE;
        BUF_OUT : ARRAY[1..64] OF BYTE;
        X : NET_VAR_DATA;
    END_VAR
    VAR
        size : INT;
        init : BOOL;
        index : INT;
        index2 : INT;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK NET_VAR_CONTROL
    VAR_INPUT
        ACTIVATE : BOOL;
        MASTER : BOOL;
        UDP : BOOL;
        REMOTE_IP4 : DWORD;
        REMOTE_PORT : WORD := 10000;
        SCAN_TIME : TIME := TIME#1s0ms;
        WATCHDOG : TIME := TIME#2s0ms;
    END_VAR
    VAR_OUTPUT
        RUN : BOOL;
        ERROR : DWORD;
    END_VAR
    VAR_IN_OUT
        X : NET_VAR_DATA;
    END_VAR
    VAR
        IPC : IP_CONTROL;
        IP_C : IP_C; (* IP_Control Verwaltungsstruktur *)
        step : INT;
        activate_last : BOOL;
        tscan : TON;
        reset : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK NET_VAR_DWORD8
    VAR_INPUT
        IN1 : DWORD;
        IN2 : DWORD;
        IN3 : DWORD;
        IN4 : DWORD;
        IN5 : DWORD;
        IN6 : DWORD;
        IN7 : DWORD;
        IN8 : DWORD;
    END_VAR
    VAR_OUTPUT
        OUT1 : DWORD;
        OUT2 : DWORD;
        OUT3 : DWORD;
        OUT4 : DWORD;
        OUT5 : DWORD;
        OUT6 : DWORD;
        OUT7 : DWORD;
        OUT8 : DWORD;
        ID : BYTE;
    END_VAR
    VAR_IN_OUT
        X : NET_VAR_DATA;
    END_VAR
    VAR
        init : BOOL;
        i : INT;
        i2 : INT;
        index : INT;
        index2 : INT;
        ra : ARRAY[1..8] OF DWORD;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK NET_VAR_REAL8
    VAR_INPUT
        IN1 : REAL;
        IN2 : REAL;
        IN3 : REAL;
        IN4 : REAL;
        IN5 : REAL;
        IN6 : REAL;
        IN7 : REAL;
        IN8 : REAL;
    END_VAR
    VAR_OUTPUT
        OUT1 : REAL;
        OUT2 : REAL;
        OUT3 : REAL;
        OUT4 : REAL;
        OUT5 : REAL;
        OUT6 : REAL;
        OUT7 : REAL;
        OUT8 : REAL;
        ID : BYTE;
    END_VAR
    VAR_IN_OUT
        X : NET_VAR_DATA;
    END_VAR
    VAR
        init : BOOL;
        i : INT;
        i2 : INT;
        index : INT;
        index2 : INT;
        r_dw : DWORD;
        ra : ARRAY[1..8] OF REAL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK NET_VAR_STRING
    VAR_OUTPUT
        ID : BYTE;
    END_VAR
    VAR_IN_OUT
        IN : STRING[STRING_LENGTH];
        OUT : STRING[STRING_LENGTH];
        X : NET_VAR_DATA;
    END_VAR
    VAR
        init : BOOL;
        len_str : INT;
        index : INT;
        index2 : INT;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK NET_VAR_X8
    VAR_INPUT
        IN_REAL1 : REAL;
        IN_REAL2 : REAL;
        IN_DINT1 : DINT;
        IN_DINT2 : DINT;
        IN_UDINT1 : UDINT;
        IN_UDINT2 : UDINT;
        IN_DWORD1 : DWORD;
        IN_DWORD2 : DWORD;
    END_VAR
    VAR_OUTPUT
        OUT_REAL1 : REAL;
        OUT_REAL2 : REAL;
        OUT_DINT1 : DINT;
        OUT_DINT2 : DINT;
        OUT_UDINT1 : UDINT;
        OUT_UDINT2 : UDINT;
        OUT_DWORD1 : DWORD;
        OUT_DWORD2 : DWORD;
        ID : BYTE;
    END_VAR
    VAR_IN_OUT
        X : NET_VAR_DATA;
    END_VAR
    VAR
        init : BOOL;
        i : INT;
        i2 : INT;
        index : INT;
        index2 : INT;
        ra : ARRAY[1..8] OF DWORD;
    END_VAR
END_FUNCTION_BLOCK
