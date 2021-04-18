TYPE
    IP2GEO_DATA :    STRUCT
        STATE : BOOL; (**)
        IP4 : DWORD; (**)
        COUNTRY_CODE : STRING[2]; (**)
        COUNTRY_NAME : STRING[20]; (**)
        REGION_CODE : STRING[2]; (**)
        REGION_NAME : STRING[20]; (**)
        CITY : STRING[20]; (**)
        GEO_LATITUDE : REAL; (**)
        GEO_LONGITUDE : REAL; (**)
        TIME_ZONE_NAME : STRING[20]; (**)
        GMT_OFFSET : INT; (**)
        IS_DST : BOOL; (**)
    END_STRUCT;
    IP_C :    STRUCT
        C_MODE : BYTE; (*W Mode: TCP/UCP AKTIV/PASSIV                               *)
        C_PORT : WORD; (*W Portnummer                                               *)
        C_IP : DWORD; (*W IP-Adresse gepackt wwxxyyzz = www.xxx.yyy.zzz            *)
        C_STATE : BYTE; (*R Verbindungsstatus ON/OFF + Flanke ON/OFF                 *)
        C_ENABLE : BOOL; (*W Freigabe für Connect                                     *)
        R_OBSERVE : BOOL; (*W Empfang ueberwachen                                      *)
        TIME_RESET : BOOL; (*W Alle Timer ruecksetzen                                   *)
        ERROR : DWORD; (*R vvwwxxyy (vv = CON_ERROR, ww = SEN_ERROR, xx = REC_ERROR *)
        FIFO : IP_FIFO_DATA; (*I IP FIFO Struktur                                         *)
        MAILBOX : ARRAY[1..16] OF BYTE; (*I Mailbox: Datenbereich für Bausteindatenaustausch         *)
    END_STRUCT;
    IP_FIFO_DATA :    STRUCT
        X : ARRAY[1..128] OF BYTE; (* IP_ID FIFO Speicher          *)
        Y : ARRAY[1..128] OF BYTE; (* IP_ID Zähler                 *)
        ID : BYTE; (* höchste vergabene id         *)
        MAX_ID : BYTE; (* maximal Anmeldungen pro ID   *)
        INIT : BOOL; (* Initialisierung durchgeführt *)
        EMPTY : BOOL; (* FIFO leer                    *)
        FULL : BOOL; (* FIFO voll                    *)
        TOP : INT; (* maximale anzahl in FIFO      *)
        NW : INT; (* Schreibzeiger                *)
        NR : INT; (* Lesezeiger                   *)
    END_STRUCT;
    NETWORK_BUFFER :    STRUCT
        SIZE : UINT; (**)
        BUFFER : NW_BUF_LONG; (**)
    END_STRUCT;
    NETWORK_BUFFER_SHORT :    STRUCT
        SIZE : UINT; (**)
        BUFFER : NW_BUF_SHORT; (**)
    END_STRUCT;
    URL :    STRUCT
        PROTOCOL : STRING[10]; (**)
        USER : STRING[32]; (**)
        PASSWORD : STRING[32]; (**)
        DOMAIN : STRING[80]; (**)
        PORT : WORD; (**)
        PATH : STRING[80]; (**)
        QUERY : STRING[OSCAT_BASIC.STRING_LENGTH]; (**)
        ANCHOR : STRING[40]; (**)
        HEADER : STRING[160]; (**)
    END_STRUCT;
    VMAP_DATA :    STRUCT
        FC : DWORD; (**)
        V_ADR : INT; (**)
        V_SIZE : INT; (**)
        P_ADR : INT; (**)
        TIME_OUT : TIME; (**)
    END_STRUCT;
    XML_CONTROL :    STRUCT
        COMMAND : WORD; (**)
        WATCHDOG : TIME; (**)
        START_POS : UINT; (**)
        STOP_POS : UINT; (**)
        COUNT : UINT; (**)
        TYP : INT; (**)
        LEVEL : UINT; (**)
        PATH : STRING[OSCAT_BASIC.STRING_LENGTH]; (**)
        ELEMENT : STRING[OSCAT_BASIC.STRING_LENGTH]; (**)
        ATTRIBUTE : STRING[OSCAT_BASIC.STRING_LENGTH]; (**)
        VALUE : STRING[OSCAT_BASIC.STRING_LENGTH]; (**)
        BLOCK1_START : UINT; (**)
        BLOCK1_STOP : UINT; (**)
        BLOCK2_START : UINT; (**)
        BLOCK2_STOP : UINT; (**)
    END_STRUCT;
END_TYPE