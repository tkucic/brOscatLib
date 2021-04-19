TYPE
    MYSQL_COM :    STRUCT
        S_BUF : NETWORK_BUFFER; (**)
        R_BUF : NETWORK_BUFFER; (**)
        SQL_CON : BOOL; (**)
        SQL_URL : STRING[STRING_LENGTH]; (**)
        SQL_PACKET_NO : BYTE; (**)
        TIMEOUT : TIME; (**)
        DNS_IP4 : DWORD; (**)
        SQL_RCV_STATE : BYTE; (**)
        ERROR_C : DWORD; (**)
        ERROR_T : BYTE; (**)
    END_STRUCT;
    MYSQL_INFO :    STRUCT
        SERVER_PROTOCOL_VERSION : BYTE; (**)
        SERVER_CAPABILITIES : WORD; (**)
        SERVER_STATUS : WORD; (**)
        SERVER_LANGUAGE : BYTE; (**)
        SQL_CONNECTED : BOOL; (**)
        SQL_ERROR : STRING[STRING_LENGTH]; (**)
        DATA_INSERT_AKTIV : BOOL; (**)
        DATA_INSERT_OK_CNT : UDINT; (**)
        DATA_INSERT_NOK_CNT : UDINT; (**)
    END_STRUCT;
END_TYPE