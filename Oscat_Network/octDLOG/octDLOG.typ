TYPE
    DLOG_CRON_DATA :    STRUCT
        CE : ARRAY[0..5] OF DLOG_CRON_ELEMENT;
    END_STRUCT;
    DLOG_CRON_ELEMENT :    STRUCT
        ELEMENTS : ARRAY[0..59] OF BOOL;
        VALUE : INT;
        VALUE_MIN : INT;
        VALUE_MAX : INT;
        ALL_SELECTED : BOOL;
    END_STRUCT;
    DLOG_DATA :    STRUCT
        STORE_TYPE : BYTE;
        ADD_COM : INT;
        ADD_DATA_REQ : BOOL;
        CLOCK_TRIG : BOOL;
        ID_MAX : USINT;
        DTI : DT;
        UCB : UNI_CIRCULAR_BUFFER_DATA;
        LOAD_TIME_MAX : TIME;
        NEW_FILE : STRING[255];
        NEW_FILE_SIZE : UDINT;
        NEW_FILE_RTRIG : BOOL;
    END_STRUCT;
    DLOG_REAL_ARRAY_ELEMENT :    STRUCT
        VALUE : REAL;
        DELTA : REAL;
        COLUMN : STRING[10];
        _DELTA_LAST : REAL;
        _VALUE_LAST : REAL;
    END_STRUCT;
    DLOG_RETAIN :    STRUCT
        FN_REM : STRING[255];
        COLOR : BOOL;
        HEAD : BOOL;
        TRIG_CNT : UDINT;
        TRIG_CNT_TOTAL : UDINT;
    END_STRUCT;
    DLOG_SAVE :    STRUCT
        FN_REM : STRING[255];
        COLOR : BOOL;
        HEAD : BOOL;
        TRIG_CNT : UDINT;
        TRIG_CNT_TOTAL : UDINT;
    END_STRUCT;
    LOG_CONTROL :    STRUCT
        NEW_MSG : STRING[LOG_SIZE]; (* neue Nachricht für den Datenbuffer *)
        NEW_MSG_OPTION : DWORD;
        LEVEL : BYTE;
        SIZE : INT := LOG_MAX; (* Anzahl der Strings im LOG_DATA *)
        RESET : BOOL; (* Nachrichtenbuffer löschen *)
        PRINTF : PRINTF_DATA; (* Array PRINTF Parameter *)
        MSG : ARRAY[0..LOG_MAX] OF STRING[LOG_SIZE]; (* Array Message *)
        MSG_OPTION : ARRAY[0..LOG_MAX] OF DWORD; (* Array Options *)
        UPDATE_COUNT : UINT; (* Updatezähler *)
        IDX : INT; (* aktueller Nachrichten-Index *)
        RING_MODE : BOOL; (* Bufferüberlauf erkannt *)
    END_STRUCT;
    UNI_CIRCULAR_BUFFER_DATA :    STRUCT
        D_MODE : INT;
        D_SIZE : INT;
        D_HEAD : WORD;
        D_STRING : STRING[STRING_LENGTH];
        D_REAL : REAL;
        D_DWORD : DWORD;
        BUF_SIZE : UINT;
        BUF_COUNT : UINT;
        BUF_USED : USINT;
        BUF_USED_MAX : USINT;
        BUF_DATA_CNT : UDINT;
        BUF_DATA_LOST : UDINT;
        BUF : UNI_CIRCULAR_BUF;
        _GetStart : UINT;
        _GetEnd : UINT;
        _Last : UINT;
        _First : UINT;
    END_STRUCT;
    us_LOG_VIEWPORT :    STRUCT
        LINE_ARRAY : ARRAY[1..40] OF INT;
        COUNT : INT; (* Anzahl der sichtbaren Nachtrichten *)
        UPDATE_COUNT : UINT; (* Updatezähler *)
        MOVE_TO_X : INT; (* Steuerung der Nachrichtenanzeige *)
        UPDATE : BOOL; (* Daten wurden geändert -> neuzeichnen *)
    END_STRUCT;
END_TYPE