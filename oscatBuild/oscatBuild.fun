FUNCTION_BLOCK ACTUATOR_2P (*  *)(* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=12 *)
    VAR_INPUT 
        IN : BYTE;
        TEST : BOOL;
        ARE : BOOL := TRUE;
    END_VAR
    VAR_IN_OUT 
        ARX : BOOL;
    END_VAR
    VAR_INPUT 
        CYCLE_TIME : TIME;
        SENS : BYTE;
        SELF_ACT_TIME : TIME;
        SELF_ACT_PULSE : TIME;
        SELF_ACT_CYCLES : INT := 1;
    END_VAR
    VAR_OUTPUT 
        OUT : BOOL;
        ARO : BOOL;
    END_VAR
    VAR 
        timer : AUTORUN;
        pwgen : OSCAT_BASIC.GEN_PULSE;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK ACTUATOR_3P (*  *)(* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=13 *)
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
    VAR_IN_OUT 
        ARX : BOOL;
    END_VAR
    VAR_OUTPUT 
        OUT1 : BOOL;
        OUT2 : BOOL;
        POS : BYTE;
        ERROR : BOOL;
        STATUS : BYTE;
    END_VAR
    VAR 
        ramp : OSCAT_BASIC._RMP_NEXT;
        tx : TIME;
        next_cal : TIME;
        next_diag : TIME;
        last : TIME;
        start : TIME;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK ACTUATOR_A (*  *)(* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=15 *)
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
        timer : OSCAT_BASIC.CYCLE_4;
        dx_edge : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK ACTUATOR_COIL (*  *)(* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=16 *)
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
FUNCTION_BLOCK ACTUATOR_PUMP (*  *)(* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=16 *)
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
        meter : OSCAT_BASIC.ontime;
        old_man : BOOL;
        init : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK ACTUATOR_UD (*  *)(* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=17 *)
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
FUNCTION_BLOCK AUTORUN (*  *)(* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=19 *)
    VAR_INPUT 
        IN : BOOL;
        TEST : BOOL;
        ARE : BOOL := TRUE;
    END_VAR
    VAR_IN_OUT 
        ARX : BOOL;
    END_VAR
    VAR_INPUT 
        TRUN : TIME;
        TOFF : TIME;
    END_VAR
    VAR_OUTPUT 
        OUT : BOOL;
        ARO : BOOL;
    END_VAR
    VAR 
        timer : OSCAT_BASIC._RMP_B;
        val : BYTE;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK CLICK (*  *)(* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=47 *)
    VAR_INPUT 
        in : BOOL;
    END_VAR
    VAR_OUTPUT 
        Q : BOOL;
        single : BOOL;
        double : BOOL;
        triple : BOOL;
        status : BYTE;
    END_VAR
    VAR_INPUT 
        T_debounce : TIME := TIME#10ms;
        T_short : TIME := TIME#200ms;
        T_pause : TIME := TIME#500ms;
        T_reconfig : TIME := TIME#1m0s0ms;
    END_VAR
    VAR 
        s_in : SW_RECONFIG;
        tx : TIME;
        state : INT;
        last : TIME;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK CLICK_MODE (*  *)(* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=49 *)
    VAR_INPUT 
        IN : BOOL;
    END_VAR
    VAR_OUTPUT 
        SINGLE : BOOL;
        DOUBLE : BOOL;
        LONG : BOOL;
        TP_LONG : BOOL;
    END_VAR
    VAR_INPUT 
        T_LONG : TIME := TIME#500ms;
    END_VAR
    VAR 
        Timer : OSCAT_BASIC.TP;
        cnt : INT;
        last : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK DEBOUNCE (*  *)(* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=49 *)
    VAR_INPUT 
        IN : BOOL;
        TD : TIME;
        PM : BOOL;
    END_VAR
    VAR_OUTPUT 
        Q : BOOL;
    END_VAR
    VAR 
        deb : OSCAT_BASIC.TOF;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK DIMM_2 (*  *)(* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=50 *)
    VAR_INPUT 
        SET : BOOL;
        VAL : BYTE := 255;
        I1 : BOOL;
        I2 : BOOL;
        RST : BOOL;
        T_DEBOUNCE : TIME := TIME#10ms;
        T_ON_MAX : TIME := TIME#0ms;
        T_DIMM_START : TIME := TIME#1s0ms;
        T_DIMM : TIME := TIME#3s0ms;
        MIN_ON : BYTE := 50;
        MAX_ON : BYTE := 255;
        RST_OUT : BOOL := TRUE;
        SOFT_DIMM : BOOL := TRUE;
        DBL1_TOG : BOOL;
        DBL2_TOG : BOOL;
        DBL1_SET : BOOL;
        DBL2_SET : BOOL;
        DBL1_POS : BYTE;
        DBL2_POS : BYTE;
    END_VAR
    VAR_OUTPUT 
        Q : BOOL := FALSE;
        D1 : BOOL;
        D2 : BOOL;
    END_VAR
    VAR_IN_OUT 
        OUT : BYTE;
    END_VAR
    VAR 
        t1 : OSCAT_BASIC.TOF;
        t2 : OSCAT_BASIC.TOF;
        dc1 : CLICK_MODE;
        dc2 : CLICK_MODE;
        t3 : OSCAT_BASIC.TON;
        dim : OSCAT_BASIC._RMP_B;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK DIMM_I (*  *)(* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=52 *)
    VAR_INPUT 
        SET : BOOL;
        VAL : BYTE := 255;
        IN : BOOL;
        RST : BOOL;
        T_DEBOUNCE : TIME := TIME#10ms;
        T_RECONFIG : TIME := TIME#10s0ms;
        T_ON_MAX : TIME := TIME#0ms;
        T_DIMM_START : TIME := TIME#1s0ms;
        T_DIMM : TIME := TIME#3s0ms;
        MIN_ON : BYTE := 50;
        MAX_ON : BYTE := 255;
        SOFT_DIMM : BOOL := TRUE;
        DBL_toggle : BOOL;
        RST_OUT : BOOL;
    END_VAR
    VAR_OUTPUT 
        Q : BOOL := FALSE;
        DBL : BOOL;
    END_VAR
    VAR_IN_OUT 
        OUT : BYTE;
    END_VAR
    VAR 
        config : SW_RECONFIG;
        decode : CLICK_MODE;
        t3 : OSCAT_BASIC.TON;
        dim : OSCAT_BASIC._RMP_B;
        dir : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK F_LAMP (*  *)(* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=54 *)
    VAR_INPUT 
        SWITCH : BOOL;
        DIMM : BYTE := 255;
        RST : BOOL;
    END_VAR
    VAR_OUTPUT 
        LAMP : BYTE;
        STATUS : BYTE;
    END_VAR
    VAR_IN_OUT 
        ONTIME : UDINT;
        CYCLES : UDINT;
    END_VAR
    VAR_INPUT 
        T_NO_DIMM : UINT := 100;
        T_MAINTENANCE : UINT := 15000;
    END_VAR
    VAR 
        runtime : OSCAT_BASIC.ONTIME;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK PULSE_LENGTH (*  *)(* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=56 *)
    VAR_INPUT 
        in : BOOL;
    END_VAR
    VAR_OUTPUT 
        short : BOOL;
        middle : BOOL;
        long : BOOL;
    END_VAR
    VAR_INPUT 
        T_short : TIME := TIME#100ms;
        T_long : TIME := TIME#1s0ms;
    END_VAR
    VAR 
        tx : TIME;
        tn : TIME;
        edge : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK PULSE_T (*  *)(* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=56 *)
    VAR_INPUT 
        IN : BOOL;
        T1 : TIME;
        T2 : TIME;
        RST : BOOL;
    END_VAR
    VAR_OUTPUT 
        Q : BOOL;
    END_VAR
    VAR 
        init : BOOL;
        last : TIME;
        tx : TIME;
        edge : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK SW_RECONFIG (*  *)(* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=57 *)
    VAR_INPUT 
        IN : BOOL;
        TD : TIME;
        TR : TIME;
    END_VAR
    VAR_OUTPUT 
        Q : BOOL;
    END_VAR
    VAR 
        T1 : OSCAT_BASIC.TON;
        T2 : OSCAT_BASIC.TON;
        INV : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK SWITCH_I (*  *)(* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=58 *)
    VAR_INPUT 
        set : BOOL;
        in : BOOL;
        rst : BOOL;
        T_debounce : TIME := TIME#10ms;
        T_reconfig : TIME := TIME#1s0ms;
        T_on_max : TIME := TIME#0ms;
    END_VAR
    VAR_OUTPUT 
        Q : BOOL;
    END_VAR
    VAR 
        state : BYTE;
        edge : BOOL;
        r_edge : BOOL;
        T_on : TIME;
        tx : TIME;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK SWITCH_X (*  *)(* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=59 *)
    VAR_INPUT 
        IN1 : BOOL;
        IN2 : BOOL;
        IN3 : BOOL;
        IN4 : BOOL;
        IN5 : BOOL;
        IN6 : BOOL;
    END_VAR
    VAR_OUTPUT 
        Q1 : BOOL;
        Q2 : BOOL;
        Q3 : BOOL;
        Q4 : BOOL;
        Q5 : BOOL;
        Q6 : BOOL;
        Q31 : BOOL;
        Q41 : BOOL;
        Q51 : BOOL;
        Q61 : BOOL;
        Q32 : BOOL;
        Q42 : BOOL;
        Q52 : BOOL;
        Q62 : BOOL;
    END_VAR
    VAR_INPUT 
        t_debounce : TIME := TIME#50ms;
    END_VAR
    VAR 
        init : BOOL;
        T1 : OSCAT_BASIC.TOF;
        T2 : OSCAT_BASIC.TOF;
        T3 : OSCAT_BASIC.TOF;
        T4 : OSCAT_BASIC.TOF;
        T5 : OSCAT_BASIC.TOF;
        T6 : OSCAT_BASIC.TOF;
        tx : TIME;
        x1 : BOOL;
        x2 : BOOL;
        E1 : BOOL;
        E2 : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TIMER_1 (*  *)(* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=60 *)
    VAR_INPUT 
        E : BOOL := TRUE;
        DTI : DT;
        START : TOD;
        DURATION : TIME;
        DAY : BYTE := 2#1111111;
    END_VAR
    VAR_OUTPUT 
        Q : BOOL;
        stop : TIME;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TIMER_2 (*  *)(* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=60 *)
    VAR_INPUT 
        DT_in : DT;
        start : TOD;
        duration : TIME;
        mode : BYTE;
        HOLIDAY : BOOL;
    END_VAR
    VAR_OUTPUT 
        Q : BOOL;
    END_VAR
    VAR 
        last_check : TIME;
        dat : DATE;
        daytime : TOD;
        activation : TIME;
        tx : TIME;
        enabled : BOOL;
        init : BOOL;
        wday : INT;
    END_VAR
    VAR RETAIN
        run_date : DATE;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION TIMER_EVENT_DECODE : OSCAT_BASIC.TIMER_EVENT (*  *)(* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=62 *)
    VAR_INPUT 
        EVENT : STRING[OSCAT_BASIC.STRING_LENGTH];
        LANG : INT;
    END_VAR
    VAR 
        pos : INT;
        start : INT;
        stop : INT;
        pt : POINTER TO ARRAY[1..255] OF BYTE;
        step : INT;
        tmp : STRING[60];
    END_VAR
END_FUNCTION
FUNCTION_BLOCK TIMER_EXT (*  *)(* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=63 *)
    VAR_INPUT 
        ENA : BOOL := TRUE;
        ON : BOOL;
        OFF : BOOL;
        MAN : BOOL;
        SWITCH : BOOL;
        DT_IN : DT;
        SUN_RISE : TOD;
        SUN_SET : TOD;
        HOLIDAY : BOOL;
        T_DEBOUNCE : TIME := TIME#100ms;
        T_RISE_START : TIME;
        T_RISE_STOP : TIME;
        T_SET_START : TIME;
        T_SET_STOP : TIME;
        T_DAY_START : TOD;
        T_DAY_STOP : TOD;
        ENABLE_SATURDAY : BOOL;
        ENABLE_SUNDAY : BOOL;
        ENABLE_HOLIDAY : BOOL;
    END_VAR
    VAR_OUTPUT 
        Q : BOOL;
        STATUS : BYTE;
    END_VAR
    VAR 
        mx : OSCAT_BASIC.MANUAL_2;
        deb : DEBOUNCE;
        tdx : TOD;
        wdx : INT;
        tc : TIME;
        tx : DWORD;
        tl : DWORD;
        qx : BOOL;
        init : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TIMER_P4 (*  *)(* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=65 *)
    VAR_INPUT 
        DTIME : DT;
        TREF_0 : TOD;
        TREF_1 : TOD;
        HOLY : BOOL;
        L0 : BOOL;
        L1 : BOOL;
        L2 : BOOL;
        L3 : BOOL;
        OFS : BYTE;
        ENQ : BOOL;
        MAN : BOOL;
        MI : BYTE;
        RST : BOOL;
    END_VAR
    VAR_IN_OUT 
        PROG : ARRAY[0..array_max] OF OSCAT_BASIC.TIMER_EVENT;
    END_VAR
    VAR_OUTPUT 
        Q0 : BOOL;
        Q1 : BOOL;
        Q2 : BOOL;
        Q3 : BOOL;
        STATUS : BYTE;
    END_VAR
    VAR CONSTANT
        array_max : INT := 63;
        channel_max : INT := 3;
    END_VAR
    VAR 
        day_start : DT;
        start : DT;
        event : OSCAT_BASIC.TIMER_EVENT;
        pos : INT;
        last_execute : DT;
        current_day : DINT;
        mask : BYTE;
        ma : ARRAY[0..channel_max] OF BYTE;
        mo : ARRAY[0..channel_max] OF BYTE;
        qn : ARRAY[0..channel_max] OF BOOL;
        qs : ARRAY[0..channel_max] OF BOOL;
        channel : INT;
        tx : TOD;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION AIR_DENSITY : REAL (*  *)(* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=426 *)
    VAR_INPUT 
        T : REAL;
        P : REAL;
        RH : REAL;
    END_VAR
    VAR CONSTANT
        RL : REAL := 287.05;
        RX : REAL := 0.003773319;
    END_VAR
END_FUNCTION
FUNCTION AIR_ENTHALPY : REAL (*  *)(* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=427 *)
    VAR_INPUT 
        T : REAL;
        RH : REAL;
    END_VAR
    VAR CONSTANT
        CPL : REAL := 1.00482;
        CW : REAL := 1.86;
        LH : REAL := 2500.78;
    END_VAR
END_FUNCTION
FUNCTION_BLOCK BOILER (*  *)(* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=428 *)
    VAR_INPUT 
        T_upper : REAL;
        T_lower : REAL;
        Pressure : BOOL := TRUE;
        enable : BOOL := TRUE;
        Req_1 : BOOL;
        Req_2 : BOOL;
        Boost : BOOL;
        t_upper_min : REAL := 50;
        t_upper_max : REAL := 60;
        T_lower_enable : BOOL;
        T_lower_max : REAL := 60;
        T_request_1 : REAL := 70;
        T_request_2 : REAL := 50;
        T_request_hys : REAL := 5;
        T_protect_high : REAL := 80;
        T_protect_low : REAL := 10;
    END_VAR
    VAR_OUTPUT 
        Heat : BOOL;
        error : BOOL;
        status : BYTE;
    END_VAR
    VAR 
        edge : BOOL;
        boost_mode : BOOL;
        flag_0 : BOOL;
        flag_1 : BOOL;
        flag_2 : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK BURNER (*  *)(* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=430 *)
    VAR_INPUT 
        in : BOOL;
        stage2 : BOOL;
        over_temp : BOOL;
        oil_temp : BOOL := TRUE;
        Flame : BOOL;
        rst : BOOL;
        rst_timer : BOOL;
        pre_heat_time : TIME := TIME#5s0ms;
        pre_vent_time : TIME := TIME#15s0ms;
        pre_ignite_time : TIME := TIME#5s0ms;
        post_ignite_time : TIME := TIME#25s0ms;
        stage2_delay : TIME := TIME#10s0ms;
        safety_time : TIME := TIME#5s0ms;
        lockout_time : TIME := TIME#10s0ms;
        multiple_ignition : BOOL := TRUE;
        KW1 : REAL;
        KW2 : REAL;
    END_VAR
    VAR_OUTPUT 
        motor : BOOL;
        coil1 : BOOL;
        coil2 : BOOL;
        pre_heat : BOOL;
        ignite : BOOL;
        KWh : REAL;
        status : BYTE;
        fail : BOOL;
    END_VAR
    VAR_IN_OUT 
        runtime1 : UDINT;
        runtime2 : UDINT;
        cycles : UDINT;
    END_VAR
    VAR 
        state : BYTE;
        last : TIME;
        tx : TIME;
        last_change : TIME;
        timer1 : OSCAT_BASIC.ONTIME;
        timer2 : OSCAT_BASIC.ONTIME;
        oil_temp_last : BOOL;
        cycles2 : UDINT;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION DEW_CON : REAL (*  *)(* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=434 *)
    VAR_INPUT 
        RH : REAL;
        T : REAL;
    END_VAR
END_FUNCTION
FUNCTION DEW_RH : REAL (*  *)(* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=435 *)
    VAR_INPUT 
        VC : REAL;
        T : REAL;
    END_VAR
END_FUNCTION
FUNCTION DEW_TEMP : REAL (*  *)(* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=436 *)
    VAR_INPUT 
        RH : REAL;
        T : REAL;
    END_VAR
    VAR CONSTANT
        a : REAL := 7.5;
        b : REAL := 237.3;
    END_VAR
    VAR 
        V : REAL;
    END_VAR
END_FUNCTION
FUNCTION HEAT_INDEX : REAL (*  *)(* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=436 *)
    VAR_INPUT 
        T : REAL;
        RH : REAL;
    END_VAR
    VAR 
        RH2 : REAL;
        T2 : REAL;
    END_VAR
END_FUNCTION
FUNCTION_BLOCK HEAT_METER (*  *)(* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=436 *)
    VAR_INPUT 
        TF : REAL;
        TR : REAL;
        LPH : REAL;
        E : BOOL;
        RST : BOOL;
        CP : REAL;
        Density : REAL;
        Content : REAL;
        Pulse_Mode : BOOL;
        Return_meter : BOOL;
        AVG_time : TIME := TIME#5s0ms;
    END_VAR
    VAR_OUTPUT 
        C : REAL;
    END_VAR
    VAR_IN_OUT 
        Y : REAL;
    END_VAR
    VAR 
        tx : DWORD;
        last : DWORD;
        int1 : OSCAT_BASIC.FT_INT2;
        edge : BOOL;
        x : REAL;
        init : BOOL;
        y_last : REAL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK HEAT_TEMP (*  *)(* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=33 *)
    VAR_INPUT 
        T_EXT : REAL;
        T_INT : REAL;
        OFFSET : REAL;
        T_REQ : REAL;
        TY_MAX : REAL := 70;
        TY_MIN : REAL := 25;
        TY_CONFIG : REAL := 70;
        T_INT_CONFIG : REAL := 20;
        T_EXT_CONFIG : REAL := -15;
        T_DIFF : REAL := 10;
        C : REAL := 1.33;
        H : REAL := 3;
    END_VAR
    VAR_OUTPUT 
        TY : REAL;
        HEAT : BOOL;
    END_VAR
    VAR 
        tr : REAL;
        tx : REAL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK LEGIONELLA (*  *)(* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=443 *)
    VAR_INPUT 
        manual : BOOL;
        temp_boiler : REAL;
        temp_return : REAL := 100;
        DT_in : DT;
        rst : BOOL;
        T_start : TOD := TIME_OF_DAY#3:0;
        day : INT := 7;
        temp_set : REAL := 70;
        temp_offset : REAL := 10;
        temp_hys : REAL := 5;
        t_max_heat : TIME := TIME#10m0s0ms;
        t_max_ret : TIME := TIME#10m0s0ms;
        tp_0 : TIME := TIME#5m0s0ms;
        TP_1 : TIME := TIME#5m0s0ms;
        tp_2 : TIME := TIME#5m0s0ms;
        tp_3 : TIME := TIME#5m0s0ms;
        tp_4 : TIME := TIME#5m0s0ms;
        tp_5 : TIME := TIME#5m0s0ms;
        tp_6 : TIME := TIME#5m0s0ms;
        tp_7 : TIME := TIME#5m0s0ms;
    END_VAR
    VAR_OUTPUT 
        Heat : BOOL;
        pump : BOOL;
        valve0 : BOOL;
        valve1 : BOOL;
        valve2 : BOOL;
        valve3 : BOOL;
        valve4 : BOOL;
        valve5 : BOOL;
        valve6 : BOOL;
        valve7 : BOOL;
        run : BOOL;
        Status : BYTE;
    END_VAR
    VAR 
        X1 : TIMER_1;
        x2 : OSCAT_BASIC.SEQUENCE_8;
        x3 : OSCAT_BASIC.HYST_1;
        init : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION SDD : REAL (*  *)(* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=445 *)
    VAR_INPUT 
        T : REAL;
        ICE : BOOL;
    END_VAR
END_FUNCTION
FUNCTION SDD_NH3 : REAL (*  *)(* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=446 *)
    VAR_INPUT 
        T : REAL;
    END_VAR
END_FUNCTION
FUNCTION SDT_NH3 : REAL (*  *)(* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=446 *)
    VAR_INPUT 
        P : REAL;
    END_VAR
END_FUNCTION
FUNCTION_BLOCK T_AVG24 (*  *)(* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=446 *)
    VAR_INPUT 
        TS : INT;
        DTI : DT;
        RST : BOOL;
        T_FILTER : TIME := TIME#10m0s0ms;
        SCALE : REAL := 1;
        OFS : REAL;
    END_VAR
    VAR_OUTPUT 
        TA : REAL;
        TP : BOOL;
    END_VAR
    VAR_IN_OUT 
        T24 : REAL;
        T24_MAX : REAL;
        T24_MIN : REAL;
    END_VAR
    VAR 
        samples : ARRAY[0..47] OF INT;
        pos : INT;
        init : BOOL;
        ft1 : OSCAT_BASIC.FILTER_I;
        sum : DINT;
        last : DT;
    END_VAR
    VAR_TEMP 
        tmp_max : INT;
        tmp_min : INT;
        i : INT;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TANK_LEVEL (*  *)(* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=41 *)
    VAR_INPUT 
        LEVEL : BOOL;
        LEAK : BOOL;
        ACLR : BOOL;
        MAX_VALVE_TIME : TIME;
        LEVEL_DELAY_TIME : TIME;
    END_VAR
    VAR_OUTPUT 
        VALVE : BOOL;
        ALARM : BOOL;
        STATUS : BYTE;
    END_VAR
    VAR 
        cx : ACTUATOR_COIL;
        tn : OSCAT_BASIC.TON;
        tl : OSCAT_BASIC.TONOF;
        open : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION TANK_VOL1 : REAL (*  *)(* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=448 *)
    VAR_INPUT 
        TR : REAL;
        TL : REAL;
        H : REAL;
    END_VAR
END_FUNCTION
FUNCTION TANK_VOL2 : REAL (*  *)(* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=448 *)
    VAR_INPUT 
        TR : REAL;
        H : REAL;
    END_VAR
END_FUNCTION
FUNCTION_BLOCK TEMP_EXT (*  *)(* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=449 *)
    VAR_INPUT 
        t_ext1 : REAL;
        t_ext2 : REAL;
        t_ext3 : REAL;
        t_ext_config : BYTE;
        dt_in : DT;
        t_ext_min : REAL := -40;
        t_ext_max : REAL := 60;
        t_ext_default : REAL := -10;
        heat_period_start : DATE := DATE#1970-9-1;
        heat_period_stop : DATE := DATE#1970-4-30;
        cool_period_start : DATE := DATE#1970-4-1;
        cool_period_stop : DATE := DATE#1970-9-30;
        heat_start_temp_day : REAL := 15;
        heat_start_temp_night : REAL := 10;
        heat_stop_temp : REAL := 18;
        cool_start_temp_day : REAL := 26;
        cool_start_temp_night : REAL := 26;
        cool_stop_temp : REAL := 24;
        start_day : TOD := TIME_OF_DAY#9:0;
        start_night : TOD := TIME_OF_DAY#21:0;
        CYCLE_TIME : TIME := TIME#10m0s0ms;
    END_VAR
    VAR_OUTPUT 
        t_ext : REAL;
        heat : BOOL;
        cool : BOOL;
    END_VAR
    VAR 
        tx : TIME;
        last_run : TIME;
        init : BOOL;
        cool_start : DATE;
        cool_stop : DATE;
        heat_start : DATE;
        heat_stop : DATE;
        xdate : DATE;
        day : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION WATER_CP : REAL (*  *)(* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=452 *)
    VAR_INPUT 
        T : REAL;
    END_VAR
    VAR 
        Pts : INT := 10;
        data : ARRAY[1..20, 0..1] OF REAL := ['0', '4.228', '5', '4.2', '10', '4.188', '15', '4.184', '50', '4.181', '60', '4.183', '70', '4.187', '80', '4.194', '90', '4.204', '100', '4.22'];
    END_VAR
END_FUNCTION
FUNCTION WATER_DENSITY : REAL (*  *)(* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=452 *)
    VAR_INPUT 
        T : REAL;
        Sat : BOOL;
    END_VAR
    VAR CONSTANT
        a0 : REAL := 999.83952;
        a1 : REAL := 16.952577;
        a2 : REAL := -0.0079905127;
        a3 : REAL := -4.6241757E-05;
        a4 : REAL := 1.0584601E-07;
        a5 : REAL := -2.8103006E-10;
        b : REAL := 0.0168872;
    END_VAR
    VAR 
        T2 : REAL;
        T4 : REAL;
    END_VAR
END_FUNCTION
FUNCTION WATER_ENTHALPY : REAL (*  *)(* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=453 *)
    VAR_INPUT 
        T : REAL;
    END_VAR
    VAR 
        Pts : INT := 11;
        data : ARRAY[1..20, 0..1] OF REAL := ['0', '0.06', '10', '42.1', '20', '83.9', '30', '125.8', '40', '167.58', '50', '209.4', '60', '251.2', '70', '293.1', '80', '335', '90', '377', '100', '419.1'];
    END_VAR
END_FUNCTION
FUNCTION WCT : REAL (*  *)(* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=453 *)
    VAR_INPUT 
        T : REAL;
        V : REAL;
    END_VAR
END_FUNCTION
FUNCTION_BLOCK BLIND_ACTUATOR (*  *)(* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=74 *)
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
        position : OSCAT_BASIC.RMP_B;
        angle : OSCAT_BASIC.RMP_B;
        lock : OSCAT_BASIC.INTERLOCK;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK BLIND_CONTROL (*  *)(* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=75 *)
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
FUNCTION_BLOCK BLIND_CONTROL_S (*  *)(* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=78 *)
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
        rmp : OSCAT_BASIC._RMP_NEXT;
        tx : TIME;
        last : TIME;
        PI_last : BYTE;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK BLIND_INPUT (*  *)(* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=80 *)
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
        s1e : OSCAT_BASIC.TOF;
        s2e : OSCAT_BASIC.TOF;
        s1d : CLICK_MODE;
        s2d : CLICK_MODE;
        dir : BOOL;
        tx : TIME;
        last : TIME;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK BLIND_NIGHT (*  *)(* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=84 *)
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
FUNCTION_BLOCK BLIND_SCENE (*  *)(* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=87 *)
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
    VAR RETAIN
        sx : ARRAY[0..15, 0..2] OF BYTE;
    END_VAR
    VAR_TEMP 
        x : BYTE;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK BLIND_SECURITY (*  *)(* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=89 *)
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
FUNCTION_BLOCK BLIND_SET (*  *)(* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=91 *)
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
FUNCTION_BLOCK BLIND_SHADE (*  *)(* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=93 *)
    VAR_INPUT 
        UP : BOOL;
        DN : BOOL;
        S_IN : BYTE;
        PI : BYTE;
        AI : BYTE;
        ENABLE : BOOL;
        SUN : BOOL;
    END_VAR
    VAR_IN_OUT 
        CX : OSCAT_BASIC.CALENDAR;
    END_VAR
    VAR_INPUT 
        sunrise_offset : TIME := TIME#60m0s0ms;
        sunset_preset : TIME := TIME#60m0s0ms;
        direction : REAL := 180;
        angle_offset : REAL := 80;
        slat_width : REAL := 80;
        Slat_spacing : REAL := 60;
        Shade_delay : TIME := TIME#1m0s0ms;
        Shade_pos : BYTE;
    END_VAR
    VAR_OUTPUT 
        QU : BOOL;
        QD : BOOL;
        STATUS : BYTE;
        PO : BYTE;
        AO : BYTE;
    END_VAR
    VAR 
        angle : REAL;
        sun_delay : OSCAT_BASIC.TOF;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK BLIND_SHADE_S (*  *)(* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=96 *)
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
    VAR_IN_OUT 
        CX : OSCAT_BASIC.calendar;
    END_VAR
    VAR_INPUT 
        sunrise_offset : TIME := TIME#60m0s0ms;
        sunset_preset : TIME := TIME#60m0s0ms;
        shade_delay : TIME := TIME#1m0s0ms;
        shade_pos : BYTE;
    END_VAR
    VAR_OUTPUT 
        QU : BOOL;
        QD : BOOL;
        STATUS : BYTE;
        PO : BYTE;
    END_VAR
    VAR 
        sun_delay : OSCAT_BASIC.TOF;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION BUILDING_VERSION : DWORD (*  *)(* http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=11 *)
    VAR_INPUT 
        IN : BOOL;
    END_VAR
END_FUNCTION
