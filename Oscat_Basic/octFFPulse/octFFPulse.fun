FUNCTION_BLOCK LTCH
    VAR_INPUT
        D : BOOL;
        L : BOOL;
        RST : BOOL;
    END_VAR
    VAR_OUTPUT
        Q : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK LTCH_4
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
FUNCTION_BLOCK STORE_8
    VAR_INPUT
        Set : BOOL;
        D0 : BOOL;
        D1 : BOOL;
        D2 : BOOL;
        D3 : BOOL;
        D4 : BOOL;
        D5 : BOOL;
        D6 : BOOL;
        D7 : BOOL;
        Clr : BOOL;
        Rst : BOOL;
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
