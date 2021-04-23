FUNCTION_BLOCK FILE_BLOCK
    (*http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=152*)
    CASE step OF
    0:	IF MODE > 0 THEN
    		ERROR := 0;
    		IF FSD.FILE_OPEN AND (FSD.FILE_SIZE = 0 OR POS >= FSD.FILE_SIZE) THEN
    			ERROR := 255;
    			MODE := 0;
    		ELSIF POS < DATA_start OR POS > DATA_stop OR NOT FSD.FILE_OPEN THEN (* Daten lesen notwendig *)
    			FSD.FILENAME := FILENAME;
    			FSD.MODE := 1; (* open + read *)
    			FSD.OFFSET := POS;
    			PT.SIZE := 65535; (* maximale anzahl lesen *);
    			DATA_start := 0;
    			DATA_stop := 0;
    			step := 10;
    		ELSE (* Daten sind im Buffer vorhanden *)
    			i := UDINT_TO_INT(POS - DATA_start); (* index berechnen *)
    			DATA := PT.BUFFER[i];
    			MODE := 0;
    			(* ---------------------- Debug-Message ----------------------------*)
    			(*IF _debug_enable THEN
    				LOG_CL.NEW_MSG := 'FB: POS: ~1 Byte: ~2 >~3<';
    				LOG_CL.PRINTF[1] := UDINT_TO_STRING(POS);
    				LOG_CL.PRINTF[2] := BYTE_TO_STRING(DATA);
    				LOG_CL.PRINTF[3] := CHR_TO_STRING(DATA);
    				LOG_MSG();
    			END_IF*)
    			(* -----------------------------------------------------------------*)
    		END_IF
    	END_IF

    10:	IF FSD.MODE = 0 THEN (* Befehl beendet *)
    		IF FSD.ERROR > 0 THEN
    			ERROR := FSD.ERROR; (* Fehler ausgeben *)
    			MODE := 0;
    		ELSE
    			DATA_start := POS;
    			DATA_stop := POS + UINT_TO_UDINT(PT.SIZE) - 1;
    		END_IF
    		step := 0;
    	END_IF
    END_CASE

    (* revision history
    ks	23. sep. 2010	rev 1.0
    	original version
    *)
END_FUNCTION_BLOCK
