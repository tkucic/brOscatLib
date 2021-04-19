FUNCTION BAND_B : BYTE
    VAR_INPUT
        X : BYTE;
        B : BYTE;
    END_VAR
END_FUNCTION
FUNCTION_BLOCK CONTROL_SET1
    VAR_INPUT
        Kt : REAL;
        Tt : REAL;
        PI : BOOL;
        PID : BOOL;
        P_K : REAL := 0.5;
        PI_K : REAL := 0.45;
        PI_TN : REAL := 0.83;
        PID_K : REAL := 0.6;
        PID_TN : REAL := 0.5;
        PID_TV : REAL := 0.125;
    END_VAR
    VAR_OUTPUT
        KP : REAL;
        TN : REAL;
        TV : REAL;
        KI : REAL;
        KD : REAL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK CONTROL_SET2
    VAR_INPUT
        KS : REAL;
        TU : REAL;
        TG : REAL;
        PI : BOOL;
        PID : BOOL;
        P_K : REAL := 1;
        PI_K : REAL := 0.9;
        PI_TN : REAL := 3.33;
        PID_K : REAL := 1.2;
        PID_TN : REAL := 2;
        PID_TV : REAL := 0.5;
    END_VAR
    VAR_OUTPUT
        KP : REAL;
        TN : REAL;
        TV : REAL;
        KI : REAL;
        KD : REAL;
    END_VAR
    VAR
        TX : REAL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION CTRL_IN : REAL
    VAR_INPUT
        SET_POINT : REAL;
        ACTUAL : REAL;
        NOISE : REAL;
    END_VAR
END_FUNCTION
FUNCTION_BLOCK CTRL_OUT
    VAR_INPUT
        CI : REAL;
        OFFSET : REAL;
        MAN_IN : REAL;
        LIM_L : REAL;
        LIM_H : REAL;
        MANUAL : BOOL;
    END_VAR
    VAR_OUTPUT
        Y : REAL;
        LIM : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK CTRL_PI
    VAR_INPUT
        ACT : REAL;
        SET : REAL;
        SUP : REAL;
        OFS : REAL;
        M_I : REAL;
        MAN : BOOL;
        RST : BOOL;
        KP : REAL := 1;
        KI : REAL := 1;
        LL : REAL := -1000;
        LH : REAL := 1000;
    END_VAR
    VAR_OUTPUT
        Y : REAL;
        DIFF : REAL;
        LIM : BOOL;
    END_VAR
    VAR
        pi : FT_PIWL;
        co : CTRL_OUT;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK CTRL_PID
    VAR_INPUT
        ACT : REAL;
        SET : REAL;
        SUP : REAL;
        OFS : REAL;
        M_I : REAL;
        MAN : BOOL;
        RST : BOOL;
        KP : REAL := 1;
        TN : REAL := 1;
        TV : REAL := 1;
        LL : REAL := -1000;
        LH : REAL := 1000;
    END_VAR
    VAR_OUTPUT
        Y : REAL;
        DIFF : REAL;
        LIM : BOOL;
    END_VAR
    VAR
        pid : FT_PIDWL;
        co : CTRL_OUT;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK CTRL_PWM
    VAR_INPUT
        CI : REAL;
        MAN_IN : REAL;
        MANUAL : BOOL;
        F : REAL;
    END_VAR
    VAR_OUTPUT
        Q : BOOL;
    END_VAR
    VAR
        PW : PWM_DC;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION DEAD_BAND : REAL
    VAR_INPUT
        X : REAL;
        L : REAL;
    END_VAR
END_FUNCTION
FUNCTION_BLOCK DEAD_BAND_A
    VAR_INPUT
        X : REAL;
        T : TIME;
        KL : REAL := 1;
        LM : REAL;
    END_VAR
    VAR_OUTPUT
        Y : REAL;
        L : REAL;
    END_VAR
    VAR
        tp1 : FT_PT1;
        tp2 : FT_PT1;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION DEAD_ZONE : REAL
    VAR_INPUT
        X : REAL;
        L : REAL;
    END_VAR
END_FUNCTION
FUNCTION_BLOCK DEAD_ZONE2
    VAR_INPUT
        X : REAL;
        L : REAL;
    END_VAR
    VAR_OUTPUT
        Y : REAL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK FT_DERIV
    VAR_INPUT
        in : REAL;
        K : REAL := 1;
        run : BOOL := TRUE;
    END_VAR
    VAR_OUTPUT
        out : REAL;
    END_VAR
    VAR
        old : REAL;
        tx : DWORD;
        last : DWORD;
        init : BOOL;
        tc : REAL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK FT_IMP
    VAR_INPUT
        in : REAL;
        T : TIME;
        K : REAL := 1;
    END_VAR
    VAR_OUTPUT
        out : REAL;
    END_VAR
    VAR
        t1 : FT_PT1;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK FT_INT
    VAR_INPUT
        IN : REAL;
        K : REAL := 1;
        RUN : BOOL := TRUE;
        RST : BOOL;
        OUT_MIN : REAL := -1E+37;
        OUT_MAX : REAL := 1E+37;
    END_VAR
    VAR_OUTPUT
        OUT : REAL;
        LIM : BOOL;
    END_VAR
    VAR
        INTeg : INTEGRATE;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK FT_INT2
    VAR_INPUT
        IN : REAL;
        K : REAL := 1;
        RUN : BOOL := TRUE;
        RST : BOOL;
        OUT_MIN : REAL := -1E+38;
        OUT_MAX : REAL := 1E+38;
    END_VAR
    VAR_OUTPUT
        OUT : REAL;
        LIM : BOOL;
    END_VAR
    VAR
        integ : INTEGRATE;
        ix : REAL;
        val : REAL2;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK FT_PD
    VAR_INPUT
        IN : REAL;
        KP : REAL := 1;
        TV : REAL := 1;
    END_VAR
    VAR_OUTPUT
        Y : REAL;
    END_VAR
    VAR
        diff : FT_DERIV;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK FT_PDT1
    VAR_INPUT
        IN : REAL;
        KP : REAL := 1;
        TV : REAL := 1;
        T1 : REAL := 1;
    END_VAR
    VAR_OUTPUT
        Y : REAL;
    END_VAR
    VAR
        diff : FT_DERIV;
        TP : FT_PT1;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK FT_PI
    VAR_INPUT
        IN : REAL;
        KP : REAL := 1;
        KI : REAL := 1;
        ILIM_L : REAL := -1E+38;
        ILIM_H : REAL := 1E+38;
        IEN : BOOL := TRUE;
        RST : BOOL;
    END_VAR
    VAR_OUTPUT
        Y : REAL;
        LIM : BOOL;
    END_VAR
    VAR
        integ : FT_INT;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK FT_PID
    VAR_INPUT
        IN : REAL;
        KP : REAL := 1;
        TN : REAL := 1;
        TV : REAL := 1;
        ILIM_L : REAL := -1E+38;
        ILIM_H : REAL := 1E+38;
        IEN : BOOL := TRUE;
        RST : BOOL;
    END_VAR
    VAR_OUTPUT
        Y : REAL;
        LIM : BOOL;
    END_VAR
    VAR
        integ : FT_INT;
        diff : FT_DERIV;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK FT_PIDW
    VAR_INPUT
        IN : REAL;
        KP : REAL := 1;
        TN : REAL := 1;
        TV : REAL := 1;
        LIM_L : REAL := -1E+38;
        LIM_H : REAL := 1E+38;
        RST : BOOL;
    END_VAR
    VAR_OUTPUT
        Y : REAL;
        LIM : BOOL;
    END_VAR
    VAR
        integ : INTEGRATE;
        diff : FT_DERIV;
        YI : REAL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK FT_PIDWL
    VAR_INPUT
        IN : REAL;
        KP : REAL := 1;
        TN : REAL := 1;
        TV : REAL := 1;
        LIM_L : REAL := -1E+38;
        LIM_H : REAL := 1E+38;
        RST : BOOL;
    END_VAR
    VAR_OUTPUT
        Y : REAL;
        LIM : BOOL;
    END_VAR
    VAR
        piwl : FT_PIWL;
        diff : FT_DERIV;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK FT_PIW
    VAR_INPUT
        IN : REAL;
        KP : REAL := 1;
        KI : REAL := 1;
        LIM_L : REAL := -1E+38;
        LIM_H : REAL := 1E+38;
        RST : BOOL;
    END_VAR
    VAR_OUTPUT
        Y : REAL;
        LIM : BOOL;
    END_VAR
    VAR
        integ : FT_INT;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK FT_PIWL
    VAR_INPUT
        IN : REAL;
        KP : REAL := 1;
        KI : REAL := 1;
        LIM_L : REAL := -1E+38;
        LIM_H : REAL := 1E+38;
        RST : BOOL;
    END_VAR
    VAR_OUTPUT
        Y : REAL;
        LIM : BOOL;
    END_VAR
    VAR
        init : BOOL;
        tx : DWORD;
        tc : REAL;
        t_last : DWORD;
        in_last : REAL;
        i : REAL;
        p : REAL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK FT_PT1
    VAR_INPUT
        in : REAL;
        T : TIME;
        K : REAL := 1;
    END_VAR
    VAR_OUTPUT
        out : REAL;
    END_VAR
    VAR
        last : DWORD;
        tx : DWORD;
        init : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK FT_PT2
    VAR_INPUT
        in : REAL;
        T : TIME;
        D : REAL;
        K : REAL := 1;
    END_VAR
    VAR_OUTPUT
        out : REAL;
    END_VAR
    VAR
        init : BOOL;
        int1 : INTEGRATE;
        int2 : INTEGRATE;
        tn : REAL;
        I1 : REAL;
        I2 : REAL;
        tn2 : REAL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK FT_TN16
    VAR_INPUT
        in : REAL;
        T : TIME;
    END_VAR
    VAR_OUTPUT
        out : REAL;
        trig : BOOL;
    END_VAR
    VAR
        length : INT := 16;
        X : ARRAY[0..15] OF REAL;
        cnt : INT;
        last : TIME;
        tx : TIME;
        init : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK FT_TN64
    VAR_INPUT
        in : REAL;
        T : TIME;
    END_VAR
    VAR_OUTPUT
        out : REAL;
        trig : BOOL;
    END_VAR
    VAR
        length : INT := 64;
        X : ARRAY[0..63] OF REAL;
        cnt : INT;
        last : TIME;
        tx : TIME;
        init : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK FT_TN8
    VAR_INPUT
        in : REAL;
        T : TIME;
    END_VAR
    VAR_OUTPUT
        out : REAL;
        trig : BOOL;
    END_VAR
    VAR
        length : INT := 8;
        X : ARRAY[0..7] OF REAL;
        cnt : INT;
        last : TIME;
        tx : TIME;
        init : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK HYST
    VAR_INPUT
        In : REAL;
        ON : REAL;
        OFF : REAL;
    END_VAR
    VAR_OUTPUT
        Q : BOOL;
        win : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK HYST_1
    VAR_INPUT
        In : REAL;
        high : REAL;
        low : REAL;
    END_VAR
    VAR_OUTPUT
        Q : BOOL;
        win : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK HYST_2
    VAR_INPUT
        IN : REAL;
        VAL : REAL;
        HYS : REAL;
    END_VAR
    VAR_OUTPUT
        Q : BOOL;
        WIN : BOOL;
    END_VAR
    VAR
        tmp : REAL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK HYST_3
    VAR_INPUT
        in : REAL;
        hyst : REAL;
        val1 : REAL;
        val2 : REAL;
    END_VAR
    VAR_OUTPUT
        Q1 : BOOL;
        Q2 : BOOL;
    END_VAR
    VAR
        X : REAL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK INTEGRATE
    VAR_INPUT
        E : BOOL := TRUE;
        X : REAL;
        K : REAL := 1;
    END_VAR
    VAR_IN_OUT
        Y : REAL;
    END_VAR
    VAR
        X_last : REAL;
        init : BOOL;
        last : DWORD;
        tx : DWORD;
    END_VAR
END_FUNCTION_BLOCK
