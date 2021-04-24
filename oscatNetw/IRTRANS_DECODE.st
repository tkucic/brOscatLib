FUNCTION_BLOCK IRTRANS_DECODE
    (*http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=36*)
    size := R_BUF.size;

    (* do nothing if the buffer is empty *)
    IF size > 0 AND IP_C.MAILBOX[1] <> z THEN
    	i := 0;
    	ERROR := TRUE;
    	stop := size - 2;
    	(* read characters before first comma and store in device *)
    	pt := ADR(DEV);
    	buffer := ADR(R_BUF.buffer);
    	WHILE i < stop DO
    		IF buffer^[i] = 44 THEN EXIT; END_IF
    		pt^ := buffer^[i];
    		pt := pt + 1;
    		i := i + 1;
    	END_WHILE
    	(* terminate the device string *)
    	pt^ := 0;
    	(* read after first comma and store in KEY *)
    	i := i + 1;
    	pt := ADR(KEY);
    	WHILE i < stop DO
    		pt^ := buffer^[i];
    		pt := pt + 1;
    		i := i + 1;
    	END_WHILE
    	(* terminate the KEY string *)
    	pt^:= 0;
    	(* check if last two characters are $R$N 13, 10 *)
    	IF buffer^[i] <> 13 AND buffer^[i+1] <> 10 THEN	RETURN;	END_IF
    	(* check if device and KEY are present *)
    	IF LEN(DEV) = 0 OR LEN(KEY) = 0 THEN RETURN; END_IF
    	(* a valid transmission has been received *)
    	CMD := TRUE;
    	ERROR := FALSE;
    ELSE
    	ERROR := FALSE;
    	CMD := FALSE;
    END_IF

    z := IP_C.MAILBOX[1];

    (* revision history
    ks	18. oct. 2008	rev 1.0
    	original version
    ks	20. oct. 2009	rev 1.1
    	Networkbuffer und buffer-funktionen auf Basis 0
    ks	06. dec. 2009	rev 1.2
    	Codeanpassung für IRTRANS_SERVER
    *)
END_FUNCTION_BLOCK
