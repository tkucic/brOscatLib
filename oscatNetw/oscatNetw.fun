FUNCTION_BLOCK DLOG_BOOL (* Data logging *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=48 *)
    VAR_IN_OUT 
        X : DLOG_DATA;
    END_VAR
    VAR_INPUT 
        STATE : BOOL;
        OFF : STRING[255];
        ON : STRING[255];
        COLUMN : STRING[40];
        DELTA : BOOL;
    END_VAR
    VAR 
        UCB : UNI_CIRCULAR_BUFFER;
        id : WORD;
        last_delta : BOOL;
        state_last : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK DLOG_CRON_TAB (* Data logging *)(* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=46 *)
    VAR_INPUT 
        ACTIVATE : BOOL;
        DTI : DT;
        SECOND : STRING[20];
        MINUTE : STRING[20];
        HOUR : STRING[20];
        DAY_OF_MONTH : STRING[20];
        DAY_OF_WEEK : STRING[20];
        MONTH : STRING[20];
    END_VAR
    VAR_OUTPUT 
        Q : BOOL;
    END_VAR
    VAR 
        CD : DLOG_CRON_DATA;
        activate_old : BOOL;
        datei : DATE;
        dti_last : DT;
        cnt1 : INT;
        cnt2 : INT;
        idx1 : INT;
        idx2 : INT;
        idx3 : INT;
        idx4 : INT;
        pos1 : INT;
        pos2 : INT;
        char_cnt : INT;
        trig_day : BOOL;
        trig_weekday : BOOL;
        str1 : STRING[STRING_LENGTH];
        str2 : STRING[STRING_LENGTH];
        str3 : STRING[STRING_LENGTH];
        num_str1 : STRING[10];
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK DLOG_DINT (* Data logging *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=49 *)
    VAR_IN_OUT 
        X : DLOG_DATA;
    END_VAR
    VAR_INPUT 
        VALUE : DINT;
        COLUMN : STRING[40];
        DELTA : DINT;
    END_VAR
    VAR 
        UCB : UNI_CIRCULAR_BUFFER;
        id : WORD;
        delta_last : DINT;
        value_last : DINT;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK DLOG_DT (* Data logging *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=50 *)
    VAR_IN_OUT 
        X : DLOG_DATA;
    END_VAR
    VAR_INPUT 
        FMT : STRING[255] := '#A-#D-#H #N:#R:#T';
        COLUMN : STRING[40];
        DELTA : UDINT;
    END_VAR
    VAR 
        UCB : UNI_CIRCULAR_BUFFER;
        id : WORD;
        delta_last : DT;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK DLOG_FILE_TO_FTP (* Data logging *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=63 *)
    VAR_IN_OUT 
        X : DLOG_DATA;
    END_VAR
    VAR_INPUT 
        FTP_URL : STRING[STRING_LENGTH];
        FTP_ACTIV : BOOL;
        FILE_DELETE : BOOL;
        TIMEOUT : TIME := TIME#30s0ms;
        RETRY : INT;
        RETRY_TIME : TIME := TIME#30s0ms;
        DNS_IP4 : DWORD;
        PLC_IP4 : DWORD;
    END_VAR
    VAR_OUTPUT 
        DONE : BOOL;
        BUSY : BOOL;
        ERROR_C : DWORD;
        ERROR_T : BYTE;
    END_VAR
    VAR 
        UCBD : UNI_CIRCULAR_BUFFER_DATA;
        UCB : UNI_CIRCULAR_BUFFER;
        FTP_CLIENT : FTP_CLIENT;
        WT_1 : TON;
        ftrig_old : BOOL;
        filename : STRING[255];
        step : INT;
        ftp_busy : BOOL;
        ftp_done : BOOL;
        cnt : INT;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK DLOG_FILE_TO_SMTP (* Data logging *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=66 *)
    VAR_IN_OUT 
        SERVER : STRING[255];
        MAILFROM : STRING[255];
        MAILTO : STRING[STRING_LENGTH];
        SUBJECT : STRING[255];
        BODY : STRING[STRING_LENGTH];
        X : DLOG_DATA;
    END_VAR
    VAR_INPUT 
        FILE_DELETE : BOOL;
        TIMEOUT : TIME := TIME#30s0ms;
        DTI : DT;
        DTI_OFFSET : INT;
        RETRY : INT;
        RETRY_TIME : TIME := TIME#30s0ms;
        DNS_IP4 : DWORD;
    END_VAR
    VAR_OUTPUT 
        DONE : BOOL;
        BUSY : BOOL;
        ERROR_C : DWORD;
        ERROR_T : BYTE;
    END_VAR
    VAR 
        UCBD : UNI_CIRCULAR_BUFFER_DATA;
        UCB : UNI_CIRCULAR_BUFFER;
        SMTP_CLIENT : SMTP_CLIENT;
        WT_1 : TON;
        ftrig_old : BOOL;
        files : STRING[STRING_LENGTH];
        step : INT;
        smtp_busy : BOOL;
        smtp_done : BOOL;
        cnt : INT;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK DLOG_REAL (* Data logging *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=51 *)
    VAR_IN_OUT 
        X : DLOG_DATA;
    END_VAR
    VAR_INPUT 
        VALUE : REAL;
        N : INT;
        D : STRING[1] := ',';
        COLUMN : STRING[40];
        DELTA : REAL;
    END_VAR
    VAR 
        UCB : UNI_CIRCULAR_BUFFER;
        id : WORD;
        delta_last : REAL;
        value_last : REAL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK DLOG_REAL_ARRAY (* Data logging *)(* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=46 *)
    VAR_IN_OUT 
        R_ARRAY : DLOG_REAL_ARRAY_DATA;
        X : DLOG_DATA;
    END_VAR
    VAR_INPUT 
        N : INT;
        D : STRING[1];
        R_COUNT : INT;
    END_VAR
    VAR 
        UCB : UNI_CIRCULAR_BUFFER;
        id : WORD;
        idx : INT;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK DLOG_STORE_FILE_CSV (* Data logging *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=52 *)
    VAR_IN_OUT 
        X : DLOG_DATA;
        SAVE_DATA : DLOG_SAVE;
    END_VAR
    VAR_INPUT 
        ENABLE : BOOL;
        TRIG_M : BOOL;
        TRIG_T : TIME;
        FILENAME : STRING[255];
        DTI : DT;
        SEP : BYTE;
        AUTO_CLOSE : TIME := TIME#15s0ms;
    END_VAR
    VAR_OUTPUT 
        ERROR_C : DWORD;
        ERROR_T : BYTE;
    END_VAR
    VAR 
        FS : FILE_SERVER;
        FSD : FILE_SERVER_DATA;
        PT : NETWORK_BUFFER;
        UCB : UNI_CIRCULAR_BUFFER;
        trig_auto : BOOL;
        trig_stored : BOOL;
        trig_tmp : BOOL;
        trig_m_last : BOOL;
        dti_last : DT := DATE_AND_TIME#2070-2-6-6:28:15;
        fn_last : STRING[255];
        fn : STRING[255];
        step_1 : INT;
        step_2 : INT;
        idx : INT;
        log_stop : BOOL;
        n : USINT;
        wd_ton : TON;
        wd_time : TIME;
        aw_ton : TON;
        aw_enable : BOOL;
        aw_aktiv : BOOL;
        total_bytes : UDINT;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK DLOG_STORE_FILE_HTML (* Data logging *)(* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=46 *)
    VAR_IN_OUT 
        X : DLOG_DATA;
        SAVE_DATA : DLOG_SAVE;
    END_VAR
    VAR_INPUT 
        ENABLE : BOOL;
        TRIG_M : BOOL;
        TRIG_T : TIME;
        FILENAME : STRING[255];
        DTI : DT;
        AUTO_CLOSE : TIME := TIME#15s0ms;
        HTML_CAPTION : STRING[255];
        HTML_TABLE : STRING[255];
        HTML_TR_HEAD : STRING[255];
        HTML_TR_EVEN : STRING[255];
        HTML_TR_ODD : STRING[255];
    END_VAR
    VAR_OUTPUT 
        ERROR_C : DWORD;
        ERROR_T : BYTE;
    END_VAR
    VAR 
        FS : FILE_SERVER;
        FSD : FILE_SERVER_DATA;
        PT : NETWORK_BUFFER;
        UCB : UNI_CIRCULAR_BUFFER;
        trig_auto : BOOL;
        trig_stored : BOOL;
        trig_tmp : BOOL;
        trig_m_last : BOOL;
        dti_last : DT := DATE_AND_TIME#2070-2-6-6:28:15;
        fn_last : STRING[255];
        str : STRING[STRING_LENGTH];
        fn : STRING[255];
        step_1 : INT;
        step_2 : INT;
        idx : INT;
        log_state : USINT;
        log_stop : BOOL;
        n : INT;
        wd_ton : TON;
        wd_time : TIME;
        aw_ton : TON;
        aw_enable : BOOL;
        aw_aktiv : BOOL;
        total_bytes : UDINT;
        cur_ode : BYTE;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK DLOG_STORE_FILE_XML (* Data logging *)(* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=46 *)
    VAR_IN_OUT 
        X : DLOG_DATA;
        SAVE_DATA : DLOG_SAVE;
    END_VAR
    VAR_INPUT 
        ENABLE : BOOL;
        TRIG_M : BOOL;
        TRIG_T : TIME;
        FILENAME : STRING[255];
        DTI : DT;
        AUTO_CLOSE : TIME := TIME#15s0ms;
    END_VAR
    VAR_OUTPUT 
        ERROR_C : DWORD;
        ERROR_T : BYTE;
    END_VAR
    VAR 
        FS : FILE_SERVER;
        FSD : FILE_SERVER_DATA;
        PT : NETWORK_BUFFER;
        UCB : UNI_CIRCULAR_BUFFER;
        trig_auto : BOOL;
        trig_stored : BOOL;
        trig_tmp : BOOL;
        trig_m_last : BOOL;
        dti_last : DT := DATE_AND_TIME#2070-2-6-6:28:15;
        fn_last : STRING[255];
        fn : STRING[255];
        str : STRING[STRING_LENGTH];
        step_1 : INT;
        step_2 : INT;
        idx : INT;
        log_state : USINT;
        log_stop : BOOL;
        n : INT;
        wd_ton : TON;
        wd_time : TIME;
        aw_ton : TON;
        aw_enable : BOOL;
        aw_aktiv : BOOL;
        total_bytes : UDINT;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK DLOG_STORE_MYSQL (* Data logging *)(* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=46 *)
    VAR_IN_OUT 
        SQL_INFO : MYSQL_INFO;
        X : DLOG_DATA;
    END_VAR
    VAR_INPUT 
        ENABLE : BOOL;
        TRIG_M : BOOL;
        TRIG_T : TIME;
        DTI : DT;
        URL : STRING[STRING_LENGTH];
        DB_NAME : STRING[64];
        TB_NAME : STRING[64];
        AUTO_DELETE : UDINT;
        TIMEOUT : TIME;
        DNS_IP4 : DWORD;
    END_VAR
    VAR_OUTPUT 
        ERROR_C : DWORD;
        ERROR_T : BYTE;
    END_VAR
    VAR 
        UCB : UNI_CIRCULAR_BUFFER;
        MYSQL_CONTROL : MYSQL_CONTROL;
        trig_auto : BOOL;
        trig_tmp : BOOL;
        trig_m_last : BOOL;
        dti_last : DT := DATE_AND_TIME#2070-2-6-6:28:15;
        enable_last : BOOL;
        step : INT;
        idx : INT;
        n : USINT;
        snd_text : STRING[STRING_LENGTH];
        snd_size : INT;
        sql_command : BYTE;
        next_step : INT;
        i1 : INT;
        i2 : INT;
        y : MYSQL_COM;
        del_dt : UDINT;
        del_start : BOOL;
        run : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK DLOG_STORE_RRD (* Data logging *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=54 *)
    VAR_IN_OUT 
        X : DLOG_DATA;
    END_VAR
    VAR_INPUT 
        ENABLE : BOOL;
        TRIG_M : BOOL;
        TRIG_T : TIME;
        URL : STRING[STRING_LENGTH];
        DTI : DT;
        SEP : BYTE;
        DNS_IP4 : DWORD;
        TIMEOUT : TIME;
    END_VAR
    VAR_OUTPUT 
        ERROR_C : DWORD;
        ERROR_T : BYTE;
    END_VAR
    VAR 
        UCB : UNI_CIRCULAR_BUFFER;
        IP_C : IP_C; (* IP_Control Verwaltungsstruktur *)
        S_BUF : NETWORK_BUFFER;
        R_BUF : NETWORK_BUFFER;
        URL_DATA : URL;
        DNS_CLIENT : DNS_CLIENT;
        HTTP_GET : HTTP_GET;
        IPC : IP_CONTROL;
        trig_auto : BOOL;
        trig_stored : BOOL;
        trig_tmp : BOOL;
        trig_m_last : BOOL;
        dti_last : DT := DATE_AND_TIME#2070-2-6-6:28:15;
        step_1 : INT;
        step_2 : INT;
        sep_char : STRING[1];
        URL_query : STRING[STRING_LENGTH];
        n : INT;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK DLOG_STRING (* Data logging *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=52 *)
    VAR_IN_OUT 
        X : DLOG_DATA;
    END_VAR
    VAR_INPUT 
        STR : STRING[255];
        COLUMN : STRING[40];
    END_VAR
    VAR 
        UCB : UNI_CIRCULAR_BUFFER;
        id : WORD;
        str_last : STRING[255];
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK MYSQL_AUTH (* Database *)(* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=1 *)
    VAR_IN_OUT 
        RUN : BOOL;
        PASSWORD : STRING[64];
        MESSAGE : ARRAY[0..19] OF BYTE;
        SCRAMBLE : ARRAY[0..19] OF BYTE;
    END_VAR
    VAR 
        SHA1_STREAM : SHA1_STREAM;
        buf : ARRAY[0..63] OF BYTE;
        sha_mode : INT;
        step : INT;
        size : UDINT;
        pos : UDINT;
        i : INT;
        i2 : INT;
        scramble1 : ARRAY[0..19] OF BYTE;
        scramble2 : ARRAY[0..19] OF BYTE;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK MYSQL_CONTROL (* Database *)(* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=1 *)
    VAR_IN_OUT 
        COM : MYSQL_COM;
        INFO : MYSQL_INFO;
    END_VAR
    VAR 
        IP_C : IP_C;
        URL_DATA : URL;
        DNS_CLIENT : DNS_CLIENT;
        IPC : IP_CONTROL;
        step : INT;
        snd_step : INT;
        TON_WAIT : TON;
        last_step : INT;
        idx1 : INT;
        idx2 : INT;
        idx3 : INT;
        dw_tmp : DWORD;
        timeout1 : TIME;
        timeout2 : TIME;
        ip_c_red_disable : BOOL;
        auth_password : STRING[64];
        auth_run : BOOL;
        MYSQL_AUTH : MYSQL_AUTH;
        scramble1_buffer : ARRAY[0..19] OF BYTE;
        scramble2_buffer : ARRAY[0..19] OF BYTE;
        charset_number : BYTE := 16#8;
        max_packet_size : DWORD := 1024;
        client_flags : DWORD := 16#38601;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK CSV_PARSER_BUF (* File and server *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=147 *)
    VAR_INPUT 
        SEP : BYTE;
    END_VAR
    VAR_IN_OUT 
        RUN : BYTE;
        OFFSET : UDINT;
        VALUE : STRING[STRING_LENGTH];
        PT : NETWORK_BUFFER;
    END_VAR
    VAR_OUTPUT 
        RESULT : BYTE;
    END_VAR
    VAR 
        step : INT;
        size : INT;
        c : BYTE;
        v_add : BYTE;
        i : INT;
        state : BYTE;
        eof : BOOL;
        pv : REFERENCE TO BYTE;
        pve : DWORD;
        watchdog : TON;
        x : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK CSV_PARSER_FILE (* File and server *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=149 *)
    VAR_INPUT 
        SEP : BYTE;
    END_VAR
    VAR_IN_OUT 
        FILENAME : STRING[255];
        FSD : FILE_SERVER_DATA;
        RUN : BYTE;
        OFFSET : UDINT;
        VALUE : STRING[STRING_LENGTH];
        PT : NETWORK_BUFFER;
    END_VAR
    VAR_OUTPUT 
        RESULT : BYTE;
    END_VAR
    VAR 
        i : UDINT;
        state : BYTE;
        e : BYTE;
        mode : BYTE;
        step : INT;
        c : BYTE;
        v_add : BYTE;
        eof : BOOL;
        pv : REFERENCE TO BYTE;
        pve : DWORD;
        watchdog : TON;
        x : BOOL;
        FB : FILE_BLOCK;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK FILE_BLOCK (* File and server *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=152 *)
    VAR_IN_OUT 
        MODE : BYTE;
        FILENAME : STRING[255];
        FSD : FILE_SERVER_DATA;
        PT : NETWORK_BUFFER;
    END_VAR
    VAR_INPUT 
        POS : UDINT;
    END_VAR
    VAR_OUTPUT 
        ERROR : BYTE;
        DATA : BYTE;
    END_VAR
    VAR 
        step : INT;
        i : INT;
        data_start : UDINT;
        data_stop : UDINT;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION FILE_PATH_SPLIT : BOOL (* File and server *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=153 *)
    VAR_INPUT 
        FILENAME : STRING[STRING_LENGTH];
    END_VAR
    VAR_IN_OUT 
        X : FILE_PATH_DATA;
    END_VAR
    VAR 
        b : INT;
        c : INT;
        d : STRING[1];
        p1 : INT;
        p2 : INT;
    END_VAR
END_FUNCTION
FUNCTION_BLOCK INI_PARSER_BUF (* File and server *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=161 *)
    VAR_IN_OUT 
        STR : STRING[STRING_LENGTH];
        RUN : BYTE;
        OFFSET : UDINT;
        KEY : STRING[STRING_LENGTH];
        VALUE : STRING[STRING_LENGTH];
        PT : NETWORK_BUFFER;
    END_VAR
    VAR_OUTPUT 
        RESULT : BYTE;
    END_VAR
    VAR 
        step : INT;
        size : INT;
        c : BYTE;
        k_add : BYTE;
        v_add : BYTE;
        i : INT;
        state : BYTE;
        eof : BOOL;
        pv : REFERENCE TO BYTE;
        pk : REFERENCE TO BYTE;
        pve : DWORD;
        pke : DWORD;
        watchdog : TON;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK INI_PARSER_FILE (* File and server *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=164 *)
    VAR_IN_OUT 
        FILENAME : STRING[255];
        FSD : FILE_SERVER_DATA;
        STR : STRING[STRING_LENGTH];
        RUN : BYTE;
        OFFSET : UDINT;
        KEY : STRING[STRING_LENGTH];
        VALUE : STRING[STRING_LENGTH];
        PT : NETWORK_BUFFER;
    END_VAR
    VAR_OUTPUT 
        RESULT : BYTE;
    END_VAR
    VAR 
        FB : FILE_BLOCK;
        i : UDINT;
        state : BYTE;
        e : BYTE;
        mode : BYTE;
        step : INT;
        c : BYTE;
        k_add : BYTE;
        v_add : BYTE;
        eof : BOOL;
        pv : REFERENCE TO BYTE;
        pk : REFERENCE TO BYTE;
        pve : DWORD;
        pke : DWORD;
        watchdog : TON;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK FILE_SERVER (* File and server *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=154 *)
    VAR_IN_OUT 
        FSD : FILE_SERVER_DATA;
        PT : NETWORK_BUFFER;
    END_VAR
    VAR 
        buf_size : UDINT;
        handle : DWORD;
        read_max_length : UDINT;
        file_position : UDINT;
        used_filename : STRING[255];
        length_read : UDINT;
        write_length : UDINT;
        length_written : UDINT;
        open_handle : DWORD;
        seek_position : UDINT;
        tell_position : UDINT;
        file_size : DINT;
        open_mode : STRING[2];
        last_mode : BYTE;
        command : BYTE;
        error_code : BYTE;
        error : BOOL;
        file_change : BOOL;
        step : INT;
        FSR : FILE_SERVER_RUNTIME;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK FILE_SERVER_RUNTIME (* File and server *)(* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=154 *)
    VAR_INPUT 
        MODE : BYTE;
        COMMAND : BYTE;
    END_VAR
    VAR_IN_OUT 
        FSD : FILE_SERVER_DATA;
    END_VAR
    VAR 
        last_command : BYTE;
        init : BOOL;
        start_tx : DWORD;
        stop_tx : DWORD;
        runtime : DWORD;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK IP_CONTROL2 (* File and server *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=107 *)
    VAR_IN_OUT 
        IP_C : IP_C; (* IP_Control Verwaltungsstruktur *)
        S_BUF : NETWORK_BUFFER_SHORT; (* Externer Sendbuffer *)
        R_BUF : NETWORK_BUFFER_SHORT; (* Externer Receivebuffer *)
    END_VAR
    VAR_INPUT 
        IP : DWORD; (* IP Adresse *)
        PORT : WORD; (* Port Nummer *)
        TIME_OUT : TIME; (* Ueberwachungszeit Connect / Send / Receive *)
    END_VAR
    VAR 
        c_time : UDINT; (* CONNECT-Time (Zeit bei nicht vorhandener Verbindung) *)
        s_time : UDINT; (* SEND-Time    (Zeit seit letzten Datensenden) *)
        r_time : UDINT; (* RECEIVE-Time (Zeit seit letztem Datenempfang) *)
        c_enable : BOOL; (* Connect: freigabe *)
        c_ip : DWORD; (* Connect: aktuelle IP-Adresse *)
        c_port : WORD; (* Connect: aktuelle Port-Nummer *)
        c_mode : BYTE; (* Connect: aktueller Mode UDP/TCP...... *)
        c_status : BYTE; (* Connect: Status (Errorcode) *)
        c_ready : BOOL; (* Connect: Verbindung aufgebaut *)
        c_ready_old : BOOL; (* Connect: letzter Zustand von c_ready für Flankenauswertung *)
        c_select : BOOL; (* non blocking mode - abfrage über select durchführen *)
        c_fdWrite : SOCKET_FD_SET;
        c_Timeout : SOCKET_TIMEVAL;
        s_total : INT; (* Send: Gesamtanzahl Bytes zum senden *)
        s_cur_pos : INT; (* Send: aktuelle Sendeposition *)
        s_cur_size : INT; (* Send: aktuelle Sendegroesse *)
        s_max_size : INT; (* Send: maximale Telegrammlänge fuer Senden *)
        s_start : BOOL; (* Send: Sende modus aktivieren *)
        s_active : BOOL; (* Send: Daten senden ist aktiv *)
        s_req : BOOL; (* Send: Start Daten senden *)
        s_done : BOOL; (* Send: ohne Fehler beendet *)
        s_status : BYTE; (* Send: Status (Errorcodes) *)
        r_status : BYTE; (* Receive: Status (Errorcodes) *)
        r_count : INT; (* Receive: Anzahl empfangener Bytes *)
        r_offset : INT; (* Receive: aktuelle Position in externen Receivebuffer *)
        r_max_size : INT; (* Receive: groesse des externen Empfangbuffers*)
        new_connection : BOOL; (* Neue Verbindungsparameter vorhanden *)
        tx : DWORD; (* letzter zeitwert *)
        error_time : DWORD; (* aktueller Timeout-Wert *)
        state : BYTE; (* schrittmerker für connect *)
        server_socket : DINT := SOCKET_INVALID;
        socket : DINT := SOCKET_INVALID;
        sockaddr : SOCKADDRESS;
        sockaddr_size : DWORD;
        plc_841 : BOOL;
        plc_881 : BOOL;
        dint_true : DINT := 1;
        bytes_received : DINT;
        bytes_sent : DINT;
        udp_mode : BOOL;
    END_VAR
    VAR CONSTANT
        STOP : BYTE := 0;
        TS_INIT : BYTE := 1;
        TS_OPEN : BYTE := 2;
        UDP_INIT : BYTE := 31;
        TC_INIT : BYTE := 51;
        TC_CONNECT : BYTE := 52;
        C_WAIT : BYTE := 250;
        C_CLOSE : BYTE := 251;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK IP_CONTROL (* File and server *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=101 *)
    VAR_IN_OUT 
        IP_C : IP_C; (* IP_Control Verwaltungsstruktur *)
        S_BUF : NETWORK_BUFFER; (* Externer Sendbuffer *)
        R_BUF : NETWORK_BUFFER; (* Externer Receivebuffer *)
    END_VAR
    VAR_INPUT 
        IP : DWORD; (* IP Adresse *)
        PORT : WORD; (* Port Nummer *)
        TIME_OUT : TIME; (* Ueberwachungszeit Connect / Send / Receive *)
    END_VAR
    VAR 
        c_time : UDINT; (* CONNECT-Time (Zeit bei nicht vorhandener Verbindung) *)
        s_time : UDINT; (* SEND-Time    (Zeit seit letzten Datensenden) *)
        r_time : UDINT; (* RECEIVE-Time (Zeit seit letztem Datenempfang) *)
        c_enable : BOOL; (* Connect: freigabe *)
        c_ip : DWORD; (* Connect: aktuelle IP-Adresse *)
        c_port : WORD; (* Connect: aktuelle Port-Nummer *)
        c_mode : BYTE; (* Connect: aktueller Mode UDP/TCP...... *)
        c_status : BYTE; (* Connect: Status (Errorcode) *)
        c_ready : BOOL; (* Connect: Verbindung aufgebaut *)
        c_ready_old : BOOL; (* Connect: letzter Zustand von c_ready für Flankenauswertung *)
        c_select : BOOL; (* non blocking mode - abfrage über select durchführen *)
        c_fdWrite : SOCKET_FD_SET;
        c_Timeout : SOCKET_TIMEVAL;
        s_total : INT; (* Send: Gesamtanzahl Bytes zum senden *)
        s_cur_pos : INT; (* Send: aktuelle Sendeposition *)
        s_cur_size : INT; (* Send: aktuelle Sendegroesse *)
        s_max_size : INT; (* Send: maximale Telegrammlänge fuer Senden *)
        s_start : BOOL; (* Send: Sende modus aktivieren *)
        s_active : BOOL; (* Send: Daten senden ist aktiv *)
        s_req : BOOL; (* Send: Start Daten senden *)
        s_done : BOOL; (* Send: ohne Fehler beendet *)
        s_status : BYTE; (* Send: Status (Errorcodes) *)
        r_status : BYTE; (* Receive: Status (Errorcodes) *)
        r_count : INT; (* Receive: Anzahl empfangener Bytes *)
        r_offset : INT; (* Receive: aktuelle Position in externen Receivebuffer *)
        r_max_size : INT; (* Receive: groesse des externen Empfangbuffers*)
        new_connection : BOOL; (* Neue Verbindungsparameter vorhanden *)
        tx : DWORD; (* letzter zeitwert *)
        error_time : DWORD; (* aktueller Timeout-Wert *)
        state : BYTE; (* schrittmerker für connect *)
        server_socket : DINT := SOCKET_INVALID;
        socket : DINT := SOCKET_INVALID;
        sockaddr : SOCKADDRESS;
        sockaddr_size : DWORD;
        plc_841 : BOOL;
        plc_881 : BOOL;
        dint_true : DINT := 1;
        bytes_received : DINT;
        bytes_sent : DINT;
        udp_mode : BOOL;
    END_VAR
    VAR CONSTANT
        STOP : BYTE := 0;
        TS_INIT : BYTE := 1;
        TS_OPEN : BYTE := 2;
        UDP_INIT : BYTE := 31;
        TC_INIT : BYTE := 51;
        TC_CONNECT : BYTE := 52;
        C_WAIT : BYTE := 250;
        C_CLOSE : BYTE := 251;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK NET_VAR_BOOL8 (* Network variables *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=200 *)
    VAR_IN_OUT 
        X : NET_VAR_DATA;
    END_VAR
    VAR_INPUT 
        IN1 : BOOL;
        IN2 : BOOL;
        IN3 : BOOL;
        IN4 : BOOL;
        IN5 : BOOL;
        IN6 : BOOL;
        IN7 : BOOL;
        IN8 : BOOL;
    END_VAR
    VAR_OUTPUT 
        OUT1 : BOOL;
        OUT2 : BOOL;
        OUT3 : BOOL;
        OUT4 : BOOL;
        OUT5 : BOOL;
        OUT6 : BOOL;
        OUT7 : BOOL;
        OUT8 : BOOL;
        ID : BYTE;
    END_VAR
    VAR 
        init : BOOL;
        index : INT;
        index2 : INT;
        BYTE_TO_BITS : BYTE_TO_BITS;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK NET_VAR_BUFFER (* Network variables *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=201 *)
    VAR_IN_OUT 
        BUF_IN : ARRAY[1..64] OF BYTE;
        BUF_OUT : ARRAY[1..64] OF BYTE;
        X : NET_VAR_DATA;
    END_VAR
    VAR_OUTPUT 
        ID : BYTE;
    END_VAR
    VAR 
        size : INT;
        init : BOOL;
        index : INT;
        index2 : INT;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK NET_VAR_CONTROL (* Network variables *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=199 *)
    VAR_INPUT 
        ACTIVATE : BOOL;
        MASTER : BOOL;
        UDP : BOOL;
        REMOTE_IP4 : DWORD;
        REMOTE_PORT : WORD := 10000;
        SCAN_TIME : TIME := TIME#1s0ms;
        WATCHDOG : TIME := TIME#2s0ms;
    END_VAR
    VAR_OUTPUT 
        RUN : BOOL;
        ERROR : DWORD;
    END_VAR
    VAR_IN_OUT 
        X : NET_VAR_DATA;
    END_VAR
    VAR 
        IPC : IP_CONTROL;
        IP_C : IP_C; (* IP_Control Verwaltungsstruktur *)
        step : INT;
        activate_last : BOOL;
        tscan : TON;
        reset : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK NET_VAR_DWORD8 (* Network variables *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=202 *)
    VAR_IN_OUT 
        X : NET_VAR_DATA;
    END_VAR
    VAR_INPUT 
        IN1 : DWORD;
        IN2 : DWORD;
        IN3 : DWORD;
        IN4 : DWORD;
        IN5 : DWORD;
        IN6 : DWORD;
        IN7 : DWORD;
        IN8 : DWORD;
    END_VAR
    VAR_OUTPUT 
        OUT1 : DWORD;
        OUT2 : DWORD;
        OUT3 : DWORD;
        OUT4 : DWORD;
        OUT5 : DWORD;
        OUT6 : DWORD;
        OUT7 : DWORD;
        OUT8 : DWORD;
        ID : BYTE;
    END_VAR
    VAR 
        init : BOOL;
        i : INT;
        i2 : INT;
        index : INT;
        index2 : INT;
        ra : ARRAY[1..8] OF DWORD;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK NET_VAR_REAL8 (* Network variables *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=202 *)
    VAR_IN_OUT 
        X : NET_VAR_DATA;
    END_VAR
    VAR_INPUT 
        IN1 : REAL;
        IN2 : REAL;
        IN3 : REAL;
        IN4 : REAL;
        IN5 : REAL;
        IN6 : REAL;
        IN7 : REAL;
        IN8 : REAL;
    END_VAR
    VAR_OUTPUT 
        OUT1 : REAL;
        OUT2 : REAL;
        OUT3 : REAL;
        OUT4 : REAL;
        OUT5 : REAL;
        OUT6 : REAL;
        OUT7 : REAL;
        OUT8 : REAL;
        ID : BYTE;
    END_VAR
    VAR 
        init : BOOL;
        i : INT;
        i2 : INT;
        index : INT;
        index2 : INT;
        r_dw : DWORD;
        ra : ARRAY[1..8] OF REAL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK NET_VAR_STRING (* Network variables *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=203 *)
    VAR_IN_OUT 
        IN : STRING[STRING_LENGTH];
        OUT : STRING[STRING_LENGTH];
        X : NET_VAR_DATA;
    END_VAR
    VAR_OUTPUT 
        ID : BYTE;
    END_VAR
    VAR 
        init : BOOL;
        len_str : INT;
        index : INT;
        index2 : INT;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK NET_VAR_X8 (* Network variables *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=204 *)
    VAR_IN_OUT 
        X : NET_VAR_DATA;
    END_VAR
    VAR_INPUT 
        IN_REAL1 : REAL;
        IN_REAL2 : REAL;
        IN_DINT1 : DINT;
        IN_DINT2 : DINT;
        IN_UDINT1 : UDINT;
        IN_UDINT2 : UDINT;
        IN_DWORD1 : DWORD;
        IN_DWORD2 : DWORD;
    END_VAR
    VAR_OUTPUT 
        OUT_REAL1 : REAL;
        OUT_REAL2 : REAL;
        OUT_DINT1 : DINT;
        OUT_DINT2 : DINT;
        OUT_UDINT1 : UDINT;
        OUT_UDINT2 : UDINT;
        OUT_DWORD1 : DWORD;
        OUT_DWORD2 : DWORD;
        ID : BYTE;
    END_VAR
    VAR 
        init : BOOL;
        i : INT;
        i2 : INT;
        index : INT;
        index2 : INT;
        ra : ARRAY[1..8] OF DWORD;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK DNS_CLIENT (* Network *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=89 *)
    VAR_IN_OUT 
        IP_C : IP_C; (* IP_Control Verwaltungsstruktur *)
        S_BUF : NETWORK_BUFFER;
        R_BUF : NETWORK_BUFFER;
    END_VAR
    VAR_INPUT 
        ACTIVATE : BOOL;
        DOMAIN : STRING[255];
        IP4_DNS : DWORD;
    END_VAR
    VAR_OUTPUT 
        IP4 : DWORD;
        DONE : BOOL;
        ERROR : DWORD;
    END_VAR
    VAR 
        IP_FIFO : IP_FIFO;
        ip_state : BYTE;
        ip_id : BYTE;
        i : INT;
        state : INT;
        domain_copy : STRING[255];
        activate_last : BOOL;
        URL_length : INT;
        char : BYTE;
        char_count : INT;
        tid : BYTE;
        anc : INT;
        x : BYTE;
        rr_stop : BOOL;
        ttl_last : DWORD;
        ttl_tmp : DWORD;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK DNS_DYN (* Network *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=92 *)
    VAR_IN_OUT 
        IP_C : IP_C; (* IP_Control Verwaltungsstruktur *)
        S_BUF : NETWORK_BUFFER;
        R_BUF : NETWORK_BUFFER;
    END_VAR
    VAR_INPUT 
        ENABLE : BOOL;
        UPDATE : BOOL;
        T_UPDATE : TIME := TIME#60m0s0ms;
        MODE : BYTE;
        HOSTNAME : STRING[30];
        USERNAME : STRING[20];
        PASSWORD : STRING[20];
        IP4 : DWORD;
    END_VAR
    VAR_OUTPUT 
        BUSY : BOOL;
        DONE : BOOL;
        ERROR_C : DWORD;
        ERROR_T : BYTE;
    END_VAR
    VAR 
        DNS_CLIENT : DNS_CLIENT;
        HTTP_GET : HTTP_GET;
        BASE64_ENCODE_STR : BASE64_ENCODE_STR;
        URL_DATA : URL;
        update_last : BOOL;
        state : INT;
        base64_done : BOOL;
        s1 : STRING[144];
        s2 : STRING[192];
        w : TON;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK DNS_REV_CLIENT (* Network *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=90 *)
    VAR_IN_OUT 
        IP_C : IP_C; (* IP_Control Verwaltungsstruktur *)
        S_BUF : NETWORK_BUFFER;
        R_BUF : NETWORK_BUFFER;
    END_VAR
    VAR_INPUT 
        ACTIVATE : BOOL;
        IP4 : DWORD;
        IP4_DNS : DWORD;
    END_VAR
    VAR_OUTPUT 
        DOMAIN : STRING[255];
        DONE : BOOL;
        ERROR : DWORD;
    END_VAR
    VAR 
        IP_FIFO : IP_FIFO;
        ip_state : BYTE;
        ip_id : BYTE;
        state : INT;
        ip4_copy : DWORD;
        d : STRING[27];
        activate_last : BOOL;
        i : INT;
        dl : INT;
        p1 : INT;
        char : BYTE;
        char_count : INT;
        tid : BYTE;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK FTP_CLIENT (* Network *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=94 *)
    VAR_INPUT 
        ACTIVATE : BOOL;
        FILENAME : STRING[255];
        FTP_URL : STRING[STRING_LENGTH];
        FTP_DOWNLOAD : BOOL;
        FTP_ACTIV : BOOL;
        FILE_DELETE : BOOL;
        TIMEOUT : TIME;
        DNS_IP4 : DWORD;
        PLC_IP4 : DWORD;
    END_VAR
    VAR_OUTPUT 
        DONE : BOOL;
        BUSY : BOOL;
        ERROR_C : DWORD;
        ERROR_T : BYTE;
    END_VAR
    VAR 
        IP_C1 : IP_C; (* IP_Control Verwaltungsstruktur *)
        IP_C2 : IP_C; (* IP_Control Verwaltungsstruktur *)
        S_BUF1 : NETWORK_BUFFER;
        S_BUF2 : NETWORK_BUFFER;
        R_BUF1 : NETWORK_BUFFER;
        R_BUF2 : NETWORK_BUFFER;
        URL_DATA : URL;
        DNS_CLIENT : DNS_CLIENT;
        IPC1 : IP_CONTROL;
        IPC2 : IP_CONTROL;
        FS : FILE_SERVER;
        FSD : FILE_SERVER_DATA;
        activate_last : BOOL;
        step : INT;
        snd_step : INT;
        snd_text : STRING[STRING_LENGTH];
        rcv_text : STRING[STRING_LENGTH];
        rcv_state : INT;
        TON_WAIT : TON;
        last_step : INT;
        next_step : INT;
        idx1 : INT;
        idx2 : INT;
        str1 : STRING[STRING_LENGTH];
        str2 : STRING[STRING_LENGTH];
        ftp_path : STRING[255];
        byar : ARRAY[0..5] OF BYTE;
        dw_tmp : DWORD;
        w_tmp : WORD;
        fpd : FILE_PATH_DATA;
        timeout2 : TIME;
        timeout3 : TIME;
        ftp_file_size : UDINT;
        ip_c1_red_disable : BOOL; (* IP_CONTROL 1 - Remote Disconnect Error unterdrücken *)
        ip_c2_red_disable : BOOL; (* IP_CONTROL 1 - Remote Disconnect Error unterdrücken *)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK GET_WAN_IP (* Network *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=96 *)
    VAR_IN_OUT 
        IP_C : IP_C; (* IP_Control Verwaltungsstruktur *)
        S_BUF : NETWORK_BUFFER;
        R_BUF : NETWORK_BUFFER;
    END_VAR
    VAR_INPUT 
        ACTIVATE : BOOL;
    END_VAR
    VAR_OUTPUT 
        WAN_IP4 : DWORD;
        DONE : BOOL;
        NEW_IP4 : BOOL;
        ERROR_C : DWORD;
        ERROR_T : BYTE;
    END_VAR
    VAR 
        URL_DATA : URL;
        DNS_CLIENT : DNS_CLIENT;
        HTTP_GET : HTTP_GET;
        activate_last : BOOL;
        wan_ip4_last : DWORD;
        state : INT;
        st_ip : STRING[120];
        i1 : INT;
        p1 : INT;
        p2 : INT;
        p3 : INT;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK HTTP_GET (* Network *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=98 *)
    VAR_IN_OUT 
        URL_DATA : URL;
        IP_C : IP_C; (* IP_Control Verwaltungsstruktur *)
        S_BUF : NETWORK_BUFFER;
        R_BUF : NETWORK_BUFFER;
    END_VAR
    VAR_INPUT 
        IP4 : DWORD;
        GET : BOOL;
        MODE : BYTE := BYTE#2;
        UNLOCK_BUF : BOOL;
    END_VAR
    VAR_OUTPUT 
        HTTP_STATUS : STRING[255];
        HEADER_START : UINT; (* HTTP Header (Message Header) *)
        HEADER_STOP : UINT; (* HTTP Header (Message Header) *)
        BODY_START : UINT; (* Message Body *)
        BODY_STOP : UINT; (* Message Body *)
        DONE : BOOL;
        ERROR : DWORD;
    END_VAR
    VAR 
        READ_HTTP : READ_HTTP;
        BASE64_ENCODE_STR : BASE64_ENCODE_STR;
        b64_str1 : STRING[144];
        b64_str2 : STRING[192];
        b64_done : BOOL;
        b64_start : BOOL;
        authentication : BOOL;
        IP_FIFO : IP_FIFO;
        ip_state : BYTE;
        ip_id : BYTE;
        get_last : BOOL;
        ip4_stored : DWORD;
        state : INT;
        i : INT;
        http_1_1_host : BOOL;
        total_size : INT;
        text : STRING[STRING_LENGTH];
        delimiter2b : STRING[2];
        delimiter4b : STRING[4];
        del_end : STRING[4];
        del_pos : INT;
        idx : INT;
        rcv_timeout : BOOL;
        con_rdce : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK IP2GEO (* Network *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=99 *)
    VAR_IN_OUT 
        IP_C : IP_C; (* IP_Control Verwaltungsstruktur *)
        S_BUF : NETWORK_BUFFER;
        R_BUF : NETWORK_BUFFER;
        GEO : IP2GEO_DATA;
    END_VAR
    VAR_INPUT 
        IP : DWORD;
        ACTIVATE : BOOL;
    END_VAR
    VAR_OUTPUT 
        BUSY : BOOL;
        DONE : BOOL;
        ERROR_C : DWORD;
        ERROR_T : BYTE;
    END_VAR
    VAR 
        CTRL : XML_CONTROL;
        XML_READER : XML_READER;
        URL_DATA : URL;
        DNS_CLIENT : DNS_CLIENT;
        HTTP_GET : HTTP_GET;
        last_state : BOOL;
        value_int : INT;
        value_real : REAL;
        v_real : REAL;
        state : INT;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK MB_CLIENT (* Network *)(* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=112 *)
    VAR_IN_OUT 
        IP_C : IP_C;
        S_BUF : NETWORK_BUFFER_SHORT;
        R_BUF : NETWORK_BUFFER_SHORT;
        DATA : ARRAY[0..255] OF WORD;
    END_VAR
    VAR_INPUT 
        DATA_SIZE : INT;
        ENABLE : BOOL;
        UDP : BOOL;
        FC : INT;
        UNIT_ID : BYTE;
        R_ADDR : INT;
        R_POINTS : INT;
        R_DATA_ADR : INT;
        R_DATA_BITPOS : INT;
        W_ADDR : INT;
        W_POINTS : INT;
        W_DATA_ADR : INT;
        W_DATA_BITPOS : INT;
        DELAY : TIME;
    END_VAR
    VAR_OUTPUT 
        ERROR : DWORD;
        BUSY : BOOL;
    END_VAR
    VAR 
        ip_state : BYTE;
        ip_id : BYTE;
        ip_fifo : ip_fifo;
        mask : DWORD;
        w_tmp : WORD;
        idx1 : INT;
        idx2 : INT;
        stop : INT;
        i : INT;
        bit_pos : INT;
        w_mask : WORD;
        b_mask : BYTE;
        count : INT;
        state : INT;
        transaction_id : INT;
        response : INT;
        comp : INT;
        ton_1 : TON;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK MB_SERVER (* Network *)(* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=116 *)
    VAR_IN_OUT 
        IP_C : IP_C;
        S_BUF : NETWORK_BUFFER_SHORT;
        R_BUF : NETWORK_BUFFER_SHORT;
        VMAP : ARRAY[1..10] OF VMAP_DATA;
        DATA : ARRAY[0..255] OF WORD;
    END_VAR
    VAR_INPUT 
        DATA_SIZE : INT;
        ENABLE : BOOL;
        UDP : BOOL;
    END_VAR
    VAR_OUTPUT 
        ERROR : DWORD;
    END_VAR
    VAR 
        MB_VMAP : MB_VMAP;
        adr1 : INT;
        adr2 : INT;
        points : INT;
        points2 : INT;
        coils : BYTE;
        mask : BYTE;
        idx1 : INT;
        idx2 : INT;
        bit_pos : INT;
        count : INT;
        fc : INT;
        i : INT;
        state : INT;
        ip_state : BYTE;
        ip_id : BYTE;
        IP_FIFO : IP_FIFO;
        w_tmp : WORD;
        last_cycle : TIME;
        tx : TIME;
        t : TON;
        ip_error : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK MB_SERVER_1 (* Network *)(* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=116 *)
    VAR_IN_OUT 
        IP_C : IP_C;
        S_BUF : NETWORK_BUFFER_SHORT;
        R_BUF : NETWORK_BUFFER_SHORT;
        VMAP : ARRAY[1..10] OF VMAP_DATA;
        DATA : ARRAY[0..255] OF WORD;
    END_VAR
    VAR_INPUT 
        DATA_SIZE : INT;
        ENABLE : BOOL;
        UDP : BOOL;
    END_VAR
    VAR_OUTPUT 
        ERROR : DWORD;
    END_VAR
    VAR 
        MB_VMAP : MB_VMAP;
        adr1 : INT;
        adr2 : INT;
        points : INT;
        points2 : INT;
        coils : BYTE;
        mask : BYTE;
        idx1 : INT;
        idx2 : INT;
        bit_pos : INT;
        count : INT;
        fc : INT;
        i : INT;
        state : INT;
        ip_state : BYTE;
        ip_id : BYTE;
        IP_FIFO : IP_FIFO;
        w_tmp : WORD;
        last_cycle : TIME;
        tx : TIME;
        t : TON;
        ip_error : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK MB_VMAP (* Network *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=118 *)
    VAR_IN_OUT 
        VMAP : ARRAY[1..10] OF VMAP_DATA;
    END_VAR
    VAR_INPUT 
        FC : INT;
        V_ADR : INT;
        V_CNT : INT;
        SIZE : INT;
    END_VAR
    VAR_OUTPUT 
        P_ADR : INT;
        P_BIT : INT;
        ERROR : BYTE;
    END_VAR
    VAR 
        i : INT;
        vopt : DWORD;
        vadr : INT;
        padr : INT;
        mask : DWORD;
        vsize : INT;
        w_tmp : WORD;
        i_tmp : INT;
        init : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK READ_HTTP (* Network *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=122 *)
    VAR_INPUT 
        SIZE : UINT;
        POS : INT;
        SRC : STRING[255];
    END_VAR
    VAR_IN_OUT 
        PT : NW_BUF_LONG;
    END_VAR
    VAR_OUTPUT 
        READ_HTTP : STRING[STRING_LENGTH];
    END_VAR
    VAR 
        index : INT;
        s1 : INT;
        e1 : INT;
        stop : INT;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK SMTP_CLIENT (* Network *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=123 *)
    VAR_INPUT 
        ACTIVATE : BOOL;
        TIMEOUT : TIME;
        DTI : DT;
        DTI_OFFSET : INT;
        DNS_IP4 : DWORD;
    END_VAR
    VAR_OUTPUT 
        DONE : BOOL;
        BUSY : BOOL;
        ERROR_C : DWORD;
        ERROR_T : BYTE;
    END_VAR
    VAR_IN_OUT 
        SERVER : STRING[255];
        MAILFROM : STRING[255];
        MAILTO : STRING[STRING_LENGTH];
        SUBJECT : STRING[255];
        BODY : STRING[STRING_LENGTH];
        FILES : STRING[STRING_LENGTH];
    END_VAR
    VAR 
        IP_C : IP_C; (* IP_Control Verwaltungsstruktur *)
        S_BUF : NETWORK_BUFFER;
        R_BUF : NETWORK_BUFFER;
        F_BUF : NETWORK_BUFFER;
        URL_DATA : URL;
        DNS_CLIENT : DNS_CLIENT;
        IPC : IP_CONTROL;
        FS : FILE_SERVER;
        FSD : FILE_SERVER_DATA;
        BASE64_ENCODE_STR : BASE64_ENCODE_STR;
        BASE64_ENCODE_STREAM : BASE64_ENCODE_STREAM;
        fpd : FILE_PATH_DATA;
        MD5_CRAM_AUTH : MD5_CRAM_AUTH;
        MD5_RUN : BOOL;
        activate_last : BOOL;
        step : INT;
        snd_step : INT;
        str1 : STRING[STRING_LENGTH];
        str2 : STRING[STRING_LENGTH];
        str3 : STRING[255];
        snd_text : STRING[STRING_LENGTH];
        snd_lf_cnt : INT;
        rcv_text : STRING[STRING_LENGTH];
        rcv_s : STRING[3];
        rcv_state : INT;
        auth_names : STRING[255] := ' PLAIN; LOGIN; CRAM-MD5';
        auth_names_tls : STRING[255] := ' PLAIN; LOGIN; CRAM-MD5;STARTTLS';
        auth_state : BYTE;
        TON_WAIT : TON;
        last_step : INT;
        next_step : INT;
        timeout2 : TIME;
        timeout3 : TIME;
        last_block : BOOL;
        file_delete : BOOL;
        esmtp : BOOL;
        cnt1 : INT;
        cnt2 : INT;
        cnt3 : INT;
        cnt4 : INT;
        idx1 : INT;
        idx2 : INT;
        idx3 : INT;
        snd_idx : INT;
        snd_enable : BOOL;
        i1 : INT;
        b64_done : BOOL;
        b64_start : BOOL;
        b64_max : UINT := 2880; (* short = 960 / long = 2880 *)
        b64_buf1 : ARRAY[0..47] OF BYTE;
        b64_buf2 : ARRAY[0..63] OF BYTE;
        b64_size1 : INT;
        b64_size2 : INT;
        b64_lf : BOOL;
        b64_str1 : STRING[144];
        b64_str2 : STRING[192];
        md5_user : STRING[64];
        md5_password : STRING[64];
        md5_b64_ts : STRING[64];
        md5_auth_key : STRING[192];
        ip_c_red_disable : BOOL; (* IP_CONTROL - Remote Disconnect Error unterdrücken *)
        ssl_mode : BYTE; (*SSL/TLS Mode -   0 = off / 1 = SSL / 2 = TLS*)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK SNTP_CLIENT (* Network *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=127 *)
    VAR_IN_OUT 
        IP_C : IP_C; (* IP_Control Verwaltungsstruktur *)
        S_BUF : NETWORK_BUFFER;
        R_BUF : NETWORK_BUFFER;
    END_VAR
    VAR_INPUT 
        IP4 : DWORD;
        ACTIVATE : BOOL;
    END_VAR
    VAR_OUTPUT 
        ERROR : DWORD;
        DONE_P : BOOL;
        UDT : DT;
        XMS : INT;
    END_VAR
    VAR 
        IP_FIFO : IP_FIFO;
        ip_state : BYTE;
        ip_id : BYTE;
        i : INT;
        last : DWORD;
        state : INT;
        tx : DWORD;
        activate_last : BOOL;
        ip4_stored : DWORD;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK SNTP_SERVER (* Network *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=128 *)
    VAR_IN_OUT 
        IP_C : IP_C; (* IP_Control Verwaltungsstruktur *)
        S_BUF : NETWORK_BUFFER;
        R_BUF : NETWORK_BUFFER;
    END_VAR
    VAR_INPUT 
        ENABLE : BOOL;
        STRATUM : BYTE := BYTE#1;
        UDT : DT;
        XMS : INT;
    END_VAR
    VAR 
        IP_FIFO : IP_FIFO;
        ip_state : BYTE;
        ip_id : BYTE;
        i2 : INT;
        i : INT;
        timestamp_int : DWORD; (* Timestamp integer part *)
        timestamp_sek : DWORD; (* Timestamp fraction part (HIGH_WORD) *)
        ts_b : BYTE;
        state : INT;
        tx : UDINT;
        t : TON;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK SPIDER_ACCESS (* Network *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=129 *)
    VAR_IN_OUT 
        IP_C : IP_C; (*IP_Control Verwaltungsstruktur*)
        S_BUF : NETWORK_BUFFER;
        R_BUF : NETWORK_BUFFER;
        VALUE : STRING[255];
        VAR_NAME : STRING[40];
    END_VAR
    VAR_INPUT 
        MODE : BYTE;
    END_VAR
    VAR_OUTPUT 
        ERROR : DWORD;
    END_VAR
    VAR 
        state : INT;
        st_tmp : STRING[STRING_LENGTH];
        URL_DATA : URL;
        HTTP_GET : HTTP_GET;
        value_len : UINT;
        body_len : UINT;
        mode_save : BYTE;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK SYS_LOG (* Network *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=131 *)
    VAR_IN_OUT 
        IP_C : IP_C; (* IP_Control Verwaltungsstruktur *)
        S_BUF : NETWORK_BUFFER;
        R_BUF : NETWORK_BUFFER;
    END_VAR
    VAR_INPUT 
        ACTIVATE : BOOL;
        LOC_DT : DT;
        SERVER_IP4 : DWORD;
        PORT : WORD;
        FACILITY : BYTE;
        SEVERITY : BYTE;
        TAG : STRING[32];
        HOSTNAME : STRING[255];
        MESSAGE : STRING[STRING_LENGTH];
        OPTION : BYTE;
    END_VAR
    VAR_OUTPUT 
        DONE_P : BOOL;
        ERROR : DWORD;
    END_VAR
    VAR 
        ip_state : BYTE;
        ip_id : BYTE;
        IP_FIFO : IP_FIFO;
        activate_last : BOOL;
        state : INT;
        s1 : STRING[20];
        i : INT;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TELNET_LOG (* Network *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=135 *)
    VAR_IN_OUT 
        IP_C : IP_C;
        S_BUF : NETWORK_BUFFER;
        LOG_CL : LOG_CONTROL;
    END_VAR
    VAR_INPUT 
        ENABLE : BOOL;
        OPTION : BYTE := BYTE#16#8C; (* no flush buffer (7) , CR&LF (3), Colors (2), AUTOWRAP (1), Screen-Init (0) *)
        PORT : WORD := 23; (* Port Nummer *)
    END_VAR
    VAR_OUTPUT 
        READY : BOOL;
    END_VAR
    VAR 
        TELNET_PRINT : TELNET_PRINT;
        done : BOOL;
        init : BOOL;
        watchdog : TON;
        ci : INT;
        pi : INT;
        pi_last : INT;
        send : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TELNET_PRINT (* Network *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=137 *)
    VAR_IN_OUT 
        IP_C : IP_C;
        S_BUF : NETWORK_BUFFER;
    END_VAR
    VAR_INPUT 
        TEXT : STRING[STRING_LENGTH];
        ENABLE : BOOL;
        SEND : BOOL;
        OPTION : BYTE := BYTE#16#8C; (* no flush buffer (7) , CR&LF (3), Colors (2), AUTOWRAP (1), Screen-Init (0) *)
        BACK_COLOR : BYTE;
        FRONT_COLOR : BYTE;
        X_POS : BYTE;
        Y_POS : BYTE;
        PORT : WORD := 23; (* Port Nummer *)
    END_VAR
    VAR_OUTPUT 
        READY : BOOL;
        DONE : BOOL;
    END_VAR
    VAR 
        last_fc : BYTE;
        state : INT;
        x : INT := -1;
        ip_state : BYTE;
        ip_id : BYTE;
        IP_FIFO : IP_FIFO;
        init : BOOL;
        b0_screen_clear : BOOL;
        b1_autowrap : BOOL;
        b2_color : BOOL;
        b3_cr_lr : BOOL;
        b7_no_flush : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TN_FRAMEWORK (* Telnet vision *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=173 *)
    VAR 
        FB_IP_CONTROL : IP_CONTROL;
        FB_TN_INPUT_CONTROL : TN_INPUT_CONTROL;
        FB_TN_INPUT_MENU_BAR : TN_INPUT_MENU_BAR;
        FB_TN_RECEIVE : TN_RECEIVE;
        FB_TN_SEND_ROWS : TN_SEND_ROWS;
        t : TON;
    END_VAR
    VAR_IN_OUT 
        US_TN_INPUT_CONTROL : us_TN_INPUT_CONTROL;
        US_TN_SCREEN : us_TN_SCREEN;
        US_TN_MENU : us_TN_MENU;
        S_BUF : NETWORK_BUFFER;
        R_BUF : NETWORK_BUFFER;
        IP_C : IP_C;
    END_VAR
    VAR_INPUT 
        PORT : WORD;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TN_INPUT_CONTROL (* Telnet vision *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=174 *)
    VAR_IN_OUT 
        XUS_TN_SCREEN : us_TN_SCREEN;
        XUS_TN_INPUT_CONTROL : us_TN_INPUT_CONTROL;
    END_VAR
    VAR 
        FB_TN_INPUT_SELECT_POPUP : TN_INPUT_SELECT_POPUP;
        FB_TN_INPUT_SELECT_TEXT : TN_INPUT_SELECT_TEXT;
        FB_TN_SC_WRITE_C : TN_SC_WRITE_C;
        FB_TN_INPUT_EDIT_LINE : TN_INPUT_EDIT_LINE;
        in_index : INT;
        in_Scroll_Offset : INT;
        in_Focus_new : INT;
        in_Focus_alt : INT;
        bo_Tool_Tip_Update : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TN_INPUT_EDIT_LINE (* Telnet vision *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=174 *)
    VAR 
        in_count : INT;
        in_Count_End : INT;
        in_CursorOffset : INT;
        by_Attr : BYTE;
        st_String : STRING[255];
        bo_Pos_Found : BOOL;
        st_CHAR : STRING[1];
        in_old_charpos : INT;
        FB_TN_SC_WRITE : TN_SC_WRITE;
    END_VAR
    VAR_IN_OUT 
        XUS_TN_SCREEN : us_TN_SCREEN;
        XUS_TN_INPUT_CONTROL_DATA : us_TN_INPUT_CONTROL_DATA;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TN_INPUT_MENU_BAR (* Telnet vision *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=176 *)
    VAR 
        FB_TN_INPUT_MENU_POPUP : TN_INPUT_MENU_POPUP;
        us_TN_MENU_POPUP : us_TN_MENU_POPUP;
        FB_TN_SC_WRITE_C : TN_SC_WRITE_C;
        in_ROW : INT;
        in_COL : INT;
        in_TITLE_Length : INT;
        st_MENU_BAR : STRING[STRING_LENGTH];
        st_MENU_TITLE : STRING[255];
        in_Count : INT;
        in_Index : INT;
        by_New_KeyCode : BYTE;
        in_Scroll_Offset : INT;
        by_ATTR : BYTE;
        bo_Reset_Position : BOOL;
    END_VAR
    VAR_IN_OUT 
        XUS_TN_MENU : us_TN_MENU;
        XUS_TN_SCREEN : us_TN_SCREEN;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TN_INPUT_MENU_POPUP (* Telnet vision *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=178 *)
    VAR 
        FB_TN_SC_AREA_SAVE : TN_SC_AREA_SAVE;
        FB_TN_SC_AREA_RESTORE : TN_SC_AREA_RESTORE;
        FB_TN_SC_LINE : TN_SC_LINE;
        FB_TN_SC_ADD_SHADOW : TN_SC_ADD_SHADOW;
        FB_TN_SC_BOX : TN_SC_BOX;
        FB_TN_SC_WRITE_C : TN_SC_WRITE_C;
        in_ROW : INT;
        in_ROWS : INT;
        in_COL : INT;
        in_COLS : INT;
        in_index : INT;
        in_Count : INT;
        in_Scroll_Offset : INT;
        by_ATTR : BYTE;
    END_VAR
    VAR_IN_OUT 
        XUS_TN_MENU_POPUP : us_TN_MENU_POPUP;
        XUS_TN_SCREEN : us_TN_SCREEN;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TN_INPUT_SELECT_POPUP (* Telnet vision *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=178 *)
    VAR 
        in_index : INT;
        in_Element_Count : INT;
        by_Cur_Key : BYTE;
        by_Attr : BYTE;
        st_String : STRING[255];
        us_TN_MENU_POPUP : us_TN_MENU_POPUP;
        FB_TN_INPUT_MENU_POPUP : TN_INPUT_MENU_POPUP;
        FB_TN_SC_WRITE : TN_SC_WRITE;
    END_VAR
    VAR_IN_OUT 
        XUS_TN_SCREEN : us_TN_SCREEN;
        XUS_TN_INPUT_CONTROL_DATA : us_TN_INPUT_CONTROL_DATA;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TN_INPUT_SELECT_TEXT (* Telnet vision *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=180 *)
    VAR 
        in_count : INT;
        by_Attr : BYTE;
        st_String : STRING[255];
        FB_TN_SC_WRITE : TN_SC_WRITE;
    END_VAR
    VAR_IN_OUT 
        XUS_TN_SCREEN : us_TN_SCREEN;
        XUS_TN_INPUT_CONTROL_DATA : us_TN_INPUT_CONTROL_DATA;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TN_RECEIVE (* Telnet vision *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=182 *)
    VAR_IN_OUT 
        R_BUF : NETWORK_BUFFER;
        XUS_TN_SCREEN : us_TN_SCREEN;
    END_VAR
    VAR 
        REQ_Size : UINT;
        REQ1 : BYTE;
        REQ2 : BYTE;
        REQ3 : BYTE;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TN_SC_ADD_SHADOW (* Telnet vision *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=184 *)
    VAR 
        in_Offset : INT;
        in_X : INT;
        in_Y : INT;
    END_VAR
    VAR_INPUT 
        IIN_Y1 : INT;
        IIN_X1 : INT;
        IIN_Y2 : INT;
        IIN_X2 : INT;
        IIN_OPTION : INT;
    END_VAR
    VAR_IN_OUT 
        XUS_TN_SCREEN : us_TN_SCREEN;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TN_SC_AREA_RESTORE (* Telnet vision *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=184 *)
    VAR 
        in_Offset_1 : INT;
        in_Offset_2 : INT;
        in_Y : INT;
        in_X : INT;
        in_Y1 : INT;
        in_X1 : INT;
        in_Y2 : INT;
        in_X2 : INT;
    END_VAR
    VAR_IN_OUT 
        XUS_TN_SCREEN : us_TN_SCREEN;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TN_SC_AREA_SAVE (* Telnet vision *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=185 *)
    VAR 
        in_Offset_1 : INT;
        in_Offset_2 : INT;
        in_Y : INT;
        in_X : INT;
    END_VAR
    VAR_INPUT 
        IIN_Y1 : INT;
        IIN_X1 : INT;
        IIN_Y2 : INT;
        IIN_X2 : INT;
    END_VAR
    VAR_IN_OUT 
        XUS_TN_SCREEN : us_TN_SCREEN;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TN_SC_BOX (* Telnet vision *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=186 *)
    VAR 
        FB_TN_SC_FILL : TN_SC_FILL;
        by_BorderChar_L_T : BYTE;
        by_BorderChar_T : BYTE;
        by_BorderChar_B : BYTE;
        by_BorderChar_R_T : BYTE;
        by_BorderChar_L : BYTE;
        by_BorderChar_R : BYTE;
        by_BorderChar_L_B : BYTE;
        by_BorderChar_R_B : BYTE;
        in_Y : INT;
        in_X : INT;
        in_Border_Offset : INT;
        in_Offset_1 : INT;
        in_Offset_2 : INT;
    END_VAR
    VAR_INPUT 
        IIN_Y1 : INT;
        IIN_X1 : INT;
        IIN_Y2 : INT;
        IIN_X2 : INT;
        IBY_FILL : BYTE;
        IBY_ATTR : BYTE;
        IIN_BORDER : INT;
    END_VAR
    VAR_IN_OUT 
        XUS_TN_SCREEN : us_TN_SCREEN;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TN_SC_FILL (* Telnet vision *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=187 *)
    VAR 
        in_X : INT;
        in_Y : INT;
        in_Offset : INT;
    END_VAR
    VAR_INPUT 
        IIN_Y1 : INT;
        IIN_X1 : INT;
        IIN_Y2 : INT;
        IIN_X2 : INT;
        IBY_CHAR : BYTE;
        IBY_ATTR : BYTE;
    END_VAR
    VAR_IN_OUT 
        XUS_TN_SCREEN : us_TN_SCREEN;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TN_SC_LINE (* Telnet vision *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=188 *)
    VAR 
        by_Connect_Left_Char : BYTE;
        by_Connect_Right_Char : BYTE;
        by_Connect_Top_Char : BYTE;
        by_Connect_Bottom_Char : BYTE;
        by_Connect_Cruz_Char : BYTE;
        by_Vertikal_Line_Char : BYTE;
        by_Horzontal_Line_Char : BYTE;
        by_old_Char : BYTE;
        in_Offset_1 : INT;
        in_ROW_Index : INT;
        in_COL_Index : INT;
        by_Char : BYTE;
    END_VAR
    VAR_INPUT 
        IIN_X1 : INT;
        IIN_Y1 : INT;
        IIN_X2 : INT;
        IIN_Y2 : INT;
        IBY_ATTR : BYTE;
        IBY_BORDER : BYTE;
    END_VAR
    VAR_IN_OUT 
        XUS_TN_SCREEN : us_TN_SCREEN;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TN_SC_READ_ATTR (* Telnet vision *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=190 *)
    VAR 
        in_Offset : INT;
    END_VAR
    VAR_INPUT 
        IIN_Y : INT;
        IIN_X : INT;
    END_VAR
    VAR_OUTPUT 
        OBY_ATTR : BYTE;
    END_VAR
    VAR_IN_OUT 
        XUS_TN_SCREEN : us_TN_SCREEN;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TN_SC_READ_CHAR (* Telnet vision *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=190 *)
    VAR 
        in_Offset : INT;
    END_VAR
    VAR_INPUT 
        IIN_Y : INT;
        IIN_X : INT;
    END_VAR
    VAR_OUTPUT 
        OBY_CHAR : BYTE;
    END_VAR
    VAR_IN_OUT 
        XUS_TN_SCREEN : us_TN_SCREEN;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION TN_SC_SHADOW_ATTR : BYTE (* Telnet vision *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=191 *)
    VAR_INPUT 
        IBY_ATTR : BYTE;
    END_VAR
END_FUNCTION
FUNCTION_BLOCK TN_SC_VIEWPORT (* Telnet vision *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=191 *)
    VAR 
        FB_TN_SC_WRITE : TN_SC_WRITE;
        FB_TON : TON;
        in_index : INT;
        in_Color : INT;
        by_Attr : BYTE;
        in_count : INT;
    END_VAR
    VAR_IN_OUT 
        XUS_LOG_VIEWPORT : us_LOG_VIEWPORT;
        XUS_LOG_CONTROL : LOG_CONTROL;
        XUS_TN_SCREEN : us_TN_SCREEN;
    END_VAR
    VAR_INPUT 
        IIN_X : INT;
        IIN_Y : INT;
        IIN_WIDTH : INT;
        IDW_ATTR_1 : DWORD;
        IDW_ATTR_2 : DWORD;
        ITI_TIME : TIME;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TN_SC_WRITE (* Telnet vision *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=192 *)
    VAR 
        bo_Color : BOOL;
        in_Offset : INT;
        in_Char_Index : INT;
        in_String_Length : INT;
    END_VAR
    VAR_INPUT 
        IIN_Y : INT;
        IIN_X : INT;
        IBY_ATTR : BYTE;
        IST_STRING : STRING[255];
    END_VAR
    VAR_IN_OUT 
        XUS_TN_SCREEN : us_TN_SCREEN;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TN_SC_WRITE_ATTR (* Telnet vision *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=193 *)
    VAR 
        in_Offset : INT;
    END_VAR
    VAR_INPUT 
        IIN_Y : INT;
        IIN_X : INT;
        IBY_ATTR : BYTE;
    END_VAR
    VAR_IN_OUT 
        XUS_TN_SCREEN : us_TN_SCREEN;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TN_SC_WRITE_C (* Telnet vision *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=193 *)
    VAR 
        FB_TN_SC_WRITE : TN_SC_WRITE;
    END_VAR
    VAR_INPUT 
        IIN_Y : INT;
        IIN_X : INT;
        IBY_ATTR : BYTE;
        IST_STRING : STRING[255];
        IIN_LENGTH : INT;
        IIN_OPTION : INT;
    END_VAR
    VAR_IN_OUT 
        XUS_TN_SCREEN : us_TN_SCREEN;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TN_SC_WRITE_CHAR (* Telnet vision *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=194 *)
    VAR 
        in_Offset : INT;
    END_VAR
    VAR_INPUT 
        IIN_Y : INT;
        IIN_X : INT;
        IBY_CHAR : BYTE;
    END_VAR
    VAR_IN_OUT 
        XUS_TN_SCREEN : us_TN_SCREEN;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TN_SC_WRITE_EOS (* Telnet vision *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=195 *)
    VAR 
        TN_SC_WRITE : TN_SC_WRITE;
    END_VAR
    VAR_INPUT 
        IBY_ATTR : BYTE;
        IST_STRING : STRING[255];
    END_VAR
    VAR_IN_OUT 
        XUS_TN_SCREEN : us_TN_SCREEN;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION TN_SC_XY2_ERROR : BOOL (* Telnet vision *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=196 *)
    VAR_INPUT 
        X1 : INT;
        Y1 : INT;
        X2 : INT;
        Y2 : INT;
    END_VAR
END_FUNCTION
FUNCTION TN_SC_XY_ERROR : BOOL (* Telnet vision *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=195 *)
    VAR_INPUT 
        X : INT;
        Y : INT;
    END_VAR
END_FUNCTION
FUNCTION_BLOCK TN_SEND_ROWS (* Telnet vision *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=183 *)
    VAR_IN_OUT 
        IP_C : IP_C;
        S_BUF : NETWORK_BUFFER;
        XUS_TN_SCREEN : us_TN_SCREEN;
    END_VAR
    VAR_INPUT 
        S_BUF_SIZE : INT;
    END_VAR
    VAR 
        in_Line_Count : INT; (*Zähler um max alle 24 Zeilen zu durchlaufen*)
        in_Col_Count : INT;
        in_Last_Row_Index : INT;
        bo_Break_Loop : BOOL;
        in_Row_Count : INT;
        in_Offset : INT;
        in_Write_Index : INT;
        in_Write_Index_Backup : INT;
        by_Cur_Color : BYTE;
        by_last_Color : BYTE;
        in_Write_Stop : INT;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK MOON_PHASE (* Weather *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=206 *)
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
FUNCTION_BLOCK WORLD_WEATHER (* Weather *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=211 *)
    VAR_IN_OUT 
        IP_C : IP_C; (* IP_Control Verwaltungsstruktur *)
        S_BUF : NETWORK_BUFFER;
        R_BUF : NETWORK_BUFFER;
        WW : WORLD_WEATHER_DATA;
    END_VAR
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
    VAR 
        URL_DATA : URL;
        DNS_CLIENT : DNS_CLIENT;
        HTTP_GET : HTTP_GET;
        CPB : CSV_PARSER_BUF;
        last_state : BOOL;
        value_int : INT;
        value_real : REAL;
        v_real : REAL;
        state : INT;
        URL_str : STRING[STRING_LENGTH];
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
FUNCTION_BLOCK WORLD_WEATHER_DESC_GE (* Weather *)(* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=210 *)
    VAR_IN_OUT 
        WW : WORLD_WEATHER_DATA;
    END_VAR
    VAR_INPUT 
        ACTIVATE : BOOL;
    END_VAR
    VAR 
        act_last : BOOL;
        x : INT;
        y : INT;
        str : STRING[60];
        i : INT;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK WORLD_WEATHER_ICON_OSCAT (* Weather *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=215 *)
    VAR_IN_OUT 
        WW : WORLD_WEATHER_DATA;
    END_VAR
    VAR_INPUT 
        ACTIVATE : BOOL;
    END_VAR
    VAR 
        dat : ARRAY[0..41] OF INT := [0, 14, 12, 9, 9, 0, 7, 7, 0, 2, 2, 3, 3, 1, 0, 0, 17, 4, 4, 3, 3, 1, 0, 0, 17, 2, 2, 3, 3, 1, 0, 0, 17, 2, 4, 3, 3, 1, 0, 0, 17, 0];
        act_last : BOOL;
        x : INT;
        i : INT;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK YAHOO_WEATHER (* Weather *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=207 *)
    VAR_IN_OUT 
        IP_C : IP_C; (* IP_Control Verwaltungsstruktur *)
        S_BUF : NETWORK_BUFFER;
        R_BUF : NETWORK_BUFFER;
        YW : YAHOO_WEATHER_DATA;
    END_VAR
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
    VAR 
        CTRL : XML_CONTROL;
        XML_READER : XML_READER;
        URL_DATA : URL;
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
FUNCTION_BLOCK YAHOO_WEATHER_DESC_GE (* Weather *)(* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=214 *)
    VAR_IN_OUT 
        YW : YAHOO_WEATHER_DATA;
    END_VAR
    VAR_INPUT 
        ACTIVATE : BOOL;
    END_VAR
    VAR 
        act_last : BOOL;
        x : INT;
        y : INT;
        str : STRING[40];
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK YAHOO_WEATHER_ICON_OSCAT (* Weather *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=211 *)
    VAR_IN_OUT 
        YW : YAHOO_WEATHER_DATA;
    END_VAR
    VAR_INPUT 
        ACTIVATE : BOOL;
    END_VAR
    VAR 
        dat : ARRAY[0..48] OF INT := [4, 2, 2, 4, 17, 1, 3, 1, 2, 2, 2, 2, 2, 3, 3, 3, 3, 5, 3, 6, 7, 14, 8, 9, 9, 10, 9, 11, 12, 11, 12, 13, 14, 15, 16, 4, 14, 4, 17, 2, 2, 3, 3, 3, 12, 2, 3, 4, 0];
        act_last : BOOL;
        x : INT;
        idx : INT;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK BASE64_DECODE_STR (* Convert *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=72 *)
    VAR_INPUT 
        RUN : BOOL;
    END_VAR
    VAR_OUTPUT 
        DONE : BOOL;
    END_VAR
    VAR_IN_OUT 
        STR1 : STRING[192];
        STR2 : STRING[144];
    END_VAR
    VAR 
        BASE64_DECODE_STREAM : BASE64_DECODE_STREAM;
        run_last : BOOL;
        buf1 : ARRAY[0..63] OF BYTE;
        buf2 : ARRAY[0..47] OF BYTE;
        mode : INT;
        size1 : INT;
        size2 : INT;
        end : INT;
        pos : INT;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK BASE64_DECODE_STREAM (* Convert *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=73 *)
    VAR_IN_OUT 
        BUF1 : ARRAY[0..63] OF BYTE;
        BUF2 : ARRAY[0..47] OF BYTE;
    END_VAR
    VAR_INPUT 
        SIZE1 : INT;
    END_VAR
    VAR_OUTPUT 
        SIZE2 : INT;
    END_VAR
    VAR 
        a : INT;
        b : WORD;
        o : INT;
        off : INT;
        i1 : INT;
        i2 : INT;
        c : INT;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK BASE64_ENCODE_STR (* Convert *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=74 *)
    VAR_INPUT 
        RUN : BOOL;
    END_VAR
    VAR_OUTPUT 
        DONE : BOOL;
    END_VAR
    VAR_IN_OUT 
        STR1 : STRING[144];
        STR2 : STRING[192];
    END_VAR
    VAR 
        BASE64_ENCODE_STREAM : BASE64_ENCODE_STREAM;
        run_last : BOOL;
        buf1 : ARRAY[0..47] OF BYTE;
        buf2 : ARRAY[0..63] OF BYTE;
        mode : INT;
        size1 : INT;
        size2 : INT;
        end : INT;
        pos : INT;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK BASE64_ENCODE_STREAM (* Convert *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=74 *)
    VAR_IN_OUT 
        BUF1 : ARRAY[0..47] OF BYTE;
        BUF2 : ARRAY[0..63] OF BYTE;
    END_VAR
    VAR_INPUT 
        SIZE1 : INT;
    END_VAR
    VAR_OUTPUT 
        SIZE2 : INT;
    END_VAR
    VAR 
        a : INT;
        b : WORD;
        i : INT;
        i2 : INT;
        i3 : INT;
        c : INT;
        BASE64 : STRING[64] := 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';
    END_VAR
END_FUNCTION_BLOCK
FUNCTION HTML_DECODE : BOOL (* Convert *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=75 *)
    VAR_INPUT 
        IN : STRING[STRING_LENGTH];
    END_VAR
    VAR 
        pos : INT;
        end : INT;
        tmp : STRING[10];
        code : STRING[1];
    END_VAR
    VAR_IN_OUT 
        RETVAL : STRING[STRING_LENGTH]; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION HTML_ENCODE : BOOL (* Convert *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=76 *)
    VAR_INPUT 
        IN : STRING[STRING_LENGTH];
        M : BOOL;
    END_VAR
    VAR 
        pt_in : REFERENCE TO ARRAY[1..255] OF BYTE;
        pt_out : REFERENCE TO ARRAY[1..256] OF BYTE;
        pos_in : INT;
        pos_out : INT;
        stop : INT;
        B : BYTE;
        tmp : STRING[10];
        i : INT;
    END_VAR
    VAR_IN_OUT 
        RETVAL : STRING[STRING_LENGTH]; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION IP4_CHECK : BOOL (* Convert *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=77 *)
    VAR_INPUT 
        NIP : DWORD;
        LIP : DWORD;
        SM : DWORD;
    END_VAR
END_FUNCTION
FUNCTION IP4_DECODE : DWORD (* Convert *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=77 *)
    VAR_INPUT 
        STR : STRING[15];
    END_VAR
    VAR 
        pos : INT;
    END_VAR
END_FUNCTION
FUNCTION IP4_TO_STRING : BOOL (* Convert *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=78 *)
    VAR_INPUT 
        IP4 : DWORD;
    END_VAR
    VAR 
        tmp : STRING[3];
    END_VAR
    VAR_IN_OUT 
        RETVAL : STRING[15]; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION IS_IP4 : BOOL (* Convert *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=78 *)
    VAR_INPUT 
        STR : STRING[255];
    END_VAR
END_FUNCTION
FUNCTION IS_URLCHR : BOOL (* Convert *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=79 *)
    VAR_INPUT 
        IN : BYTE;
    END_VAR
END_FUNCTION
FUNCTION MD5_AUX : DWORD (* Convert *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=79 *)
    VAR_INPUT 
        N : INT;
        A : DWORD;
        B : DWORD;
        C : DWORD;
        D : DWORD;
        X : DWORD;
        U : INT;
        T : DWORD;
    END_VAR
    VAR 
        w : DWORD;
    END_VAR
END_FUNCTION
FUNCTION_BLOCK MD5_CRAM_AUTH (* Convert *)(* http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=78 *)
    VAR_IN_OUT 
        RUN : BOOL;
        USERNAME : STRING[64];
        PASSWORD : STRING[64];
        B64_TS : STRING[64]; (* Base64 coded ServerTimeStamp *)
        AUTH_KEY : STRING[192];
    END_VAR
    VAR 
        BASE64_DECODE_STR : BASE64_DECODE_STR;
        BASE64_ENCODE_STR : BASE64_ENCODE_STR;
        MD5_STREAM : MD5_STREAM;
        step : INT;
        md5_mode : INT;
        buf : ARRAY[0..63] OF BYTE;
        md5 : ARRAY[0..15] OF BYTE;
        md5_first : ARRAY[0..15] OF BYTE;
        md5_str1 : STRING[64];
        md5_str2 : STRING[64];
        size : UDINT;
        n1 : INT;
        n2 : INT;
        pos : UDINT;
        b64d_run : BOOL;
        b64d_done : BOOL;
        b64e_run : BOOL;
        b64e_done : BOOL;
        str_192 : STRING[192];
        str_144 : STRING[144];
        xpad : BYTE;
        pt : REFERENCE TO BYTE;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK MD5_STR (* Convert *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=80 *)
    VAR_INPUT 
        RUN : BOOL;
    END_VAR
    VAR_OUTPUT 
        DONE : BOOL;
    END_VAR
    VAR_IN_OUT 
        STR : STRING[STRING_LENGTH];
        MD5 : ARRAY[0..15] OF BYTE;
    END_VAR
    VAR 
        run_last : BOOL;
        MD5_STREAM : MD5_STREAM;
        buf : ARRAY[0..63] OF BYTE;
        mode : INT;
        size : UDINT;
        pos : UDINT;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK MD5_STREAM (* Convert *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=80 *)
    VAR_IN_OUT 
        MODE : INT;
        BUF : ARRAY[0..63] OF BYTE;
        MD5 : ARRAY[0..15] OF BYTE;
        SIZE : UDINT;
    END_VAR
    VAR_OUTPUT 
        POS : UDINT;
    END_VAR
    VAR 
        hash : ARRAY[0..3] OF DWORD;
        a : DWORD;
        b : DWORD;
        c : DWORD;
        d : DWORD;
        end : UDINT;
        block : UDINT;
        x : ARRAY[0..15] OF DWORD;
        n : INT;
        n1 : INT;
        z : INT;
        pad_1 : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION MD5_TO_STRH : BOOL (* Convert *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=82 *)
    VAR_INPUT 
        MD5 : ARRAY[0..15] OF BYTE;
    END_VAR
    VAR 
        i : INT;
        tmp : BYTE;
        pt : REFERENCE TO BYTE;
    END_VAR
    VAR_IN_OUT 
        RETVAL : STRING[32]; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION_BLOCK RC4_CRYPT_STREAM (* Convert *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=82 *)
    VAR_IN_OUT 
        MODE : INT;
        KEY : STRING[40];
        BUF : ARRAY[0..63] OF BYTE;
        SIZE : UDINT;
    END_VAR
    VAR_OUTPUT 
        POS : UDINT;
    END_VAR
    VAR 
        sbox : ARRAY[0..255] OF BYTE;
        skey : ARRAY[0..255] OF BYTE;
        a : INT;
        b : INT;
        c : INT;
        d : USINT;
        e : USINT;
        end : UDINT;
        v : BYTE;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK SHA1_STR (* Convert *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=83 *)
    VAR_INPUT 
        RUN : BOOL;
    END_VAR
    VAR_OUTPUT 
        DONE : BOOL;
    END_VAR
    VAR_IN_OUT 
        STR : STRING[STRING_LENGTH];
        SHA1 : ARRAY[0..19] OF BYTE;
    END_VAR
    VAR 
        run_last : BOOL;
        SHA1_STREAM : SHA1_STREAM;
        buf : ARRAY[0..63] OF BYTE;
        mode : INT;
        size : UDINT;
        pos : UDINT;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK SHA1_STREAM (* Convert *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=84 *)
    VAR_IN_OUT 
        MODE : INT;
        BUF : ARRAY[0..63] OF BYTE;
        SHA1 : ARRAY[0..19] OF BYTE;
        SIZE : UDINT;
    END_VAR
    VAR_OUTPUT 
        POS : UDINT;
    END_VAR
    VAR 
        hash : ARRAY[0..4] OF DWORD;
        end : UDINT;
        block : UDINT;
        pad_1 : BOOL;
        w : ARRAY[0..79] OF DWORD;
        n : INT;
        n1 : INT;
        a : DWORD;
        b : DWORD;
        c : DWORD;
        d : DWORD;
        e : DWORD;
        f : DWORD;
        k : DWORD;
        x : DWORD;
        z : INT;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION SHA1_TO_STRH : BOOL (* Convert *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=85 *)
    VAR_INPUT 
        SHA1 : ARRAY[0..19] OF BYTE;
    END_VAR
    VAR 
        i : INT;
        tmp : BYTE;
        pt : REFERENCE TO BYTE;
    END_VAR
    VAR_IN_OUT 
        RETVAL : STRING[40]; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION STRING_TO_URL : BOOL (* Convert *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=86 *)
    VAR_INPUT 
        STR : STRING[STRING_LENGTH];
        DEFAULT_PROTOCOL : STRING[10];
        DEFAULT_PATH : STRING[80];
    END_VAR
    VAR 
        pos : INT;
        pos2 : INT;
        x : STRING[STRING_LENGTH];
    END_VAR
    VAR_IN_OUT 
        RETVAL : URL; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION URL_DECODE : BOOL (* Convert *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=87 *)
    VAR_INPUT 
        IN : STRING[STRING_LENGTH];
    END_VAR
    VAR 
        pos : INT;
        seq : STRING[3];
        new : STRING[1];
    END_VAR
    VAR_IN_OUT 
        RETVAL : STRING[STRING_LENGTH]; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION URL_ENCODE : BOOL (* Convert *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=87 *)
    VAR_INPUT 
        IN : STRING[STRING_LENGTH];
    END_VAR
    VAR 
        pt_in : REFERENCE TO ARRAY[1..255] OF BYTE;
        pt_out : REFERENCE TO ARRAY[1..256] OF BYTE;
        pos_in : INT;
        pos_out : INT;
        stop : INT;
        tb : BYTE;
    END_VAR
    VAR_IN_OUT 
        RETVAL : STRING[STRING_LENGTH]; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION URL_TO_STRING : BOOL (* Convert *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=87 *)
    VAR_INPUT 
        IN : URL;
    END_VAR
    VAR_IN_OUT 
        RETVAL : STRING[STRING_LENGTH]; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION_BLOCK IRTRANS_DECODE (* Driver *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=36 *)
    VAR_IN_OUT 
        IP_C : IP_C; (* IP_Control Verwaltungsstruktur *)
        R_BUF : NETWORK_BUFFER_SHORT;
    END_VAR
    VAR_OUTPUT 
        CMD : BOOL;
        DEV : STRING[255];
        KEY : STRING[255];
        ERROR : BOOL;
    END_VAR
    VAR 
        i : INT;
        stop : INT;
        pt : REFERENCE TO BYTE;
        buffer : REFERENCE TO ARRAY[0..32000] OF BYTE;
        size : UINT;
        z : BYTE;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK IRTRANS_RCV_1 (* Driver *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=37 *)
    VAR_INPUT 
        DEV_CODE : STRING[255];
        KEY_CODE : STRING[255];
        CMD : BOOL;
    END_VAR
    VAR_IN_OUT 
        DEV : STRING[255];
        KEY : STRING[255];
    END_VAR
    VAR_OUTPUT 
        Q : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK IRTRANS_RCV_4 (* Driver *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=39 *)
    VAR_INPUT 
        DEV_CODE : STRING[255];
        KEY_CODE_0 : STRING[255];
        KEY_CODE_1 : STRING[255];
        KEY_CODE_2 : STRING[255];
        KEY_CODE_3 : STRING[255];
        CMD : BOOL;
    END_VAR
    VAR_IN_OUT 
        DEV : STRING[255];
        KEY : STRING[255];
    END_VAR
    VAR_OUTPUT 
        Q0 : BOOL;
        Q1 : BOOL;
        Q2 : BOOL;
        Q3 : BOOL;
    END_VAR
    VAR 
        decode : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK IRTRANS_RCV_8 (* Driver *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=39 *)
    VAR_INPUT 
        DEV_CODE : STRING[255];
        KEY_CODE_0 : STRING[255];
        KEY_CODE_1 : STRING[255];
        KEY_CODE_2 : STRING[255];
        KEY_CODE_3 : STRING[255];
        KEY_CODE_4 : STRING[255];
        KEY_CODE_5 : STRING[255];
        KEY_CODE_6 : STRING[255];
        KEY_CODE_7 : STRING[255];
        CMD : BOOL;
    END_VAR
    VAR_IN_OUT 
        DEV : STRING[255];
        KEY : STRING[255];
    END_VAR
    VAR_OUTPUT 
        Q0 : BOOL;
        Q1 : BOOL;
        Q2 : BOOL;
        Q3 : BOOL;
        Q4 : BOOL;
        Q5 : BOOL;
        Q6 : BOOL;
        Q7 : BOOL;
    END_VAR
    VAR 
        decode : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK IRTRANS_SERVER (* Driver *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=40 *)
    VAR_IN_OUT 
        IP_C : IP_C; (* IP_Control Verwaltungsstruktur *)
        S_BUF : NETWORK_BUFFER_SHORT;
        R_BUF : NETWORK_BUFFER_SHORT;
    END_VAR
    VAR_INPUT 
        UDP_TCP : BOOL;
    END_VAR
    VAR_OUTPUT 
        S_ENABLE : BOOL;
        R_ENABLE : BOOL;
        ERROR : DWORD;
    END_VAR
    VAR 
        t : TON;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK IRTRANS_SND_1 (* Driver *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=42 *)
    VAR_INPUT 
        DEV_CODE : STRING[255];
        KEY_CODE : STRING[255];
        IN : BOOL;
        T_REPEAT : TIME;
    END_VAR
    VAR_IN_OUT 
        IP_C : IP_C; (* IP_Control Verwaltungsstruktur *)
        S_BUF : NETWORK_BUFFER_SHORT;
    END_VAR
    VAR_OUTPUT 
        KEY : BYTE;
    END_VAR
    VAR 
        skey : STRING[255];
        size : INT;
        str : STRING[255];
        t : TON;
        k : BYTE;
        lk : BYTE;
        d : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK IRTRANS_SND_4 (* Driver *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=43 *)
    VAR_INPUT 
        DEV_CODE : STRING[255];
        KEY_CODE_0 : STRING[255];
        KEY_CODE_1 : STRING[255];
        KEY_CODE_2 : STRING[255];
        KEY_CODE_3 : STRING[255];
        IN_0 : BOOL;
        IN_1 : BOOL;
        IN_2 : BOOL;
        IN_3 : BOOL;
        T_REPEAT : TIME;
    END_VAR
    VAR_IN_OUT 
        IP_C : IP_C; (* IP_Control Verwaltungsstruktur *)
        S_BUF : NETWORK_BUFFER_SHORT;
    END_VAR
    VAR_OUTPUT 
        KEY : BYTE;
    END_VAR
    VAR 
        skey : STRING[255];
        size : INT;
        str : STRING[255];
        t : TON;
        k : BYTE;
        lk : BYTE;
        d : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK IRTRANS_SND_8 (* Driver *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=44 *)
    VAR_INPUT 
        DEV_CODE : STRING[255];
        KEY_CODE_0 : STRING[255];
        KEY_CODE_1 : STRING[255];
        KEY_CODE_2 : STRING[255];
        KEY_CODE_3 : STRING[255];
        KEY_CODE_4 : STRING[255];
        KEY_CODE_5 : STRING[255];
        KEY_CODE_6 : STRING[255];
        KEY_CODE_7 : STRING[255];
        IN_0 : BOOL;
        IN_1 : BOOL;
        IN_2 : BOOL;
        IN_3 : BOOL;
        IN_4 : BOOL;
        IN_5 : BOOL;
        IN_6 : BOOL;
        IN_7 : BOOL;
        T_REPEAT : TIME;
    END_VAR
    VAR_IN_OUT 
        IP_C : IP_C; (* IP_Control Verwaltungsstruktur *)
        S_BUF : NETWORK_BUFFER_SHORT;
    END_VAR
    VAR_OUTPUT 
        KEY : BYTE;
    END_VAR
    VAR 
        skey : STRING[255];
        size : INT;
        str : STRING[255];
        t : TON;
        k : BYTE;
        lk : BYTE;
        d : BOOL;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION ELEMENT_COUNT : INT (* Other *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=34 *)
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
FUNCTION ELEMENT_GET : BOOL (* Other *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=34 *)
    VAR_INPUT 
        SEP : BYTE;
        POS : INT;
    END_VAR
    VAR_IN_OUT 
        ELEMENT : STRING[ELEMENT_LENGTH];
    END_VAR
    VAR 
        i : INT := 1;
        o : INT := 1;
        pt : REFERENCE TO ARRAY[1..ELEMENT_LENGTH] OF BYTE;
        po : REFERENCE TO ARRAY[1..ELEMENT_LENGTH] OF BYTE;
        cnt : INT;
        c : BYTE;
    END_VAR
    VAR_IN_OUT 
        RETVAL : STRING[ELEMENT_LENGTH]; (*Return value of the function*)
    END_VAR
END_FUNCTION
FUNCTION_BLOCK IP_FIFO (* Other *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=108 *)
    VAR_IN_OUT 
        FIFO : IP_FIFO_DATA;
        ID : BYTE;
        STATE : BYTE;
    END_VAR
    VAR 
        tmp : INT;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK LOG_MSG (* Other *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=111 *)
    VAR 
        FB_PRINT_SF : PRINT_SF;
        idX : INT;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK LOG_VIEWPORT (* Other *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=111 *)
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
FUNCTION NETWORK_VERSION : DWORD (* Other *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=35 *)
    VAR_INPUT 
        IN : BOOL;
    END_VAR
END_FUNCTION
FUNCTION_BLOCK PRINT_SF (* Other *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=121 *)
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
FUNCTION_BLOCK UNI_CIRCULAR_BUFFER (* Other *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=69 *)
    VAR_IN_OUT 
        DATA : UNI_CIRCULAR_BUFFER_DATA;
    END_VAR
    VAR 
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
    VAR 
        cnt : UINT;
        mode_last : INT;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK XML_READER (* Other *)(* http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=140 *)
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
