FUNCTION V3_ABS : REAL
    VAR_INPUT
        A : VECTOR_3;
    END_VAR
END_FUNCTION
FUNCTION V3_ADD : BOOL
    VAR_INPUT
        A : VECTOR_3;
        B : VECTOR_3;
    END_VAR
    VAR_IN_OUT
        retVal : VECTOR_3; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION V3_ANG : REAL
    VAR_INPUT
        A : VECTOR_3;
        B : VECTOR_3;
    END_VAR
    VAR
        d : REAL;
    END_VAR
END_FUNCTION
FUNCTION V3_DPRO : REAL
    VAR_INPUT
        A : VECTOR_3;
        B : VECTOR_3;
    END_VAR
END_FUNCTION
FUNCTION V3_NORM : BOOL
    VAR_INPUT
        A : VECTOR_3;
    END_VAR
    VAR_IN_OUT
        retVal : VECTOR_3; (*Return value of the function*)
    END_VAR
    VAR
        la : REAL;
    END_VAR
END_FUNCTION
FUNCTION V3_NUL : BOOL
    VAR_INPUT
        A : VECTOR_3;
    END_VAR
END_FUNCTION
FUNCTION V3_PAR : BOOL
    VAR_INPUT
        A : VECTOR_3;
        B : VECTOR_3;
    END_VAR
END_FUNCTION
FUNCTION V3_REV : BOOL
    VAR_INPUT
        A : VECTOR_3;
    END_VAR
    VAR_IN_OUT
        retVal : VECTOR_3; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION V3_SMUL : BOOL
    VAR_INPUT
        A : VECTOR_3;
        M : REAL;
    END_VAR
    VAR_IN_OUT
        retVal : VECTOR_3; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION V3_SUB : BOOL
    VAR_INPUT
        A : VECTOR_3;
        B : VECTOR_3;
    END_VAR
    VAR_IN_OUT
        retVal : VECTOR_3; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION V3_XANG : REAL
    VAR_INPUT
        A : VECTOR_3;
    END_VAR
    VAR
        la : REAL;
    END_VAR
END_FUNCTION
FUNCTION V3_XPRO : BOOL
    VAR_INPUT
        A : VECTOR_3;
        B : VECTOR_3;
    END_VAR
    VAR_IN_OUT
        retVal : VECTOR_3; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION V3_YANG : REAL
    VAR_INPUT
        A : VECTOR_3;
    END_VAR
    VAR
        la : REAL;
    END_VAR
END_FUNCTION
FUNCTION V3_ZANG : REAL
    VAR_INPUT
        A : VECTOR_3;
    END_VAR
    VAR
        la : REAL;
    END_VAR
END_FUNCTION
