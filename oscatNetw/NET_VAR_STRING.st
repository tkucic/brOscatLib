FUNCTION_BLOCK NET_VAR_STRING
    (*http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=203*)
    IF NOT INit THEN
    	INit := TRUE;
    	X.ID_MAX := X.ID_MAX + USINT#1;
    	ID := USINT_TO_BYTE(X.ID_MAX);
    END_IF

    IF X.STATE > BYTE#0 AND X.ERROR_ID = BYTE#0 THEN
    	INdex := X.INdex; (* PCWORX Workaround *)
    	IF X.STATE = BYTE#1 THEN (* Daten schreiben *)
    		len_str := LEN(IN);
    		IF INT_TO_UINT(INdex + 3 + len_str) > X.BUF_SIZE THEN
    			X.ERROR_ID := ID;
    		ELSE
    			X.S_BUF.BUFFER[INdex] := ID; (* ID *)
    			INdex := INdex + 1;
    			X.S_BUF.BUFFER[INdex] := BYTE#6; (* TYPE REAL *)
    			INdex := INdex + 1;
    			X.S_BUF.BUFFER[INdex] := INT_TO_BYTE(len_str); (* Anzahl der Bytes *)
    			INdex := INdex + 1;
    			OSCAT_BASIC._STRING_TO_BUFFER(STR:=IN,POS:=INdex,PT:=ADR(X.S_BUF.BUFFER),SIZE:=X.BUF_SIZE);
    			INdex := INdex + len_str;
    		END_IF
    	ELSIF X.STATE = BYTE#2 THEN (* Daten lesen *)
    		INdex2 := INdex + 1; (* PCWORX Workaround *)
    		IF X.R_BUF.BUFFER[INdex] <> ID OR X.R_BUF.BUFFER[INdex2] <> BYTE#6 THEN
    			X.ERROR_ID := ID;
    		ELSE
    			INdex := INdex + 2;
    			len_str := BYTE_TO_INT(X.R_BUF.BUFFER[INdex]);
    			INdex2 := INdex + 1;
    			INdex := INdex2 + len_str;
    			IF len_STR > 0 THEN
    				OUT := OSCAT_BASIC.BUFFER_TO_STRING(PT:=ADR(X.R_BUF.BUFFER),SIZE:=X.BUF_SIZE,START:=INT_TO_UINT(INdex2),STOP:=INT_TO_UINT(INdex - 1));
    			ELSE
    				OUT := '';
    			END_IF
    		END_IF
    	END_IF
    	X.INdex := INdex;
    END_IF

    (* revision history
    ks	15.may. 2011	rev 1.0
    	origINal version

    *)
END_FUNCTION_BLOCK
