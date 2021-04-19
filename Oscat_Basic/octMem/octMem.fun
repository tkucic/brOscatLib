FUNCTION_BLOCK FIFO_16
    VAR_INPUT
        Din : DWORD;
        E : BOOL := TRUE;
        RD : BOOL;
        WD : BOOL;
        RST : BOOL;
    END_VAR
    VAR_OUTPUT
        Dout : DWORD;
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
FUNCTION_BLOCK FIFO_32
    VAR_INPUT
        Din : DWORD;
        E : BOOL := TRUE;
        RD : BOOL;
        WD : BOOL;
        RST : BOOL;
    END_VAR
    VAR_OUTPUT
        Dout : DWORD;
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
FUNCTION_BLOCK STACK_16
    VAR_INPUT
        Din : DWORD;
        E : BOOL := TRUE;
        RD : BOOL;
        WD : BOOL;
        RST : BOOL;
    END_VAR
    VAR_OUTPUT
        Dout : DWORD;
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
FUNCTION_BLOCK STACK_32
    VAR_INPUT
        Din : DWORD;
        E : BOOL := TRUE;
        RD : BOOL;
        WD : BOOL;
        RST : BOOL;
    END_VAR
    VAR_OUTPUT
        Dout : DWORD;
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
