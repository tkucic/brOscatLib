FUNCTION_BLOCK MB_SERVER
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=116*)
    (* read system time *)
    tx := DWORD_TO_TIME(OSCAT_BASIC.T_PLC_MS());

    FOR i := 1 TO 10 DO
    	IF VMAP[i].TIME_OUT > T#0s THEN
    		VMAP[i].TIME_OUT := VMAP[i].TIME_OUT + tx - last_cycle;
    	END_IF
    END_FOR
    last_cycle := tx;
    ip_ERROR := IP_C.ERROR > DWORD#0;

    CASE state OF
    00: (* Warten auf Freigabe *)
    	IF ENABLE THEN
    		state := 10;
    		ip_state := BYTE#1; (* Anmelden *)
    	END_IF

    10: (* Bei IP_Control anmelden und auf freigabe warten *)
    	IF ip_state = BYTE#3 THEN

    		(* IP Datenverkehr einrichten *)
    		IP_C.C_PORT := WORD#0; (* Port von IP_CONTROL verwenden *)
    		IP_C.C_IP := DWORD#0; (* IP von IP_CONTROL verwenden *)
    		IP_C.C_MODE := SEL(UDP,BYTE#4,BYTE#5); (* Mode: 4=TCP+PASSIV+PORT , 5=UDP+PASSIV+PORT *)
    		IP_C.TIME_RESET := TRUE; (* Zeitueberwachung rücksetzen *)
    		IP_C.C_ENABLE := TRUE; (* Verbindungsaufbau freigeben *)
    		IP_C.R_OBSERVE := TRUE; (* keine Empfangsueberwachung *)
    		state := 20;
    	END_IF

    20:	IF NOT ip_ERROR THEN
    		IF S_BUF.SIZE = UINT#0 AND R_BUF.SIZE > UINT#6 THEN	(* Datensenden nicht aktiv und Daten wurden empfangen *)
    			IF  R_BUF.SIZE = WORD_TO_UINT(OSCAT_BASIC.WORD_OF_BYTE(R_BUF.BUFFER[4],R_BUF.BUFFER[5])) + UINT#6 THEN (* gültige Datenlänge *)
    				ERROR := DWORD#00; (* Error löschen *)

    				(* Header kopieren *)
    				FOR i := 0 TO 13 DO
    					S_BUF.BUFFER[i] := R_BUF.BUFFER[i];
    				END_FOR
    				fc := BYTE_TO_INT(R_BUF.BUFFER[7]);
    				adr1 := WORD_TO_INT(OSCAT_BASIC.WORD_OF_BYTE(R_BUF.BUFFER[8],R_BUF.BUFFER[9]));
    				points := WORD_TO_INT(OSCAT_BASIC.WORD_OF_BYTE(R_BUF.BUFFER[10],R_BUF.BUFFER[11]));

    				(* Virtual Address *)
    				MB_VMAP(VMAP:=VMAP,FC:=fc,V_ADR:=adr1,V_CNT:=points,SIZE:=DATA_SIZE);
    				adr1:=MB_VMAP.P_ADR;
    				bit_pos:=MB_VMAP.P_BIT;
    				ERROR:=BYTE_TO_DWORD(MB_VMAP.ERROR);

    				IF ERROR = DWORD#0 THEN
    					CASE fc OF
    					(*---------------------------------------------*)
    					1..2 : (* Read Coil Status / Read Input Status *)
    						count := 9; (* erstes Datenbyte *)
    						coils := BYTE#0;
    						mask := BYTE#1;
    						FOR i := 1 TO points DO
    							IF mask = BYTE#0 THEN
    								mask := BYTE#1;
    								S_BUF.BUFFER[count] := coils;
    								coils := BYTE#0;
    								count := count + 1;
    							END_IF
    							IF (DATA[adr1] AND SHL(WORD#1,bit_pos)) > WORD#0 THEN
    								coils := coils OR mask;
    							END_IF
    	
    							bit_Pos := bit_Pos + 1;
    							IF bit_pos > 15 THEN
    								ADR1 := ADR1 + 1;
    								bit_pos := 0;
    							END_IF
    	
    							mask := SHL(mask,1);
    						END_FOR
    						S_BUF.BUFFER[Count] := coils;
    	
    						S_BUF.BUFFER[8] := INT_TO_BYTE(count - 8); (* Bytecount *)
    						S_BUF.SIZE := INT_TO_UINT(count + 1);
    	
    					(*--------------------------------------------------*)
    					3..4 : (* Read Holding Registers / Read Input Registers *)
    						idx1 := 07;
    						count := adr1 + points - 1;
    						FOR i := adr1 TO count DO
    							idx1 := idx1 + 2;
    							idx2 := idx1 + 1; (* zweiter index für pcworx notwendig ! *)
    							w_tmp := DATA[i];
    							S_BUF.BUFFER[idx1] := WORD_TO_BYTE(SHR(w_tmp,8));
    							S_BUF.BUFFER[idx2] := WORD_TO_BYTE(w_tmp);
    						END_FOR
    						S_BUF.BUFFER[8] := SHL(INT_TO_BYTE(points),1); (* Anzahl Register in Bytes *)
    						S_BUF.SIZE := INT_TO_UINT(idx2 + 1);
    					(*--------------------------------------------------*)
    					5 : (* Force Single Coil *)
    						DATA[adr1]:=OSCAT_BASIC.BIT_LOAD_W(DATA[adr1],R_BUF.BUFFER[10] > BYTE#0,bit_pos);
    						S_BUF.SIZE := UINT#12;
    					(*--------------------------------------------------*)
    					6 : (* Preset Single Register *)
    						DATA[adr1] := OSCAT_BASIC.WORD_OF_BYTE(R_BUF.BUFFER[10],R_BUF.BUFFER[11]);
    						S_BUF.SIZE := UINT#12;
    					(*--------------------------------------------------*)
    					15 : (* Force Multible Coils *)
    						mask := BYTE#1;
    						idx1 := 13;
    						FOR i := 1 TO points DO
    							DATA[adr1]:=OSCAT_BASIC.BIT_LOAD_W(DATA[adr1],(R_BUF.BUFFER[idx1] AND mask) > BYTE#0,bit_pos);
    							bit_pos := bit_pos + 1;
    							IF bit_pos > 15 THEN
    								adr1:= adr1 + 1;
    								bit_pos := 0;
    							END_IF
    							mask := ROL(mask,1);
    							IF mask = BYTE#1 THEN
    								idx1 := idx1 +1;
    							END_IF
    						END_FOR
    						S_BUF.SIZE := UINT#12;
    					(*--------------------------------------------------*)
    					16 : (* Preset Multiple Registers	*)
    						idx1 := 11;
    						count := adr1 + points - 1;
    						FOR i := adr1 TO Count DO
    							idx1 := idx1 + 2;
    	 						idx2 := idx1 + 1;
    							Data[i] := OSCAT_BASIC.WORD_OF_BYTE(R_BUF.BUFFER[idx1],R_BUF.BUFFER[idx2]);
    						END_FOR
    						S_BUF.SIZE := UINT#12;
    					(*--------------------------------------------------*)
    					22 : (* Mask Write Register *)
    						w_tmp := OSCAT_BASIC.WORD_OF_BYTE(R_BUF.BUFFER[10],R_BUF.BUFFER[11]); (* and mask *)
    						DATA[adr1] := (DATA[adr1] AND w_tmp) OR (OSCAT_BASIC.WORD_OF_BYTE(R_BUF.BUFFER[12],R_BUF.BUFFER[13]) AND (NOT w_tmp));
    						S_BUF.SIZE := UINT#14;
    					(*--------------------------------------------------*)
    					23 : (* Read / Write Registers	*)
    						(*--- Write-Register -----------------------------------*)
    						adr2 := WORD_TO_INT(OSCAT_BASIC.WORD_OF_BYTE(R_BUF.BUFFER[12],R_BUF.BUFFER[13]));
    						points2 := WORD_TO_INT(OSCAT_BASIC.WORD_OF_BYTE(R_BUF.BUFFER[14],R_BUF.BUFFER[15]));

    						(* Virtual Address Write Register *)
    						MB_VMAP(VMAP:=VMAP,FC:=16,V_ADR:=adr2,V_CNT:=points2,SIZE:=DATA_SIZE);
    						adr2:=MB_VMAP.P_ADR;
    						ERROR:=BYTE_TO_DWORD(MB_VMAP.ERROR);
    	
    						IF ERROR = DWORD#0 THEN
    							idx1 := 15;
    							count := adr2 + points2 - 1;
    							FOR i := adr2 TO count DO
    								idx1 := idx1 + 2;
    	 							idx2 := idx1 + 1; (* zweiter index für pcworx notwendig ! *)
    								Data[i] := OSCAT_BASIC.WORD_OF_BYTE(R_BUF.BUFFER[idx1],R_BUF.BUFFER[idx2]);
    							END_FOR
    	
    							(*--- Read-Register -----------------------------------*)
    							idx1 := 07;
    							count := adr1 + points - 1;
    							FOR i := adr1 TO count DO
    								idx1 := idx1 + 2;
    								idx2 := idx1 + 1; (* zweiter index für pcworx notwendig ! *)
    								w_tmp := DATA[i];
    								S_BUF.BUFFER[idx1] := WORD_TO_BYTE(SHR(w_tmp,8));
    								S_BUF.BUFFER[idx2] := WORD_TO_BYTE(w_tmp);
    							END_FOR
    							S_BUF.BUFFER[8] := SHL(INT_TO_BYTE(points),1); (* Anzahl Register in Bytes *)
    							S_BUF.SIZE := INT_TO_UINT(idx2 + 1);
    	
    						END_IF
    	
    					(*--------------------------------------------------*)
    					ELSE
    						ERROR := DWORD#01; (* ILLEGAL FUNCTION *)
    					END_CASE
    				END_IF
    			END_IF
    	
    			IF ERROR > DWORD#0 THEN
    				S_BUF.BUFFER[7] := S_BUF.BUFFER[7] OR BYTE#2#1000_0000; (* Fehlerbit setzen *)
    				S_BUF.BUFFER[8] := DWORD_TO_BYTE(ERROR);
    				S_BUF.SIZE := UINT#9;
    			END_IF
    	
    			S_BUF.BUFFER[4] := BYTE#0; (* high Byte *)
    			S_BUF.BUFFER[5] := UINT_TO_BYTE(S_BUF.SIZE - UINT#6); (* Längenfeld eintragen - nur low byte *)
    	
    		END_IF
    	ELSE
    		ERROR := IP_C.ERROR;
    	END_IF

    	t(IN:= ip_ERROR, PT:=T#2s);
    	IF t.Q THEN
    		IP_C.TIME_RESET := TRUE; (* Error Reset *)
    	END_IF

    	R_BUF.SIZE := UINT#0; (* Empfangsdaten zerstören *)

    	IF ENABLE = FALSE OR t.Q THEN
    	    ip_state := BYTE#4; (* Abmelden *)
    		state := 00;
    		IP_C.C_ENABLE := FALSE;
    	END_IF
    END_CASE

    (* IP_FIFO *)
    IP_FIFO(FIFO:=IP_C.FIFO,STATE:=ip_state,ID:=ip_id);

    (* revision history
    ks	05. jan. 2009	rev 1.0
    	original version

    ks	28. jan. 2009	rev 1.1
    	network_buffer_short verwendet  

    ks	20. oct. 2009	rev 1.2
    	change lokal-var adr to adr1,Networkbuffer und Buffer-funktionen auf Basis 0

    ks	17. may. 2011	rev 1.3
    	automatischer re-connect

    ks	05. may. 2012	rev 1.4
    	timeoutüberwachung für re-connect
    *)
END_FUNCTION_BLOCK