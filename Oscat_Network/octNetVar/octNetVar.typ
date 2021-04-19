TYPE
    NET_VAR_DATA :    STRUCT
        CYCLE : UDINT;
        STATE : BYTE;
        INDEX : INT;
        ID_MAX : USINT;
        ERROR_ID : BYTE;
        BUF_SIZE : UINT;
        S_BUF : NETWORK_BUFFER;
        R_BUF : NETWORK_BUFFER;
    END_STRUCT;
END_TYPE