FUNCTION F_LIN : BOOL
    VAR_INPUT
        X : REAL; (**)
        A : REAL; (**)
        B : REAL; (**)
    END_VAR
    VAR_OUTPUT
        retVal : REAL := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION F_LIN2 : BOOL
    VAR_INPUT
        X : REAL; (**)
        X1 : REAL; (**)
        Y1 : REAL; (**)
        X2 : REAL; (**)
        Y2 : REAL; (**)
    END_VAR
    VAR_OUTPUT
        retVal : REAL := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION F_POLY : BOOL
    VAR_INPUT
        X : REAL; (**)
        C : ARRAY[0..7] OF REAL; (**)
    END_VAR
    VAR_OUTPUT
        retVal : REAL := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION F_POWER : BOOL
    VAR_INPUT
        a : REAL; (**)
        x : REAL; (**)
        n : REAL; (**)
    END_VAR
    VAR_OUTPUT
        retVal : REAL := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION F_QUAD : BOOL
    VAR_INPUT
        X : REAL; (**)
        A : REAL; (**)
        B : REAL; (**)
        C : REAL; (**)
    END_VAR
    VAR_OUTPUT
        retVal : REAL := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION FRMP_B : BOOL
    VAR_INPUT
        START : BYTE; (**)
        DIR : BOOL; (**)
        TD : TIME; (**)
        TR : TIME; (**)
    END_VAR
    VAR_OUTPUT
        retVal : BYTE := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION_BLOCK FT_AVG
    VAR_INPUT
        IN : REAL; (**)
        E : BOOL := TRUE; (**)
        N : INT := 32; (**)
        RST : BOOL; (**)
    END_VAR
    VAR_OUTPUT
        AVG : REAL; (**)
    END_VAR
    VAR
        buff : DELAY; (**)
        i : INT; (**)
        init : BOOL; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK FT_MIN_MAX
    VAR_INPUT
        in : REAL; (**)
        rst : BOOL; (**)
    END_VAR
    VAR_OUTPUT
        mx : REAL; (**)
        mn : REAL; (**)
    END_VAR
    VAR
        init : BOOL; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK FT_RMP
    VAR_INPUT
        Rmp : BOOL := TRUE; (**)
        in : REAL; (**)
        KR : REAL; (**)
        KF : REAL; (**)
    END_VAR
    VAR_OUTPUT
        out : REAL; (**)
        busy : BOOL; (**)
        UD : BOOL; (**)
    END_VAR
    VAR
        tx : TIME; (**)
        last : TIME; (**)
        init : BOOL; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION LINEAR_INT : BOOL
    VAR_INPUT
        X : REAL; (**)
        XY : ARRAY[1..20, 0..1] OF REAL; (**)
        Pts : INT; (**)
    END_VAR
    VAR_OUTPUT
        retVal : REAL := ; (*Return value of the function*)
    END_VAR
    VAR
        i : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION POLYNOM_INT : BOOL
    VAR_INPUT
        X : REAL; (**)
        XY : ARRAY[1..5, 0..1] OF REAL; (**)
        Pts : INT; (**)
    END_VAR
    VAR_OUTPUT
        retVal : REAL := ; (*Return value of the function*)
    END_VAR
    VAR
        I : INT; (**)
        J : INT; (**)
        stop : INT; (**)
    END_VAR
END_FUNCTION
