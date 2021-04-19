FUNCTION_BLOCK DNS_CLIENT
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
    VAR_IN_OUT
        IP_C : IP_C; (* IP_Control Verwaltungsstruktur *)
        S_BUF : NETWORK_BUFFER;
        R_BUF : NETWORK_BUFFER;
    END_VAR
    VAR
        IP_FIFO : IP_FIFO;
        ip_state : BYTE;
        ip_id : BYTE;
        i : INT;
        state : INT;
        domain_copy : STRING[255];
        activate_last : BOOL;
        url_length : INT;
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
FUNCTION_BLOCK DNS_DYN
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
    VAR_IN_OUT
        IP_C : IP_C; (* IP_Control Verwaltungsstruktur *)
        S_BUF : NETWORK_BUFFER;
        R_BUF : NETWORK_BUFFER;
    END_VAR
    VAR
        DNS_CLIENT : DNS_CLIENT;
        HTTP_GET : HTTP_GET;
        BASE64_ENCODE_STR : BASE64_ENCODE_STR;
        URL_DATA : url;
        update_last : BOOL;
        state : INT;
        base64_done : BOOL;
        s1 : STRING[144];
        s2 : STRING[192];
        w : TON;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK DNS_REV_CLIENT
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
    VAR_IN_OUT
        IP_C : IP_C; (* IP_Control Verwaltungsstruktur *)
        S_BUF : NETWORK_BUFFER;
        R_BUF : NETWORK_BUFFER;
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
FUNCTION_BLOCK FTP_CLIENT
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
        URL_DATA : url;
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
FUNCTION_BLOCK GET_WAN_IP
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
    VAR_IN_OUT
        IP_C : IP_C; (* IP_Control Verwaltungsstruktur *)
        S_BUF : NETWORK_BUFFER;
        R_BUF : NETWORK_BUFFER;
    END_VAR
    VAR
        URL_DATA : url;
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
FUNCTION_BLOCK HTTP_GET
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
    VAR_IN_OUT
        URL_DATA : url;
        IP_C : IP_C; (* IP_Control Verwaltungsstruktur *)
        S_BUF : NETWORK_BUFFER;
        R_BUF : NETWORK_BUFFER;
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
FUNCTION_BLOCK IP2GEO
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
    VAR_IN_OUT
        IP_C : IP_C; (* IP_Control Verwaltungsstruktur *)
        S_BUF : NETWORK_BUFFER;
        R_BUF : NETWORK_BUFFER;
        GEO : IP2GEO_DATA;
    END_VAR
    VAR
        CTRL : XML_CONTROL;
        XML_READER : XML_READER;
        URL_DATA : url;
        DNS_CLIENT : DNS_CLIENT;
        HTTP_GET : HTTP_GET;
        last_state : BOOL;
        value_int : INT;
        value_real : REAL;
        v_real : REAL;
        state : INT;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK MB_CLIENT
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
    VAR_IN_OUT
        IP_C : IP_C;
        S_BUF : NETWORK_BUFFER_SHORT;
        R_BUF : NETWORK_BUFFER_SHORT;
        DATA : ARRAY[0..255] OF WORD;
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
FUNCTION_BLOCK MB_SERVER
    VAR_INPUT
        DATA_SIZE : INT;
        ENABLE : BOOL;
        UDP : BOOL;
    END_VAR
    VAR_OUTPUT
        ERROR : DWORD;
    END_VAR
    VAR_IN_OUT
        IP_C : IP_C;
        S_BUF : NETWORK_BUFFER_SHORT;
        R_BUF : NETWORK_BUFFER_SHORT;
        VMAP : ARRAY[1..10] OF VMAP_DATA;
        DATA : ARRAY[0..255] OF WORD;
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
FUNCTION_BLOCK MB_SERVER_1
    VAR_INPUT
        DATA_SIZE : INT;
        ENABLE : BOOL;
        UDP : BOOL;
    END_VAR
    VAR_OUTPUT
        ERROR : DWORD;
    END_VAR
    VAR_IN_OUT
        IP_C : IP_C;
        S_BUF : NETWORK_BUFFER_SHORT;
        R_BUF : NETWORK_BUFFER_SHORT;
        VMAP : ARRAY[1..10] OF VMAP_DATA;
        DATA : ARRAY[0..255] OF WORD;
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
FUNCTION_BLOCK MB_VMAP
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
    VAR_IN_OUT
        VMAP : ARRAY[1..10] OF VMAP_DATA;
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
FUNCTION_BLOCK READ_HTTP
    VAR_INPUT
        SIZE : UINT;
        POS : INT;
        SRC : STRING[255];
    END_VAR
    VAR_OUTPUT
        READ_HTTP : STRING[STRING_LENGTH];
    END_VAR
    VAR_IN_OUT
        PT : NW_BUF_LONG;
    END_VAR
    VAR
        index : INT;
        s1 : INT;
        e1 : INT;
        stop : INT;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK SMTP_CLIENT
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
        URL_DATA : url;
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
FUNCTION_BLOCK SNTP_CLIENT
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
    VAR_IN_OUT
        IP_C : IP_C; (* IP_Control Verwaltungsstruktur *)
        S_BUF : NETWORK_BUFFER;
        R_BUF : NETWORK_BUFFER;
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
FUNCTION_BLOCK SNTP_SERVER
    VAR_INPUT
        ENABLE : BOOL;
        STRATUM : BYTE := BYTE#1;
        UDT : DT;
        XMS : INT;
    END_VAR
    VAR_IN_OUT
        IP_C : IP_C; (* IP_Control Verwaltungsstruktur *)
        S_BUF : NETWORK_BUFFER;
        R_BUF : NETWORK_BUFFER;
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
FUNCTION_BLOCK SPIDER_ACCESS
    VAR_INPUT
        MODE : BYTE;
    END_VAR
    VAR_OUTPUT
        ERROR : DWORD;
    END_VAR
    VAR_IN_OUT
        IP_C : IP_C; (*IP_Control Verwaltungsstruktur*)
        S_BUF : NETWORK_BUFFER;
        R_BUF : NETWORK_BUFFER;
        VALUE : STRING[255];
        VAR_NAME : STRING[40];
    END_VAR
    VAR
        state : INT;
        st_tmp : STRING[STRING_LENGTH];
        URL_DATA : url;
        HTTP_GET : HTTP_GET;
        value_len : UINT;
        body_len : UINT;
        mode_save : BYTE;
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK SYS_LOG
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
    VAR_IN_OUT
        IP_C : IP_C; (* IP_Control Verwaltungsstruktur *)
        S_BUF : NETWORK_BUFFER;
        R_BUF : NETWORK_BUFFER;
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
FUNCTION_BLOCK TELNET_LOG
    VAR_INPUT
        ENABLE : BOOL;
        OPTION : BYTE := BYTE#16#8C; (* no flush buffer (7) , CR&LF (3), Colors (2), AUTOWRAP (1), Screen-Init (0) *)
        PORT : WORD := 23; (* Port Nummer *)
    END_VAR
    VAR_OUTPUT
        READY : BOOL;
    END_VAR
    VAR_IN_OUT
        IP_C : IP_C;
        S_BUF : NETWORK_BUFFER;
        LOG_CL : LOG_CONTROL;
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
FUNCTION_BLOCK TELNET_PRINT
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
    VAR_IN_OUT
        IP_C : IP_C;
        S_BUF : NETWORK_BUFFER;
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
