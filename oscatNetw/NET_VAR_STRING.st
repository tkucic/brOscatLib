FUNCTION_BLOCK NET_VAR_STRING
    (*http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=203*)
    IF NOT init THEN
    	init := TRUE;
    	X.ID_MAX := X.ID_MAX + USINT#1;
    	ID := USINT_TO_BYTE(X.ID_MAX);
    END_IF

    IF X.STATE > BYTE#0 AND X.ERROR_ID = BYTE#0 THEN
    	index := X.index; (* PCWORX Workaround *)
    	IF X.STATE = BYTE#1 THEN (* Daten schreiben *)
    		len_str := LEN(IN);
    		IF INT_TO_UINT(index + 3 + len_str) > X.BUF_SIZE THEN
    			X.ERROR_ID := ID;
    		ELSE
    			X.S_BUF.BUFFER[index] := ID; (* ID *)
    			index := index + 1;
    			X.S_BUF.BUFFER[index] := BYTE#6; (* TYPE REAL *)
    			index := index + 1;
    			X.S_BUF.BUFFER[index] := INT_TO_BYTE(len_str); (* Anzahl der Bytes *)
    			index := index + 1;
    			OSCAT_BASIC._STRING_TO_BUFFER(STR:=IN,POS:=index,PT:=ADR(X.S_BUF.BUFFER),SIZE:=X.BUF_SIZE);
    			index := index + len_str;
    		END_IF
    	ELSIF X.STATE = BYTE#2 THEN (* Daten lesen *)
    		index2 := index + 1; (* PCWORX Workaround *)
    		IF X.R_BUF.BUFFER[index] <> ID OR X.R_BUF.BUFFER[index2] <> BYTE#6 THEN
    			X.ERROR_ID := ID;
    		ELSE
    			index := index + 2;
    			len_str := BYTE_TO_INT(X.R_BUF.BUFFER[index]);
    			index2 := index + 1;
    			index := index2 + len_str;
    			IF len_str > 0 THEN
    				OUT := OSCAT_BASIC.BUFFER_TO_STRING(PT:=ADR(X.R_BUF.BUFFER),SIZE:=X.BUF_SIZE,START:=INT_TO_UINT(index2),STOP:=INT_TO_UINT(index - 1));
    			ELSE
    				OUT := '';
    			END_IF
    		END_IF
    	END_IF
    	X.index := index;
    END_IF

    (* revision history
    ks	15.may. 2011	rev 1.0
    	original version

    *)
END_FUNCTION_BLOCK
