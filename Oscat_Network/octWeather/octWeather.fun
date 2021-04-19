FUNCTION_BLOCK MOON_PHASE
    VAR_INPUT
        XDT : DT;
        SCALE : BYTE := 12;
        UPDATE : TIME := TIME#60m0s0ms;
    END_VAR
    VAR_OUTPUT
        PHASE : BYTE;
    END_VAR
    VAR
        x : UDINT;
        last_dt : DT;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK WORLD_WEATHER
    VAR_INPUT
        ACTIVATE : BOOL;
        LATITUDE : REAL;
        LONGITUDE : REAL;
        KEY : STRING[30];
    END_VAR
    VAR_OUTPUT
        BUSY : BOOL;
        DONE : BOOL;
        ERROR_C : DWORD;
        ERROR_T : BYTE;
    END_VAR
    VAR_IN_OUT
        IP_C : IP_C; (* IP_Control Verwaltungsstruktur *)
        S_BUF : NETWORK_BUFFER;
        R_BUF : NETWORK_BUFFER;
        WW : WORLD_WEATHER_DATA;
    END_VAR
    VAR
        URL_DATA : url;
        DNS_CLIENT : DNS_CLIENT;
        HTTP_GET : HTTP_GET;
        CPB : CSV_PARSER_BUF;
        last_state : BOOL;
        value_int : INT;
        value_real : REAL;
        v_real : REAL;
        state : INT;
        url_str : STRING[STRING_LENGTH];
        offset : UDINT;
        size : INT;
        sep : BYTE;
        cnt : INT;
        day : INT;
        idx : INT;
        run : BYTE;
        result : BYTE;
        value : STRING[STRING_LENGTH];
        pos : INT;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK WORLD_WEATHER_DESC_GE
    VAR_INPUT
        ACTIVATE : BOOL;
    END_VAR
    VAR_IN_OUT
        WW : WORLD_WEATHER_DATA;
    END_VAR
    VAR
        act_last : BOOL;
        x : INT;
        y : INT;
        str : STRING[60];
        i : INT;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK WORLD_WEATHER_ICON_OSCAT
    VAR_INPUT
        ACTIVATE : BOOL;
    END_VAR
    VAR_IN_OUT
        WW : WORLD_WEATHER_DATA;
    END_VAR
    VAR
        dat : ARRAY[0..41] OF INT := [0, 14, 12, 9, 9, 0, 7, 7, 0, 2, 2, 3, 3, 1, 0, 0, 17, 4, 4, 3, 3, 1, 0, 0, 17, 2, 2, 3, 3, 1, 0, 0, 17, 2, 4, 3, 3, 1, 0, 0, 17, 0];
        act_last : BOOL;
        x : INT;
        i : INT;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK YAHOO_WEATHER
    VAR_INPUT
        ACTIVATE : BOOL;
        UNITS : BOOL;
        LOCATION : STRING[20];
    END_VAR
    VAR_OUTPUT
        BUSY : BOOL;
        DONE : BOOL;
        ERROR_C : DWORD;
        ERROR_T : BYTE;
    END_VAR
    VAR_IN_OUT
        IP_C : IP_C; (* IP_Control Verwaltungsstruktur *)
        S_BUF : NETWORK_BUFFER;
        R_BUF : NETWORK_BUFFER;
        YW : YAHOO_WEATHER_DATA;
    END_VAR
    VAR
        CTRL : XML_CONTROL;
        XML_READER : XML_READER;
        URL_DATA : url;
        DNS_CLIENT : DNS_CLIENT;
        HTTP_GET : HTTP_GET;
        activate_last : BOOL;
        value_int : INT;
        value_real : REAL;
        v_real : REAL;
        state : INT;
        cycle : INT;
        day_idx : INT;
        idx : INT;
        cnt : INT;
        repeat_request : BOOL;
        repeat_wait_time : UDINT := 5000; (* Repeat-Waittime *)
        repeat_count : USINT;
        repeat_max_count : USINT := 3; (* maximal repeat *)
        repeat_tx : UDINT;
        tx : UDINT;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK YAHOO_WEATHER_DESC_GE
    VAR_INPUT
        ACTIVATE : BOOL;
    END_VAR
    VAR_IN_OUT
        YW : YAHOO_WEATHER_DATA;
    END_VAR
    VAR
        act_last : BOOL;
        x : INT;
        y : INT;
        str : STRING[40];
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK YAHOO_WEATHER_ICON_OSCAT
    VAR_INPUT
        ACTIVATE : BOOL;
    END_VAR
    VAR_IN_OUT
        YW : YAHOO_WEATHER_DATA;
    END_VAR
    VAR
        dat : ARRAY[0..48] OF INT := [4, 2, 2, 4, 17, 1, 3, 1, 2, 2, 2, 2, 2, 3, 3, 3, 3, 5, 3, 6, 7, 14, 8, 9, 9, 10, 9, 11, 12, 11, 12, 13, 14, 15, 16, 4, 14, 4, 17, 2, 2, 3, 3, 3, 12, 2, 3, 4, 0];
        act_last : BOOL;
        x : INT;
        idx : INT;
    END_VAR
END_FUNCTION_BLOCK
