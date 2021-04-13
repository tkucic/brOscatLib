FUNCTION_BLOCK DRIVER_1
    VAR_INPUT
        Toggle_Mode : BOOL; (**)
        Timeout : TIME; (**)
        SET : BOOL; (**)
        IN : BOOL; (**)
        RST : BOOL; (**)
    END_VAR
    VAR_OUTPUT
        Q : BOOL; (**)
    END_VAR
    VAR
        off : TON; (**)
        edge : BOOL; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK DRIVER_4
    VAR_INPUT
        Toggle_Mode : BOOL; (**)
        Timeout : TIME; (**)
        SET : BOOL; (**)
        IN0 : BOOL; (**)
        IN1 : BOOL; (**)
        IN2 : BOOL; (**)
        IN3 : BOOL; (**)
        RST : BOOL; (**)
    END_VAR
    VAR_OUTPUT
        Q0 : BOOL; (**)
        Q1 : BOOL; (**)
        Q2 : BOOL; (**)
        Q3 : BOOL; (**)
    END_VAR
    VAR
        d0 : DRIVER_1; (**)
        d1 : DRIVER_1; (**)
        d2 : DRIVER_1; (**)
        d3 : DRIVER_1; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK DRIVER_4C
    VAR_INPUT
        IN : BOOL; (**)
        RST : BOOL; (**)
        Timeout : TIME; (**)
        SX : ARRAY[1..7] OF BYTE := ['1', '3', '7', '15']; (**)
    END_VAR
    VAR_OUTPUT
        SN : INT; (**)
        Q0 : BOOL; (**)
        Q1 : BOOL; (**)
        Q2 : BOOL; (**)
        Q3 : BOOL; (**)
    END_VAR
    VAR
        off : TON; (**)
        edge : BOOL; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK FLOW_CONTROL
    VAR_INPUT
        IN : BOOL; (**)
        REQ : BOOL; (**)
        ENQ : BOOL; (**)
        RST : BOOL; (**)
        T_AUTO : TIME := TIME#60m0s0ms; (**)
        T_DELAY : TIME := TIME#1380m0s0ms; (**)
    END_VAR
    VAR_OUTPUT
        Q : BOOL; (**)
        STATUS : BYTE; (**)
    END_VAR
    VAR
        timer : TP_1D; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK FT_Profile
    VAR_INPUT
        K : REAL := 1; (**)
        O : REAL; (**)
        M : REAL := 1; (**)
        E : BOOL; (**)
        value_0 : REAL; (**)
        time_1 : TIME; (**)
        value_1 : REAL; (**)
        time_2 : TIME; (**)
        value_2 : REAL; (**)
        time_3 : TIME; (**)
        value_3 : REAL; (**)
        time_10 : TIME; (**)
        value_10 : REAL; (**)
        time_11 : TIME; (**)
        value_11 : REAL; (**)
        time_12 : TIME; (**)
        value_12 : REAL; (**)
        time_13 : TIME; (**)
        value_13 : REAL; (**)
    END_VAR
    VAR_OUTPUT
        Y : REAL; (**)
        RUN : BOOL; (**)
        ET : TIME; (**)
    END_VAR
    VAR
        tx : TIME; (**)
        edge : BOOL; (**)
        state : BYTE; (**)
        ta : TIME; (**)
        tb : TIME; (**)
        t0 : TIME; (**)
        temp : REAL; (**)
        va : REAL; (**)
        vb : REAL; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK INC_DEC
    VAR_INPUT
        CHa : BOOL; (**)
        CHb : BOOL; (**)
        RST : BOOL; (**)
    END_VAR
    VAR_OUTPUT
        dir : BOOL; (**)
        cnt : INT; (**)
    END_VAR
    VAR
        edgea : BOOL; (**)
        clk : BOOL; (**)
        clka : BOOL; (**)
        clkb : BOOL; (**)
        edgeb : BOOL; (**)
        axb : BOOL; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK INTERLOCK
    VAR_INPUT
        I1 : BOOL; (**)
        I2 : BOOL; (**)
        TL : TIME; (**)
    END_VAR
    VAR_OUTPUT
        Q1 : BOOL; (**)
        Q2 : BOOL; (**)
    END_VAR
    VAR
        T1 : TOF; (**)
        T2 : TOF; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK INTERLOCK_4
    VAR_INPUT
        I0 : BOOL; (**)
        I1 : BOOL; (**)
        I2 : BOOL; (**)
        I3 : BOOL; (**)
        E : BOOL; (**)
        MODE : INT; (**)
    END_VAR
    VAR_OUTPUT
        OUT : BYTE; (**)
        TP : BOOL; (**)
    END_VAR
    VAR
        in : BYTE; (**)
        last : BYTE; (**)
        old : BYTE; (**)
        lmode : INT; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION MANUAL : BOOL
    VAR_INPUT
        IN : BOOL; (**)
        ON : BOOL; (**)
        OFF : BOOL; (**)
    END_VAR
END_FUNCTION
FUNCTION_BLOCK MANUAL_1
    VAR_INPUT
        IN : BOOL; (**)
        MAN : BOOL; (**)
        M_I : BOOL; (**)
        SET : BOOL; (**)
        RST : BOOL; (**)
    END_VAR
    VAR_OUTPUT
        Q : BOOL; (**)
        STATUS : BYTE; (**)
    END_VAR
    VAR
        S_edge : BOOL; (**)
        r_edge : BOOL; (**)
        edge : BOOL; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK MANUAL_2
    VAR_INPUT
        IN : BOOL; (**)
        ENA : BOOL; (**)
        ON : BOOL; (**)
        OFF : BOOL; (**)
        MAN : BOOL; (**)
    END_VAR
    VAR_OUTPUT
        Q : BOOL; (**)
        STATUS : BYTE; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK MANUAL_4
    VAR_INPUT
        I0 : BOOL; (**)
        I1 : BOOL; (**)
        I2 : BOOL; (**)
        I3 : BOOL; (**)
        MAN : BOOL; (**)
        STP : BOOL; (**)
        M0 : BOOL; (**)
        M1 : BOOL; (**)
        M2 : BOOL; (**)
        M3 : BOOL; (**)
    END_VAR
    VAR_OUTPUT
        Q0 : BOOL; (**)
        Q1 : BOOL; (**)
        Q2 : BOOL; (**)
        Q3 : BOOL; (**)
        STATUS : BYTE; (**)
    END_VAR
    VAR
        edge : BOOL; (**)
        pos : INT; (**)
        tog : BOOL; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK PARSET
    VAR_INPUT
        A0 : BOOL; (**)
        A1 : BOOL; (**)
        X01 : REAL; (**)
        X02 : REAL; (**)
        X03 : REAL; (**)
        X04 : REAL; (**)
        X11 : REAL; (**)
        X12 : REAL; (**)
        X13 : REAL; (**)
        X14 : REAL; (**)
        X21 : REAL; (**)
        X22 : REAL; (**)
        X23 : REAL; (**)
        X24 : REAL; (**)
        X31 : REAL; (**)
        X32 : REAL; (**)
        X33 : REAL; (**)
        X34 : REAL; (**)
        TC : TIME; (**)
    END_VAR
    VAR_OUTPUT
        P1 : REAL; (**)
        P2 : REAL; (**)
        P3 : REAL; (**)
        P4 : REAL; (**)
    END_VAR
    VAR
        X : ARRAY[0..3, 1..4] OF REAL; (**)
        S1 : REAL; (**)
        S2 : REAL; (**)
        S3 : REAL; (**)
        S4 : REAL; (**)
        tx : DWORD; (**)
        last : DWORD; (**)
        start : BOOL; (**)
        set : BYTE; (**)
        init : BOOL; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK PARSET2
    VAR_INPUT
        X : REAL; (**)
        X01 : REAL; (**)
        X02 : REAL; (**)
        X03 : REAL; (**)
        X04 : REAL; (**)
        X11 : REAL; (**)
        X12 : REAL; (**)
        X13 : REAL; (**)
        X14 : REAL; (**)
        X21 : REAL; (**)
        X22 : REAL; (**)
        X23 : REAL; (**)
        X24 : REAL; (**)
        X31 : REAL; (**)
        X32 : REAL; (**)
        X33 : REAL; (**)
        X34 : REAL; (**)
        L1 : REAL; (**)
        L2 : REAL; (**)
        L3 : REAL; (**)
        TC : TIME; (**)
    END_VAR
    VAR_OUTPUT
        P1 : REAL; (**)
        P2 : REAL; (**)
        P3 : REAL; (**)
        P4 : REAL; (**)
    END_VAR
    VAR
        Pset : PARSET; (**)
        init : BOOL; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK SIGNAL
    VAR_INPUT
        IN : BOOL; (**)
        SIG : BYTE; (**)
        TS : TIME; (**)
    END_VAR
    VAR_OUTPUT
        Q : BOOL; (**)
    END_VAR
    VAR
        tx : DWORD; (**)
        step : BYTE; (**)
    END_VAR
    VAR CONSTANT
        one : BYTE := 1; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK SIGNAL_4
    VAR_INPUT
        IN1 : BOOL; (**)
        IN2 : BOOL; (**)
        IN3 : BOOL; (**)
        IN4 : BOOL; (**)
        TS : TIME; (**)
        S1 : BYTE := 2#11111111; (**)
        S2 : BYTE := 2#11110000; (**)
        S3 : BYTE := 2#10101010; (**)
        S4 : BYTE := 2#10100000; (**)
    END_VAR
    VAR_OUTPUT
        Q : BOOL; (**)
    END_VAR
    VAR
        sig : SIGNAL; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK SRAMP
    VAR_INPUT
        X : REAL; (**)
        A_UP : REAL; (**)
        A_DN : REAL; (**)
        VU_MAX : REAL; (**)
        VD_MAX : REAL; (**)
        LIMIT_HIGH : REAL; (**)
        LIMIT_LOW : REAL; (**)
        RST : BOOL; (**)
    END_VAR
    VAR_OUTPUT
        Y : REAL; (**)
        V : REAL; (**)
    END_VAR
    VAR
        cycle_time : TC_S; (**)
        init : BOOL; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TUNE
    VAR_INPUT
        SET : BOOL; (**)
        SU : BOOL; (**)
        SD : BOOL; (**)
        RST : BOOL; (**)
        SS : REAL := 0.1; (**)
        Limit_L : REAL; (**)
        LIMIT_H : REAL := 100; (**)
        RST_val : REAL; (**)
        SET_val : REAL := 100; (**)
        T1 : TIME := TIME#500ms; (**)
        T2 : TIME := TIME#2s0ms; (**)
        S1 : REAL := 2; (**)
        S2 : REAL := 10; (**)
    END_VAR
    VAR_OUTPUT
        Y : REAL; (**)
    END_VAR
    VAR
        tx : DWORD; (**)
        start : DWORD; (**)
        start2 : DWORD; (**)
        state : INT; (**)
        in : BOOL; (**)
        step : REAL; (**)
        SPEED : REAL; (**)
        Y_start : REAL; (**)
        Y_start2 : REAL; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TUNE2
    VAR_INPUT
        SET : BOOL; (**)
        SU : BOOL; (**)
        SD : BOOL; (**)
        FU : BOOL; (**)
        FD : BOOL; (**)
        RST : BOOL; (**)
        SS : REAL := 0.1; (**)
        FS : REAL := 5; (**)
        Limit_L : REAL; (**)
        LIMIT_H : REAL := 100; (**)
        RST_val : REAL; (**)
        SET_val : REAL := 100; (**)
        TR : TIME := TIME#500ms; (**)
        S1 : REAL := 2; (**)
        S2 : REAL := 10; (**)
    END_VAR
    VAR_OUTPUT
        Y : REAL; (**)
    END_VAR
    VAR
        tx : DWORD; (**)
        start : DWORD; (**)
        state : INT; (**)
        in : BOOL; (**)
        step : REAL; (**)
        SPEED : REAL; (**)
        Y_start : REAL; (**)
    END_VAR
END_FUNCTION_BLOCK
