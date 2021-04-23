FUNCTION_BLOCK IRTRANS_SND_1
    (*http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=42*)
    d := IP_C.C_STATE > 127 AND (IP_C.MAILBOX[1] > 0 OR IP_C.C_MODE <> 5);
    IF NOT d THEN RETURN; END_IF

    t(IN:= lk = k , PT:=T_REPEAT);

    IF S_BUF.SIZE = 0 THEN
    	IF IN THEN
    		sKEY := KEY_CODE; k := 1;
    	ELSE
    		lk := 0;
    		KEY := 0;
    		RETURN; (* beenden wenn keIN KEY aktiv *)
    	END_IF

    	IF lk <> k OR T.Q THEN (* anderer KEY oder repeat wartezeit abgelaufen *)
    		str := CONCAT('snd ',DEV_CODE);
    		str := CONCAT(str,',');
    		str := CONCAT(str,sKEY);
    		size := LEN(str);
    		OSCAT_BASIC._STRING_TO_BUFFER(STR:=str, POS:=0, PT:=ADR(S_BUF.BUFFER), SIZE:=size);
    		S_BUF.SIZE := size; (* Sendelänge eINtragen *)
    		KEY := k;
    		lk := k; (* letzten KEY speichern *)
    		t(IN:=FALSE); (* Reset Time *)
    	END_IF
    END_IF

    (* revision history
    hm	6. dec 2009		rev 1.0
    	origINal version
    *)
END_FUNCTION_BLOCK
