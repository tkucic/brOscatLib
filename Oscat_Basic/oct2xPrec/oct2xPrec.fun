FUNCTION R2_ABS : BOOL
    VAR_INPUT
        X : REAL2;
    END_VAR
    VAR_IN_OUT
        retVal : REAL2; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION R2_ADD : BOOL
    VAR_INPUT
        X : REAL2;
        Y : REAL;
    END_VAR
    VAR_IN_OUT
        retVal : REAL2; (*Return value of the function*)
    END_VAR
    VAR
        temp : REAL;
    END_VAR
END_FUNCTION
FUNCTION R2_ADD2 : BOOL
    VAR_INPUT
        X : REAL2;
        Y : REAL2;
    END_VAR
    VAR_IN_OUT
        retVal : REAL2; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION R2_MUL : BOOL
    VAR_INPUT
        X : REAL2;
        Y : REAL;
    END_VAR
    VAR_IN_OUT
        retVal : REAL2; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION R2_SET : BOOL
    VAR_INPUT
        X : REAL;
    END_VAR
    VAR_IN_OUT
        retVal : REAL2; (*Return value of the function*)
    END_VAR
END_FUNCTION
