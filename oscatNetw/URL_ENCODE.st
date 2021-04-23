FUNCTION URL_ENCODE
    (*http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=87*)
    pt_IN  := ADR(IN);
    pt_out := ADR(URL_ENCODE);

    (* scan the INput strINg and convert unallowed characters *)
    pos_IN := 1;
    stop := LEN(IN);
    FOR pos_out := 1 TO 250 DO
    	IF pos_IN > stop THEN
    		EXIT;
    	ELSIF IS_URLCHR(pt_IN^[pos_IN]) THEN
    		pt_out^[pos_out] := pt_IN^[pos_IN];
    		(* INcrement IN by 1 *)
    		pos_IN := pos_IN + 1;
    	ELSE
    		(* cannot fit 3 digits, exit *)
    		IF pos_out > 248 THEN EXIT; END_IF
    		(* INvalid character that needs to be converted *)
    		pt_out^[pos_out] := 37;    (* start with % sign *)
    		pos_out := pos_out + 1;
    		(* need to add the two hex digits *)
    		tb := SHR(pt_IN^[pos_IN],4);
    		IF tb > 9 THEN
    			pt_out^[pos_out] := tb + 55;
    		ELSE
    			pt_out^[pos_out] := tb + 48;
    		END_IF
    		pos_out := pos_out + 1;
    		tb := pt_IN^[pos_IN] AND 16#0F;
    		IF tb > 9 THEN
    			pt_out^[pos_out] := tb + 55;
    		ELSE
    			pt_out^[pos_out] := tb + 48;
    		END_IF
    		(* INcrement IN and out because out has to move 3 digits *)
    		pos_IN := pos_IN + 1;
    	END_IF
    END_FOR

    (* termINate the output strINg *)
    pt_out^[pos_out] := 0;

    (* revision history
    hm	27. apr. 2008	rev 1.0
    	origINal version

    ks	10. mai. 2008	rev 1.1
    	strINglength 250

    *)
END_FUNCTION
