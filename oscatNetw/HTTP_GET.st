FUNCTION_BLOCK HTTP_GET
    (*http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=98*)
    CASE state OF
    00:	DONE := FALSE;
    	IF GET AND NOT get_last THEN (* auf positive Flanke SET warten *)
    		state := 10;
    		ip4_stored := IP4; (* aktuelle IP4 speichern *)
    		total_size := 0;
    		HEADER_START := UINT#0;
    		HEADER_STOP := UINT#0;
    		BODY_START := UINT#0;
    		BODY_STOP := UINT#0;
    		HTTP_STATUS := '';
    		ERROR := DWORD#0;
    		ip_state := BYTE#1; (* Anmelden *)
    		authentication := FALSE;
    		delimiter2b := '$0D$0A';
    		delimiter4b := '$0D$0A$0D$0A';

    		(* LOGIN Parameter vorhanden *)
    		(* LOGIN Parameter vorhanden *)
    		IF URL_DATA.USER <> '' AND URL_DATA.PASSWORD <> '' THEN
    			b64_str1 := CONCAT(URL_DATA.USER,':');
    			b64_str1 := CONCAT(b64_str1,URL_DATA.PASSWORD); (* USER:PASSWORD *)
    			b64_start := TRUE; (* BASE64 kodierung von Username *)
    			authentication := TRUE;
    			state := 5;
    		ELSE
    			state := 10;
    		END_IF
    	        	(*####################  DEBUG-MESSAGE  ###################################*)
    		(*IF _debug_enable THEN
    	       		LOG_CL.NEW_MSG := 'HTTP: S00 START /ip_id ~4';
    	            	LOG_CL.PRINTF[4]  := BYTE_TO_STRING(ip_id);
    	            	LOG_MSG();
    	        	END_IF*)
    	        	(*########################################################################*)
    	END_IF

    5:	IF b64_start AND b64_done THEN (* warten auf base64 konvertierung *)
    		b64_start := FALSE;
    		state := 10;
    	END_IF

    10:	IF ip_state = BYTE#3 THEN (* Bei IP_Control anmelden und auf freigabe warten *)
    		idx := 0;
    		text := CONCAT('GET ',URL_DATA.PATH);
    		OSCAT_BASIC._STRING_TO_BUFFER(STR:=text,POS:=idx,PT:=ADR(S_BUF.BUFFER),SIZE:=SIZEOF(S_BUF.BUFFER)); (* GET path in buffer kopieren *)
    		idx := idx + LEN(text);

    		IF LEN(URL_DATA.QUERY) > 0 THEN
    			S_BUF.BUFFER[idx] := 63; (* ASCII '?' *)
    			idx := idx + 1;
    			OSCAT_BASIC._STRING_TO_BUFFER(STR:=URL_DATA.QUERY,POS:=idx,PT:=ADR(S_BUF.BUFFER),SIZE:=SIZEOF(S_BUF.BUFFER)); (* QUERY in buffer kopieren *)
    			idx := idx + LEN(URL_DATA.QUERY);
    		END_IF

    		IF MODE >= BYTE#2 THEN (* gewünschte HTTP Version uebergeben *)
    			text := ' HTTP/1.1';
    		ELSE
    			text := ' HTTP/1.0';
    		END_IF
    		text := CONCAT(text,delimiter2b);
    		OSCAT_BASIC._STRING_TO_BUFFER(STR:=text,POS:=idx,PT:=ADR(S_BUF.BUFFER),SIZE:=SIZEOF(S_BUF.BUFFER)); (* HTTP Version in buffer kopieren *)
    		idx := idx + LEN(text);

    		IF MODE = BYTE#1 THEN (* HTTP/1.0 mit persistenter Verbindung gewünscht *)
    			text := CONCAT('Connection: Keep-Alive',delimiter2b); (* workaround für pcworx -> kein $0D$0A als Stringkonstante möglich *)
    		ELSIF MODE = BYTE#3 THEN (* HTTP/1.1 ohne persistenter Verbindung gewünscht *)
    			text := CONCAT('Connection: Close',delimiter2b); (* workaround für pcworx -> kein $0D$0A als Stringkonstante möglich *)
    		ELSE
    			text := '';
    		END_IF

    		(* Zusatz Parameter übernehmen *)
    		text := CONCAT(text,URL_DATA.HEADER);
    		OSCAT_BASIC._STRING_TO_BUFFER(STR:=text,POS:=idx,PT:=ADR(S_BUF.BUFFER),SIZE:=SIZEOF(S_BUF.BUFFER)); (* HTTP Version in buffer kopieren *)
    		idx := idx + LEN(text);

    		IF authentication THEN
    			text := CONCAT('Authorization: Basic ',b64_str2);
    			text := CONCAT(text,delimiter2b); (* workaround für pcworx -> kein $0D$0A als Stringkonstante möglich *)
    			OSCAT_BASIC._STRING_TO_BUFFER(STR:=text,POS:=idx,PT:=ADR(S_BUF.BUFFER),SIZE:=SIZEOF(S_BUF.BUFFER)); (* HTTP Host in buffer kopieren *)
    			idx := idx + LEN(text);
    		END_IF

    		text := CONCAT('Host: ',URL_DATA.DOMAIN);
    		text := CONCAT(text,delimiter4b); (* workaround für pcworx -> kein $0D$0A als Stringkonstante möglich *)
    		OSCAT_BASIC._STRING_TO_BUFFER(STR:=text,POS:=idx,PT:=ADR(S_BUF.BUFFER),SIZE:=SIZEOF(S_BUF.BUFFER)); (* HTTP Host in buffer kopieren *)
    		idx := idx + LEN(text);

    		(* IP Datenverkehr einrichten *)
    		IF FIND(';HTTPS;https;Https;', CONCAT(URL_DATA.PROTOCOL,';')) > 1 THEN
    			IP_C.C_PORT := SEL(URL_DATA.PORT = WORD#0,URL_DATA.PORT,WORD#443); (* Portnummer eintragen *)
    			IP_C.MAILBOX[16] := BYTE#1; (* SSL MODE freigeben *)
    		ELSE
    			IP_C.C_PORT := SEL(URL_DATA.PORT = WORD#0,URL_DATA.PORT,WORD#80);  (* Portnummer eintragen *)
    		END_IF

    		IP_C.C_IP := ip4_stored; (* IP eintragen *)
    		IP_C.C_MODE := BYTE#0; (* MODE: TCP+AKTIV+PORT+IP *)
    		IP_C.C_ENABLE := TRUE; (* Verbindungsaufbau freigeben *)
    		IP_C.TIME_RESET := TRUE; (* Zeitueberwachung rücksetzen *)
    		IP_C.R_OBSERVE := TRUE; (* Datenempfang ueberwachen *)
    		S_BUF.SIZE := INT_TO_UINT(idx); (* Sendelänge eintragen *)
    		R_BUF.SIZE := UINT#0; (* Empfangslänge rücksetzen *)

    		state := 30;
    	        	(*####################  DEBUG-MESSAGE  ###################################*)
    	        	(*IF _debug_enable THEN
    	        		LOG_CL.NEW_MSG := 'HTTP: S20 SEND /ip_id ~4';
    	            	LOG_CL.PRINTF[4]  := BYTE_TO_STRING(ip_id);
    	            	LOG_MSG();
    	        	END_IF*)
    	        	(*########################################################################*)
    	END_IF

    30:	rcv_timeout := (IP_C.ERROR AND DWORD#16#0000_FF00) = DWORD#16#0000_FF00;
    	con_rdce :=     (IP_C.ERROR AND DWORD#16#FD00_0000) = DWORD#16#FD00_0000;

    	IF S_BUF.SIZE = UINT#0 THEN
    		IF total_size = 0 THEN
    			IF R_BUF.SIZE > UINT#15 THEN; (* länge der empfangenen Daten prüfen *)

    				(* HTTP HEADER Ende suchen -> durch $0D$A$0D$A erkennbar bei DEC RT-11,CP/M,MS-DOS,Windows *)
    				del_end := '$0D$0A$0D$0A';
    				del_pos := OSCAT_BASIC.BUFFER_SEARCH(PT:=ADR(R_BUF.BUFFER),SIZE:=R_BUF.SIZE,STR:=del_end,POS:=0,IGN:=FALSE);

    				(* kein Ende gefunden ? -> andere Ende-Codierung suchen *)
    				IF del_pos = 0 THEN
    					del_end := '$0A$0A';
    					(* HTTP HEADER Ende suchen -> durch $0A$0A erkennbar bei Multics, Unix-Derivate,Mac OS X *)
    					del_pos := OSCAT_BASIC.BUFFER_SEARCH(PT:=ADR(R_BUF.BUFFER),SIZE:=R_BUF.SIZE,STR:=del_end,POS:=0,IGN:=FALSE);
    				END_IF

    				IF del_pos > 0 THEN
    					HEADER_START := UINT#0;
    					HEADER_STOP := INT_TO_UINT(del_pos + LEN(del_end) - 1);
    					total_size := -1; (* HTTP Header empfangen aber noch keine gesamtlänge bekannt *)
    				END_IF
    		                	(*####################  DEBUG-MESSAGE  ###################################*)
    		                	(*IF _debug_enable THEN
    		                   	LOG_CL.NEW_MSG := 'HTTP: S20 HEADER_START ~1 / HEADER_STOP ~2/ip_id ~4';
    		                   	LOG_CL.PRINTF[4]  := BYTE_TO_STRING(ip_id);
    		                   	LOG_CL.PRINTF[1]  := UINT_TO_STRING(HEADER_START);
    		                   	LOG_CL.PRINTF[2]  := UINT_TO_STRING(HEADER_STOP);
    		                   	LOG_MSG();
    		                	END_IF*)
    		                	(*########################################################################*)

    				(* HTTP Statuscode auswerten: (kann 1.0 oder 1.1 sein *)
    				READ_HTTP(size:=HEADER_STOP,pos:=0,SRC:='',pt:=R_BUF.BUFFER);

    				i := LEN(READ_HTTP.READ_HTTP);
    				IF i > 7 THEN
    					(* HTTP Version von HOST auswerten 1.0 oder 1.1 *)
    					text:=MID(READ_HTTP.READ_HTTP,1,3);
    					http_1_1_host := text = '1';

    					(* Code und Meldung isolieren *)
    					HTTP_STATUS := RIGHT(READ_HTTP.READ_HTTP,i-4);
    				END_IF

    				(* positive HTTP Anfrage ? *)
    				IF FIND(HTTP_STATUS,'200') > 0 THEN

    					(* 'Content-Length: Wert einlesen auswerten *)
    					READ_HTTP(size:=HEADER_STOP,pos:=0,SRC:='CONTENT-LENGTH',pt:=R_BUF.BUFFER);
    					text:=READ_HTTP.READ_HTTP;

    					IF LEN(text) >= 1 THEN
    						IF OSCAT_BASIC.IS_NUM(str:=text) THEN
    							(* erwartete gesamtmenge an Bytes berechnen *)
    							total_size := STRING_TO_INT(text) + UINT_TO_INT(HEADER_STOP) + 1;
                               					(*####################  DEBUG-MESSAGE  ###################################*)
                               					(*IF _debug_enable THEN
                                  					LOG_CL.NEW_MSG := 'HTTP: S20 HEADER ~1, BODY ~2 TOTAL ~3 /ip_id ~4';
                                 					LOG_CL.PRINTF[4]  := BYTE_TO_STRING(ip_id);
                                   					LOG_CL.PRINTF[1]  := UINT_TO_STRING(HEADER_STOP);
                                   					LOG_CL.PRINTF[2]  := INT_TO_STRING(total_size-UINT_TO_INT(HEADER_STOP));
                                   					LOG_CL.PRINTF[3]  := INT_TO_STRING(total_size);
                                  					LOG_MSG();
                              					END_IF*)
                              					(*########################################################################*)
    						END_IF
    					END_IF
    				ELSE
    					ERROR := DWORD#16#000000FC; (* Fehler durch HTTP-Statuscodes *)
    				END_IF
    			END_IF
    		(* 1. bei bekannter Content-Length wird nach erhalt der erwartenen Daten die verbindung beendet *)
    		(* 2. bei persistenter Verbindung muss bei unbekannter Datenmenge auf Receive-Timeout gewartet werden *)
    		(* 3. wenn nach datenempfang die verbindung vom host unterbrochen wird *)
    		ELSIF (R_BUF.SIZE >= INT_TO_UINT(total_size)) OR
    			(R_BUF.SIZE > UINT#0 AND total_size < 0 AND ((rcv_timeout OR con_rdce) OR (IP_C.C_STATE = BYTE#1))) THEN

    			IF R_BUF.SIZE - 1 > HEADER_STOP THEN (* BODY Daten vorhanden *)
    				BODY_START := HEADER_STOP + UINT#1;
    				BODY_STOP := R_BUF.SIZE - 1;
    		                	(*####################  DEBUG-MESSAGE  ###################################*)
    		                	(*IF _debug_enable THEN
    		                   	LOG_CL.NEW_MSG := 'HTTP: S20 BODY ~1, START ~2 END ~3 /ip_id ~4';
    		                   	LOG_CL.PRINTF[4]  := BYTE_TO_STRING(ip_id);
    		                   	LOG_CL.PRINTF[1]  := UINT_TO_STRING(HEADER_STOP);
    		                   	LOG_CL.PRINTF[2]  := UINT_TO_STRING(BODY_START);
    		                   	LOG_CL.PRINTF[3]  := UINT_TO_STRING(BODY_STOP);
    		                   	LOG_MSG();
    		               	END_IF*)
    		               	(*########################################################################*)
    			END_IF

    			DONE := TRUE;
    			IP_C.C_ENABLE := FALSE; (* Verbindung abbauen *)
    			state := 40;
                		(*####################  DEBUG-MESSAGE  ###################################*)
                		(*IF _debug_enable THEN
                    			LOG_CL.NEW_MSG := 'HTTP: S30 OK /ip_id ~4';
                    			LOG_CL.PRINTF[4]  := BYTE_TO_STRING(ip_id);
                    			LOG_MSG();
                		END_IF*)
                		(*########################################################################*)
    		END_IF
    	END_IF

    	IF IP_C.ERROR <> DWORD#0 THEN
    		(* bei unbekannter Content-size ist nicht bekannt ob bzw wieviele Telegramme noch folgen werden *)
    		(* darum wird nach receive-timeout oder Remote disconnect ERROR der fehler wieder ausgefiltert (logischer fehler) *)
    		IF rcv_timeout AND DONE THEN
    			IP_C.ERROR := IP_C.ERROR AND DWORD#16#FFFF_00FF; (* Fehler wieder rücksetzen *)
    		ELSIF con_rdce AND DONE THEN
    			IP_C.ERROR := IP_C.ERROR AND DWORD#16#00FF_FFFF; (* Fehler wieder rücksetzen *)
    		ELSE
    			ERROR := IP_C.ERROR;
    		END_IF
    	END_IF

    	IF ERROR > DWORD#0 THEN
    		IP_C.C_ENABLE := FALSE; (* Verbindungsaufbau sperren *)
    		state := 40;
    	        	(*####################  DEBUG-MESSAGE  ###################################*)
    	        	(*IF _debug_enable THEN
    	            	LOG_CL.NEW_MSG := 'HTTP: S30 ERROR ~1 /ip_id ~4';
    	            	LOG_CL.PRINTF[1]  := DWORD_TO_STRING(ERROR);
    	            	LOG_CL.PRINTF[4]  := BYTE_TO_STRING(ip_id);
    	            	LOG_MSG();
    	        	END_IF*)
    	        	(*########################################################################*)
    	END_IF

    40:	IF (UNLOCK_BUF OR NOT DONE) THEN (* Warten auf Release und Verbindung beendet -> ip_id vom Stack nehmen *)
    		ip_state := BYTE#4; (* Abmelden *)
    		DONE := FALSE;
    		IP_C.MAILBOX[16] := BYTE#0; (* SSL MODE beenden *)
    		state := 0;
    	END_IF
    END_CASE

    get_last := GET; (* letzten Status sichern zur Flankenerkennung *)

    IP_FIFO(FIFO:=IP_C.FIFO,state:=ip_state,ID:=ip_id); (* IP_FIFO *)

    BASE64_ENCODE_STR(RUN:=b64_start,STR1:=b64_str1,STR2:=b64_str2); (* BASE64 kodierung *)
    b64_done:=BASE64_ENCODE_STR.DONE;

    (*####################  DEBUG-MESSAGE  ###################################*)
    (*IF _debug_enable THEN
    	IF state <> _debug_state_last THEN
    		LOG_CL.NEW_MSG := 'http_get: /last ~1 /New ~2';
    		LOG_CL.PRINTF[1] := INT_TO_STRING(_debug_state_last);
    		LOG_CL.PRINTF[2] := INT_TO_STRING(state);
    		LOG_MSG();
    		_debug_state_last := state;
    	END_IF
    END_IF*)
    (*########################################################################*)

    (* revision history
    ks	18. oct. 2008	rev 1.0
    	original version

    ks	20. oct. 2009	rev 1.1
    	Fehler bei body-suche bei $0a$0a korrigiert,Codeoptimierung,
    	new VAR del_pos , del_end (Networkbuffer und Buffer-funktionen auf Basis 0)

    ks	28. oct. 2009	rev 1.2
    	über url.header können zusätzliche header-infos übergeben werden

    ks	12. apr. 2011	rev 1.3
    	verbesserte fehlererkennung und fehlerkorrektur bei buffer_to_string

    ks	31. mar. 2016	rev 1.4
    	authentication und SSL (HTTPS) hinzugefügt, DONE später zurücksetzen

    *)
END_FUNCTION_BLOCK
