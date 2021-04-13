FUNCTION BCDC_TO_INT : INT
    VAR_INPUT
        IN : BYTE; (**)
    END_VAR
END_FUNCTION
FUNCTION BIT_COUNT : INT
    VAR_INPUT
        IN : DWORD; (**)
    END_VAR
END_FUNCTION
FUNCTION BIT_LOAD_B : BYTE
    VAR_INPUT
        IN : BYTE; (**)
        VAL : BOOL; (**)
        POS : INT; (**)
    END_VAR
    VAR_CONSTANT
        dat : BYTE := 1; (**)
    END_VAR
END_FUNCTION
FUNCTION BIT_LOAD_B2 : BYTE
    VAR_INPUT
        I : BYTE; (**)
        D : BOOL; (**)
        P : INT; (**)
        N : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION BIT_LOAD_DW : DWORD
    VAR_INPUT
        IN : DWORD; (**)
        VAL : BOOL; (**)
        POS : INT; (**)
    END_VAR
    VAR_CONSTANT
        dat : DWORD := 1; (**)
    END_VAR
END_FUNCTION
FUNCTION BIT_LOAD_DW2 : DWORD
    VAR_INPUT
        I : DWORD; (**)
        D : BOOL; (**)
        P : INT; (**)
        N : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION BIT_LOAD_W : WORD
    VAR_INPUT
        IN : WORD; (**)
        VAL : BOOL; (**)
        POS : INT; (**)
    END_VAR
    VAR_CONSTANT
        dat : WORD := 1; (**)
    END_VAR
END_FUNCTION
FUNCTION BIT_LOAD_W2 : WORD
    VAR_INPUT
        I : WORD; (**)
        D : BOOL; (**)
        P : INT; (**)
        N : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION BIT_OF_DWORD : BOOL
    VAR_INPUT
        in : DWORD; (**)
        N : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION BIT_TOGGLE_B : BYTE
    VAR_INPUT
        IN : BYTE; (**)
        POS : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION BIT_TOGGLE_DW : DWORD
    VAR_INPUT
        IN : DWORD; (**)
        POS : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION BIT_TOGGLE_W : WORD
    VAR_INPUT
        IN : WORD; (**)
        POS : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION BYTE_OF_BIT : BYTE
    VAR_INPUT
        B0 : BOOL; (**)
        B1 : BOOL; (**)
        B2 : BOOL; (**)
        B3 : BOOL; (**)
        B4 : BOOL; (**)
        B5 : BOOL; (**)
        B6 : BOOL; (**)
        B7 : BOOL; (**)
    END_VAR
END_FUNCTION
FUNCTION BYTE_OF_DWORD : BYTE
    VAR_INPUT
        in : DWORD; (**)
        N : BYTE; (**)
    END_VAR
END_FUNCTION
FUNCTION_BLOCK BYTE_TO_BITS
    VAR_INPUT
        IN : BYTE; (**)
    END_VAR
    VAR_OUTPUT
        B0 : BOOL; (**)
        B1 : BOOL; (**)
        B2 : BOOL; (**)
        B3 : BOOL; (**)
        B4 : BOOL; (**)
        B5 : BOOL; (**)
        B6 : BOOL; (**)
        B7 : BOOL; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION BYTE_TO_GRAY : BYTE
    VAR_INPUT
        IN : BYTE; (**)
    END_VAR
END_FUNCTION
FUNCTION CHECK_PARITY : BOOL
    VAR_INPUT
        in : DWORD; (**)
        p : BOOL; (**)
    END_VAR
END_FUNCTION
FUNCTION CHK_REAL : BYTE
    VAR_INPUT
        X : REAL; (**)
    END_VAR
    VAR
        pt : REFERENCE TO DWORD; (**)
        tmp : DWORD; (**)
    END_VAR
END_FUNCTION
FUNCTION_BLOCK DEC_2
    VAR_INPUT
        D : BOOL; (**)
        A : BOOL; (**)
    END_VAR
    VAR_OUTPUT
        Q0 : BOOL; (**)
        Q1 : BOOL; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK DEC_4
    VAR_INPUT
        D : BOOL; (**)
        A0 : BOOL; (**)
        A1 : BOOL; (**)
    END_VAR
    VAR_OUTPUT
        Q0 : BOOL; (**)
        Q1 : BOOL; (**)
        Q2 : BOOL; (**)
        Q3 : BOOL; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK DEC_8
    VAR_INPUT
        D : BOOL; (**)
        A0 : BOOL; (**)
        A1 : BOOL; (**)
        A2 : BOOL; (**)
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
    VAR
        X : INT; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION DW_TO_REAL : REAL
    VAR_INPUT
        X : DWORD; (**)
    END_VAR
    VAR
        pt : REFERENCE TO REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION DWORD_OF_BYTE : DWORD
    VAR_INPUT
        B3 : BYTE; (**)
        B2 : BYTE; (**)
        B1 : BYTE; (**)
        B0 : BYTE; (**)
    END_VAR
END_FUNCTION
FUNCTION DWORD_OF_WORD : DWORD
    VAR_INPUT
        W1 : WORD; (**)
        W0 : WORD; (**)
    END_VAR
END_FUNCTION
FUNCTION GRAY_TO_BYTE : BYTE
    VAR_INPUT
        IN : BYTE; (**)
    END_VAR
END_FUNCTION
FUNCTION INT_TO_BCDC : BYTE
    VAR_INPUT
        IN : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION MUX_2 : BOOL
    VAR_INPUT
        D0 : BOOL; (**)
        D1 : BOOL; (**)
        A0 : BOOL; (**)
    END_VAR
END_FUNCTION
FUNCTION MUX_4 : BOOL
    VAR_INPUT
        D0 : BOOL; (**)
        D1 : BOOL; (**)
        D2 : BOOL; (**)
        D3 : BOOL; (**)
        A0 : BOOL; (**)
        A1 : BOOL; (**)
    END_VAR
END_FUNCTION
FUNCTION PARITY : BOOL
    VAR_INPUT
        in : DWORD; (**)
    END_VAR
END_FUNCTION
FUNCTION REAL_TO_DW : DWORD
    VAR_INPUT
        X : REAL; (**)
    END_VAR
    VAR
        pt : REFERENCE TO DWORD; (**)
    END_VAR
END_FUNCTION
FUNCTION REFLECT : DWORD
    VAR_INPUT
        D : DWORD; (**)
        L : INT; (**)
    END_VAR
    VAR
        i : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION REVERSE : BYTE
    VAR_INPUT
        IN : BYTE; (**)
    END_VAR
END_FUNCTION
FUNCTION SHL1 : DWORD
    VAR_INPUT
        IN : DWORD; (**)
        N : INT; (**)
    END_VAR
    VAR_CONSTANT
        temp : DWORD := 16#FFFFFFFF; (**)
    END_VAR
END_FUNCTION
FUNCTION SHR1 : DWORD
    VAR_INPUT
        IN : DWORD; (**)
        N : INT; (**)
    END_VAR
    VAR_CONSTANT
        temp : DWORD := 16#FFFFFFFF; (**)
    END_VAR
END_FUNCTION
FUNCTION SWAP_BYTE : WORD
    VAR_INPUT
        IN : WORD; (**)
    END_VAR
END_FUNCTION
FUNCTION SWAP_BYTE2 : DWORD
    VAR_INPUT
        IN : DWORD; (**)
    END_VAR
END_FUNCTION
FUNCTION WORD_OF_BYTE : WORD
    VAR_INPUT
        B1 : BYTE; (**)
        B0 : BYTE; (**)
    END_VAR
END_FUNCTION
FUNCTION WORD_OF_DWORD : WORD
    VAR_INPUT
        in : DWORD; (**)
        N : BYTE; (**)
    END_VAR
END_FUNCTION
