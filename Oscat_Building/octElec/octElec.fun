FUNCTION_BLOCK CLICK
    VAR_INPUT
        in : BOOL; (**)
    END_VAR
    VAR_OUTPUT
        Q : BOOL; (**)
        single : BOOL; (**)
        double : BOOL; (**)
        triple : BOOL; (**)
        status : BYTE; (**)
    END_VAR
    VAR
        s_in : SW_RECONFIG; (**)
        tx : TIME; (**)
        state : INT; (**)
        last : TIME; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK CLICK_MODE
    VAR_INPUT
        IN : BOOL; (**)
    END_VAR
    VAR_OUTPUT
        SINGLE : BOOL; (**)
        DOUBLE : BOOL; (**)
        LONG : BOOL; (**)
        TP_LONG : BOOL; (**)
    END_VAR
    VAR
        Timer : OSCAT_BASIC.TP; (**)
        cnt : INT; (**)
        last : BOOL; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK DEBOUNCE
    VAR_INPUT
        IN : BOOL; (**)
        TD : TIME; (**)
        PM : BOOL; (**)
    END_VAR
    VAR_OUTPUT
        Q : BOOL; (**)
    END_VAR
    VAR
        deb : OSCAT_BASIC.TOF; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK DIMM_2
    VAR_INPUT
        SET : BOOL; (**)
        VAL : BYTE := 255; (**)
        I1 : BOOL; (**)
        I2 : BOOL; (**)
        RST : BOOL; (**)
        T_DEBOUNCE : TIME := TIME#10ms; (**)
        T_ON_MAX : TIME := TIME#0ms; (**)
        T_DIMM_START : TIME := TIME#1s0ms; (**)
        T_DIMM : TIME := TIME#3s0ms; (**)
        MIN_ON : BYTE := 50; (**)
        MAX_ON : BYTE := 255; (**)
        RST_OUT : BOOL := TRUE; (**)
        SOFT_DIMM : BOOL := TRUE; (**)
        DBL1_TOG : BOOL; (**)
        DBL2_TOG : BOOL; (**)
        DBL1_SET : BOOL; (**)
        DBL2_SET : BOOL; (**)
        DBL1_POS : BYTE; (**)
        DBL2_POS : BYTE; (**)
    END_VAR
    VAR_OUTPUT
        Q : BOOL := FALSE; (**)
        D1 : BOOL; (**)
        D2 : BOOL; (**)
    END_VAR
    VAR_IN_OUT
        OUT : BYTE; (**)
    END_VAR
    VAR
        t1 : OSCAT_BASIC.TOF; (**)
        t2 : OSCAT_BASIC.TOF; (**)
        dc1 : CLICK_MODE; (**)
        dc2 : CLICK_MODE; (**)
        t3 : OSCAT_BASIC.TON; (**)
        dim : OSCAT_BASIC._RMP_B; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK DIMM_I
    VAR_INPUT
        SET : BOOL; (**)
        VAL : BYTE := 255; (**)
        IN : BOOL; (**)
        RST : BOOL; (**)
        T_DEBOUNCE : TIME := TIME#10ms; (**)
        T_RECONFIG : TIME := TIME#10s0ms; (**)
        T_ON_MAX : TIME := TIME#0ms; (**)
        T_DIMM_START : TIME := TIME#1s0ms; (**)
        T_DIMM : TIME := TIME#3s0ms; (**)
        MIN_ON : BYTE := 50; (**)
        MAX_ON : BYTE := 255; (**)
        SOFT_DIMM : BOOL := TRUE; (**)
        DBL_toggle : BOOL; (**)
        RST_OUT : BOOL; (**)
    END_VAR
    VAR_OUTPUT
        Q : BOOL := FALSE; (**)
        DBL : BOOL; (**)
    END_VAR
    VAR_IN_OUT
        OUT : BYTE; (**)
    END_VAR
    VAR
        config : SW_RECONFIG; (**)
        decode : CLICK_MODE; (**)
        t3 : OSCAT_BASIC.TON; (**)
        dim : OSCAT_BASIC._RMP_B; (**)
        dir : BOOL; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK F_LAMP
    VAR_INPUT
        SWITCH : BOOL; (**)
        DIMM : BYTE := 255; (**)
        RST : BOOL; (**)
    END_VAR
    VAR_OUTPUT
        LAMP : BYTE; (**)
        STATUS : BYTE; (**)
    END_VAR
    VAR_IN_OUT
        ONTIME : UDINT; (**)
        CYCLES : UDINT; (**)
    END_VAR
    VAR
        runtime : OSCAT_BASIC.ONTIME; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK PULSE_LENGTH
    VAR_INPUT
        in : BOOL; (**)
    END_VAR
    VAR_OUTPUT
        short : BOOL; (**)
        middle : BOOL; (**)
        long : BOOL; (**)
    END_VAR
    VAR
        tx : TIME; (**)
        tn : TIME; (**)
        edge : BOOL; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK PULSE_T
    VAR_INPUT
        IN : BOOL; (**)
        T1 : TIME; (**)
        T2 : TIME; (**)
        RST : BOOL; (**)
    END_VAR
    VAR_OUTPUT
        Q : BOOL; (**)
    END_VAR
    VAR
        init : BOOL; (**)
        last : TIME; (**)
        tx : TIME; (**)
        edge : BOOL; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK SW_RECONFIG
    VAR_INPUT
        IN : BOOL; (**)
        TD : TIME; (**)
        TR : TIME; (**)
    END_VAR
    VAR_OUTPUT
        Q : BOOL; (**)
    END_VAR
    VAR
        T1 : OSCAT_BASIC.TON; (**)
        T2 : OSCAT_BASIC.TON; (**)
        INV : BOOL; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK SWITCH_I
    VAR_INPUT
        set : BOOL; (**)
        in : BOOL; (**)
        rst : BOOL; (**)
        T_debounce : TIME := TIME#10ms; (**)
        T_reconfig : TIME := TIME#1s0ms; (**)
        T_on_max : TIME := TIME#0ms; (**)
    END_VAR
    VAR_OUTPUT
        Q : BOOL; (**)
    END_VAR
    VAR
        state : BYTE; (**)
        edge : BOOL; (**)
        r_edge : BOOL; (**)
        T_on : TIME; (**)
        tx : TIME; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK SWITCH_X
    VAR_INPUT
        IN1 : BOOL; (**)
        IN2 : BOOL; (**)
        IN3 : BOOL; (**)
        IN4 : BOOL; (**)
        IN5 : BOOL; (**)
        IN6 : BOOL; (**)
    END_VAR
    VAR_OUTPUT
        Q1 : BOOL; (**)
        Q2 : BOOL; (**)
        Q3 : BOOL; (**)
        Q4 : BOOL; (**)
        Q5 : BOOL; (**)
        Q6 : BOOL; (**)
        Q31 : BOOL; (**)
        Q41 : BOOL; (**)
        Q51 : BOOL; (**)
        Q61 : BOOL; (**)
        Q32 : BOOL; (**)
        Q42 : BOOL; (**)
        Q52 : BOOL; (**)
        Q62 : BOOL; (**)
    END_VAR
    VAR
        init : BOOL; (**)
        T1 : OSCAT_BASIC.TOF; (**)
        T2 : OSCAT_BASIC.TOF; (**)
        T3 : OSCAT_BASIC.TOF; (**)
        T4 : OSCAT_BASIC.TOF; (**)
        T5 : OSCAT_BASIC.TOF; (**)
        T6 : OSCAT_BASIC.TOF; (**)
        tx : TIME; (**)
        x1 : BOOL; (**)
        x2 : BOOL; (**)
        E1 : BOOL; (**)
        E2 : BOOL; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TIMER_1
    VAR_INPUT
        E : BOOL := TRUE; (**)
        DTI : DT; (**)
        START : TOD; (**)
        DURATION : TIME; (**)
        DAY : BYTE := 2#1111111; (**)
    END_VAR
    VAR_OUTPUT
        Q : BOOL; (**)
        stop : TIME; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TIMER_2
    VAR_INPUT
        DT_in : DT; (**)
        start : TOD; (**)
        duration : TIME; (**)
        mode : BYTE; (**)
        HOLIDAY : BOOL; (**)
    END_VAR
    VAR_OUTPUT
        Q : BOOL; (**)
    END_VAR
    VAR
        run_date : DATE; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION TIMER_EVENT_DECODE : OSCAT_BASIC.TIMER_EVENT
    VAR_INPUT
        EVENT : STRING[OSCAT_BASIC.STRING_LENGTH]; (**)
        LANG : INT; (**)
    END_VAR
    VAR
        pos : INT; (**)
        start : INT; (**)
        stop : INT; (**)
        pt : REFERENCE TO ARRAY[1..255] OF BYTE; (**)
        step : INT; (**)
        tmp : STRING[60]; (**)
    END_VAR
END_FUNCTION
FUNCTION_BLOCK TIMER_EXT
    VAR_INPUT
        ENA : BOOL := TRUE; (**)
        ON : BOOL; (**)
        OFF : BOOL; (**)
        MAN : BOOL; (**)
        SWITCH : BOOL; (**)
        DT_IN : DT; (**)
        SUN_RISE : TOD; (**)
        SUN_SET : TOD; (**)
        HOLIDAY : BOOL; (**)
        T_DEBOUNCE : TIME := TIME#100ms; (**)
        T_RISE_START : TIME; (**)
        T_RISE_STOP : TIME; (**)
        T_SET_START : TIME; (**)
        T_SET_STOP : TIME; (**)
        T_DAY_START : TOD; (**)
        T_DAY_STOP : TOD; (**)
        ENABLE_SATURDAY : BOOL; (**)
        ENABLE_SUNDAY : BOOL; (**)
        ENABLE_HOLIDAY : BOOL; (**)
    END_VAR
    VAR_OUTPUT
        Q : BOOL; (**)
        STATUS : BYTE; (**)
    END_VAR
    VAR
        mx : OSCAT_BASIC.MANUAL_2; (**)
        deb : DEBOUNCE; (**)
        tdx : TOD; (**)
        wdx : INT; (**)
        tc : TIME; (**)
        tx : DWORD; (**)
        tl : DWORD; (**)
        qx : BOOL; (**)
        init : BOOL; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TIMER_P4
    VAR_INPUT
        DTIME : DT; (**)
        TREF_0 : TOD; (**)
        TREF_1 : TOD; (**)
        HOLY : BOOL; (**)
        L0 : BOOL; (**)
        L1 : BOOL; (**)
        L2 : BOOL; (**)
        L3 : BOOL; (**)
        OFS : BYTE; (**)
        ENQ : BOOL; (**)
        MAN : BOOL; (**)
        MI : BYTE; (**)
        RST : BOOL; (**)
    END_VAR
    VAR_OUTPUT
        Q0 : BOOL; (**)
        Q1 : BOOL; (**)
        Q2 : BOOL; (**)
        Q3 : BOOL; (**)
        STATUS : BYTE; (**)
    END_VAR
    VAR_IN_OUT
        PROG : ARRAY[0..array_max] OF OSCAT_BASIC.TIMER_EVENT; (**)
    END_VAR
    VAR
        day_start : DT; (**)
        start : DT; (**)
        event : OSCAT_BASIC.TIMER_EVENT; (**)
        pos : INT; (**)
        last_execute : DT; (**)
        current_day : DINT; (**)
        mask : BYTE; (**)
        ma : ARRAY[0..channel_max] OF BYTE; (**)
        mo : ARRAY[0..channel_max] OF BYTE; (**)
        qn : ARRAY[0..channel_max] OF BOOL; (**)
        qs : ARRAY[0..channel_max] OF BOOL; (**)
        channel : INT; (**)
        tx : TOD; (**)
    END_VAR
    VAR CONSTANT
        array_max : INT := 63; (**)
        channel_max : INT := 3; (**)
    END_VAR
END_FUNCTION_BLOCK
