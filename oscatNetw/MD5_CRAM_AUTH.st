FUNCTION_BLOCK MD5_CRAM_AUTH
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=78*)
    CASE step OF

    0:	IF RUN THEN
    		step := 5;
    		str_192 := B64_TS;
    		b64d_run := TRUE;
    	END_IF

    5: IF B64D_DONE THEN (* IPAD Zyklus *)
    		b64d_run := FALSE;
    		xpad := 16#36;
    		md5_str1 := PASSWORD;
    		md5_str2 := str_144;
    		size := 64 + LEN(md5_str2);
    		md5_mode := 1;
    		step := 10;
    	END_IF

    10: IF md5_mode = 3 THEN (* OPAD Zyklus *)
    		md5_first := md5; (* md5 array vom IPAD sichern *)
    		xpad := 16#5C;
    		size := 64 + 16;
    		md5_mode := 1;
    		step := 20;
    	END_IF

    20: IF md5_mode = 3 THEN
    		md5_mode := 0;
    		str_144 := CONCAT(USERNAME , ' ');
    		str_144 := CONCAT(str_144 , MD5_TO_STRH(md5));
    		b64e_run := TRUE;
    		step := 30;
    	END_IF

    30: IF B64E_DONE THEN
    		AUTH_KEY := str_192;
    		b64e_run := FALSE;
    		RUN := FALSE;
    		step := 0; (* alles beendet !! *)
    	END_IF

    END_CASE

    (* ----------- md5 -------------- *)
    CASE md5_mode OF

    1:	n2 := LEN(md5_str1) - 1;
    	pt := ADR(md5_str1);
    	FOR n1 := 0 TO n2 DO (* string in buf kopieren *)
    		buf[n1] := pt^ XOR xpad;
    		pt := pt + 1;
    	END_FOR
    	FOR n1 := n2 + 1 TO 63 DO (* mit ipad füllen *)
    		buf[n1] := xpad;
    	END_FOR

    2:	(* Data copy and Calc *)
    	IF size > 0 AND pos >= 64 THEN
    		IF step = 20 THEN
    			FOR n1 := 0 TO 15 DO
    				buf[n1] := md5_first[n1];
    			END_FOR
    		ELSE
    			n2 := LEN(md5_str2) - 1;
    			pt := ADR(md5_str2);
    			FOR n1 := 0 TO n2 DO (* string in buf kopieren *)
    				buf[n1] := pt^;
    				pt := pt + 1;
    			END_FOR
    		END_IF
    	END_IF

    END_CASE

    IF md5_mode > 0 THEN
    	MD5_STREAM(SIZE:=size, MODE:=md5_mode, BUF:=buf, MD5:=md5, POS=>pos);
    END_IF

    BASE64_DECODE_STR(RUN:=b64d_run, STR1:=str_192, STR2:=str_144, DONE=>b64d_done);
    BASE64_ENCODE_STR(RUN:=b64e_run, STR1:=str_144, STR2:=str_192, DONE=>b64e_done);

    (* revision history

    hm		10. mai. 2010	rev 1.0
    	original version
    *)
END_FUNCTION_BLOCK
