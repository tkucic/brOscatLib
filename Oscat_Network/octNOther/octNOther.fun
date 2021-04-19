FUNCTION ELEMENT_COUNT : INT
    VAR_INPUT
        SEP : BYTE;
    END_VAR
    VAR_IN_OUT
        ELEMENT : STRING[ELEMENT_LENGTH];
    END_VAR
    VAR
        pt : REFERENCE TO ARRAY[1..ELEMENT_LENGTH] OF BYTE;
        l : INT;
        pos : INT;
    END_VAR
END_FUNCTION
FUNCTION ELEMENT_GET : BOOL
    VAR_INPUT
        SEP : BYTE;
        POS : INT;
    END_VAR
    VAR_IN_OUT
        ELEMENT : STRING[ELEMENT_LENGTH];
        retVal : STRING[ELEMENT_LENGTH]; (*Return value of the function*)
    END_VAR
    VAR
        i : INT := 1;
        o : INT := 1;
        pt : REFERENCE TO ARRAY[1..ELEMENT_LENGTH] OF BYTE;
        po : REFERENCE TO ARRAY[1..ELEMENT_LENGTH] OF BYTE;
        cnt : INT;
        c : BYTE;
    END_VAR
END_FUNCTION
FUNCTION_BLOCK IP_FIFO
    VAR_IN_OUT
        FIFO : IP_FIFO_DATA;
        ID : BYTE;
        STATE : BYTE;
    END_VAR
    VAR
        tmp : INT;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK LOG_MSG
    VAR
        FB_PRINT_SF : PRINT_SF;
        idX : INT;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK LOG_VIEWPORT
    VAR_IN_OUT
        LC : LOG_CONTROL;
        LV : us_LOG_VIEWPORT;
    END_VAR
    VAR
        pos : INT;
        count : INT;
        idx : INT;
        base : INT;
        update_pos : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION NETWORK_VERSION : DWORD
    VAR_INPUT
        IN : BOOL;
    END_VAR
END_FUNCTION
FUNCTION_BLOCK PRINT_SF
    VAR_IN_OUT
        PRINTF_DATA : PRINTF_DATA;
        STR : STRING[LOG_SIZE];
    END_VAR
    VAR
        pos : INT;
        c : INT;
        src : STRING[1] := '~';
        run : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK UNI_CIRCULAR_BUFFER
    VAR_IN_OUT
        DATA : UNI_CIRCULAR_BUFFER_DATA;
    END_VAR
    VAR
        cnt : UINT;
        mode_last : INT;
        tmp_dw : DWORD;
        pTmp : REFERENCE TO BYTE;
        n : INT;
        n1 : INT;
        n2 : INT;
        x : BYTE;
        buf_totalsize : UINT;
    END_VAR
    VAR CONSTANT
        HeaderSize : INT := 4;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK XML_READER
    VAR_IN_OUT
        CTRL : XML_CONTROL;
        BUF : NW_BUF_LONG;
    END_VAR
    VAR
        index : INT;
        index2 : INT;
        stop : INT;
        mode : INT;
        command : WORD;
        c : BYTE;
        s1 : INT;
        e1 : INT;
        path_overflow : BOOL;
        empty_tag : BOOL;
        s_code : STRING[10];
        e_code : STRING[10];
        watchdog : TON;
    END_VAR
END_FUNCTION_BLOCK
