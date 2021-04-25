FUNCTION_BLOCK TN_RECEIVE
    (*http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=182*)
    (* Datenempfang auswertung *)
    XUS_TN_SCREEN.by_Input_ASCII_Code := BYTE#00;
    XUS_TN_SCREEN.by_Input_Exten_Code := BYTE#00;

    IF R_BUF.SIZE > UINT#0 THEN
    	(* empfangene Daten auswerten *)
    	REQ_Size := R_BUF.SIZE;
    	REQ1 := R_BUF.BUFFER[0];
    	REQ2 := R_BUF.BUFFER[1];
    	REQ3 := R_BUF.BUFFER[2];

    	IF REQ1 = BYTE#27 AND REQ_Size >= UINT#3 THEN (* Escape *)
    		IF REQ2 = BYTE#91 THEN (* Cursor code *)
    			IF (REQ3 >= BYTE#65 AND REQ3 <= BYTE#68) OR (REQ3 = BYTE#72) OR (REQ3 = BYTE#75) THEN (* 65..68 = Cursor o,u,r,l / 72 = POS1 / 75 = ENDE *)
    				XUS_TN_SCREEN.by_Input_Exten_Code := REQ3;
    			END_IF
    		ELSIF REQ2 = BYTE#79 THEN (* Sondertasten F1/F2/F3/F4 *)
    			IF REQ3 >= BYTE#80 AND REQ3 <= BYTE#83 THEN
    				XUS_TN_SCREEN.by_Input_Exten_Code := REQ3;
    			END_IF
    		END_IF
    	ELSIF REQ1 >= BYTE#32 AND REQ1 <= BYTE#126 THEN
    		XUS_TN_SCREEN.by_Input_ASCII_Code := REQ1;
    		XUS_TN_SCREEN.bo_Input_ASCII_IsNum := ISC_NUM(REQ1); (* Auswertung auf Zahleneingabe *)
    	ELSIF REQ1 = BYTE#8 OR REQ1 = BYTE#9 OR REQ1 = BYTE#13 OR REQ1 = BYTE#27 THEN (* prüfe auf Steuerzeichen 8=Backspace / 9=Tabulator / 13=Return / 27=Escape *)
    		XUS_TN_SCREEN.by_Input_Exten_Code := REQ1;
    	END_IF

    	(* Empfangsbuffer Datenlänge null eintragen (Telegramm zerstören *)
    	R_BUF.SIZE := UINT#00;
    END_IF

    (* revision history
    ks	10. mai. 2010	rev 1.0
    	original version
    *)
END_FUNCTION_BLOCK
