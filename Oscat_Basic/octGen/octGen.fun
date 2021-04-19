FUNCTION_BLOCK A_TRIG
    VAR_INPUT
        IN : REAL;
        RES : REAL;
    END_VAR
    VAR_OUTPUT
        Q : BOOL;
        D : REAL;
    END_VAR
    VAR
        last_in : REAL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK B_TRIG
    VAR_INPUT
        CLK : BOOL;
    END_VAR
    VAR_OUTPUT
        Q : BOOL;
    END_VAR
    VAR
        edge_ : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK CLICK_CNT
    VAR_INPUT
        IN : BOOL;
        N : INT;
        TC : TIME;
    END_VAR
    VAR_OUTPUT
        Q : BOOL;
    END_VAR
    VAR
        tx : TP;
        edge_ : BOOL;
        cnt : INT := -1;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK CLICK_DEC
    VAR_INPUT
        IN : BOOL;
        TC : TIME;
    END_VAR
    VAR_OUTPUT
        Q0 : BOOL;
        Q1 : BOOL;
        Q2 : BOOL;
        Q3 : BOOL;
    END_VAR
    VAR
        tx : TP;
        edge_ : BOOL;
        cnt : INT := -1;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK CLK_DIV
    VAR_INPUT
        clk : BOOL;
        rst : BOOL;
    END_VAR
    VAR_OUTPUT
        Q0 : BOOL;
        Q1 : BOOL;
        Q2 : BOOL;
        Q3 : BOOL;
        Q4 : BOOL;
        Q5 : BOOL;
        Q6 : BOOL;
        Q7 : BOOL;
    END_VAR
    VAR
        cnt : BYTE;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK CLK_N
    VAR_INPUT
        N : INT;
    END_VAR
    VAR_OUTPUT
        Q : BOOL;
    END_VAR
    VAR
        edge_ : BOOL;
        stime : DWORD;
        clk : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK CLK_PRG
    VAR_INPUT
        PT : TIME := TIME#10ms;
    END_VAR
    VAR_OUTPUT
        Q : BOOL;
    END_VAR
    VAR
        init : BOOL;
        last : TIME;
        tx : TIME;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK CLK_PULSE
    VAR_INPUT
        PT : TIME;
        N : INT;
        RST : BOOL;
    END_VAR
    VAR_OUTPUT
        Q : BOOL;
        CNT : INT;
        RUN : BOOL;
    END_VAR
    VAR
        tx : DWORD;
        tn : DWORD;
        init : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK CYCLE_4
    VAR_INPUT
        E : BOOL := TRUE;
        T0 : TIME;
        T1 : TIME;
        T2 : TIME;
        T3 : TIME;
        S0 : BOOL;
        SX : INT;
        SL : BOOL;
    END_VAR
    VAR_OUTPUT
        STATE : INT;
    END_VAR
    VAR
        tx : TIME;
        last : TIME;
        init : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK D_TRIG
    VAR_INPUT
        in : DWORD;
    END_VAR
    VAR_OUTPUT
        Q : BOOL;
        X : DWORD;
    END_VAR
    VAR
        last_in : DWORD;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK GEN_BIT
    VAR_INPUT
        in0 : DWORD;
        in1 : DWORD;
        in2 : DWORD;
        in3 : DWORD;
        clk : BOOL;
        steps : INT;
        rep : INT;
        rst : BOOL;
    END_VAR
    VAR_OUTPUT
        Q0 : BOOL;
        Q1 : BOOL;
        Q2 : BOOL;
        Q3 : BOOL;
        cnt : INT;
        run : BOOL;
    END_VAR
    VAR
        r0 : DWORD;
        r1 : DWORD;
        r2 : DWORD;
        r3 : DWORD;
        rx : INT := 1;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK GEN_SQ
    VAR_INPUT
        PT : TIME;
    END_VAR
    VAR_OUTPUT
        Q : BOOL;
    END_VAR
    VAR
        tn : DWORD;
        tx : DWORD;
        init : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK SCHEDULER
    VAR_INPUT
        E0 : BOOL;
        E1 : BOOL;
        E2 : BOOL;
        E3 : BOOL;
        T0 : TIME;
        T1 : TIME;
        T2 : TIME;
        T3 : TIME;
    END_VAR
    VAR_OUTPUT
        Q0 : BOOL;
        Q1 : BOOL;
        Q2 : BOOL;
        Q3 : BOOL;
    END_VAR
    VAR
        init : BOOL;
        s0 : TIME;
        s1 : TIME;
        s2 : TIME;
        s3 : TIME;
        tx : TIME;
        c : INT;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK SCHEDULER_2
    VAR_INPUT
        E0 : BOOL;
        E1 : BOOL;
        E2 : BOOL;
        E3 : BOOL;
        C0 : UINT;
        C1 : UINT;
        C2 : UINT;
        C3 : UINT;
        O0 : UINT;
        O1 : UINT;
        O2 : UINT;
        O3 : UINT;
    END_VAR
    VAR_OUTPUT
        Q0 : BOOL;
        Q1 : BOOL;
        Q2 : BOOL;
        Q3 : BOOL;
    END_VAR
    VAR
        sx : UINT;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK SEQUENCE_4
    VAR_INPUT
        in0 : BOOL := TRUE;
        in1 : BOOL := TRUE;
        in2 : BOOL := TRUE;
        in3 : BOOL := TRUE;
        start : BOOL;
        rst : BOOL;
        wait0 : TIME;
        delay0 : TIME;
        wait1 : TIME;
        delay1 : TIME;
        wait2 : TIME;
        delay2 : TIME;
        wait3 : TIME;
        delay3 : TIME;
        stop_on_error : BOOL;
    END_VAR
    VAR_OUTPUT
        Q0 : BOOL;
        Q1 : BOOL;
        Q2 : BOOL;
        Q3 : BOOL;
        QX : BOOL;
        run : BOOL;
        step : INT := -1;
        status : BYTE;
    END_VAR
    VAR
        last : TIME;
        edge_ : BOOL;
        tx : TIME;
        init : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK SEQUENCE_64
    VAR_INPUT
        START : BOOL;
        SMAX : INT;
        PROG : ARRAY[0..63] OF TIME;
        RST : BOOL;
    END_VAR
    VAR_OUTPUT
        STATE : INT := -1;
        TRIG : BOOL;
    END_VAR
    VAR
        tx : TIME;
        edge_ : BOOL;
        last : TIME;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK SEQUENCE_8
    VAR_INPUT
        in0 : BOOL := TRUE;
        in1 : BOOL := TRUE;
        in2 : BOOL := TRUE;
        in3 : BOOL := TRUE;
        in4 : BOOL := TRUE;
        in5 : BOOL := TRUE;
        in6 : BOOL := TRUE;
        in7 : BOOL := TRUE;
        start : BOOL;
        rst : BOOL;
        wait0 : TIME;
        delay0 : TIME;
        wait1 : TIME;
        delay1 : TIME;
        wait2 : TIME;
        delay2 : TIME;
        wait3 : TIME;
        delay3 : TIME;
        wait4 : TIME;
        delay4 : TIME;
        wait5 : TIME;
        delay5 : TIME;
        wait6 : TIME;
        delay6 : TIME;
        wait7 : TIME;
        delay7 : TIME;
        stop_on_error : BOOL;
    END_VAR
    VAR_OUTPUT
        Q0 : BOOL;
        Q1 : BOOL;
        Q2 : BOOL;
        Q3 : BOOL;
        Q4 : BOOL;
        Q5 : BOOL;
        Q6 : BOOL;
        Q7 : BOOL;
        QX : BOOL;
        run : BOOL;
        step : INT := -1;
        status : BYTE;
    END_VAR
    VAR
        last : TIME;
        edge_ : BOOL;
        tx : TIME;
        init : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TMAX
    VAR_INPUT
        IN : BOOL;
        PT : TIME;
    END_VAR
    VAR_OUTPUT
        Q : BOOL;
        Z : BOOL;
    END_VAR
    VAR
        tx : TIME;
        start : TIME;
        last_in : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TMIN
    VAR_INPUT
        IN : BOOL;
        PT : TIME;
    END_VAR
    VAR_OUTPUT
        Q : BOOL;
    END_VAR
    VAR
        pm : TP;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TOF_1
    VAR_INPUT
        IN : BOOL;
        PT : TIME;
        RST : BOOL;
    END_VAR
    VAR_OUTPUT
        Q : BOOL;
    END_VAR
    VAR
        tx : TIME;
        start : TIME;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TONOF
    VAR_INPUT
        IN : BOOL;
        T_ON : TIME;
        T_OFF : TIME;
    END_VAR
    VAR_OUTPUT
        Q : BOOL;
    END_VAR
    VAR
        X : TON;
        old : BOOL;
        mode : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TP_1
    VAR_INPUT
        IN : BOOL;
        PT : TIME;
        RST : BOOL;
    END_VAR
    VAR_OUTPUT
        Q : BOOL;
    END_VAR
    VAR
        tx : TIME;
        start : TIME;
        ix : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TP_1D
    VAR_INPUT
        IN : BOOL;
        PT1 : TIME;
        PTD : TIME;
        RST : BOOL;
    END_VAR
    VAR_OUTPUT
        Q : BOOL;
        W : BOOL;
    END_VAR
    VAR
        tx : TIME;
        start : TIME;
        ix : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TP_X
    VAR_INPUT
        IN : BOOL;
        PT : TIME;
    END_VAR
    VAR_OUTPUT
        Q : BOOL;
        ET : TIME;
    END_VAR
    VAR
        edge_ : BOOL;
        start : TIME;
        tx : TIME;
    END_VAR
END_FUNCTION_BLOCK
