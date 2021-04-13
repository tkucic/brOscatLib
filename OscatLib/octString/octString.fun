FUNCTION BIN_TO_BYTE : BYTE
    VAR_INPUT
        BIN : STRING[12]; (**)
    END_VAR
    VAR
        pt : REFERENCE TO BYTE; (**)
        i : INT; (**)
        X : BYTE; (**)
        stop : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION BIN_TO_DWORD : DWORD
    VAR_INPUT
        BIN : STRING[40]; (**)
    END_VAR
    VAR
        pt : REFERENCE TO BYTE; (**)
        i : INT; (**)
        X : BYTE; (**)
        stop : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION BYTE_TO_STRB : STRING[8]
    VAR_INPUT
        IN : BYTE; (**)
    END_VAR
    VAR
        i : INT; (**)
        pt : REFERENCE TO BYTE; (**)
    END_VAR
END_FUNCTION
FUNCTION BYTE_TO_STRH : STRING[2]
    VAR_INPUT
        IN : BYTE; (**)
    END_VAR
    VAR
        temp : BYTE; (**)
        PT : REFERENCE TO BYTE; (**)
    END_VAR
END_FUNCTION
FUNCTION CAPITALIZE : STRING[STRING_LENGTH]
    VAR_INPUT
        str : STRING[STRING_LENGTH]; (**)
    END_VAR
    VAR
        PT : REFERENCE TO BYTE; (**)
        pos : INT; (**)
        L : INT; (**)
        first : BOOL := TRUE; (**)
    END_VAR
END_FUNCTION
FUNCTION CHARCODE : BYTE
    VAR_INPUT
        STR : STRING[10]; (**)
    END_VAR
    VAR
        found : STRING[1]; (**)
        search : STRING[10]; (**)
        pos : INT; (**)
        i : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION CHARNAME : STRING[10]
    VAR_INPUT
        C : BYTE; (**)
    END_VAR
    VAR
        pos : INT; (**)
        i : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION CHR_TO_STRING : STRING[1]
    VAR_INPUT
        C : BYTE; (**)
    END_VAR
    VAR
        PT : REFERENCE TO BYTE; (**)
    END_VAR
END_FUNCTION
FUNCTION CLEAN : STRING[STRING_LENGTH]
    VAR_INPUT
        IN : STRING[STRING_LENGTH]; (**)
        CX : STRING[80]; (**)
    END_VAR
    VAR
        pos : INT := 1; (**)
        stop : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION CODE : BYTE
    VAR_INPUT
        STR : STRING[STRING_LENGTH]; (**)
        POS : INT; (**)
    END_VAR
    VAR
        PT : REFERENCE TO BYTE; (**)
    END_VAR
END_FUNCTION
FUNCTION COUNT_CHAR : INT
    VAR_INPUT
        str : STRING[STRING_LENGTH]; (**)
        chr : BYTE; (**)
    END_VAR
    VAR
        l : INT; (**)
        pt : REFERENCE TO BYTE; (**)
        pos : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION COUNT_SUBSTRING : INT
    VAR_INPUT
        SEARCH : STRING[255]; (**)
        STR : STRING[255]; (**)
    END_VAR
    VAR
        pos : INT; (**)
        size : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION DEC_TO_BYTE : BYTE
    VAR_INPUT
        DEC : STRING[10]; (**)
    END_VAR
    VAR
        pt : REFERENCE TO BYTE; (**)
        i : INT; (**)
        X : BYTE; (**)
        stop : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION DEC_TO_DWORD : DWORD
    VAR_INPUT
        DEC : STRING[20]; (**)
    END_VAR
    VAR
        pt : REFERENCE TO BYTE; (**)
        i : INT; (**)
        X : BYTE; (**)
        stop : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION DEC_TO_INT : INT
    VAR_INPUT
        DEC : STRING[10]; (**)
    END_VAR
    VAR
        pt : REFERENCE TO BYTE; (**)
        i : INT; (**)
        X : BYTE; (**)
        sign : BOOL; (**)
        stop : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION DEL_CHARS : STRING[STRING_LENGTH]
    VAR_INPUT
        IN : STRING[STRING_LENGTH]; (**)
        CX : STRING[80]; (**)
    END_VAR
    VAR
        pos : INT := 1; (**)
        stop : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION DT_TO_STRF : STRING[None]
    VAR_INPUT
        DTI : DT; (**)
        MS : INT; (**)
        FMT : STRING[255]; (**)
        LANG : INT; (**)
    END_VAR
    VAR
        ly : INT; (**)
        dx : DATE; (**)
        fs : STRING[10]; (**)
        td : TOD; (**)
        tmp : INT; (**)
        pos : INT; (**)
        f : INT; (**)
    END_VAR
    VAR CONSTANT
        FILL : STRING[1] := '0'; (**)
        BLANK : STRING[1] := ' '; (**)
    END_VAR
END_FUNCTION
FUNCTION DWORD_TO_STRB : STRING[32]
    VAR_INPUT
        IN : DWORD; (**)
    END_VAR
    VAR
        pt : REFERENCE TO BYTE; (**)
        i : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION DWORD_TO_STRF : STRING[20]
    VAR_INPUT
        IN : DWORD; (**)
        N : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION DWORD_TO_STRH : STRING[8]
    VAR_INPUT
        IN : DWORD; (**)
    END_VAR
    VAR
        i : INT; (**)
        temp : BYTE; (**)
        pt : REFERENCE TO BYTE; (**)
    END_VAR
END_FUNCTION
FUNCTION EXEC : STRING[STRING_LENGTH]
    VAR_INPUT
        str : STRING[STRING_LENGTH]; (**)
    END_VAR
    VAR
        pos : INT; (**)
        R1 : REAL; (**)
        R2 : REAL; (**)
        operator : STRING[10]; (**)
    END_VAR
END_FUNCTION
FUNCTION FILL : STRING[STRING_LENGTH]
    VAR_INPUT
        C : BYTE; (**)
        L : INT; (**)
    END_VAR
    VAR
        i : INT; (**)
        sx : STRING[1]; (**)
    END_VAR
END_FUNCTION
FUNCTION FIND_CHAR : INT
    VAR_INPUT
        str : STRING[STRING_LENGTH]; (**)
        pos : INT; (**)
    END_VAR
    VAR
        i : INT; (**)
        pt : REFERENCE TO ARRAY[1..255] OF BYTE; (**)
        stop : INT; (**)
        X : BYTE; (**)
    END_VAR
END_FUNCTION
FUNCTION FIND_CTRL : INT
    VAR_INPUT
        str : STRING[STRING_LENGTH]; (**)
        pos : INT; (**)
    END_VAR
    VAR
        i : INT; (**)
        pt : REFERENCE TO ARRAY[1..255] OF BYTE; (**)
        stop : INT; (**)
        x : BYTE; (**)
    END_VAR
END_FUNCTION
FUNCTION FIND_NONUM : INT
    VAR_INPUT
        str : STRING[STRING_LENGTH]; (**)
        pos : INT; (**)
    END_VAR
    VAR
        i : INT; (**)
        pt : REFERENCE TO ARRAY[1..255] OF BYTE; (**)
        end : INT; (**)
        X : BYTE; (**)
    END_VAR
END_FUNCTION
FUNCTION FIND_NUM : INT
    VAR_INPUT
        str : STRING[STRING_LENGTH]; (**)
        pos : INT; (**)
    END_VAR
    VAR
        i : INT; (**)
        pt : REFERENCE TO ARRAY[1..255] OF BYTE; (**)
        stop : INT; (**)
        X : BYTE; (**)
    END_VAR
END_FUNCTION
FUNCTION FINDB : INT
    VAR_INPUT
        str1 : STRING[STRING_LENGTH]; (**)
        str2 : STRING[STRING_LENGTH]; (**)
    END_VAR
    VAR
        pos : INT; (**)
        length : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION FINDB_NONUM : INT
    VAR_INPUT
        str : STRING[STRING_LENGTH]; (**)
    END_VAR
    VAR
        pos : INT; (**)
        pt : REFERENCE TO BYTE; (**)
    END_VAR
END_FUNCTION
FUNCTION FINDB_NUM : INT
    VAR_INPUT
        str : STRING[STRING_LENGTH]; (**)
    END_VAR
    VAR
        pos : INT; (**)
        pt : REFERENCE TO BYTE; (**)
    END_VAR
END_FUNCTION
FUNCTION FINDP : INT
    VAR_INPUT
        str : STRING[STRING_LENGTH]; (**)
        src : STRING[STRING_LENGTH]; (**)
        pos : INT; (**)
    END_VAR
    VAR
        i : INT; (**)
        ls : INT; (**)
        lx : INT; (**)
        stp : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION FIX : STRING[STRING_LENGTH]
    VAR_INPUT
        str : STRING[STRING_LENGTH]; (**)
        L : INT; (**)
        C : BYTE; (**)
        M : INT; (**)
    END_VAR
    VAR
        N : INT; (**)
        SX : STRING[STRING_LENGTH]; (**)
    END_VAR
END_FUNCTION
FUNCTION FLOAT_TO_REAL : REAL
    VAR_INPUT
        FLT : STRING[20]; (**)
    END_VAR
    VAR
        pt : REFERENCE TO ARRAY[1..20] OF BYTE; (**)
        i : INT; (**)
        X : BYTE; (**)
        sign : INT := 1; (**)
        stop : INT; (**)
        tmp : DINT; (**)
        d : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION FSTRING_TO_BYTE : BYTE
    VAR_INPUT
        IN : STRING[12]; (**)
    END_VAR
END_FUNCTION
FUNCTION FSTRING_TO_DT : DT
    VAR_INPUT
        SDT : STRING[60]; (**)
        FMT : STRING[60]; (**)
    END_VAR
    VAR
        c : STRING[1]; (**)
        tmp : STRING[20]; (**)
        end : INT; (**)
        dy : INT := 1970; (**)
        dm : INT := 1; (**)
        dd : INT := 1; (**)
        th : INT; (**)
        tm : INT; (**)
        ts : INT; (**)
    END_VAR
    VAR CONSTANT
        ignore : STRING[1] := '*'; (* ignore character is * *)
        fchar : STRING[1] := '#'; (* format character is # *)
    END_VAR
END_FUNCTION
FUNCTION FSTRING_TO_DWORD : DWORD
    VAR_INPUT
        IN : STRING[40]; (**)
    END_VAR
END_FUNCTION
FUNCTION FSTRING_TO_MONTH : INT
    VAR_INPUT
        MTH : STRING[20]; (**)
        LANG : INT; (**)
    END_VAR
    VAR
        lx : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION FSTRING_TO_WEEK : BYTE
    VAR_INPUT
        WEEK : STRING[60]; (**)
        LANG : INT; (**)
    END_VAR
    VAR
        pos : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION FSTRING_TO_WEEKDAY : INT
    VAR_INPUT
        WDAY : STRING[20]; (**)
        LANG : INT; (**)
    END_VAR
    VAR
        tmp : STRING[2]; (**)
        i : INT; (**)
        ly : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION HEX_TO_BYTE : BYTE
    VAR_INPUT
        HEX : STRING[5]; (**)
    END_VAR
    VAR
        pt : REFERENCE TO BYTE; (**)
        i : INT; (**)
        X : BYTE; (**)
        stop : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION HEX_TO_DWORD : DWORD
    VAR_INPUT
        Hex : STRING[20]; (**)
    END_VAR
    VAR
        pt : REFERENCE TO BYTE; (**)
        i : INT; (**)
        X : BYTE; (**)
        stop : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION IS_ALNUM : BOOL
    VAR_INPUT
        str : STRING[STRING_LENGTH]; (**)
    END_VAR
    VAR
        L : INT; (**)
        pt : REFERENCE TO BYTE; (**)
        pos : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION IS_ALPHA : BOOL
    VAR_INPUT
        str : STRING[STRING_LENGTH]; (**)
    END_VAR
    VAR
        L : INT; (**)
        pt : REFERENCE TO BYTE; (**)
        pos : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION IS_CC : BOOL
    VAR_INPUT
        str : STRING[STRING_LENGTH]; (**)
        cmp : STRING[STRING_LENGTH]; (**)
    END_VAR
    VAR
        L : INT; (**)
        pos : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION IS_CTRL : BOOL
    VAR_INPUT
        STR : STRING[STRING_LENGTH]; (**)
    END_VAR
    VAR
        L : INT; (**)
        pt : REFERENCE TO BYTE; (**)
        pos : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION IS_HEX : BOOL
    VAR_INPUT
        str : STRING[STRING_LENGTH]; (**)
    END_VAR
    VAR
        L : INT; (**)
        pt : REFERENCE TO BYTE; (**)
        pos : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION IS_LOWER : BOOL
    VAR_INPUT
        str : STRING[STRING_LENGTH]; (**)
    END_VAR
    VAR
        l : INT; (**)
        pt : REFERENCE TO BYTE; (**)
        pos : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION IS_NCC : BOOL
    VAR_INPUT
        str : STRING[STRING_LENGTH]; (**)
        cmp : STRING[STRING_LENGTH]; (**)
    END_VAR
    VAR
        L : INT; (**)
        pos : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION IS_NUM : BOOL
    VAR_INPUT
        str : STRING[STRING_LENGTH]; (**)
    END_VAR
    VAR
        L : INT; (**)
        pt : REFERENCE TO BYTE; (**)
        pos : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION IS_UPPER : BOOL
    VAR_INPUT
        str : STRING[STRING_LENGTH]; (**)
    END_VAR
    VAR
        L : INT; (**)
        pt : REFERENCE TO BYTE; (**)
        pos : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION ISC_ALPHA : BOOL
    VAR_INPUT
        IN : BYTE; (**)
    END_VAR
END_FUNCTION
FUNCTION ISC_CTRL : BOOL
    VAR_INPUT
        IN : BYTE; (**)
    END_VAR
END_FUNCTION
FUNCTION ISC_HEX : BOOL
    VAR_INPUT
        IN : BYTE; (**)
    END_VAR
END_FUNCTION
FUNCTION ISC_LOWER : BOOL
    VAR_INPUT
        IN : BYTE; (**)
    END_VAR
END_FUNCTION
FUNCTION ISC_NUM : BOOL
    VAR_INPUT
        IN : BYTE; (**)
    END_VAR
END_FUNCTION
FUNCTION ISC_UPPER : BOOL
    VAR_INPUT
        IN : BYTE; (**)
    END_VAR
END_FUNCTION
FUNCTION LOWERCASE : STRING[STRING_LENGTH]
    VAR_INPUT
        str : STRING[STRING_LENGTH]; (**)
    END_VAR
    VAR
        PT : REFERENCE TO BYTE; (**)
        pos : INT; (**)
        l : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION_BLOCK MESSAGE_4R
    VAR_INPUT
        M0 : STRING[STRING_LENGTH]; (**)
        M1 : STRING[STRING_LENGTH]; (**)
        M2 : STRING[STRING_LENGTH]; (**)
        M3 : STRING[STRING_LENGTH]; (**)
        MM : INT := 3; (**)
        ENQ : BOOL := TRUE; (**)
        CLK : BOOL := TRUE; (**)
        T1 : TIME := TIME#3s0ms; (**)
    END_VAR
    VAR_OUTPUT
        MX : STRING[STRING_LENGTH]; (**)
        MN : INT; (**)
        TR : BOOL; (**)
    END_VAR
    VAR
        timer : TON; (**)
        edge : BOOL; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK MESSAGE_8
    VAR_INPUT
        IN1 : BOOL; (**)
        IN2 : BOOL; (**)
        IN3 : BOOL; (**)
        IN4 : BOOL; (**)
        IN5 : BOOL; (**)
        IN6 : BOOL; (**)
        IN7 : BOOL; (**)
        IN8 : BOOL; (**)
        S1 : STRING[STRING_LENGTH]; (**)
        S2 : STRING[STRING_LENGTH]; (**)
        S3 : STRING[STRING_LENGTH]; (**)
        S4 : STRING[STRING_LENGTH]; (**)
        S5 : STRING[STRING_LENGTH]; (**)
        S6 : STRING[STRING_LENGTH]; (**)
        S7 : STRING[STRING_LENGTH]; (**)
        S8 : STRING[STRING_LENGTH]; (**)
    END_VAR
    VAR_OUTPUT
        M : STRING[STRING_LENGTH]; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION MIRROR : STRING[STRING_LENGTH]
    VAR_INPUT
        str : STRING[STRING_LENGTH]; (**)
    END_VAR
    VAR
        pi : REFERENCE TO ARRAY[1..255] OF BYTE; (**)
        po : REFERENCE TO BYTE; (**)
        lx : INT; (**)
        i : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION MONTH_TO_STRING : STRING[10]
    VAR_INPUT
        MTH : INT; (**)
        LANG : INT; (**)
        LX : INT; (**)
    END_VAR
    VAR
        ly : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION OCT_TO_BYTE : BYTE
    VAR_INPUT
        OCT : STRING[10]; (**)
    END_VAR
    VAR
        pt : REFERENCE TO BYTE; (**)
        i : INT; (**)
        X : BYTE; (**)
        stop : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION OCT_TO_DWORD : DWORD
    VAR_INPUT
        OCT : STRING[20]; (**)
    END_VAR
    VAR
        pt : REFERENCE TO BYTE; (**)
        i : INT; (**)
        X : BYTE; (**)
        stop : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION REAL_TO_STRF : STRING[20]
    VAR_INPUT
        IN : REAL; (**)
        N : INT; (**)
    END_VAR
    VAR
        O : REAL; (**)
        i : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION REPLACE_ALL : STRING[STRING_LENGTH]
    VAR_INPUT
        str : STRING[STRING_LENGTH]; (**)
        src : STRING[STRING_LENGTH]; (**)
        rep : STRING[STRING_LENGTH]; (**)
    END_VAR
    VAR
        pos : INT; (**)
        lp : INT; (**)
        lx : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION REPLACE_CHARS : STRING[STRING_LENGTH]
    VAR_INPUT
        STR : STRING[STRING_LENGTH]; (**)
        SRC : STRING[255]; (**)
        REP : STRING[255]; (**)
    END_VAR
    VAR
        a : INT; (**)
        b : INT; (**)
        c : STRING[1]; (**)
        stp : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION REPLACE_UML : STRING[STRING_LENGTH]
    VAR_INPUT
        str : STRING[STRING_LENGTH]; (**)
    END_VAR
    VAR
        L : INT; (**)
        pt : REFERENCE TO BYTE; (**)
        pto : REFERENCE TO BYTE; (**)
        ptm : REFERENCE TO BYTE; (**)
        pt1 : REFERENCE TO BYTE; (**)
        pt2 : REFERENCE TO BYTE; (**)
        su : STRING[2]; (**)
        pos : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION_BLOCK TICKER
    VAR_INPUT
        N : INT; (**)
        PT : TIME; (**)
    END_VAR
    VAR_OUTPUT
        Display : STRING[STRING_LENGTH]; (**)
    END_VAR
    VAR_IN_OUT
        Text : STRING[STRING_LENGTH]; (**)
    END_VAR
    VAR
        delay : TP; (**)
        step : INT; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION TO_LOWER : BYTE
    VAR_INPUT
        IN : BYTE; (**)
    END_VAR
END_FUNCTION
FUNCTION TO_UML : STRING[2]
    VAR_INPUT
        IN : BYTE; (**)
    END_VAR
END_FUNCTION
FUNCTION TO_UPPER : BYTE
    VAR_INPUT
        IN : BYTE; (**)
    END_VAR
END_FUNCTION
FUNCTION TRIM : STRING[STRING_LENGTH]
    VAR_INPUT
        str : STRING[STRING_LENGTH]; (**)
    END_VAR
    VAR
        pos : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION TRIM1 : STRING[STRING_LENGTH]
    VAR_INPUT
        str : STRING[STRING_LENGTH]; (**)
    END_VAR
    VAR
        pos : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION TRIME : STRING[string_length]
    VAR_INPUT
        str : STRING[STRING_LENGTH]; (**)
    END_VAR
END_FUNCTION
FUNCTION UPPERCASE : STRING[STRING_LENGTH]
    VAR_INPUT
        str : STRING[STRING_LENGTH]; (**)
    END_VAR
    VAR
        pt : REFERENCE TO BYTE; (**)
        pos : INT; (**)
        l : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION WEEKDAY_TO_STRING : STRING[10]
    VAR_INPUT
        WDAY : INT; (**)
        LANG : INT; (**)
        LX : INT; (**)
    END_VAR
    VAR
        ly : INT; (**)
    END_VAR
END_FUNCTION
