FUNCTION ACOSH : REAL
    VAR_INPUT
        X : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION ACOTH : REAL
    VAR_INPUT
        X : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION AGDF : REAL
    VAR_INPUT
        X : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION ASINH : REAL
    VAR_INPUT
        X : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION ATAN2 : REAL
    VAR_INPUT
        Y : REAL; (**)
        X : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION ATANH : REAL
    VAR_INPUT
        X : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION BETA : REAL
    VAR_INPUT
        X : REAL; (**)
        Y : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION BINOM : DINT
    VAR_INPUT
        N : INT; (**)
        K : INT; (**)
    END_VAR
    VAR
        i : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION CAUCHY : REAL
    VAR_INPUT
        X : REAL; (**)
        T : REAL; (**)
        U : REAL; (**)
    END_VAR
    VAR
        tmp : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION CAUCHYCD : REAL
    VAR_INPUT
        X : REAL; (**)
        T : REAL; (**)
        U : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION CEIL : INT
    VAR_INPUT
        X : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION CEIL2 : DINT
    VAR_INPUT
        X : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION CMP : BOOL
    VAR_INPUT
        X : REAL; (**)
        Y : REAL; (**)
        N : INT; (**)
    END_VAR
    VAR
        tmp : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION COSH : REAL
    VAR_INPUT
        X : REAL; (**)
    END_VAR
    VAR
        t : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION COTH : REAL
    VAR_INPUT
        X : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION D_TRUNC : DINT
    VAR_INPUT
        X : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION DEC1 : INT
    VAR_INPUT
        X : INT; (**)
        N : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION DEG : REAL
    VAR_INPUT
        rad : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION DIFFER : BOOL
    VAR_INPUT
        in1 : REAL; (**)
        in2 : REAL; (**)
        X : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION ERF : REAL
    VAR_INPUT
        X : REAL; (**)
    END_VAR
    VAR
        x2 : REAL; (**)
        ax2 : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION ERFC : REAL
    VAR_INPUT
        X : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION EVEN : BOOL
    VAR_INPUT
        in : DINT; (**)
    END_VAR
END_FUNCTION
FUNCTION EXP10 : REAL
    VAR_INPUT
        X : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION EXPN : REAL
    VAR_INPUT
        X : REAL; (**)
        N : INT; (**)
    END_VAR
    VAR
        sign : BOOL; (**)
    END_VAR
END_FUNCTION
FUNCTION FACT : DINT
    VAR_INPUT
        X : INT; (**)
    END_VAR
    VAR
        i : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION FIB : DINT
    VAR_INPUT
        X : INT; (**)
    END_VAR
    VAR
        t1 : DINT; (**)
        t2 : DINT; (**)
    END_VAR
END_FUNCTION
FUNCTION FLOOR : INT
    VAR_INPUT
        X : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION FLOOR2 : DINT
    VAR_INPUT
        X : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION FRACT : REAL
    VAR_INPUT
        x : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION GAMMA : REAL
    VAR_INPUT
        X : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION GAUSS : REAL
    VAR_INPUT
        X : REAL; (**)
        U : REAL; (**)
        SI : REAL; (**)
    END_VAR
    VAR
        temp : REAL; (**)
        si_inv : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION GAUSSCD : REAL
    VAR_INPUT
        X : REAL; (**)
        U : REAL; (**)
        SI : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION GCD : INT
    VAR_INPUT
        A : DINT; (**)
        B : DINT; (**)
    END_VAR
    VAR
        t : DINT; (**)
    END_VAR
END_FUNCTION
FUNCTION GDF : REAL
    VAR_INPUT
        X : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION GOLD : REAL
    VAR_INPUT
        X : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION HYPOT : REAL
    VAR_INPUT
        X : REAL; (**)
        Y : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION INC : INT
    VAR_INPUT
        X : INT; (**)
        D : INT; (**)
        M : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION INC1 : INT
    VAR_INPUT
        X : INT; (**)
        N : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION INC2 : INT
    VAR_INPUT
        X : INT; (**)
        D : INT; (**)
        L : INT; (**)
        U : INT; (**)
    END_VAR
    VAR
        tmp : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION INV : REAL
    VAR_INPUT
        X : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION LAMBERT_W : REAL
    VAR_INPUT
        X : REAL; (**)
    END_VAR
    VAR
        w : REAL; (**)
        i : INT; (**)
        we : REAL; (**)
        w1e : REAL; (**)
        last : DWORD; (**)
        ewx : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION LANGEVIN : REAL
    VAR_INPUT
        X : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION MAX3 : REAL
    VAR_INPUT
        in1 : REAL; (**)
        in2 : REAL; (**)
        in3 : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION MID3 : REAL
    VAR_INPUT
        in1 : REAL; (**)
        in2 : REAL; (**)
        in3 : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION MIN3 : REAL
    VAR_INPUT
        in1 : REAL; (**)
        in2 : REAL; (**)
        in3 : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION MODR : REAL
    VAR_INPUT
        IN : REAL; (**)
        DIVI : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION MUL_ADD : REAL
    VAR_INPUT
        X : REAL; (**)
        K : REAL; (**)
        O : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION NEGX : REAL
    VAR_INPUT
        X : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION RAD : REAL
    VAR_INPUT
        deg : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION RDM : REAL
    VAR_INPUT
        last : REAL; (**)
    END_VAR
    VAR
        tn : DWORD; (**)
        tc : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION RDM2 : INT
    VAR_INPUT
        last : INT; (**)
        low : INT; (**)
        high : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION RDMDW : DWORD
    VAR_INPUT
        last : DWORD; (**)
    END_VAR
    VAR
        RX : REAL; (**)
        M : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION REAL_TO_FRAC : FRACTION
    VAR_INPUT
        X : REAL; (* input value *)
        N : INT; (* higest number of denominator *)
    END_VAR
    VAR
        m : ARRAY[0..1, 0..1] OF DINT; (**)
        t : DINT; (**)
        ai : DINT; (**)
        sign : BOOL; (**)
    END_VAR
END_FUNCTION
FUNCTION RND : REAL
    VAR_INPUT
        X : REAL; (**)
        N : INT; (**)
    END_VAR
    VAR
        M : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION ROUND : REAL
    VAR_INPUT
        in : REAL; (**)
        N : INT; (**)
    END_VAR
    VAR
        X : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION SGN : INT
    VAR_INPUT
        X : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION SIGMOID : REAL
    VAR_INPUT
        X : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION SIGN_I : BOOL
    VAR_INPUT
        IN : DINT; (**)
    END_VAR
END_FUNCTION
FUNCTION SIGN_R : BOOL
    VAR_INPUT
        in : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION SINC : REAL
    VAR_INPUT
        X : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION SINH : REAL
    VAR_INPUT
        X : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION SQRTN : REAL
    VAR_INPUT
        X : REAL; (**)
        N : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION TANC : REAL
    VAR_INPUT
        X : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION TANH : REAL
    VAR_INPUT
        X : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION WINDOW : BOOL
    VAR_INPUT
        low : REAL; (**)
        in : REAL; (**)
        high : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION WINDOW2 : BOOL
    VAR_INPUT
        low : REAL; (**)
        in : REAL; (**)
        high : REAL; (**)
    END_VAR
END_FUNCTION
