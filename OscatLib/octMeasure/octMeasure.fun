FUNCTION_BLOCK ALARM_2
    VAR_INPUT
        X : REAL; (**)
        LO_1 : REAL; (**)
        HI_1 : REAL; (**)
        LO_2 : REAL; (**)
        HI_2 : REAL; (**)
        HYS : REAL; (**)
    END_VAR
    VAR_OUTPUT
        Q1_LO : BOOL; (**)
        Q1_HI : BOOL; (**)
        Q2_LO : BOOL; (**)
        Q2_HI : BOOL; (**)
    END_VAR
    VAR
        tmp : REAL; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK BAR_GRAPH
    VAR_INPUT
        X : REAL; (**)
        rst : BOOL; (**)
        trigger_Low : REAL; (**)
        trigger_High : REAL; (**)
        Alarm_low : BOOL; (**)
        Alarm_high : BOOL; (**)
        log_scale : BOOL; (**)
    END_VAR
    VAR_OUTPUT
        LOW : BOOL; (**)
        Q1 : BOOL; (**)
        Q2 : BOOL; (**)
        Q3 : BOOL; (**)
        Q4 : BOOL; (**)
        Q5 : BOOL; (**)
        Q6 : BOOL; (**)
        HIGH : BOOL; (**)
        Alarm : BOOL; (**)
        Status : BYTE; (**)
    END_VAR
    VAR
        init : BOOL; (**)
        T1 : REAL; (**)
        T2 : REAL; (**)
        T3 : REAL; (**)
        T4 : REAL; (**)
        T5 : REAL; (**)
        temp : REAL; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK CALIBRATE
    VAR_INPUT
        X : REAL; (**)
        CO : BOOL; (**)
        CS : BOOL; (**)
        Y_Offset : REAL; (**)
        Y_Scale : REAL; (**)
    END_VAR
    VAR_OUTPUT
        Y : REAL; (**)
    END_VAR
    VAR
        offset : REAL; (**)
        Scale : REAL := 1; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK CYCLE_TIME
    VAR_INPUT
        RST : BOOL; (**)
    END_VAR
    VAR_OUTPUT
        ct_min : TIME; (**)
        ct_max : TIME; (**)
        ct_last : TIME; (**)
        systime : TIME; (**)
        sysdays : INT; (**)
        cycles : DWORD; (**)
    END_VAR
    VAR
        last_cycle : TIME; (**)
        tx : TIME; (**)
        init : BOOL; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK DT_SIMU
    VAR_INPUT
        START : DT; (**)
        SPEED : REAL := 1; (**)
    END_VAR
    VAR_OUTPUT
        DTS : DT; (**)
    END_VAR
    VAR
        tc : DWORD; (**)
        init : BOOL; (**)
        last : DWORD; (**)
        tx : DWORD; (**)
        td : DWORD; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK FLOW_METER
    VAR_INPUT
        VX : REAL; (**)
        E : BOOL; (**)
        RST : BOOL; (**)
        PULSE_MODE : BOOL; (**)
        UPDATE_TIME : TIME := TIME#1s0ms; (**)
    END_VAR
    VAR_OUTPUT
        F : REAL; (**)
    END_VAR
    VAR_IN_OUT
        X : REAL; (**)
        Y : UDINT; (**)
    END_VAR
    VAR
        tx : TIME; (**)
        tl : TIME; (**)
        int1 : INTEGRATE; (**)
        init : BOOL; (**)
        e_last : BOOL; (**)
        tmp : INT; (**)
        x_last : REAL; (**)
        y_last : UDINT; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK M_D
    VAR_INPUT
        start : BOOL; (**)
        stop : BOOL; (**)
        tmax : TIME := TIME#14400m0s0ms; (**)
        rst : BOOL; (**)
    END_VAR
    VAR_OUTPUT
        PT : TIME; (**)
        ET : TIME; (**)
        run : BOOL; (**)
    END_VAR
    VAR
        edge : BOOL; (**)
        T0 : TIME; (**)
        tx : TIME; (**)
        startup : BOOL; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK M_T
    VAR_INPUT
        IN : BOOL; (**)
        TMAX : TIME := TIME#14400m0s0ms; (**)
        RST : BOOL; (**)
    END_VAR
    VAR_OUTPUT
        PT : TIME; (**)
        ET : TIME; (**)
    END_VAR
    VAR
        edge : BOOL; (**)
        start : TIME; (**)
        tx : TIME; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK M_TX
    VAR_INPUT
        in : BOOL; (**)
        tmax : TIME := TIME#14400m0s0ms; (**)
        rst : BOOL; (**)
    END_VAR
    VAR_OUTPUT
        TH : TIME; (**)
        TL : TIME; (**)
        DC : REAL; (**)
        F : REAL; (**)
        ET : TIME; (**)
    END_VAR
    VAR
        edge : BOOL; (**)
        start : TIME; (**)
        stop : TIME; (**)
        tx : TIME; (**)
        rise : BOOL; (**)
        fall : BOOL; (**)
        startup : BOOL; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK METER
    VAR_INPUT
        M1 : REAL; (**)
        M2 : REAL; (**)
        I1 : BOOL; (**)
        I2 : BOOL; (**)
        D : REAL := 1; (**)
        RST : BOOL; (**)
    END_VAR
    VAR_IN_OUT
        MX : REAL; (**)
    END_VAR
    VAR
        MR : REAL2; (**)
        MX1 : REAL; (* current consumption value on M1 and M2 *)
        MX2 : REAL; (* current consumption value on M1 and M2 *)
        tx : DWORD; (**)
        last : DWORD; (**)
        tc : REAL; (**)
        init : BOOL; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK METER_STAT
    VAR_INPUT
        IN : REAL; (**)
        DI : DATE; (**)
        RST : BOOL; (**)
    END_VAR
    VAR_IN_OUT
        Last_Day : REAL; (**)
        Current_Day : REAL; (**)
        Last_Week : REAL; (**)
        Current_Week : REAL; (**)
        Last_Month : REAL; (**)
        Current_Month : REAL; (**)
        Last_Year : REAL; (**)
        Current_Year : REAL; (**)
    END_VAR
    VAR
        Year_Start : REAL; (**)
        Month_Start : REAL; (**)
        Week_Start : REAL; (**)
        Day_Start : REAL; (**)
        last_run : DATE; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK ONTIME
    VAR_INPUT
        IN : BOOL; (**)
        RST : BOOL; (**)
    END_VAR
    VAR_IN_OUT
        SECONDS : UDINT; (**)
        CYCLES : UDINT; (**)
    END_VAR
    VAR
        tx : DWORD; (**)
        last : DWORD; (**)
        edge : BOOL; (**)
        init : BOOL; (**)
        ms : DWORD; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION T_PLC_MS : DWORD
    VAR
        debug : BOOL := 0; (**)
        N : INT := 0; (**)
        offset : DWORD := 0; (**)
    END_VAR
END_FUNCTION
FUNCTION T_PLC_US : DWORD
    VAR
        debug : BOOL := 0; (**)
        N : INT := 0; (**)
        offset : DWORD := 0; (**)
    END_VAR
END_FUNCTION
FUNCTION_BLOCK TC_MS
    VAR_OUTPUT
        TC : DWORD; (**)
    END_VAR
    VAR
        init : BOOL; (**)
        tx : DWORD; (**)
        last : DWORD; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TC_S
    VAR_OUTPUT
        TC : REAL; (**)
    END_VAR
    VAR
        init : BOOL; (**)
        tx : DWORD; (**)
        last : DWORD; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TC_US
    VAR_OUTPUT
        TC : DWORD; (**)
    END_VAR
    VAR
        init : BOOL; (**)
        tx : DWORD; (**)
        last : DWORD; (**)
    END_VAR
END_FUNCTION_BLOCK
