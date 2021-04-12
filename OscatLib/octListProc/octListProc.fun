FUNCTION LIST_CLEAN : BOOL
    VAR_INPUT
        SEP : BYTE; (**)
    END_VAR
    VAR_IN_OUT
        LIST : STRING[LIST_LENGTH]; (**)
    END_VAR
    VAR
        pt : POINTER TO ARRAY[1..LIST_LENGTH] OF BYTE; (**)
        pos : INT; (**)
        pw : INT; (**)
        last : BYTE; (**)
        c : BYTE; (**)
    END_VAR
END_FUNCTION
FUNCTION LIST_GET : STRING[LIST_LENGTH]
    VAR_INPUT
        SEP : BYTE; (**)
        POS : INT; (**)
    END_VAR
    VAR_IN_OUT
        LIST : STRING[LIST_LENGTH]; (**)
    END_VAR
    VAR
        i : INT := 1; (**)
        o : INT := 1; (**)
        pt : POINTER TO ARRAY[1..LIST_LENGTH] OF BYTE; (**)
        po : POINTER TO ARRAY[1..LIST_LENGTH] OF BYTE; (**)
        cnt : INT; (**)
        c : BYTE; (**)
    END_VAR
END_FUNCTION
FUNCTION LIST_INSERT : BOOL
    VAR_INPUT
        SEP : BYTE; (**)
        POS : INT; (**)
        INS : STRING[LIST_LENGTH]; (**)
    END_VAR
    VAR_IN_OUT
        LIST : STRING[LIST_LENGTH]; (**)
    END_VAR
    VAR
        i : INT; (**)
        pt : POINTER TO ARRAY[1..LIST_LENGTH] OF BYTE; (**)
        cnt : INT; (**)
        c : BYTE; (**)
        tmp : STRING[LIST_LENGTH]; (**)
    END_VAR
END_FUNCTION
FUNCTION LIST_LEN : INT
    VAR_INPUT
        SEP : BYTE; (**)
    END_VAR
    VAR_IN_OUT
        LIST : STRING[LIST_LENGTH]; (**)
    END_VAR
    VAR
        pt : POINTER TO ARRAY[1..LIST_LENGTH] OF BYTE; (**)
        l : INT; (**)
        pos : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION_BLOCK LIST_NEXT
    VAR_INPUT
        SEP : BYTE; (**)
        RST : BOOL; (**)
    END_VAR
    VAR_OUTPUT
        LEL : STRING[LIST_LENGTH]; (**)
        NUL : BOOL; (**)
    END_VAR
    VAR_IN_OUT
        LIST : STRING[LIST_LENGTH]; (**)
    END_VAR
    VAR
        pt : POINTER TO ARRAY[1..LIST_LENGTH] OF BYTE; (**)
        stop : INT; (**)
        start : INT; (**)
        pos : INT := 1; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION LIST_RETRIEVE : STRING[LIST_LENGTH]
    VAR_INPUT
        SEP : BYTE; (**)
        POS : INT; (**)
    END_VAR
    VAR_IN_OUT
        LIST : STRING[LIST_LENGTH]; (**)
    END_VAR
    VAR
        i : INT; (**)
        o : INT; (**)
        pt : POINTER TO ARRAY[0..LIST_LENGTH] OF BYTE; (**)
        po : POINTER TO ARRAY[0..LIST_LENGTH] OF BYTE; (**)
        cnt : INT; (**)
        c : BYTE; (**)
        p : INT; (**)
        l : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION LIST_RETRIEVE_MAX : STRING[LIST_LENGTH]
    VAR_INPUT
        SEP : BYTE; (**)
    END_VAR
    VAR_IN_OUT
        LIST : STRING[LIST_LENGTH]; (**)
    END_VAR
    VAR
        pt : POINTER TO ARRAY[1..LIST_LENGTH] OF BYTE; (**)
        l : INT; (**)
        pos : INT; (**)
        last : INT; (**)
        lx : INT; (**)
        mpos : INT := 1; (**)
    END_VAR
END_FUNCTION
FUNCTION LIST_RETRIEVE_MIN : STRING[LIST_LENGTH]
    VAR_INPUT
        SEP : BYTE; (**)
    END_VAR
    VAR_IN_OUT
        LIST : STRING[LIST_LENGTH]; (**)
    END_VAR
    VAR
        pt : POINTER TO ARRAY[1..LIST_LENGTH] OF BYTE; (**)
        l : INT; (**)
        pos : INT; (**)
        last : INT; (**)
        lx : INT; (**)
        mpos : INT := 1; (**)
    END_VAR
END_FUNCTION
FUNCTION LIST_SORT_L : STRING[LIST_LENGTH]
    VAR_INPUT
        SEP : BYTE; (**)
    END_VAR
    VAR_IN_OUT
        LIST : STRING[LIST_LENGTH]; (**)
    END_VAR
    VAR
        element : STRING[LIST_LENGTH]; (**)
        sepx : STRING[1]; (**)
    END_VAR
END_FUNCTION
