FUNCTION_BLOCK MYSQL_AUTH
    VAR_IN_OUT
        RUN : BOOL; (**)
        PASSWORD : STRING[64]; (**)
        MESSAGE : ARRAY[0..19] OF BYTE; (**)
        SCRAMBLE : ARRAY[0..19] OF BYTE; (**)
    END_VAR
    VAR
        SHA1_STREAM : SHA1_STREAM; (**)
        buf : ARRAY[0..63] OF BYTE; (**)
        sha_mode : INT; (**)
        step : INT; (**)
        size : UDINT; (**)
        pos : UDINT; (**)
        i : INT; (**)
        i2 : INT; (**)
        scramble1 : ARRAY[0..19] OF BYTE; (**)
        scramble2 : ARRAY[0..19] OF BYTE; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK MYSQL_CONTROL
    VAR_IN_OUT
        COM : MYSQL_COM; (**)
        INFO : MYSQL_INFO; (**)
    END_VAR
    VAR
        IP_C : IP_C; (**)
        URL_DATA : url; (**)
        DNS_CLIENT : DNS_CLIENT; (**)
        IPC : IP_CONTROL; (**)
        step : INT; (**)
        snd_step : INT; (**)
        TON_WAIT : TON; (**)
        last_step : INT; (**)
        idx1 : INT; (**)
        idx2 : INT; (**)
        idx3 : INT; (**)
        dw_tmp : DWORD; (**)
        timeout1 : TIME; (**)
        timeout2 : TIME; (**)
        ip_c_red_disable : BOOL; (**)
        auth_password : STRING[64]; (**)
        auth_run : BOOL; (**)
        MYSQL_AUTH : MYSQL_AUTH; (**)
        scramble1_buffer : ARRAY[0..19] OF BYTE; (**)
        scramble2_buffer : ARRAY[0..19] OF BYTE; (**)
        charset_number : BYTE := 16#8; (**)
        max_packet_size : DWORD := 1024; (**)
        client_flags : DWORD := 16#38601; (**)
    END_VAR
END_FUNCTION_BLOCK
