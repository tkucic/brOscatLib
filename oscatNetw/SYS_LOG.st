FUNCTION_BLOCK SYS_LOG
    (*http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=131*)
    CASE state OF
    00: (* auf positive Flanke SET warten *)
    	IF ACTIVATE AND NOT ACTIVATE_LAST THEN
    		state := 10;
    		ERROR := DWORD#0;
    		IP_STATE := BYTE#1; (* Anmelden *)
        		(*####################  DEBUG-MESSAGE  ###################################*)
        		(*IF _debug_enable THEN
          			LOG_CL.NEW_MSG := 'SYS_LOG: S00 START /IP_ID ~4';
          			LOG_CL.PRINTF[4]  := BYTE_TO_STRING(IP_ID);
          			LOG_MSG();
        		END_IF*)
        		(*########################################################################*)
    	END_IF
    	DONE_P := FALSE;

    10: (* Bei IP_Control anmelden und auf freigabe warten *)
    	IF IP_STATE = BYTE#3 THEN
    		(* Sendedaten aufbereiten *)
    		i := 0;
    		IF (OPTION AND BYTE#0000_0001) = BYTE#00 THEN (* Option: no priority Code *)
    			(* Priority:  '<xx>' als dezimalwert *)
    			(* BYTE: xxxx x...  = Facility *)
    			(*       .... .xxx  = Level *)
    			s1 := REPLACE('<P>',BYTE_TO_STRING(SHL(FACILITY,3) OR (SEVERITY AND BYTE#0000_0111)),1,2);
    		ELSE
    			s1 := '';
    		END_IF

    		IF (OPTION AND BYTE#0000_0010) = BYTE#00 THEN (* Option: No Use Syslog RFC Header *)
    			(* 'month day hh:mm:ss ' *)
    			s1 := CONCAT(s1,OSCAT_BASIC.DT_TO_STRF(DTI:=LOC_DT,MS:=0,FMT:='#E #W #N:#R:#T ',LANG:=1));
    			OSCAT_BASIC._STRING_TO_BUFFER(STR:=s1,POS:=i,PT:=ADR(S_BUF.BUFFER),SIZE:=UINT#1024);
    			i := i + LEN(s1);
    			(* ' sourcename eintragen *)
    			OSCAT_BASIC._STRING_TO_BUFFER(STR:=HOSTNAME,POS:=i,PT:=ADR(S_BUF.BUFFER),SIZE:=UINT#1024);
    			i := i + LEN(HOSTNAME);
    			S_BUF.BUFFER[i] := BYTE#32; (* leerzeichen einfuegen *)
    			i := i + 1;
    			(* ' TAG eintragen *)
    			OSCAT_BASIC._STRING_TO_BUFFER(STR:=TAG,POS:=i,PT:=ADR(S_BUF.BUFFER),SIZE:=UINT#1024);
    			i := i + LEN(TAG);
    			S_BUF.BUFFER[i] := BYTE#32; (* leerzeichen einfuegen *)
    			i := i + 1;
    		END_IF

    		(* ' MESSAGE eintragen *)
    		OSCAT_BASIC._STRING_TO_BUFFER(STR:=MESSAGE,POS:=i,PT:=ADR(S_BUF.BUFFER),SIZE:=UINT#1024);
    		i := i + LEN(MESSAGE);

    		IF (OPTION AND BYTE#0000_0100) > BYTE#00 THEN (* Option: Add a CR & LF to end of MESSAGE *)
    			S_BUF.BUFFER[i] := BYTE#13; (* Carriage Return einfuegen *)
    			i := i + 1;
    			S_BUF.BUFFER[i] := BYTE#10; (* Linefeed einfuegen *)
    			i := i + 1;
    		END_IF

    		state := 30;

    		(* IP Datenverkehr einrichten *)
    		IF (OPTION AND BYTE#2#0000_1000) > BYTE#00 THEN (* Option: TCP Mode *)
    			IP_C.C_MODE := BYTE#0; (* Mode: TCP/AKTIV *)
    		ELSE
    			IP_C.C_MODE := BYTE#1; (* Mode: UDP/AKTIV *)
    		END_IF

    		IF PORT = WORD#0 THEN (* keine Portnummer vorgegeben ? *)
    			IF IP_C.C_MODE = BYTE#0 THEN (* Modus bestimmen  TCP oder UDP ? *)
    				IP_C.C_PORT := WORD#1468; (* Standard Portnummer für Syslog over TCP *)
    			ELSE
    				IP_C.C_PORT := WORD#514; (* Standard Portnummer für Syslog over UDP *)
    			END_IF
    		ELSE
    			IP_C.C_PORT := PORT; (* uebergebene Portnummer eintragen *)
    		END_IF

    		IP_C.C_IP := SERVER_IP4; (* IP eintragen *)
    		IP_C.C_ENABLE := TRUE; (* Verbindungsaufbau freigeben *)
    		IP_C.TIME_RESET := TRUE; (* Zeitueberwachung rücksetzen *)
    		IP_C.R_OBSERVE := FALSE; (* Datenempfang ueberwachen *)
    		S_BUF.SIZE := INT_TO_UINT(i); (* Sendelänge eintragen *)
    		R_BUF.SIZE := UINT#0; (* Empfangslänge rücksetzen *)
        		(*####################  DEBUG-MESSAGE  ###################################*)
        		(*IF _debug_enable THEN
          			LOG_CL.NEW_MSG := 'SYS_LOG: S20 SEND /IP_ID ~4';
          			LOG_CL.PRINTF[4]  := BYTE_TO_STRING(IP_ID);
          			LOG_MSG();
        		END_IF*)
        		(*########################################################################*)
    	END_IF

    30:
    	IF IP_C.ERROR <> DWORD#00 THEN
    		ERROR := IP_C.ERROR;
    		state := 0;
        		(*####################  DEBUG-MESSAGE  ###################################*)
        		(*IF _debug_enable THEN
          			LOG_CL.NEW_MSG := 'SYS_LOG: S30 ERROR ~1 IP_ID ~4';
          			LOG_CL.PRINTF[1]  := DWORD_TO_STRING(ERROR);
          			LOG_CL.PRINTF[4]  := BYTE_TO_STRING(IP_ID);
          			LOG_MSG();
        		END_IF*)
        		(*########################################################################*)
    	ELSIF S_BUF.SIZE = UINT#0 THEN (* warten bis alle daten gesendet sind *)
    		DONE_P := TRUE;
    		state := 0;
        		(*####################  DEBUG-MESSAGE  ###################################*)
        		(*IF _debug_enable THEN
          			LOG_CL.NEW_MSG := 'SYS_LOG: S30 OK /IP_ID ~4';
          			LOG_CL.PRINTF[4]  := BYTE_TO_STRING(IP_ID);
          			LOG_MSG();
        		END_IF*)
        		(*########################################################################*)
    	END_IF

    	IF state = 0 THEN (* Verbindung freigeben *)
    		IP_STATE := BYTE#4;
    	END_IF

    END_CASE

    ACTIVATE_LAST := ACTIVATE; (* letzten Status sichern zur Flankenerkennung *)

    (* IP_FIFO *)
    IP_FIFO(FIFO:=IP_C.FIFO,STATE:=ip_state,ID:=IP_ID);

    (* revision history
    ks	18. oct. 2008	rev 1.0
    	original version

    ks	20. jun. 2009	rev 1.1
    	Networkbuffer und Buffer-funktionen auf Basis 0

    *)
END_FUNCTION_BLOCK
