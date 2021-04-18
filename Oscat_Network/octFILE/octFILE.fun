FUNCTION_BLOCK CSV_PARSER_BUF
    VAR_INPUT
        SEP : BYTE; (**)
    END_VAR
    VAR_OUTPUT
        RESULT : BYTE; (**)
    END_VAR
    VAR_IN_OUT
        RUN : BYTE; (**)
        OFFSET : UDINT; (**)
        VALUE : STRING[OSCAT_BASIC.STRING_LENGTH]; (**)
        PT : NETWORK_BUFFER; (**)
    END_VAR
    VAR
        step : INT; (**)
        size : INT; (**)
        c : BYTE; (**)
        v_add : BYTE; (**)
        i : INT; (**)
        state : BYTE; (**)
        eof : BOOL; (**)
        pv : REFERENCE TO BYTE; (**)
        pve : DWORD; (**)
        watchdog : TON; (**)
        x : BOOL; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK CSV_PARSER_FILE
    VAR_INPUT
        SEP : BYTE; (**)
    END_VAR
    VAR_OUTPUT
        RESULT : BYTE; (**)
    END_VAR
    VAR_IN_OUT
        FILENAME : STRING[255]; (**)
        FSD : FILE_SERVER_DATA; (**)
        RUN : BYTE; (**)
        OFFSET : UDINT; (**)
        VALUE : STRING[OSCAT_BASIC.STRING_LENGTH]; (**)
        PT : NETWORK_BUFFER; (**)
    END_VAR
    VAR
        i : UDINT; (**)
        state : BYTE; (**)
        e : BYTE; (**)
        mode : BYTE; (**)
        step : INT; (**)
        c : BYTE; (**)
        v_add : BYTE; (**)
        eof : BOOL; (**)
        pv : REFERENCE TO BYTE; (**)
        pve : DWORD; (**)
        watchdog : TON; (**)
        x : BOOL; (**)
        FB : FILE_BLOCK; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK FILE_BLOCK
    VAR_INPUT
        POS : UDINT; (**)
    END_VAR
    VAR_OUTPUT
        ERROR : BYTE; (**)
        DATA : BYTE; (**)
    END_VAR
    VAR_IN_OUT
        MODE : BYTE; (**)
        FILENAME : STRING[255]; (**)
        FSD : FILE_SERVER_DATA; (**)
        PT : NETWORK_BUFFER; (**)
    END_VAR
    VAR
        step : INT; (**)
        i : INT; (**)
        data_start : UDINT; (**)
        data_stop : UDINT; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION FILE_PATH_SPLIT : BOOL
    VAR_INPUT
        FILENAME : STRING[OSCAT_BASIC.STRING_LENGTH]; (**)
    END_VAR
    VAR_OUTPUT
        retVal : BOOL := ; (*Return value of the function*)
    END_VAR
    VAR_IN_OUT
        X : FILE_PATH_DATA; (**)
    END_VAR
    VAR
        b : INT; (**)
        c : INT; (**)
        d : STRING[1]; (**)
        p1 : INT; (**)
        p2 : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION_BLOCK INI_PARSER_BUF
    VAR_OUTPUT
        RESULT : BYTE; (**)
    END_VAR
    VAR_IN_OUT
        STR : STRING[OSCAT_BASIC.STRING_LENGTH]; (**)
        RUN : BYTE; (**)
        OFFSET : UDINT; (**)
        KEY : STRING[OSCAT_BASIC.STRING_LENGTH]; (**)
        VALUE : STRING[OSCAT_BASIC.STRING_LENGTH]; (**)
        PT : NETWORK_BUFFER; (**)
    END_VAR
    VAR
        step : INT; (**)
        size : INT; (**)
        c : BYTE; (**)
        k_add : BYTE; (**)
        v_add : BYTE; (**)
        i : INT; (**)
        state : BYTE; (**)
        eof : BOOL; (**)
        pv : REFERENCE TO BYTE; (**)
        pk : REFERENCE TO BYTE; (**)
        pve : DWORD; (**)
        pke : DWORD; (**)
        watchdog : TON; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK INI_PARSER_FILE
    VAR_OUTPUT
        RESULT : BYTE; (**)
    END_VAR
    VAR_IN_OUT
        FILENAME : STRING[255]; (**)
        FSD : FILE_SERVER_DATA; (**)
        STR : STRING[OSCAT_BASIC.STRING_LENGTH]; (**)
        RUN : BYTE; (**)
        OFFSET : UDINT; (**)
        KEY : STRING[OSCAT_BASIC.STRING_LENGTH]; (**)
        VALUE : STRING[OSCAT_BASIC.STRING_LENGTH]; (**)
        PT : NETWORK_BUFFER; (**)
    END_VAR
    VAR
        FB : FILE_BLOCK; (**)
        i : UDINT; (**)
        state : BYTE; (**)
        e : BYTE; (**)
        mode : BYTE; (**)
        step : INT; (**)
        c : BYTE; (**)
        k_add : BYTE; (**)
        v_add : BYTE; (**)
        eof : BOOL; (**)
        pv : REFERENCE TO BYTE; (**)
        pk : REFERENCE TO BYTE; (**)
        pve : DWORD; (**)
        pke : DWORD; (**)
        watchdog : TON; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK FILE_SERVER
    VAR_IN_OUT
        FSD : FILE_SERVER_DATA; (**)
        PT : NETWORK_BUFFER; (**)
    END_VAR
    VAR
        buf_size : UDINT; (**)
        handle : DWORD; (**)
        read_max_length : UDINT; (**)
        file_position : UDINT; (**)
        used_filename : STRING[255]; (**)
        length_read : UDINT; (**)
        write_length : UDINT; (**)
        length_written : UDINT; (**)
        open_handle : DWORD; (**)
        seek_position : UDINT; (**)
        tell_position : UDINT; (**)
        file_size : DINT; (**)
        open_mode : STRING[2]; (**)
        last_mode : BYTE; (**)
        command : BYTE; (**)
        error_code : BYTE; (**)
        error : BOOL; (**)
        file_change : BOOL; (**)
        step : INT; (**)
        FSR : FILE_SERVER_RUNTIME; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK FILE_SERVER_RUNTIME
    VAR_INPUT
        MODE : BYTE; (**)
        COMMAND : BYTE; (**)
    END_VAR
    VAR_IN_OUT
        FSD : FILE_SERVER_DATA; (**)
    END_VAR
    VAR
        last_command : BYTE; (**)
        init : BOOL; (**)
        start_tx : DWORD; (**)
        stop_tx : DWORD; (**)
        runtime : DWORD; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK IP_CONTROL2
    VAR_INPUT
        IP : DWORD; (* IP Adresse *)
        PORT : WORD; (* Port Nummer *)
        TIME_OUT : TIME; (* Ueberwachungszeit Connect / Send / Receive *)
    END_VAR
    VAR_IN_OUT
        IP_C : IP_C; (* IP_Control Verwaltungsstruktur *)
        S_BUF : NETWORK_BUFFER_SHORT; (* Externer Sendbuffer *)
        R_BUF : NETWORK_BUFFER_SHORT; (* Externer Receivebuffer *)
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
        c_fdWrite : SOCKET_FD_SET; (**)
        c_Timeout : SOCKET_TIMEVAL; (**)
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
        server_socket : DINT := SOCKET_INVALID; (**)
        socket : DINT := SOCKET_INVALID; (**)
        sockaddr : SOCKADDRESS; (**)
        sockaddr_size : DWORD; (**)
        plc_841 : BOOL; (**)
        plc_881 : BOOL; (**)
        dint_true : DINT := 1; (**)
        bytes_received : DINT; (**)
        bytes_sent : DINT; (**)
        udp_mode : BOOL; (**)
    END_VAR
    VAR CONSTANT
        STOP : BYTE := 0; (**)
        TS_INIT : BYTE := 1; (**)
        TS_OPEN : BYTE := 2; (**)
        UDP_INIT : BYTE := 31; (**)
        TC_INIT : BYTE := 51; (**)
        TC_CONNECT : BYTE := 52; (**)
        C_WAIT : BYTE := 250; (**)
        C_CLOSE : BYTE := 251; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK IP_CONTROL
    VAR_INPUT
        IP : DWORD; (* IP Adresse *)
        PORT : WORD; (* Port Nummer *)
        TIME_OUT : TIME; (* Ueberwachungszeit Connect / Send / Receive *)
    END_VAR
    VAR_IN_OUT
        IP_C : IP_C; (* IP_Control Verwaltungsstruktur *)
        S_BUF : NETWORK_BUFFER; (* Externer Sendbuffer *)
        R_BUF : NETWORK_BUFFER; (* Externer Receivebuffer *)
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
        c_fdWrite : SOCKET_FD_SET; (**)
        c_Timeout : SOCKET_TIMEVAL; (**)
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
        server_socket : DINT := SOCKET_INVALID; (**)
        socket : DINT := SOCKET_INVALID; (**)
        sockaddr : SOCKADDRESS; (**)
        sockaddr_size : DWORD; (**)
        plc_841 : BOOL; (**)
        plc_881 : BOOL; (**)
        dint_true : DINT := 1; (**)
        bytes_received : DINT; (**)
        bytes_sent : DINT; (**)
        udp_mode : BOOL; (**)
    END_VAR
    VAR CONSTANT
        STOP : BYTE := 0; (**)
        TS_INIT : BYTE := 1; (**)
        TS_OPEN : BYTE := 2; (**)
        UDP_INIT : BYTE := 31; (**)
        TC_INIT : BYTE := 51; (**)
        TC_CONNECT : BYTE := 52; (**)
        C_WAIT : BYTE := 250; (**)
        C_CLOSE : BYTE := 251; (**)
    END_VAR
END_FUNCTION_BLOCK
