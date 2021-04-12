FUNCTION_BLOCK COUNT_BR
    VAR_INPUT
        SET : BOOL; (**)
        IN : BYTE; (**)
        UP : BOOL; (**)
        DN : BOOL; (**)
        STEP : BYTE := 1; (**)
        MX : BYTE := 255; (**)
        RST : BOOL; (**)
    END_VAR
    VAR_OUTPUT
        CNT : BYTE; (**)
    END_VAR
    VAR
        last_up : BOOL; (**)
        last_dn : BOOL; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK COUNT_DR
    VAR_INPUT
        SET : BOOL; (**)
        IN : DWORD; (**)
        UP : BOOL; (**)
        DN : BOOL; (**)
        STEP : DWORD := 1; (**)
        MX : DWORD := 16#FFFFFFFF; (**)
        RST : BOOL; (**)
    END_VAR
    VAR_OUTPUT
        CNT : DWORD; (**)
    END_VAR
    VAR
        last_up : BOOL; (**)
        last_dn : BOOL; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK FF_D2E
    VAR_INPUT
        D0 : BOOL; (**)
        D1 : BOOL; (**)
        CLK : BOOL; (**)
        RST : BOOL; (**)
    END_VAR
    VAR_OUTPUT
        Q0 : BOOL; (**)
        Q1 : BOOL; (**)
    END_VAR
    VAR
        edge : BOOL; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK FF_D4E
    VAR_INPUT
        D0 : BOOL; (**)
        D1 : BOOL; (**)
        D2 : BOOL; (**)
        D3 : BOOL; (**)
        CLK : BOOL; (**)
        RST : BOOL; (**)
    END_VAR
    VAR_OUTPUT
        Q0 : BOOL; (**)
        Q1 : BOOL; (**)
        Q2 : BOOL; (**)
        Q3 : BOOL; (**)
    END_VAR
    VAR
        edge : BOOL; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK FF_DRE
    VAR_INPUT
        SET : BOOL; (**)
        D : BOOL; (**)
        CLK : BOOL; (**)
        RST : BOOL; (**)
    END_VAR
    VAR_OUTPUT
        Q : BOOL; (**)
    END_VAR
    VAR
        edge : BOOL; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK FF_JKE
    VAR_INPUT
        SET : BOOL; (**)
        J : BOOL; (**)
        CLK : BOOL; (**)
        K : BOOL; (**)
        RST : BOOL; (**)
    END_VAR
    VAR_OUTPUT
        Q : BOOL; (**)
    END_VAR
    VAR
        edge : BOOL; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK FF_RSE
    VAR_INPUT
        CS : BOOL; (**)
        CR : BOOL; (**)
        RST : BOOL; (**)
    END_VAR
    VAR_OUTPUT
        Q : BOOL; (**)
    END_VAR
    VAR
        es : BOOL; (**)
        er : BOOL; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK SELECT_8
    VAR_INPUT
        E : BOOL; (**)
        SET : BOOL; (**)
        IN : BYTE; (**)
        UP : BOOL; (**)
        DN : BOOL; (**)
        RST : BOOL; (**)
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
        STATE : INT; (**)
    END_VAR
    VAR
        last_up : BOOL; (**)
        last_dn : BOOL; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK SHR_4E
    VAR_INPUT
        SET : BOOL; (**)
        D0 : BOOL; (**)
        CLK : BOOL; (**)
        RST : BOOL; (**)
    END_VAR
    VAR_OUTPUT
        Q0 : BOOL; (**)
        Q1 : BOOL; (**)
        Q2 : BOOL; (**)
        Q3 : BOOL; (**)
    END_VAR
    VAR
        trig : R_TRIG; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK SHR_4UDE
    VAR_INPUT
        SET : BOOL; (**)
        D0 : BOOL; (**)
        D3 : BOOL; (**)
        CLK : BOOL; (**)
        DN : BOOL; (**)
        RST : BOOL; (**)
    END_VAR
    VAR_OUTPUT
        Q0 : BOOL; (**)
        Q1 : BOOL; (**)
        Q2 : BOOL; (**)
        Q3 : BOOL; (**)
    END_VAR
    VAR
        trig : R_TRIG; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK SHR_8PLE
    VAR_INPUT
        Din : BOOL; (**)
        Dload : BYTE; (**)
        CLK : BOOL; (**)
        UP : BOOL := 1; (**)
        load : BOOL; (**)
        RST : BOOL; (**)
    END_VAR
    VAR_OUTPUT
        DOut : BOOL; (**)
    END_VAR
    VAR
        edge : BOOL := 1; (**)
        register : BYTE; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK SHR_8UDE
    VAR_INPUT
        SET : BOOL; (**)
        D0 : BOOL; (**)
        D7 : BOOL; (**)
        CLK : BOOL; (**)
        DN : BOOL; (**)
        RST : BOOL; (**)
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
        trig : R_TRIG; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TOGGLE
    VAR_INPUT
        CLK : BOOL; (**)
        rst : BOOL; (**)
    END_VAR
    VAR_OUTPUT
        Q : BOOL; (**)
    END_VAR
    VAR
        edge : BOOL; (**)
    END_VAR
END_FUNCTION_BLOCK
