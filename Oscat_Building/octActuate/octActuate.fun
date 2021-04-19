FUNCTION_BLOCK ACTUATOR_2P
    VAR_INPUT
        IN : BYTE;
        TEST : BOOL;
        ARE : BOOL := TRUE;
    END_VAR
    VAR_OUTPUT
        OUT : BOOL;
        ARO : BOOL;
    END_VAR
    VAR_IN_OUT
        ARX : BOOL;
    END_VAR
    VAR
        timer : AUTORUN;
        pwgen : GEN_PULSE;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK ACTUATOR_3P
    VAR_INPUT
        IN : BYTE;
        TEST : BOOL;
        ARE : BOOL := TRUE;
        END_POS : BOOL;
        T_RUN : TIME := TIME#1m0s0ms;
        T_EXT : TIME := TIME#10s0ms;
        T_CAL : TIME := TIME#10m0s0ms;
        T_DIAG : TIME := TIME#14400m0s0ms;
        SWITCH_AVAIL : BOOL;
    END_VAR
    VAR_OUTPUT
        OUT1 : BOOL;
        OUT2 : BOOL;
        POS : BYTE;
        ERROR : BOOL;
        STATUS : BYTE;
    END_VAR
    VAR_IN_OUT
        ARX : BOOL;
    END_VAR
    VAR
        ramp : _RMP_NEXT;
        tx : TIME;
        next_cal : TIME;
        next_diag : TIME;
        last : TIME;
        start : TIME;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK ACTUATOR_A
    VAR_INPUT
        I1 : BYTE;
        IS : BOOL;
        I2 : BYTE;
        RV : BOOL;
        DX : BOOL;
        RUNTIME : TIME;
        SELF_ACT_TIME : TIME;
        OUT_MIN : WORD;
        OUT_MAX : WORD;
    END_VAR
    VAR_OUTPUT
        Y : WORD;
    END_VAR
    VAR
        timer : CYCLE_4;
        dx_edge : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK ACTUATOR_COIL
    VAR_INPUT
        IN : BOOL;
        self_act_cycle : TIME := TIME#14400m0s0ms;
        self_act_time : TIME := TIME#1s0ms;
    END_VAR
    VAR_OUTPUT
        OUT : BOOL;
        STATUS : BYTE;
    END_VAR
    VAR
        last : DWORD;
        init : BOOL;
        tx : DWORD;
        now : DWORD;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK ACTUATOR_PUMP
    VAR_INPUT
        IN : BOOL;
        MANUAL : BOOL;
        RST : BOOL;
        MIN_ONTIME : TIME := TIME#10s0ms;
        MIN_OFFTIME : TIME := TIME#10s0ms;
        RUN_EVERY : TIME := TIME#10000m0s0ms;
    END_VAR
    VAR_OUTPUT
        PUMP : BOOL;
    END_VAR
    VAR_IN_OUT
        RUNTIME : UDINT;
        CYCLES : UDINT;
    END_VAR
    VAR
        tx : TIME;
        last_change : TIME;
        meter : ontime;
        old_man : BOOL;
        init : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK ACTUATOR_UD
    VAR_INPUT
        UD : BOOL;
        ON : BOOL;
        Manual : BOOL;
        Up : BOOL;
        Dn : BOOL;
        off : BOOL;
        YUP_in : BOOL;
        YDN_in : BOOL;
        TON : TIME;
        TOFF : TIME;
        out_return : BOOL;
    END_VAR
    VAR_OUTPUT
        Yup : BOOL;
        Ydn : BOOL;
        status : BYTE;
    END_VAR
    VAR
        tx : TIME;
        last : TIME;
        init : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK AUTORUN
    VAR_INPUT
        IN : BOOL;
        TEST : BOOL;
        ARE : BOOL := TRUE;
    END_VAR
    VAR_OUTPUT
        OUT : BOOL;
        ARO : BOOL;
    END_VAR
    VAR_IN_OUT
        ARX : BOOL;
    END_VAR
    VAR
        timer : _RMP_B;
        val : BYTE;
    END_VAR
END_FUNCTION_BLOCK
