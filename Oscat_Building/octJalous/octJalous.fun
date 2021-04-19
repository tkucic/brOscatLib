FUNCTION_BLOCK BLIND_ACTUATOR
    VAR_INPUT
        UP : BOOL;
        DN : BOOL;
        S_IN : BYTE;
        T_UD : TIME := TIME#10s0ms;
        T_ANGLE : TIME := TIME#3s0ms;
        T_LOCKOUT : TIME := TIME#100ms;
    END_VAR
    VAR_OUTPUT
        POS : BYTE;
        ANG : BYTE;
        QU : BOOL;
        QD : BOOL;
        STATUS : BYTE;
    END_VAR
    VAR
        position : RMP_B;
        angle : RMP_B;
        lock : INTERLOCK;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK BLIND_CONTROL
    VAR_INPUT
        UP : BOOL;
        DN : BOOL;
        S_IN : BYTE;
        PI : BYTE;
        AI : BYTE;
        T_UD : TIME;
        T_ANGLE : TIME;
        SENS : BYTE := 5;
        T_LOCKOUT : TIME := TIME#100ms;
    END_VAR
    VAR_OUTPUT
        POS : BYTE;
        ANG : BYTE;
        MU : BOOL;
        MD : BOOL;
        STATUS : BYTE;
    END_VAR
    VAR
        act : BLIND_ACTUATOR;
        delta : BYTE;
        bTimeTest : BOOL := FALSE;
        iPos : BYTE;
        iAngel : BYTE;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK BLIND_CONTROL_S
    VAR_INPUT
        UP : BOOL;
        DN : BOOL;
        S_IN : BYTE := 125;
        PI : BYTE;
        T_UP : TIME;
        T_DN : TIME;
        RU : BOOL;
        RD : BOOL;
        T_LOCKOUT : TIME := TIME#100ms;
        T_EXT : TIME;
        EXT_TRIG : BYTE := 5;
        R_POS_TOP : BYTE := 255;
        R_POS_BOT : BYTE;
    END_VAR
    VAR_OUTPUT
        POS : BYTE;
        MU : BOOL;
        MD : BOOL;
        STATUS : BYTE;
    END_VAR
    VAR
        rmp : _RMP_NEXT;
        tx : TIME;
        last : TIME;
        PI_last : BYTE;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK BLIND_INPUT
    VAR_INPUT
        POS : BYTE;
        ANG : BYTE;
        S1 : BOOL;
        S2 : BOOL;
        IN : BOOL;
        PI : BYTE;
        AI : BYTE;
        SINGLE_SWITCH : BOOL;
        CLICK_EN : BOOL := TRUE;
        CLICK_TIME : TIME := TIME#500ms;
        MAX_RUNTIME : TIME := TIME#1m0s0ms;
        MANUAL_TIMEOUT : TIME := TIME#60m0s0ms;
        DEBOUNCE_TIME : TIME := TIME#20ms;
        DBL_CLK1 : BOOL := FALSE;
        DBL_POS1 : BYTE;
        DBL_ANG1 : BYTE;
        DBL_CLK2 : BOOL := FALSE;
        DBL_POS2 : BYTE := 255;
        DBL_ANG2 : BYTE := 255;
        D1_TOGGLE : BOOL := TRUE;
        D2_TOGGLE : BOOL := TRUE;
        MASTER_MODE : BOOL;
    END_VAR
    VAR_OUTPUT
        QU : BOOL := TRUE;
        QD : BOOL := TRUE;
        STATUS : BYTE;
        PO : BYTE := 255;
        AO : BYTE := 255;
        D1 : BOOL;
        D2 : BOOL;
    END_VAR
    VAR
        s1e : TOF;
        s2e : TOF;
        s1d : CLICK_MODE;
        s2d : CLICK_MODE;
        dir : BOOL;
        tx : TIME;
        last : TIME;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK BLIND_NIGHT
    VAR_INPUT
        UP : BOOL;
        DN : BOOL;
        S_IN : BYTE;
        PI : BYTE;
        AI : BYTE;
        E_NIGHT : BOOL := TRUE;
        E_DAY : BOOL := TRUE;
        DTIN : DT;
        SUNRISE : TOD;
        SUNSET : TOD;
        SUNRISE_OFFSET : TIME;
        SUNSET_OFFSET : TIME;
        NIGHT_POSITION : BYTE;
        NIGHT_ANGLE : BYTE;
    END_VAR
    VAR_OUTPUT
        QU : BOOL;
        QD : BOOL;
        STATUS : BYTE;
        PO : BYTE;
        AO : BYTE;
    END_VAR
    VAR
        night : BOOL;
        last_night : DATE;
        last_day : DATE;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK BLIND_SCENE
    VAR_INPUT
        UP : BOOL;
        DN : BOOL;
        S_IN : BYTE;
        PI : BYTE;
        AI : BYTE;
        ENABLE : BOOL;
        SWRITE : BOOL;
        SCENE : BYTE;
    END_VAR
    VAR_OUTPUT
        QU : BOOL;
        QD : BOOL;
        STATUS : BYTE;
        PO : BYTE;
        AO : BYTE;
    END_VAR
    VAR
        sx : ARRAY[0..15, 0..2] OF BYTE;
        x : BYTE;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK BLIND_SECURITY
    VAR_INPUT
        UP : BOOL;
        DN : BOOL;
        S_IN : BYTE;
        PI : BYTE;
        AI : BYTE;
        FIRE : BOOL;
        WIND : BOOL;
        ALARM : BOOL;
        DOOR : BOOL;
        RAIN : BOOL;
        Alarm_UP : BOOL := TRUE;
        WIND_UP : BOOL := TRUE;
        RAIN_UP : BOOL := FALSE;
    END_VAR
    VAR_OUTPUT
        QU : BOOL;
        QD : BOOL;
        STATUS : BYTE;
        PO : BYTE;
        AO : BYTE;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK BLIND_SET
    VAR_INPUT
        UP : BOOL;
        DN : BOOL;
        S_IN : BYTE;
        PI : BYTE;
        AI : BYTE;
        IN : BOOL;
        PX : BYTE;
        AX : BYTE;
        OVERRIDE_MANUAL : BOOL;
        RESTORE_POSITION : BOOL;
        RESTORE_TIME : TIME := TIME#1m0s0ms;
    END_VAR
    VAR_OUTPUT
        QU : BOOL;
        QD : BOOL;
        STATUS : BYTE;
        PO : BYTE;
        AO : BYTE;
    END_VAR
    VAR
        tx : TIME;
        ps : BYTE;
        as : BYTE;
        last : TIME;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK BLIND_SHADE
    VAR_INPUT
        UP : BOOL;
        DN : BOOL;
        S_IN : BYTE;
        PI : BYTE;
        AI : BYTE;
        ENABLE : BOOL;
        SUN : BOOL;
    END_VAR
    VAR_OUTPUT
        QU : BOOL;
        QD : BOOL;
        STATUS : BYTE;
        PO : BYTE;
        AO : BYTE;
    END_VAR
    VAR_IN_OUT
        CX : CALENDAR;
    END_VAR
    VAR
        angle : REAL;
        sun_delay : TOF;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK BLIND_SHADE_S
    VAR_INPUT
        UP : BOOL;
        DN : BOOL;
        S_IN : BYTE;
        PI : BYTE;
        ENABLE : BOOL;
        SUN : BOOL;
        HORZ1 : REAL := 100;
        HORZ2 : REAL := 260;
        VERT : REAL := 90;
        ALERT : BOOL := FALSE;
    END_VAR
    VAR_OUTPUT
        QU : BOOL;
        QD : BOOL;
        STATUS : BYTE;
        PO : BYTE;
    END_VAR
    VAR_IN_OUT
        CX : calendar;
    END_VAR
    VAR
        sun_delay : TOF;
    END_VAR
END_FUNCTION_BLOCK
