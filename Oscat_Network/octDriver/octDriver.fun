FUNCTION_BLOCK IRTRANS_DECODE
    VAR_OUTPUT
        CMD : BOOL; (**)
        DEV : STRING[255]; (**)
        KEY : STRING[255]; (**)
        ERROR : BOOL; (**)
    END_VAR
    VAR_IN_OUT
        IP_C : IP_C; (* IP_Control Verwaltungsstruktur *)
        R_BUF : NETWORK_BUFFER_SHORT; (**)
    END_VAR
    VAR
        i : INT; (**)
        stop : INT; (**)
        pt : REFERENCE TO BYTE; (**)
        buffer : REFERENCE TO ARRAY[0..32000] OF BYTE; (**)
        size : UINT; (**)
        z : BYTE; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK IRTRANS_RCV_1
    VAR_INPUT
        DEV_CODE : STRING[255]; (**)
        KEY_CODE : STRING[255]; (**)
        CMD : BOOL; (**)
    END_VAR
    VAR_OUTPUT
        Q : BOOL; (**)
    END_VAR
    VAR_IN_OUT
        DEV : STRING[255]; (**)
        KEY : STRING[255]; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK IRTRANS_RCV_4
    VAR_TEMP
        decode : BOOL; (**)
    END_VAR
    VAR_INPUT
        DEV_CODE : STRING[255]; (**)
        KEY_CODE_0 : STRING[255]; (**)
        KEY_CODE_1 : STRING[255]; (**)
        KEY_CODE_2 : STRING[255]; (**)
        KEY_CODE_3 : STRING[255]; (**)
        CMD : BOOL; (**)
    END_VAR
    VAR_OUTPUT
        Q0 : BOOL; (**)
        Q1 : BOOL; (**)
        Q2 : BOOL; (**)
        Q3 : BOOL; (**)
    END_VAR
    VAR_IN_OUT
        DEV : STRING[255]; (**)
        KEY : STRING[255]; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK IRTRANS_RCV_8
    VAR_TEMP
        decode : BOOL; (**)
    END_VAR
    VAR_INPUT
        dev_code : STRING[255]; (**)
        key_code_0 : STRING[255]; (**)
        key_code_1 : STRING[255]; (**)
        key_code_2 : STRING[255]; (**)
        key_code_3 : STRING[255]; (**)
        key_code_4 : STRING[255]; (**)
        key_code_5 : STRING[255]; (**)
        key_code_6 : STRING[255]; (**)
        key_code_7 : STRING[255]; (**)
        CMD : BOOL; (**)
    END_VAR
    VAR_OUTPUT
        Q0 : BOOL; (**)
        Q1 : BOOL; (**)
        Q2 : BOOL; (**)
        Q3 : BOOL; (**)
        Q4 : BOOL; (**)
        Q5 : BOOL; (**)
        Q6 : BOOL; (**)
        Q7 : BOOL; (**)
    END_VAR
    VAR_IN_OUT
        DEV : STRING[255]; (**)
        KEY : STRING[255]; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK IRTRANS_SERVER
    VAR_INPUT
        UDP_TCP : BOOL; (**)
    END_VAR
    VAR_OUTPUT
        S_ENABLE : BOOL; (**)
        R_ENABLE : BOOL; (**)
        ERROR : DWORD; (**)
    END_VAR
    VAR_IN_OUT
        IP_C : IP_C; (* IP_Control Verwaltungsstruktur *)
        S_BUF : NETWORK_BUFFER_SHORT; (**)
        R_BUF : NETWORK_BUFFER_SHORT; (**)
    END_VAR
    VAR
        t : TON; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK IRTRANS_SND_1
    VAR_INPUT
        DEV_CODE : STRING[255]; (**)
        KEY_CODE : STRING[255]; (**)
        IN : BOOL; (**)
        T_REPEAT : TIME; (**)
    END_VAR
    VAR_OUTPUT
        KEY : BYTE; (**)
    END_VAR
    VAR_IN_OUT
        IP_C : IP_C; (* IP_Control Verwaltungsstruktur *)
        S_BUF : NETWORK_BUFFER_SHORT; (**)
    END_VAR
    VAR
        skey : STRING[255]; (**)
        size : INT; (**)
        str : STRING[255]; (**)
        t : TON; (**)
        k : BYTE; (**)
        lk : BYTE; (**)
        d : BOOL; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK IRTRANS_SND_4
    VAR_INPUT
        DEV_CODE : STRING[255]; (**)
        KEY_CODE_0 : STRING[255]; (**)
        KEY_CODE_1 : STRING[255]; (**)
        KEY_CODE_2 : STRING[255]; (**)
        KEY_CODE_3 : STRING[255]; (**)
        IN_0 : BOOL; (**)
        IN_1 : BOOL; (**)
        IN_2 : BOOL; (**)
        IN_3 : BOOL; (**)
        T_REPEAT : TIME; (**)
    END_VAR
    VAR_OUTPUT
        KEY : BYTE; (**)
    END_VAR
    VAR_IN_OUT
        IP_C : IP_C; (* IP_Control Verwaltungsstruktur *)
        S_BUF : NETWORK_BUFFER_SHORT; (**)
    END_VAR
    VAR
        skey : STRING[255]; (**)
        size : INT; (**)
        str : STRING[255]; (**)
        t : TON; (**)
        k : BYTE; (**)
        lk : BYTE; (**)
        d : BOOL; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK IRTRANS_SND_8
    VAR_INPUT
        DEV_CODE : STRING[255]; (**)
        KEY_CODE_0 : STRING[255]; (**)
        KEY_CODE_1 : STRING[255]; (**)
        KEY_CODE_2 : STRING[255]; (**)
        KEY_CODE_3 : STRING[255]; (**)
        KEY_CODE_4 : STRING[255]; (**)
        KEY_CODE_5 : STRING[255]; (**)
        KEY_CODE_6 : STRING[255]; (**)
        KEY_CODE_7 : STRING[255]; (**)
        IN_0 : BOOL; (**)
        IN_1 : BOOL; (**)
        IN_2 : BOOL; (**)
        IN_3 : BOOL; (**)
        IN_4 : BOOL; (**)
        IN_5 : BOOL; (**)
        IN_6 : BOOL; (**)
        IN_7 : BOOL; (**)
        T_REPEAT : TIME; (**)
    END_VAR
    VAR_OUTPUT
        KEY : BYTE; (**)
    END_VAR
    VAR_IN_OUT
        IP_C : IP_C; (* IP_Control Verwaltungsstruktur *)
        S_BUF : NETWORK_BUFFER_SHORT; (**)
    END_VAR
    VAR
        skey : STRING[255]; (**)
        size : INT; (**)
        str : STRING[255]; (**)
        t : TON; (**)
        k : BYTE; (**)
        lk : BYTE; (**)
        d : BOOL; (**)
    END_VAR
END_FUNCTION_BLOCK
