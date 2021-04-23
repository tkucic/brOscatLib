FUNCTION_BLOCK NET_VAR_BUFFER
    (*http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=201*)
    IF NOT init THEN
    	init := TRUE;
    	X.ID_MAX := X.ID_MAX + USINT#1;
    	ID := USINT_TO_BYTE(X.ID_MAX);
    END_IF

    IF X.STATE > BYTE#0 AND X.ERROR_ID = BYTE#0 THEN
    	index := X.index; (* PCWORX Workaround *)
    	IF X.STATE = BYTE#1 THEN (* Daten schreiben *)
    		size := SIZEOF(BUF_IN);
    		IF INT_TO_UINT(index + 3 + size) > X.BUF_SIZE THEN
    			X.ERROR_ID := ID;
    		ELSE
    			X.S_BUF.BUFFER[index] := ID; (* ID *)
    			index := index + 1;
    			X.S_BUF.BUFFER[index] := BYTE#20; (* TYPE BUFFER *)
    			index := index + 1;
    			X.S_BUF.BUFFER[index] := INT_TO_BYTE(size); (* Anzahl der Bytes *)
    				index := index + 1;
    			FOR index2 := 1 TO size DO
    				X.S_BUF.BUFFER[index] := BUF_IN[index2];
    				index := index + 1;
    			END_FOR
    		END_IF
    	ELSIF X.STATE = BYTE#2 THEN (* Daten lesen *)
    		index2 := index + 1; (* PCWORX Workaround *)
    		IF X.R_BUF.BUFFER[index] <> ID OR X.R_BUF.BUFFER[index2] <> BYTE#20 THEN
    			X.ERROR_ID := ID;
    		ELSE
    			index := index + 2;
    			size := BYTE_TO_INT(X.R_BUF.BUFFER[index]);
    			index := index + 1;
    			FOR index2 := 1 TO size DO
    				BUF_OUT[index2] := X.R_BUF.BUFFER[index];
    				index := index + 1;
    			END_FOR
    		END_IF
    	END_IF
    	X.index := index;
    END_IF

    (* revision history
    ks	15.may. 2011	rev 1.0
    	original version

    *)
END_FUNCTION_BLOCK
