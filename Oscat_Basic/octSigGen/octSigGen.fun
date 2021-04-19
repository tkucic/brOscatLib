FUNCTION_BLOCK _RMP_B
    VAR_INPUT
        DIR : BOOL; (* true = up *)
        E : BOOL := TRUE;
        TR : TIME;
    END_VAR
    VAR_IN_OUT
        RMP : BYTE;
    END_VAR
    VAR
        tx : TIME;
        tl : TIME;
        tn : TIME;
        init : BOOL;
        last_dir : BOOL;
        start : BYTE;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK _RMP_NEXT
    VAR_INPUT
        E : BOOL := TRUE;
        IN : BYTE;
        TR : TIME;
        TF : TIME;
        TL : TIME;
    END_VAR
    VAR_OUTPUT
        DIR : BOOL; (* upwards = TRUE *)
        UP : BOOL;
        DN : BOOL;
    END_VAR
    VAR_IN_OUT
        OUT : BYTE;
    END_VAR
    VAR
        rmx : _RMP_B;
        dirx : TREND_DW;
        t_lock : TP;
        xen : BOOL;
        xdir : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK _RMP_W
    VAR_INPUT
        DIR : BOOL;
        E : BOOL := TRUE;
        TR : TIME;
    END_VAR
    VAR_IN_OUT
        RMP : WORD;
    END_VAR
    VAR
        tx : DWORD;
        tl : DWORD;
        step : DINT;
        init : BOOL;
        last_dir : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK GEN_PULSE
    VAR_INPUT
        ENQ : BOOL := TRUE;
        PTH : TIME;
        PTL : TIME;
    END_VAR
    VAR_OUTPUT
        Q : BOOL;
    END_VAR
    VAR
        tx : TIME;
        tn : TIME;
        init : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK GEN_PW2
    VAR_INPUT
        ENQ : BOOL;
        TH1 : TIME;
        TL1 : TIME;
        TH2 : TIME;
        TL2 : TIME;
        TS : BOOL;
    END_VAR
    VAR_OUTPUT
        Q : BOOL;
        TH : TIME;
        TL : TIME;
    END_VAR
    VAR
        t_high : TIME;
        t_low : TIME;
        tx : TIME;
        start : TIME;
        init : BOOL;
        et : TIME;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK GEN_RDM
    VAR_INPUT
        PT : TIME;
        AM : REAL := 1;
        OS : REAL;
    END_VAR
    VAR_OUTPUT
        Q : BOOL;
        Out : REAL;
    END_VAR
    VAR
        tx : TIME;
        last : TIME;
        init : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK GEN_RDT
    VAR_INPUT
        Enable : BOOL := TRUE;
        Min_Time_ms : TIME := TIME#1s0ms; (* min Taktzeit *)
        Max_Time_ms : TIME := TIME#1s200ms; (* Max Taktzeit *)
        TP_Q : TIME := TIME#100ms; (* Zeit Ausgang auf TRUE *)
    END_VAR
    VAR_OUTPUT
        xQ : BOOL;
    END_VAR
    VAR
        tonRDMTimer : TON; (* Zeitbaustein Taktgenerator *)
        tof_xQ : TOF; (* Ausschaltverzögerung Taktgenerator *)
        tRDMTime : TIME; (* Sollzeit *)
        rRDMTime : REAL; (* Zufalswert Timer *)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK GEN_RMP
    VAR_INPUT
        PT : TIME := TIME#1s0ms;
        AM : REAL := 1;
        OS : REAL;
        DL : REAL;
    END_VAR
    VAR_OUTPUT
        Q : BOOL;
        OUT : REAL;
    END_VAR
    VAR
        tx : TIME;
        last : TIME;
        init : BOOL;
        temp : REAL;
        ltemp : REAL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK GEN_SIN
    VAR_INPUT
        PT : TIME;
        AM : REAL := 1;
        OS : REAL;
        DL : REAL;
    END_VAR
    VAR_OUTPUT
        Q : BOOL;
        Out : REAL;
    END_VAR
    VAR
        tx : TIME;
        last : TIME;
        init : BOOL;
        temp : REAL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK GEN_SQR
    VAR_INPUT
        PT : TIME;
        AM : REAL := 1;
        OS : REAL;
        DC : REAL := 0.5;
        DL : REAL;
    END_VAR
    VAR_OUTPUT
        Q : BOOL;
        Out : REAL;
    END_VAR
    VAR
        tx : TIME;
        last : TIME;
        init : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK PWM_DC
    VAR_INPUT
        F : REAL;
        DC : REAL;
    END_VAR
    VAR_OUTPUT
        Q : BOOL;
    END_VAR
    VAR
        clk : CLK_PRG;
        pulse : TP_X;
        tmp : REAL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK PWM_PW
    VAR_INPUT
        F : REAL;
        PW : TIME;
    END_VAR
    VAR_OUTPUT
        Q : BOOL;
    END_VAR
    VAR
        clk : CLK_PRG;
        pulse : TP_X;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK RMP_B
    VAR_INPUT
        SET : BOOL;
        PT : TIME;
        E : BOOL := TRUE;
        UP : BOOL := TRUE;
        RST : BOOL;
    END_VAR
    VAR_OUTPUT
        OUT : BYTE;
        BUSY : BOOL;
        HIGH : BOOL;
        LOW : BOOL;
    END_VAR
    VAR
        rmp : _RMP_B;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK RMP_SOFT
    VAR_INPUT
        IN : BOOL;
        VAL : BYTE;
        PT_ON : TIME;
        PT_OFF : TIME;
    END_VAR
    VAR_OUTPUT
        OUT : BYTE;
    END_VAR
    VAR
        rmp : _RMP_B;
        tmp : BYTE;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK RMP_W
    VAR_INPUT
        SET : BOOL;
        PT : TIME;
        E : BOOL := TRUE;
        UP : BOOL := TRUE;
        RST : BOOL;
    END_VAR
    VAR_OUTPUT
        out : WORD;
        busy : BOOL;
        high : BOOL;
        low : BOOL;
    END_VAR
    VAR
        rmp : _RMP_W;
    END_VAR
END_FUNCTION_BLOCK
