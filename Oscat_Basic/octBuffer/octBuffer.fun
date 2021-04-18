FUNCTION _BUFFER_CLEAR : BOOL
    VAR_INPUT
        PT : REFERENCE TO BYTE; (**)
        SIZE : UINT; (**)
    END_VAR
    VAR_OUTPUT
        retVal : BOOL := ; (*Return value of the function*)
    END_VAR
    VAR
        ptw : REFERENCE TO DWORD; (**)
        temp : DWORD; (**)
        end : DWORD; (**)
        end32 : DWORD; (**)
    END_VAR
END_FUNCTION
FUNCTION _BUFFER_INIT : BOOL
    VAR_INPUT
        PT : REFERENCE TO BYTE; (**)
        SIZE : UINT; (**)
        INIT : BYTE; (**)
    END_VAR
    VAR_OUTPUT
        retVal : BOOL := ; (*Return value of the function*)
    END_VAR
    VAR
        ptw : REFERENCE TO DWORD; (**)
        temp : DWORD; (**)
        end : DWORD; (**)
        end32 : DWORD; (**)
    END_VAR
END_FUNCTION
FUNCTION _BUFFER_INSERT : BOOL
    VAR_INPUT
        STR : STRING[STRING_LENGTH]; (**)
        POS : INT; (**)
        PT : REFERENCE TO ARRAY[0..32767] OF BYTE; (**)
        SIZE : UINT; (**)
    END_VAR
    VAR_OUTPUT
        retVal : INT := ; (*Return value of the function*)
    END_VAR
    VAR
        end : INT; (**)
        lx : INT; (**)
        i : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION _BUFFER_UPPERCASE : BOOL
    VAR_INPUT
        PT : REFERENCE TO ARRAY[0..32000] OF BYTE; (**)
        SIZE : INT; (**)
    END_VAR
    VAR_OUTPUT
        retVal : BOOL := ; (*Return value of the function*)
    END_VAR
    VAR
        pos : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION _STRING_TO_BUFFER : BOOL
    VAR_INPUT
        STR : STRING[STRING_LENGTH]; (**)
        POS : INT; (**)
        PT : REFERENCE TO ARRAY[0..32767] OF BYTE; (**)
        SIZE : UINT; (**)
    END_VAR
    VAR_OUTPUT
        retVal : INT := ; (*Return value of the function*)
    END_VAR
    VAR
        ps : REFERENCE TO BYTE; (**)
        i : INT; (**)
        end : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION BUFFER_COMP : BOOL
    VAR_INPUT
        PT1 : REFERENCE TO ARRAY[0..32767] OF BYTE; (**)
        SIZE1 : INT; (**)
        PT2 : REFERENCE TO ARRAY[0..32767] OF BYTE; (**)
        SIZE2 : INT; (**)
        START : INT; (**)
    END_VAR
    VAR_OUTPUT
        retVal : INT := ; (*Return value of the function*)
    END_VAR
    VAR
        i : INT; (**)
        j : INT; (**)
        end : INT; (**)
        firstbyte : BYTE; (**)
    END_VAR
END_FUNCTION
FUNCTION BUFFER_SEARCH : BOOL
    VAR_INPUT
        PT : REFERENCE TO ARRAY[0..32767] OF BYTE; (**)
        SIZE : INT; (**)
        STR : STRING[STRING_LENGTH]; (**)
        POS : INT; (**)
        IGN : BOOL; (**)
    END_VAR
    VAR_OUTPUT
        retVal : INT := ; (*Return value of the function*)
    END_VAR
    VAR
        ps : REFERENCE TO ARRAY[0..STRING_LENGTH] OF BYTE; (**)
        chx : BYTE; (**)
        i : INT; (**)
        end : INT; (**)
        k : INT; (**)
        lx : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION BUFFER_TO_STRING : BOOL
    VAR_INPUT
        PT : REFERENCE TO ARRAY[0..32767] OF BYTE; (**)
        SIZE : UINT; (**)
        START : UINT; (**)
        STOP : UINT; (**)
    END_VAR
    VAR_OUTPUT
        retVal : STRING[STRING_LENGTH] := ; (*Return value of the function*)
    END_VAR
    VAR
        ps : REFERENCE TO BYTE; (**)
        i : UINT; (**)
        stp : UINT; (**)
        sta : UINT; (**)
    END_VAR
END_FUNCTION
