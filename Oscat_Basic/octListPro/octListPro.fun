FUNCTION LIST_CLEAN : BOOL
    VAR_INPUT
        SEP : BYTE;
    END_VAR
    VAR_IN_OUT
        LIST : STRING[LIST_LENGTH];
    END_VAR
    VAR
        pt : REFERENCE TO ARRAY[1..LIST_LENGTH] OF BYTE;
        read : INT := 1;
        write : INT := 1;
        last : BYTE;
        c : BYTE;
    END_VAR
END_FUNCTION
FUNCTION LIST_GET : BOOL
    VAR_INPUT
        SEP : BYTE;
        POS : INT;
    END_VAR
    VAR_IN_OUT
        LIST : STRING[LIST_LENGTH];
        retVal : STRING[LIST_LENGTH]; (*Return value of the function*)
    END_VAR
    VAR
        i : INT := 1;
        o : INT := 1;
        pt : REFERENCE TO ARRAY[1..LIST_LENGTH] OF BYTE;
        po : REFERENCE TO ARRAY[1..LIST_LENGTH] OF BYTE;
        cnt : INT := 0;
        c : BYTE;
    END_VAR
END_FUNCTION
FUNCTION LIST_INSERT : BOOL
    VAR_INPUT
        SEP : BYTE;
        POS : INT;
        INS : STRING[LIST_LENGTH];
    END_VAR
    VAR_IN_OUT
        LIST : STRING[LIST_LENGTH];
    END_VAR
    VAR
        pt : REFERENCE TO ARRAY[1..LIST_LENGTH] OF BYTE;
        read : INT := 1;
        cnt : INT := 1;
        sx : STRING[1];
    END_VAR
END_FUNCTION
FUNCTION LIST_LEN : INT
    VAR_INPUT
        SEP : BYTE;
    END_VAR
    VAR_IN_OUT
        LIST : STRING[LIST_LENGTH];
    END_VAR
    VAR
        pt : REFERENCE TO ARRAY[1..LIST_LENGTH] OF BYTE;
        pos : INT := 1;
        c : BYTE;
    END_VAR
END_FUNCTION
FUNCTION_BLOCK LIST_NEXT
    VAR_INPUT
        SEP : BYTE;
        RST : BOOL;
    END_VAR
    VAR_OUTPUT
        LEL : STRING[LIST_LENGTH];
        NUL : BOOL;
    END_VAR
    VAR_IN_OUT
        LIST : STRING[LIST_LENGTH];
    END_VAR
    VAR
        pos : INT := 1;
        pt : REFERENCE TO ARRAY[1..LIST_LENGTH] OF BYTE;
        po : REFERENCE TO ARRAY[1..LIST_LENGTH] OF BYTE;
        c : BYTE;
        write : INT;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION LIST_RETRIEVE : BOOL
    VAR_INPUT
        SEP : BYTE;
        POS : INT;
    END_VAR
    VAR_IN_OUT
        LIST : STRING[LIST_LENGTH];
        retVal : STRING[LIST_LENGTH]; (*Return value of the function*)
    END_VAR
    VAR
        i : INT;
        o : INT := 1;
        w : INT := 1;
        pt : REFERENCE TO ARRAY[1..LIST_LENGTH] OF BYTE;
        po : REFERENCE TO ARRAY[1..LIST_LENGTH] OF BYTE;
        cnt : INT := 0;
        c : BYTE;
    END_VAR
END_FUNCTION
