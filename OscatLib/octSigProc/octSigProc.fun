FUNCTION AIN : REAL
    VAR_INPUT
        in : DWORD; (**)
        Bits : BYTE; (**)
        sign : BYTE := 255; (**)
        low : REAL; (**)
        high : REAL := 10; (**)
    END_VAR
    VAR
        ff : DWORD := 16#FFFFFFFF; (**)
    END_VAR
END_FUNCTION
FUNCTION_BLOCK AIN1
    VAR_INPUT
        in : DWORD; (**)
        sign_bit : INT := 255; (**)
        error_bit : INT := 255; (**)
        error_code_en : BOOL; (**)
        error_code : DWORD; (**)
        overflow_bit : INT := 255; (**)
        overflow_code_en : BOOL; (**)
        overflow_code : DWORD; (**)
        Bit_0 : INT; (**)
        Bit_N : INT := 31; (**)
        out_min : REAL; (**)
        out_max : REAL := 10; (**)
        code_min : DWORD; (**)
        code_max : DWORD := 16#FFFFFFFF; (**)
        error_output : REAL; (**)
        overflow_output : REAL := 10; (**)
    END_VAR
    VAR_OUTPUT
        out : REAL; (**)
        sign : BOOL; (**)
        error : BOOL; (**)
        overflow : BOOL; (**)
    END_VAR
    VAR
        tB : DWORD; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION AOUT : DWORD
    VAR_INPUT
        in : REAL; (**)
        Bits : BYTE; (**)
        sign : BYTE := 255; (**)
        low : REAL; (**)
        high : REAL := 10; (**)
    END_VAR
    VAR
        ff : DWORD := 2#1; (**)
    END_VAR
END_FUNCTION
FUNCTION AOUT1 : DWORD
    VAR_INPUT
        in : REAL; (**)
        Bit_0 : INT; (**)
        Bit_N : INT := 31; (**)
        sign : INT := 255; (**)
        low : REAL; (**)
        high : REAL := 10; (**)
    END_VAR
    VAR
        ff : DWORD := 2#1; (**)
    END_VAR
END_FUNCTION
FUNCTION BYTE_TO_RANGE : REAL
    VAR_INPUT
        X : BYTE; (**)
        low : REAL; (**)
        high : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION_BLOCK DELAY
    VAR_INPUT
        IN : REAL; (**)
        N : INT; (**)
        RST : BOOL; (**)
    END_VAR
    VAR_OUTPUT
        OUT : REAL; (**)
    END_VAR
    VAR
        buf : ARRAY[0..31] OF REAL; (**)
        i : INT; (**)
        init : BOOL; (**)
        stop : INT; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK DELAY_4
    VAR_INPUT
        in : REAL; (**)
    END_VAR
    VAR_OUTPUT
        out1 : REAL; (**)
        out2 : REAL; (**)
        out3 : REAL; (**)
        out4 : REAL; (**)
    END_VAR
    VAR
        temp : REAL; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK FADE
    VAR_INPUT
        IN1 : REAL; (**)
        IN2 : REAL; (**)
        F : BOOL; (**)
        TF : TIME; (**)
        rst : BOOL; (**)
    END_VAR
    VAR_OUTPUT
        Y : REAL; (**)
    END_VAR
    VAR
        rmx : RMP_W; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK FILTER_DW
    VAR_INPUT
        X : DWORD; (**)
        T : TIME; (**)
    END_VAR
    VAR_OUTPUT
        Y : DWORD; (**)
    END_VAR
    VAR
        last : DWORD; (**)
        tx : DWORD; (**)
        init : BOOL; (**)
        Yi : REAL; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK FILTER_I
    VAR_INPUT
        X : INT; (**)
        T : TIME; (**)
    END_VAR
    VAR_OUTPUT
        Y : INT; (**)
    END_VAR
    VAR
        Yi : DINT; (**)
        last : DWORD; (**)
        tx : DWORD; (**)
        init : BOOL; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK FILTER_MAV_DW
    VAR_INPUT
        X : DWORD; (**)
        N : UINT; (**)
        RST : BOOL; (**)
    END_VAR
    VAR_OUTPUT
        Y : DWORD; (**)
    END_VAR
    VAR
        init : BOOL; (**)
        buffer : ARRAY[0..31] OF DWORD; (**)
        i : INT; (**)
        tmp : INT; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK FILTER_MAV_W
    VAR_INPUT
        X : WORD; (**)
        N : UINT; (**)
        RST : BOOL; (**)
    END_VAR
    VAR_OUTPUT
        Y : WORD; (**)
    END_VAR
    VAR
        init : BOOL; (**)
        buffer : ARRAY[0..31] OF WORD; (**)
        i : INT; (**)
        tmp : INT; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK FILTER_W
    VAR_INPUT
        X : WORD; (**)
        T : TIME; (**)
    END_VAR
    VAR_OUTPUT
        Y : WORD; (**)
    END_VAR
    VAR
        last : DWORD; (**)
        tx : DWORD; (**)
        init : BOOL; (**)
        tmp : DWORD; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK FILTER_WAV
    VAR_INPUT
        X : REAL; (**)
        W : ARRAY[0..15] OF REAL; (**)
        RST : BOOL; (**)
    END_VAR
    VAR_OUTPUT
        Y : REAL; (**)
    END_VAR
    VAR
        init : BOOL; (**)
        buffer : ARRAY[0..15] OF REAL; (**)
        i : INT; (**)
        n : INT; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION MIX : REAL
    VAR_INPUT
        A : REAL; (**)
        B : REAL; (**)
        M : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION MUX_R2 : REAL
    VAR_INPUT
        IN0 : REAL; (**)
        IN1 : REAL; (**)
        A : BOOL; (**)
    END_VAR
END_FUNCTION
FUNCTION MUX_R4 : REAL
    VAR_INPUT
        IN0 : REAL; (**)
        IN1 : REAL; (**)
        IN2 : REAL; (**)
        IN3 : REAL; (**)
        A0 : BOOL; (**)
        A1 : BOOL; (**)
    END_VAR
END_FUNCTION
FUNCTION OFFSET : REAL
    VAR_INPUT
        X : REAL; (**)
        O1 : BOOL; (**)
        O2 : BOOL; (**)
        O3 : BOOL; (**)
        O4 : BOOL; (**)
        D : BOOL; (**)
        Offset_1 : REAL; (**)
        Offset_2 : REAL; (**)
        Offset_3 : REAL; (**)
        Offset_4 : REAL; (**)
        default : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION OFFSET2 : REAL
    VAR_INPUT
        X : REAL; (**)
        O1 : BOOL; (**)
        O2 : BOOL; (**)
        O3 : BOOL; (**)
        O4 : BOOL; (**)
        D : BOOL; (**)
        Offset_1 : REAL; (**)
        Offset_2 : REAL; (**)
        Offset_3 : REAL; (**)
        Offset_4 : REAL; (**)
        default : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION OVERRIDE : REAL
    VAR_INPUT
        X1 : REAL; (**)
        X2 : REAL; (**)
        X3 : REAL; (**)
        E1 : BOOL; (**)
        E2 : BOOL; (**)
        E3 : BOOL; (**)
    END_VAR
END_FUNCTION
FUNCTION RANGE_TO_BYTE : BYTE
    VAR_INPUT
        X : REAL; (**)
        low : REAL; (**)
        high : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION RANGE_TO_WORD : WORD
    VAR_INPUT
        X : REAL; (**)
        low : REAL; (**)
        high : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION SCALE : REAL
    VAR_INPUT
        X : REAL; (**)
        K : REAL; (**)
        O : REAL; (**)
        MX : REAL; (**)
        MN : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION SCALE_B : REAL
    VAR_INPUT
        X : BYTE; (**)
        I_LO : BYTE; (**)
        I_HI : BYTE; (**)
        O_LO : REAL; (**)
        O_HI : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION SCALE_B2 : REAL
    VAR_INPUT
        in1 : BYTE; (**)
        in2 : BYTE; (**)
        K : REAL; (**)
        O : REAL; (**)
        in1_min : REAL; (**)
        in1_max : REAL := 1000; (**)
        in2_min : REAL; (**)
        in2_max : REAL := 1000; (**)
    END_VAR
END_FUNCTION
FUNCTION SCALE_B4 : REAL
    VAR_INPUT
        in1 : BYTE; (**)
        in2 : BYTE; (**)
        in3 : BYTE; (**)
        in4 : BYTE; (**)
        K : REAL; (**)
        O : REAL; (**)
        in1_min : REAL; (**)
        in1_max : REAL := 1000; (**)
        in2_min : REAL; (**)
        in2_max : REAL := 1000; (**)
        in3_min : REAL; (**)
        in3_max : REAL := 1000; (**)
        in4_min : REAL; (**)
        in4_max : REAL := 1000; (**)
    END_VAR
END_FUNCTION
FUNCTION SCALE_B8 : REAL
    VAR_INPUT
        in1 : BYTE; (**)
        in2 : BYTE; (**)
        in3 : BYTE; (**)
        in4 : BYTE; (**)
        in5 : BYTE; (**)
        in6 : BYTE; (**)
        in7 : BYTE; (**)
        in8 : BYTE; (**)
        K : REAL; (**)
        O : REAL; (**)
        in1_min : REAL; (**)
        in1_max : REAL := 1000; (**)
        in2_min : REAL; (**)
        in2_max : REAL := 1000; (**)
        in3_min : REAL; (**)
        in3_max : REAL := 1000; (**)
        in4_min : REAL; (**)
        in4_max : REAL := 1000; (**)
        in5_min : REAL; (**)
        in5_max : REAL := 1000; (**)
        in6_min : REAL; (**)
        in6_max : REAL := 1000; (**)
        in7_min : REAL; (**)
        in7_max : REAL := 1000; (**)
        in8_min : REAL; (**)
        in8_max : REAL := 1000; (**)
    END_VAR
END_FUNCTION
FUNCTION SCALE_D : REAL
    VAR_INPUT
        X : DWORD; (**)
        I_LO : DWORD; (**)
        I_HI : DWORD; (**)
        O_LO : REAL; (**)
        O_HI : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION SCALE_R : REAL
    VAR_INPUT
        X : REAL; (**)
        I_LO : REAL; (**)
        I_HI : REAL; (**)
        O_LO : REAL; (**)
        O_HI : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION SCALE_X2 : REAL
    VAR_INPUT
        IN1 : BOOL; (**)
        IN2 : BOOL; (**)
        K : REAL; (**)
        O : REAL; (**)
        IN1_MIN : REAL; (**)
        IN1_MAX : REAL := 1000; (**)
        IN2_MIN : REAL; (**)
        IN2_MAX : REAL := 1000; (**)
    END_VAR
END_FUNCTION
FUNCTION SCALE_X4 : REAL
    VAR_INPUT
        IN1 : BOOL; (**)
        IN2 : BOOL; (**)
        IN3 : BOOL; (**)
        IN4 : BOOL; (**)
        K : REAL; (**)
        O : REAL; (**)
        IN1_MIN : REAL; (**)
        IN1_MAX : REAL := 1000; (**)
        IN2_MIN : REAL; (**)
        IN2_MAX : REAL := 1000; (**)
        IN3_MIN : REAL; (**)
        IN3_MAX : REAL := 1000; (**)
        IN4_MIN : REAL; (**)
        IN4_MAX : REAL := 1000; (**)
    END_VAR
END_FUNCTION
FUNCTION SCALE_X8 : REAL
    VAR_INPUT
        in1 : BOOL; (**)
        in2 : BOOL; (**)
        in3 : BOOL; (**)
        in4 : BOOL; (**)
        in5 : BOOL; (**)
        in6 : BOOL; (**)
        in7 : BOOL; (**)
        in8 : BOOL; (**)
        K : REAL; (**)
        O : REAL; (**)
        in1_min : REAL; (**)
        in1_max : REAL := 1000; (**)
        in2_min : REAL; (**)
        in2_max : REAL := 1000; (**)
        in3_min : REAL; (**)
        in3_max : REAL := 1000; (**)
        in4_min : REAL; (**)
        in4_max : REAL := 1000; (**)
        in5_min : REAL; (**)
        in5_max : REAL := 1000; (**)
        in6_min : REAL; (**)
        in6_max : REAL := 1000; (**)
        in7_min : REAL; (**)
        in7_max : REAL := 1000; (**)
        in8_min : REAL; (**)
        in8_max : REAL := 1000; (**)
    END_VAR
END_FUNCTION
FUNCTION_BLOCK SEL2_OF_3
    VAR_INPUT
        IN1 : REAL; (**)
        IN2 : REAL; (**)
        IN3 : REAL; (**)
        D : REAL; (**)
    END_VAR
    VAR_OUTPUT
        Y : REAL; (**)
        W : INT; (**)
        E : BOOL; (**)
    END_VAR
    VAR
        D12 : BOOL; (**)
        D23 : BOOL; (**)
        D31 : BOOL; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK SEL2_OF_3B
    VAR_INPUT
        IN1 : BOOL; (**)
        IN2 : BOOL; (**)
        IN3 : BOOL; (**)
        TD : TIME; (**)
    END_VAR
    VAR_OUTPUT
        Q : BOOL; (**)
        W : BOOL; (**)
    END_VAR
    VAR
        TDEL : TON; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK SH
    VAR_INPUT
        in : REAL; (**)
        CLK : BOOL; (**)
    END_VAR
    VAR_OUTPUT
        out : REAL; (**)
        trig : BOOL; (**)
    END_VAR
    VAR
        edge : BOOL; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK SH_1
    VAR_INPUT
        in : REAL; (**)
        PT : TIME; (**)
    END_VAR
    VAR_OUTPUT
        out : REAL; (**)
        Trig : BOOL; (**)
    END_VAR
    VAR
        last : TIME; (**)
        tx : TIME; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK SH_2
    VAR_INPUT
        in : REAL; (**)
        PT : TIME; (**)
        N : INT := 16; (**)
        disc : INT; (**)
    END_VAR
    VAR_OUTPUT
        out : REAL; (**)
        trig : BOOL; (**)
        avg : REAL; (**)
        high : REAL; (**)
        low : REAL; (**)
    END_VAR
    VAR
        M : INT; (**)
        buf : ARRAY[0..15] OF REAL; (**)
        buf2 : ARRAY[0..15] OF REAL; (**)
        last : TIME; (**)
        i : INT; (**)
        start : INT; (**)
        temp : REAL; (**)
        stop : INT; (**)
        tx : TIME; (**)
        d2 : INT; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK SH_T
    VAR_INPUT
        IN : REAL; (**)
        E : BOOL; (**)
    END_VAR
    VAR_OUTPUT
        OUT : REAL; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION STAIR : REAL
    VAR_INPUT
        X : REAL; (**)
        D : REAL; (**)
    END_VAR
END_FUNCTION
FUNCTION_BLOCK STAIR2
    VAR_INPUT
        X : REAL; (**)
        D : REAL; (**)
    END_VAR
    VAR_OUTPUT
        Y : REAL; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TREND
    VAR_INPUT
        X : REAL; (**)
    END_VAR
    VAR_OUTPUT
        Q : BOOL; (**)
        TU : BOOL; (**)
        TD : BOOL; (**)
        D : REAL; (**)
    END_VAR
    VAR
        last_X : REAL; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TREND_DW
    VAR_INPUT
        X : DWORD; (**)
    END_VAR
    VAR_OUTPUT
        Q : BOOL; (**)
        TU : BOOL; (**)
        TD : BOOL; (**)
        D : DWORD; (**)
    END_VAR
    VAR
        last_X : DWORD; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION WORD_TO_RANGE : REAL
    VAR_INPUT
        X : WORD; (**)
        low : REAL; (**)
        high : REAL; (**)
    END_VAR
END_FUNCTION
