FUNCTION_BLOCK ASTRO
    VAR_INPUT
        m : REAL;
        AE : REAL;
        PC : REAL;
        LJ : REAL;
    END_VAR
    VAR_OUTPUT
        Ym : REAL;
        YAE : REAL;
        YPC : REAL;
        YLJ : REAL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION BFT_TO_MS : REAL
    VAR_INPUT
        BFT : INT;
    END_VAR
END_FUNCTION
FUNCTION C_TO_F : REAL
    VAR_INPUT
        celsius : REAL;
    END_VAR
END_FUNCTION
FUNCTION C_TO_K : REAL
    VAR_INPUT
        Celsius : REAL;
    END_VAR
END_FUNCTION
FUNCTION DEG_TO_DIR : BOOL
    VAR_INPUT
        DEG : INT;
        N : INT;
        L : INT;
    END_VAR
    VAR_IN_OUT
        retVal : STRING[3]; (*Return value of the function*)
    END_VAR
    VAR
        ly : INT;
    END_VAR
END_FUNCTION
FUNCTION DIR_TO_DEG : INT
    VAR_INPUT
        DIR : STRING[3];
        L : INT;
    END_VAR
    VAR
        ly : INT;
        i : INT;
    END_VAR
END_FUNCTION
FUNCTION_BLOCK ENERGY
    VAR_INPUT
        J : REAL;
        C : REAL;
        Wh : REAL;
    END_VAR
    VAR_OUTPUT
        YJ : REAL;
        YC : REAL;
        YWh : REAL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION F_TO_C : REAL
    VAR_INPUT
        fahrenheit : REAL;
    END_VAR
END_FUNCTION
FUNCTION F_TO_OM : REAL
    VAR_INPUT
        F : REAL;
    END_VAR
END_FUNCTION
FUNCTION F_TO_PT : TIME
    VAR_INPUT
        F : REAL;
    END_VAR
END_FUNCTION
FUNCTION GEO_TO_DEG : REAL
    VAR_INPUT
        D : INT;
        M : INT;
        SEC : REAL;
    END_VAR
END_FUNCTION
FUNCTION K_TO_C : REAL
    VAR_INPUT
        Kelvin : REAL;
    END_VAR
END_FUNCTION
FUNCTION KMH_TO_MS : REAL
    VAR_INPUT
        kmh : REAL;
    END_VAR
END_FUNCTION
FUNCTION_BLOCK LENGTH
    VAR_INPUT
        m : REAL;
        p : REAL;
        in : REAL;
        ft : REAL;
        yd : REAL;
        mile : REAL;
        sm : REAL;
        fm : REAL;
    END_VAR
    VAR_OUTPUT
        Ym : REAL;
        Yp : REAL;
        Yin : REAL;
        Yft : REAL;
        Yyd : REAL;
        Ymile : REAL;
        Ysm : REAL;
        Yfm : REAL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION MS_TO_BFT : INT
    VAR_INPUT
        MS : REAL;
    END_VAR
END_FUNCTION
FUNCTION MS_TO_KMH : REAL
    VAR_INPUT
        ms : REAL;
    END_VAR
END_FUNCTION
FUNCTION OM_TO_F : REAL
    VAR_INPUT
        OM : REAL;
    END_VAR
END_FUNCTION
FUNCTION_BLOCK PRESSURE
    VAR_INPUT
        mws : REAL;
        torr : REAL;
        att : REAL;
        atm : REAL;
        pa : REAL;
        bar : REAL;
    END_VAR
    VAR_OUTPUT
        Ymws : REAL;
        Ytorr : REAL;
        Yatt : REAL;
        Yatm : REAL;
        Ypa : REAL;
        Ybar : REAL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION PT_TO_F : REAL
    VAR_INPUT
        PT : TIME;
    END_VAR
END_FUNCTION
FUNCTION_BLOCK SPEED
    VAR_INPUT
        ms : REAL;
        kmh : REAL;
        kn : REAL;
        mh : REAL;
    END_VAR
    VAR_OUTPUT
        Yms : REAL;
        Ykmh : REAL;
        Ykn : REAL;
        Ymh : REAL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TEMPERATURE
    VAR_INPUT
        K : REAL;
        C : REAL := -273.15;
        F : REAL := -459.67;
        Re : REAL := -218.52;
        Ra : REAL;
    END_VAR
    VAR_OUTPUT
        YK : REAL;
        YC : REAL;
        YF : REAL;
        YRe : REAL;
        YRa : REAL;
    END_VAR
END_FUNCTION_BLOCK
