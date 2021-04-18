FUNCTION V3_ABS : BOOL
    VAR_INPUT
        A : VECTOR_3; (**)
    END_VAR
    VAR_OUTPUT
        retVal : REAL := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION V3_ADD : BOOL
    VAR_INPUT
        A : VECTOR_3; (**)
        B : VECTOR_3; (**)
    END_VAR
    VAR_OUTPUT
        retVal : VECTOR_3 := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION V3_ANG : BOOL
    VAR_INPUT
        A : VECTOR_3; (**)
        B : VECTOR_3; (**)
    END_VAR
    VAR_OUTPUT
        retVal : REAL := ; (*Return value of the function*)
    END_VAR
    VAR
        d : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION V3_DPRO : BOOL
    VAR_INPUT
        A : VECTOR_3; (**)
        B : VECTOR_3; (**)
    END_VAR
    VAR_OUTPUT
        retVal : REAL := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION V3_NORM : BOOL
    VAR_INPUT
        A : VECTOR_3; (**)
    END_VAR
    VAR_OUTPUT
        retVal : VECTOR_3 := ; (*Return value of the function*)
    END_VAR
    VAR
        la : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION V3_NUL : BOOL
    VAR_INPUT
        A : VECTOR_3; (**)
    END_VAR
    VAR_OUTPUT
        retVal : BOOL := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION V3_PAR : BOOL
    VAR_INPUT
        A : VECTOR_3; (**)
        B : VECTOR_3; (**)
    END_VAR
    VAR_OUTPUT
        retVal : BOOL := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION V3_REV : BOOL
    VAR_INPUT
        A : VECTOR_3; (**)
    END_VAR
    VAR_OUTPUT
        retVal : VECTOR_3 := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION V3_SMUL : BOOL
    VAR_INPUT
        A : VECTOR_3; (**)
        M : REAL; (**)
    END_VAR
    VAR_OUTPUT
        retVal : VECTOR_3 := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION V3_SUB : BOOL
    VAR_INPUT
        A : VECTOR_3; (**)
        B : VECTOR_3; (**)
    END_VAR
    VAR_OUTPUT
        retVal : VECTOR_3 := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION V3_XANG : BOOL
    VAR_INPUT
        A : VECTOR_3; (**)
    END_VAR
    VAR_OUTPUT
        retVal : REAL := ; (*Return value of the function*)
    END_VAR
    VAR
        la : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION V3_XPRO : BOOL
    VAR_INPUT
        A : VECTOR_3; (**)
        B : VECTOR_3; (**)
    END_VAR
    VAR_OUTPUT
        retVal : VECTOR_3 := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION V3_YANG : BOOL
    VAR_INPUT
        A : VECTOR_3; (**)
    END_VAR
    VAR_OUTPUT
        retVal : REAL := ; (*Return value of the function*)
    END_VAR
    VAR
        la : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION V3_ZANG : BOOL
    VAR_INPUT
        A : VECTOR_3; (**)
    END_VAR
    VAR_OUTPUT
        retVal : REAL := ; (*Return value of the function*)
    END_VAR
    VAR
        la : REAL; (**)
    END_VAR
END_FUNCTION
