FUNCTION_BLOCK ESR_COLLECT
    VAR_INPUT
        ESR_0 : ARRAY[0..3] OF ESR_DATA;
        ESR_1 : ARRAY[0..3] OF ESR_DATA;
        ESR_2 : ARRAY[0..3] OF ESR_DATA;
        ESR_3 : ARRAY[0..3] OF ESR_DATA;
        ESR_4 : ARRAY[0..3] OF ESR_DATA;
        ESR_5 : ARRAY[0..3] OF ESR_DATA;
        ESR_6 : ARRAY[0..3] OF ESR_DATA;
        ESR_7 : ARRAY[0..3] OF ESR_DATA;
        rst : BOOL;
    END_VAR
    VAR_OUTPUT
        ESR_OUT : ARRAY[0..31] OF ESR_DATA;
    END_VAR
    VAR_IN_OUT
        pos : INT;
    END_VAR
    VAR
        cnt : INT := -1;
    END_VAR
    VAR CONSTANT
        max_in : INT := 3; (* max limit of input array *)
        max_out : INT := 32; (* number of elements in array *)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK ESR_MON_B8
    VAR_INPUT
        s0 : BOOL;
        s1 : BOOL;
        s2 : BOOL;
        s3 : BOOL;
        s4 : BOOL;
        s5 : BOOL;
        s6 : BOOL;
        s7 : BOOL;
        DT_in : DT;
        a0 : STRING[10];
        a1 : STRING[10];
        a2 : STRING[10];
        a3 : STRING[10];
        a4 : STRING[10];
        a5 : STRING[10];
        a6 : STRING[10];
        a7 : STRING[10];
    END_VAR
    VAR_OUTPUT
        ESR_Flag : BOOL;
    END_VAR
    VAR_IN_OUT
        ESR_Out : ARRAY[0..3] OF ESR_DATA;
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
FUNCTION_BLOCK ESR_MON_R4
    VAR_INPUT
        R0 : REAL;
        R1 : REAL;
        R2 : REAL;
        R3 : REAL;
        DT_in : DT;
        a0 : STRING[10];
        a1 : STRING[10];
        a2 : STRING[10];
        a3 : STRING[10];
        s0 : REAL;
        s1 : REAL;
        s2 : REAL;
        s3 : REAL;
    END_VAR
    VAR_OUTPUT
        ESR_Flag : BOOL;
    END_VAR
    VAR_IN_OUT
        ESR_Out : ARRAY[0..3] OF ESR_DATA;
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
FUNCTION_BLOCK ESR_MON_X8
    VAR_INPUT
        s0 : BYTE;
        s1 : BYTE;
        s2 : BYTE;
        s3 : BYTE;
        s4 : BYTE;
        s5 : BYTE;
        s6 : BYTE;
        s7 : BYTE;
        DT_in : DT;
        Mode : BYTE := 3;
        a0 : STRING[10];
        a1 : STRING[10];
        a2 : STRING[10];
        a3 : STRING[10];
        a4 : STRING[10];
        a5 : STRING[10];
        a6 : STRING[10];
        a7 : STRING[10];
    END_VAR
    VAR_OUTPUT
        ESR_Flag : BOOL;
    END_VAR
    VAR_IN_OUT
        ESR_Out : ARRAY[0..3] OF ESR_DATA;
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
FUNCTION OSCAT_VERSION : DWORD
    VAR_INPUT
        IN : BOOL;
    END_VAR
END_FUNCTION
FUNCTION STATUS_TO_ESR : BOOL
    VAR_INPUT
        status : BYTE;
        adress : STRING[10];
        DT_in : DT;
        TS : TIME;
    END_VAR
    VAR_IN_OUT
        retVal : ESR_DATA; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION CRC_GEN : DWORD
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
FUNCTION_BLOCK MATRIX
    VAR_INPUT
        x1 : BOOL;
        x2 : BOOL;
        x3 : BOOL;
        x4 : BOOL;
        X5 : BOOL;
        Release : BOOL;
    END_VAR
    VAR_OUTPUT
        code : BYTE;
        TP : BOOL;
        y1 : BOOL := TRUE;
        y2 : BOOL;
        y3 : BOOL;
        y4 : BOOL;
    END_VAR
    VAR
        line : BYTE;
        X : ARRAY[0..3] OF BYTE; (* scan line inputs *)
        L : ARRAY[0..3] OF BYTE; (* scan line status *)
        i : INT;
        temp : BYTE;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK PIN_CODE
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
