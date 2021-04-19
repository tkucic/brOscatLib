FUNCTION AIR_DENSITY : REAL
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
FUNCTION AIR_ENTHALPY : REAL
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
FUNCTION_BLOCK BOILER
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
        edge_ : BOOL;
        boost_mode : BOOL;
        flag_0 : BOOL;
        flag_1 : BOOL;
        flag_2 : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK BURNER
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
        timer1 : ONTIME;
        timer2 : ONTIME;
        oil_temp_last : BOOL;
        cycles2 : UDINT;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION DEW_CON : REAL
    VAR_INPUT
        RH : REAL;
        T : REAL;
    END_VAR
END_FUNCTION
FUNCTION DEW_RH : REAL
    VAR_INPUT
        VC : REAL;
        T : REAL;
    END_VAR
END_FUNCTION
FUNCTION DEW_TEMP : REAL
    VAR_INPUT
        RH : REAL;
        T : REAL;
    END_VAR
    VAR
        V : REAL;
    END_VAR
    VAR CONSTANT
        a : REAL := 7.5;
        b : REAL := 237.3;
    END_VAR
END_FUNCTION
FUNCTION HEAT_INDEX : REAL
    VAR_INPUT
        T : REAL;
        RH : REAL;
    END_VAR
    VAR
        RH2 : REAL;
        T2 : REAL;
    END_VAR
END_FUNCTION
FUNCTION_BLOCK HEAT_METER
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
        int1 : FT_INT2;
        edge_ : BOOL;
        x : REAL;
        init : BOOL;
        y_last : REAL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK HEAT_TEMP
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
FUNCTION_BLOCK LEGIONELLA
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
        x2 : SEQUENCE_8;
        x3 : HYST_1;
        init : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION SDD : REAL
    VAR_INPUT
        T : REAL;
        ICE : BOOL;
    END_VAR
END_FUNCTION
FUNCTION SDD_NH3 : REAL
    VAR_INPUT
        T : REAL;
    END_VAR
END_FUNCTION
FUNCTION SDT_NH3 : REAL
    VAR_INPUT
        P : REAL;
    END_VAR
END_FUNCTION
FUNCTION_BLOCK T_AVG24
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
        ft1 : FILTER_I;
        sum : DINT;
        last : DT;
        tmp_max : INT;
        tmp_min : INT;
        i : INT;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TANK_LEVEL
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
        tn : TON;
        tl : TONOF;
        open : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION TANK_VOL1 : REAL
    VAR_INPUT
        TR : REAL;
        TL : REAL;
        H : REAL;
    END_VAR
END_FUNCTION
FUNCTION TANK_VOL2 : REAL
    VAR_INPUT
        TR : REAL;
        H : REAL;
    END_VAR
END_FUNCTION
FUNCTION_BLOCK TEMP_EXT
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
FUNCTION WATER_CP : REAL
    VAR_INPUT
        T : REAL;
    END_VAR
    VAR
        Pts : INT := 10;
        data : ARRAY[1..20, 0..1] OF REAL := [0, 4.228, 5, 4.2, 10, 4.188, 15, 4.184, 50, 4.181, 60, 4.183, 70, 4.187, 80, 4.194, 90, 4.204, 100, 4.22];
    END_VAR
END_FUNCTION
FUNCTION WATER_DENSITY : REAL
    VAR_INPUT
        T : REAL;
        Sat : BOOL;
    END_VAR
    VAR
        T2 : REAL;
        T4 : REAL;
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
END_FUNCTION
FUNCTION WATER_ENTHALPY : REAL
    VAR_INPUT
        T : REAL;
    END_VAR
    VAR
        Pts : INT := 11;
        data : ARRAY[1..20, 0..1] OF REAL := [0, 0.06, 10, 42.1, 20, 83.9, 30, 125.8, 40, 167.58, 50, 209.4, 60, 251.2, 70, 293.1, 80, 335, 90, 377, 100, 419.1];
    END_VAR
END_FUNCTION
FUNCTION WCT : REAL
    VAR_INPUT
        T : REAL;
        V : REAL;
    END_VAR
END_FUNCTION
