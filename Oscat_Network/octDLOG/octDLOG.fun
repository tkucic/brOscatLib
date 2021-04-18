FUNCTION_BLOCK DLOG_BOOL
    VAR_INPUT
        STATE : BOOL; (**)
        OFF : STRING[255]; (**)
        ON : STRING[255]; (**)
        COLUMN : STRING[40]; (**)
        DELTA : BOOL; (**)
    END_VAR
    VAR_IN_OUT
        X : DLOG_DATA; (**)
    END_VAR
    VAR
        UCB : UNI_CIRCULAR_BUFFER; (**)
        id : WORD; (**)
        last_delta : BOOL; (**)
        state_last : BOOL; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK DLOG_CRON_TAB
    VAR_INPUT
        ACTIVATE : BOOL; (**)
        DTI : DT; (**)
        SECOND : STRING[20]; (**)
        MINUTE : STRING[20]; (**)
        HOUR : STRING[20]; (**)
        DAY_OF_MONTH : STRING[20]; (**)
        DAY_OF_WEEK : STRING[20]; (**)
        MONTH : STRING[20]; (**)
    END_VAR
    VAR_OUTPUT
        Q : BOOL; (**)
    END_VAR
    VAR
        CD : DLOG_CRON_DATA; (**)
        activate_old : BOOL; (**)
        datei : DATE; (**)
        dti_last : DT; (**)
        cnt1 : INT; (**)
        cnt2 : INT; (**)
        idx1 : INT; (**)
        idx2 : INT; (**)
        idx3 : INT; (**)
        idx4 : INT; (**)
        pos1 : INT; (**)
        pos2 : INT; (**)
        char_cnt : INT; (**)
        trig_day : BOOL; (**)
        trig_weekday : BOOL; (**)
        str1 : STRING[OSCAT_BASIC.STRING_LENGTH]; (**)
        str2 : STRING[OSCAT_BASIC.STRING_LENGTH]; (**)
        str3 : STRING[OSCAT_BASIC.STRING_LENGTH]; (**)
        num_str1 : STRING[10]; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK DLOG_DINT
    VAR_INPUT
        VALUE : DINT; (**)
        COLUMN : STRING[40]; (**)
        DELTA : DINT; (**)
    END_VAR
    VAR_IN_OUT
        X : DLOG_DATA; (**)
    END_VAR
    VAR
        UCB : UNI_CIRCULAR_BUFFER; (**)
        id : WORD; (**)
        delta_last : DINT; (**)
        value_last : DINT; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK DLOG_DT
    VAR_INPUT
        FMT : STRING[255] := '#A-#D-#H #N:#R:#T'; (**)
        COLUMN : STRING[40]; (**)
        DELTA : UDINT; (**)
    END_VAR
    VAR_IN_OUT
        X : DLOG_DATA; (**)
    END_VAR
    VAR
        UCB : UNI_CIRCULAR_BUFFER; (**)
        id : WORD; (**)
        delta_last : DT; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK DLOG_FILE_TO_FTP
    VAR_INPUT
        FTP_URL : STRING[OSCAT_BASIC.STRING_LENGTH]; (**)
        FTP_ACTIV : BOOL; (**)
        FILE_DELETE : BOOL; (**)
        TIMEOUT : TIME := TIME#30s0ms; (**)
        RETRY : INT; (**)
        RETRY_TIME : TIME := TIME#30s0ms; (**)
        DNS_IP4 : DWORD; (**)
        PLC_IP4 : DWORD; (**)
    END_VAR
    VAR_OUTPUT
        DONE : BOOL; (**)
        BUSY : BOOL; (**)
        ERROR_C : DWORD; (**)
        ERROR_T : BYTE; (**)
    END_VAR
    VAR_IN_OUT
        X : DLOG_DATA; (**)
    END_VAR
    VAR
        UCBD : UNI_CIRCULAR_BUFFER_DATA; (**)
        UCB : UNI_CIRCULAR_BUFFER; (**)
        FTP_CLIENT : FTP_CLIENT; (**)
        WT_1 : TON; (**)
        ftrig_old : BOOL; (**)
        filename : STRING[255]; (**)
        step : INT; (**)
        ftp_busy : BOOL; (**)
        ftp_done : BOOL; (**)
        cnt : INT; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK DLOG_FILE_TO_SMTP
    VAR_INPUT
        FILE_DELETE : BOOL; (**)
        TIMEOUT : TIME := TIME#30s0ms; (**)
        DTI : DT; (**)
        DTI_OFFSET : INT; (**)
        RETRY : INT; (**)
        RETRY_TIME : TIME := TIME#30s0ms; (**)
        DNS_IP4 : DWORD; (**)
    END_VAR
    VAR_OUTPUT
        DONE : BOOL; (**)
        BUSY : BOOL; (**)
        ERROR_C : DWORD; (**)
        ERROR_T : BYTE; (**)
    END_VAR
    VAR_IN_OUT
        SERVER : STRING[255]; (**)
        MAILFROM : STRING[255]; (**)
        MAILTO : STRING[OSCAT_BASIC.STRING_LENGTH]; (**)
        SUBJECT : STRING[255]; (**)
        BODY : STRING[OSCAT_BASIC.STRING_LENGTH]; (**)
        X : DLOG_DATA; (**)
    END_VAR
    VAR
        UCBD : UNI_CIRCULAR_BUFFER_DATA; (**)
        UCB : UNI_CIRCULAR_BUFFER; (**)
        SMTP_CLIENT : SMTP_CLIENT; (**)
        WT_1 : TON; (**)
        ftrig_old : BOOL; (**)
        files : STRING[OSCAT_BASIC.STRING_LENGTH]; (**)
        step : INT; (**)
        smtp_busy : BOOL; (**)
        smtp_done : BOOL; (**)
        cnt : INT; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK DLOG_REAL
    VAR_INPUT
        VALUE : REAL; (**)
        N : INT; (**)
        D : STRING[1] := ','; (**)
        COLUMN : STRING[40]; (**)
        DELTA : REAL; (**)
    END_VAR
    VAR_IN_OUT
        X : DLOG_DATA; (**)
    END_VAR
    VAR
        UCB : UNI_CIRCULAR_BUFFER; (**)
        id : WORD; (**)
        delta_last : REAL; (**)
        value_last : REAL; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK DLOG_REAL_ARRAY
    VAR_INPUT
        N : INT; (**)
        D : STRING[1]; (**)
        R_COUNT : INT; (**)
    END_VAR
    VAR_IN_OUT
        R_ARRAY : DLOG_REAL_ARRAY_DATA; (**)
        X : DLOG_DATA; (**)
    END_VAR
    VAR
        UCB : UNI_CIRCULAR_BUFFER; (**)
        id : WORD; (**)
        idx : INT; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK DLOG_STORE_FILE_CSV
    VAR_INPUT
        ENABLE : BOOL; (**)
        TRIG_M : BOOL; (**)
        TRIG_T : TIME; (**)
        FILENAME : STRING[255]; (**)
        DTI : DT; (**)
        SEP : BYTE; (**)
        AUTO_CLOSE : TIME := TIME#15s0ms; (**)
    END_VAR
    VAR_OUTPUT
        ERROR_C : DWORD; (**)
        ERROR_T : BYTE; (**)
    END_VAR
    VAR_IN_OUT
        X : DLOG_DATA; (**)
        SAVE_DATA : DLOG_SAVE; (**)
    END_VAR
    VAR
        FS : FILE_SERVER; (**)
        FSD : FILE_SERVER_DATA; (**)
        PT : NETWORK_BUFFER; (**)
        UCB : UNI_CIRCULAR_BUFFER; (**)
        trig_auto : BOOL; (**)
        trig_stored : BOOL; (**)
        trig_tmp : BOOL; (**)
        trig_m_last : BOOL; (**)
        dti_last : DT := DATE_AND_TIME#2070-2-6-6:28:15; (**)
        fn_last : STRING[255]; (**)
        fn : STRING[255]; (**)
        step_1 : INT; (**)
        step_2 : INT; (**)
        idx : INT; (**)
        log_stop : BOOL; (**)
        n : USINT; (**)
        wd_ton : TON; (**)
        wd_time : TIME; (**)
        aw_ton : TON; (**)
        aw_enable : BOOL; (**)
        aw_aktiv : BOOL; (**)
        total_bytes : UDINT; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK DLOG_STORE_FILE_HTML
    VAR_INPUT
        ENABLE : BOOL; (**)
        TRIG_M : BOOL; (**)
        TRIG_T : TIME; (**)
        FILENAME : STRING[255]; (**)
        DTI : DT; (**)
        AUTO_CLOSE : TIME := TIME#15s0ms; (**)
        HTML_CAPTION : STRING[255]; (**)
        HTML_TABLE : STRING[255]; (**)
        HTML_TR_HEAD : STRING[255]; (**)
        HTML_TR_EVEN : STRING[255]; (**)
        HTML_TR_ODD : STRING[255]; (**)
    END_VAR
    VAR_OUTPUT
        ERROR_C : DWORD; (**)
        ERROR_T : BYTE; (**)
    END_VAR
    VAR_IN_OUT
        X : DLOG_DATA; (**)
        SAVE_DATA : DLOG_SAVE; (**)
    END_VAR
    VAR
        FS : FILE_SERVER; (**)
        FSD : FILE_SERVER_DATA; (**)
        PT : NETWORK_BUFFER; (**)
        UCB : UNI_CIRCULAR_BUFFER; (**)
        trig_auto : BOOL; (**)
        trig_stored : BOOL; (**)
        trig_tmp : BOOL; (**)
        trig_m_last : BOOL; (**)
        dti_last : DT := DATE_AND_TIME#2070-2-6-6:28:15; (**)
        fn_last : STRING[255]; (**)
        str : STRING[OSCAT_BASIC.STRING_LENGTH]; (**)
        fn : STRING[255]; (**)
        step_1 : INT; (**)
        step_2 : INT; (**)
        idx : INT; (**)
        log_state : USINT; (**)
        log_stop : BOOL; (**)
        n : INT; (**)
        wd_ton : TON; (**)
        wd_time : TIME; (**)
        aw_ton : TON; (**)
        aw_enable : BOOL; (**)
        aw_aktiv : BOOL; (**)
        total_bytes : UDINT; (**)
        cur_ode : BYTE; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK DLOG_STORE_FILE_XML
    VAR_INPUT
        ENABLE : BOOL; (**)
        TRIG_M : BOOL; (**)
        TRIG_T : TIME; (**)
        FILENAME : STRING[255]; (**)
        DTI : DT; (**)
        AUTO_CLOSE : TIME := TIME#15s0ms; (**)
    END_VAR
    VAR_OUTPUT
        ERROR_C : DWORD; (**)
        ERROR_T : BYTE; (**)
    END_VAR
    VAR_IN_OUT
        X : DLOG_DATA; (**)
        SAVE_DATA : DLOG_SAVE; (**)
    END_VAR
    VAR
        FS : FILE_SERVER; (**)
        FSD : FILE_SERVER_DATA; (**)
        PT : NETWORK_BUFFER; (**)
        UCB : UNI_CIRCULAR_BUFFER; (**)
        trig_auto : BOOL; (**)
        trig_stored : BOOL; (**)
        trig_tmp : BOOL; (**)
        trig_m_last : BOOL; (**)
        dti_last : DT := DATE_AND_TIME#2070-2-6-6:28:15; (**)
        fn_last : STRING[255]; (**)
        fn : STRING[255]; (**)
        str : STRING[OSCAT_BASIC.STRING_LENGTH]; (**)
        step_1 : INT; (**)
        step_2 : INT; (**)
        idx : INT; (**)
        log_state : USINT; (**)
        log_stop : BOOL; (**)
        n : INT; (**)
        wd_ton : TON; (**)
        wd_time : TIME; (**)
        aw_ton : TON; (**)
        aw_enable : BOOL; (**)
        aw_aktiv : BOOL; (**)
        total_bytes : UDINT; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK DLOG_STORE_MYSQL
    VAR_INPUT
        ENABLE : BOOL; (**)
        TRIG_M : BOOL; (**)
        TRIG_T : TIME; (**)
        DTI : DT; (**)
        URL : STRING[OSCAT_BASIC.STRING_LENGTH]; (**)
        DB_NAME : STRING[64]; (**)
        TB_NAME : STRING[64]; (**)
        AUTO_DELETE : UDINT; (**)
        TIMEOUT : TIME; (**)
        DNS_IP4 : DWORD; (**)
    END_VAR
    VAR_OUTPUT
        ERROR_C : DWORD; (**)
        ERROR_T : BYTE; (**)
    END_VAR
    VAR_IN_OUT
        SQL_INFO : MYSQL_INFO; (**)
        X : DLOG_DATA; (**)
    END_VAR
    VAR
        UCB : UNI_CIRCULAR_BUFFER; (**)
        MYSQL_CONTROL : MYSQL_CONTROL; (**)
        trig_auto : BOOL; (**)
        trig_tmp : BOOL; (**)
        trig_m_last : BOOL; (**)
        dti_last : DT := DATE_AND_TIME#2070-2-6-6:28:15; (**)
        enable_last : BOOL; (**)
        step : INT; (**)
        idx : INT; (**)
        n : USINT; (**)
        snd_text : STRING[OSCAT_BASIC.STRING_LENGTH]; (**)
        snd_size : INT; (**)
        sql_command : BYTE; (**)
        next_step : INT; (**)
        i1 : INT; (**)
        i2 : INT; (**)
        y : MYSQL_COM; (**)
        del_dt : UDINT; (**)
        del_start : BOOL; (**)
        run : BOOL; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK DLOG_STORE_RRD
    VAR_INPUT
        ENABLE : BOOL; (**)
        TRIG_M : BOOL; (**)
        TRIG_T : TIME; (**)
        URL : STRING[OSCAT_BASIC.STRING_LENGTH]; (**)
        DTI : DT; (**)
        SEP : BYTE; (**)
        DNS_IP4 : DWORD; (**)
        TIMEOUT : TIME; (**)
    END_VAR
    VAR_OUTPUT
        ERROR_C : DWORD; (**)
        ERROR_T : BYTE; (**)
    END_VAR
    VAR_IN_OUT
        X : DLOG_DATA; (**)
    END_VAR
    VAR
        UCB : UNI_CIRCULAR_BUFFER; (**)
        IP_C : IP_C; (* IP_Control Verwaltungsstruktur *)
        S_BUF : NETWORK_BUFFER; (**)
        R_BUF : NETWORK_BUFFER; (**)
        URL_DATA : url; (**)
        DNS_CLIENT : DNS_CLIENT; (**)
        HTTP_GET : HTTP_GET; (**)
        IPC : IP_CONTROL; (**)
        trig_auto : BOOL; (**)
        trig_stored : BOOL; (**)
        trig_tmp : BOOL; (**)
        trig_m_last : BOOL; (**)
        dti_last : DT := DATE_AND_TIME#2070-2-6-6:28:15; (**)
        step_1 : INT; (**)
        step_2 : INT; (**)
        sep_char : STRING[1]; (**)
        url_query : STRING[OSCAT_BASIC.STRING_LENGTH]; (**)
        n : INT; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK DLOG_STRING
    VAR_INPUT
        STR : STRING[255]; (**)
        COLUMN : STRING[40]; (**)
    END_VAR
    VAR_IN_OUT
        X : DLOG_DATA; (**)
    END_VAR
    VAR
        UCB : UNI_CIRCULAR_BUFFER; (**)
        id : WORD; (**)
        str_last : STRING[255]; (**)
    END_VAR
END_FUNCTION_BLOCK
