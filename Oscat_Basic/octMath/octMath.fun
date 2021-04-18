FUNCTION ACOSH : BOOL
    VAR_INPUT
        X : REAL; (**)
    END_VAR
    VAR_OUTPUT
        retVal : REAL := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION ACOTH : BOOL
    VAR_INPUT
        X : REAL; (**)
    END_VAR
    VAR_OUTPUT
        retVal : REAL := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION AGDF : BOOL
    VAR_INPUT
        X : REAL; (**)
    END_VAR
    VAR_OUTPUT
        retVal : REAL := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION ASINH : BOOL
    VAR_INPUT
        X : REAL; (**)
    END_VAR
    VAR_OUTPUT
        retVal : REAL := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION ATAN2 : BOOL
    VAR_INPUT
        Y : REAL; (**)
        X : REAL; (**)
    END_VAR
    VAR_OUTPUT
        retVal : REAL := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION ATANH : BOOL
    VAR_INPUT
        X : REAL; (**)
    END_VAR
    VAR_OUTPUT
        retVal : REAL := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION BETA : BOOL
    VAR_INPUT
        X : REAL; (**)
        Y : REAL; (**)
    END_VAR
    VAR_OUTPUT
        retVal : REAL := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION BINOM : BOOL
    VAR_INPUT
        N : INT; (**)
        K : INT; (**)
    END_VAR
    VAR_OUTPUT
        retVal : DINT := ; (*Return value of the function*)
    END_VAR
    VAR
        i : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION CAUCHY : BOOL
    VAR_INPUT
        X : REAL; (**)
        T : REAL; (**)
        U : REAL; (**)
    END_VAR
    VAR_OUTPUT
        retVal : REAL := ; (*Return value of the function*)
    END_VAR
    VAR
        tmp : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION CAUCHYCD : BOOL
    VAR_INPUT
        X : REAL; (**)
        T : REAL; (**)
        U : REAL; (**)
    END_VAR
    VAR_OUTPUT
        retVal : REAL := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION CEIL : BOOL
    VAR_INPUT
        X : REAL; (**)
    END_VAR
    VAR_OUTPUT
        retVal : INT := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION CEIL2 : BOOL
    VAR_INPUT
        X : REAL; (**)
    END_VAR
    VAR_OUTPUT
        retVal : DINT := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION CMP : BOOL
    VAR_INPUT
        X : REAL; (**)
        Y : REAL; (**)
        N : INT; (**)
    END_VAR
    VAR_OUTPUT
        retVal : BOOL := ; (*Return value of the function*)
    END_VAR
    VAR
        tmp : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION COSH : BOOL
    VAR_INPUT
        X : REAL; (**)
    END_VAR
    VAR_OUTPUT
        retVal : REAL := ; (*Return value of the function*)
    END_VAR
    VAR
        t : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION COTH : BOOL
    VAR_INPUT
        X : REAL; (**)
    END_VAR
    VAR_OUTPUT
        retVal : REAL := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION D_TRUNC : BOOL
    VAR_INPUT
        X : REAL; (**)
    END_VAR
    VAR_OUTPUT
        retVal : DINT := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION DEC1 : BOOL
    VAR_INPUT
        X : INT; (**)
        N : INT; (**)
    END_VAR
    VAR_OUTPUT
        retVal : INT := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION DEG : BOOL
    VAR_INPUT
        rad : REAL; (**)
    END_VAR
    VAR_OUTPUT
        retVal : REAL := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION DIFFER : BOOL
    VAR_INPUT
        in1 : REAL; (**)
        in2 : REAL; (**)
        X : REAL; (**)
    END_VAR
    VAR_OUTPUT
        retVal : BOOL := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION ERF : BOOL
    VAR_INPUT
        X : REAL; (**)
    END_VAR
    VAR_OUTPUT
        retVal : REAL := ; (*Return value of the function*)
    END_VAR
    VAR
        x2 : REAL; (**)
        ax2 : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION ERFC : BOOL
    VAR_INPUT
        X : REAL; (**)
    END_VAR
    VAR_OUTPUT
        retVal : REAL := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION EVEN : BOOL
    VAR_INPUT
        in : DINT; (**)
    END_VAR
    VAR_OUTPUT
        retVal : BOOL := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION EXP10 : BOOL
    VAR_INPUT
        X : REAL; (**)
    END_VAR
    VAR_OUTPUT
        retVal : REAL := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION EXPN : BOOL
    VAR_INPUT
        X : REAL; (**)
        N : INT; (**)
    END_VAR
    VAR_OUTPUT
        retVal : REAL := ; (*Return value of the function*)
    END_VAR
    VAR
        sign : BOOL; (**)
    END_VAR
END_FUNCTION
FUNCTION FACT : BOOL
    VAR_INPUT
        X : INT; (**)
    END_VAR
    VAR_OUTPUT
        retVal : DINT := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION FIB : BOOL
    VAR_INPUT
        X : INT; (**)
    END_VAR
    VAR_OUTPUT
        retVal : DINT := ; (*Return value of the function*)
    END_VAR
    VAR
        t1 : DINT; (**)
        t2 : DINT; (**)
    END_VAR
END_FUNCTION
FUNCTION FLOOR : BOOL
    VAR_INPUT
        X : REAL; (**)
    END_VAR
    VAR_OUTPUT
        retVal : INT := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION FLOOR2 : BOOL
    VAR_INPUT
        X : REAL; (**)
    END_VAR
    VAR_OUTPUT
        retVal : DINT := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION FRACT : BOOL
    VAR_INPUT
        x : REAL; (**)
    END_VAR
    VAR_OUTPUT
        retVal : REAL := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION GAMMA : BOOL
    VAR_INPUT
        X : REAL; (**)
    END_VAR
    VAR_OUTPUT
        retVal : REAL := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION GAUSS : BOOL
    VAR_INPUT
        X : REAL; (**)
        U : REAL; (**)
        SI : REAL; (**)
    END_VAR
    VAR_OUTPUT
        retVal : REAL := ; (*Return value of the function*)
    END_VAR
    VAR
        temp : REAL; (**)
        si_inv : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION GAUSSCD : BOOL
    VAR_INPUT
        X : REAL; (**)
        U : REAL; (**)
        SI : REAL; (**)
    END_VAR
    VAR_OUTPUT
        retVal : REAL := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION GCD : BOOL
    VAR_INPUT
        A : DINT; (**)
        B : DINT; (**)
    END_VAR
    VAR_OUTPUT
        retVal : INT := ; (*Return value of the function*)
    END_VAR
    VAR
        t : DINT; (**)
    END_VAR
END_FUNCTION
FUNCTION GDF : BOOL
    VAR_INPUT
        X : REAL; (**)
    END_VAR
    VAR_OUTPUT
        retVal : REAL := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION GOLD : BOOL
    VAR_INPUT
        X : REAL; (**)
    END_VAR
    VAR_OUTPUT
        retVal : REAL := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION HYPOT : BOOL
    VAR_INPUT
        X : REAL; (**)
        Y : REAL; (**)
    END_VAR
    VAR_OUTPUT
        retVal : REAL := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION INC : BOOL
    VAR_INPUT
        X : INT; (**)
        D : INT; (**)
        M : INT; (**)
    END_VAR
    VAR_OUTPUT
        retVal : INT := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION INC1 : BOOL
    VAR_INPUT
        X : INT; (**)
        N : INT; (**)
    END_VAR
    VAR_OUTPUT
        retVal : INT := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION INC2 : BOOL
    VAR_INPUT
        X : INT; (**)
        D : INT; (**)
        L : INT; (**)
        U : INT; (**)
    END_VAR
    VAR_OUTPUT
        retVal : INT := ; (*Return value of the function*)
    END_VAR
    VAR
        tmp : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION INV : BOOL
    VAR_INPUT
        X : REAL; (**)
    END_VAR
    VAR_OUTPUT
        retVal : REAL := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION LAMBERT_W : BOOL
    VAR_INPUT
        X : REAL; (**)
    END_VAR
    VAR_OUTPUT
        retVal : REAL := ; (*Return value of the function*)
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
FUNCTION LANGEVIN : BOOL
    VAR_INPUT
        X : REAL; (**)
    END_VAR
    VAR_OUTPUT
        retVal : REAL := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION MAX3 : BOOL
    VAR_INPUT
        in1 : REAL; (**)
        in2 : REAL; (**)
        in3 : REAL; (**)
    END_VAR
    VAR_OUTPUT
        retVal : REAL := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION MID3 : BOOL
    VAR_INPUT
        IN1 : REAL; (**)
        IN2 : REAL; (**)
        IN3 : REAL; (**)
    END_VAR
    VAR_OUTPUT
        retVal : REAL := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION MIN3 : BOOL
    VAR_INPUT
        in1 : REAL; (**)
        in2 : REAL; (**)
        in3 : REAL; (**)
    END_VAR
    VAR_OUTPUT
        retVal : REAL := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION MODR : BOOL
    VAR_INPUT
        IN : REAL; (**)
        DIVI : REAL; (**)
    END_VAR
    VAR_OUTPUT
        retVal : REAL := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION MUL_ADD : BOOL
    VAR_INPUT
        X : REAL; (**)
        K : REAL; (**)
        O : REAL; (**)
    END_VAR
    VAR_OUTPUT
        retVal : REAL := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION NEGX : BOOL
    VAR_INPUT
        X : REAL; (**)
    END_VAR
    VAR_OUTPUT
        retVal : REAL := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION RAD : BOOL
    VAR_INPUT
        DEG : REAL; (**)
    END_VAR
    VAR_OUTPUT
        retVal : REAL := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION RDM : BOOL
    VAR_INPUT
        last : REAL; (**)
    END_VAR
    VAR_OUTPUT
        retVal : REAL := ; (*Return value of the function*)
    END_VAR
    VAR
        tn : DWORD; (**)
        tc : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION RDM2 : BOOL
    VAR_INPUT
        last : INT; (**)
        low : INT; (**)
        high : INT; (**)
    END_VAR
    VAR_OUTPUT
        retVal : INT := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION RDMDW : BOOL
    VAR_INPUT
        last : DWORD; (**)
    END_VAR
    VAR_OUTPUT
        retVal : DWORD := ; (*Return value of the function*)
    END_VAR
    VAR
        RX : REAL; (**)
        M : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION REAL_TO_FRAC : BOOL
    VAR_INPUT
        X : REAL; (* in einen Bruch umzuwandelnder Wert *)
        N : INT; (* maximale Größe des Nenners *)
    END_VAR
    VAR_OUTPUT
        retVal : FRACTION := ; (*Return value of the function*)
    END_VAR
    VAR
        temp : DINT; (* Merker für Berechnungen *)
        sign : BOOL; (* Vorzeichen vom Eingangswert *)
        X_gerundet : DINT; (* Wert von Bruch, auf ganze Zahl gerundet *)
        X_ohne_Nachkomma : REAL; (* Wert von Bruch, ohne Nachkommastellen *)
        Numerator : DINT := 1; (* Initialwert Zaehler  *)
        Denominator : DINT := 0; (* Initialwert Nenner *)
        Numerator_old : DINT := 0; (* Initialwert Zaehler der letzten Berechnung  *)
        Denominator_old : DINT := 1; (* Initialwert Zaehler der letzten Berechnung   *)
    END_VAR
END_FUNCTION
FUNCTION RND : BOOL
    VAR_INPUT
        X : REAL; (**)
        N : INT; (**)
    END_VAR
    VAR_OUTPUT
        retVal : REAL := ; (*Return value of the function*)
    END_VAR
    VAR
        M : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION ROUND : BOOL
    VAR_INPUT
        in : REAL; (**)
        N : INT; (**)
    END_VAR
    VAR_OUTPUT
        retVal : REAL := ; (*Return value of the function*)
    END_VAR
    VAR
        X : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION SGN : BOOL
    VAR_INPUT
        X : REAL; (**)
    END_VAR
    VAR_OUTPUT
        retVal : INT := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION SIGMOID : BOOL
    VAR_INPUT
        X : REAL; (**)
    END_VAR
    VAR_OUTPUT
        retVal : REAL := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION SIGN_I : BOOL
    VAR_INPUT
        IN : DINT; (**)
    END_VAR
    VAR_OUTPUT
        retVal : BOOL := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION SIGN_R : BOOL
    VAR_INPUT
        in : REAL; (**)
    END_VAR
    VAR_OUTPUT
        retVal : BOOL := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION SINC : BOOL
    VAR_INPUT
        X : REAL; (**)
    END_VAR
    VAR_OUTPUT
        retVal : REAL := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION SINH : BOOL
    VAR_INPUT
        X : REAL; (**)
    END_VAR
    VAR_OUTPUT
        retVal : REAL := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION SQRTN : BOOL
    VAR_INPUT
        X : REAL; (**)
        N : INT; (**)
    END_VAR
    VAR_OUTPUT
        retVal : REAL := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION TANC : BOOL
    VAR_INPUT
        X : REAL; (**)
    END_VAR
    VAR_OUTPUT
        retVal : REAL := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION TANH : BOOL
    VAR_INPUT
        X : REAL; (**)
    END_VAR
    VAR_OUTPUT
        retVal : REAL := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION WINDOW : BOOL
    VAR_INPUT
        low : REAL; (**)
        in : REAL; (**)
        high : REAL; (**)
    END_VAR
    VAR_OUTPUT
        retVal : BOOL := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION WINDOW2 : BOOL
    VAR_INPUT
        LOW : REAL; (**)
        IN : REAL; (**)
        HIGH : REAL; (**)
    END_VAR
    VAR_OUTPUT
        retVal : BOOL := ; (*Return value of the function*)
    END_VAR
END_FUNCTION
