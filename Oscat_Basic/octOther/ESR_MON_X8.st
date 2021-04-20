FUNCTION_BLOCK ESR_MON_X8
    (* read system timer *)
    tx := DWORD_TO_TIME(T_PLC_MS());

    ESR_Flag := FALSE;
    ESR_Out[3].TYP := 0;
    ESR_Out[2].TYP := 0;
    ESR_Out[1].TYP := 0;
    ESR_Out[0].TYP := 0;
    cnt := 0;


    (* check if inputs have chaged and fill buffer *)
    IF s0 <> x0 AND ((s0 < 100) OR (s0 > 99 AND s0 < 200 AND Mode >= 2) OR (s0 > 199 AND Mode = 3)) THEN
    	STATUS_TO_ESR(s0, a0, DT_in, tx, retVal:=ESR_Out[cnt]);
    	x0 := s0;
    	cnt := cnt + 1;
    	ESR_Flag := TRUE;
    END_IF
    IF s1 <> x1 AND ((s1 < 100) OR (s1 > 99 AND s1 < 200 AND Mode >= 2) OR (s1 > 199 AND Mode = 3)) THEN
    	STATUS_TO_ESR(s1, a1, DT_in, tx, retVal:=ESR_Out[cnt]);
    	x1 := s1;
    	cnt := cnt + 1;
    	ESR_Flag := TRUE;
    END_IF
    IF s2 <> x2 AND ((s2 < 100) OR (s2 > 99 AND s2 < 200 AND Mode >= 2) OR (s2 > 199 AND Mode = 3)) THEN
    	STATUS_TO_ESR(s2, a2, DT_in, tx, retVal:=ESR_Out[cnt]);
    	x2 := s2;
    	cnt := cnt + 1;
    	ESR_Flag := TRUE;
    END_IF
    IF s3 <> x3 AND ((s3 < 100) OR (s3 > 99 AND s3 < 200 AND Mode >= 2) OR (s3 > 199 AND Mode = 3)) THEN
    	STATUS_TO_ESR(s3, a3, DT_in, tx, retVal:=ESR_Out[cnt]);
    	x3 := s3;
    	cnt := cnt + 1;
    	ESR_Flag := TRUE;
    END_IF
    IF cnt < 4 AND s4 <> x4 AND ((s4 < 100) OR (s4 > 99 AND s4 < 200 AND Mode >= 2) OR (s4 > 199 AND Mode = 3)) THEN
    	STATUS_TO_ESR(s4, a4, DT_in, tx, retVal:=ESR_Out[cnt]);
    	x4 := s4;
    	cnt := cnt + 1;
    	ESR_Flag := TRUE;
    END_IF
    IF cnt < 4 AND s5 <> x5 AND ((s5 < 100) OR (s5 > 99 AND s5 < 200 AND Mode >= 2) OR (s5 > 199 AND Mode = 3)) THEN
    	STATUS_TO_ESR(s5, a5, DT_in, tx, retVal:=ESR_Out[cnt]);
    	x5 := s5;
    	cnt := cnt + 1;
    	ESR_Flag := TRUE;
    END_IF
    IF cnt < 4 AND s6 <> x6 AND ((s6 < 100) OR (s6 > 99 AND s6 < 200 AND Mode >= 2) OR (s6 > 199 AND Mode = 3)) THEN
    	STATUS_TO_ESR(s6, a6, DT_in, tx, retVal:=ESR_Out[cnt]);
    	x6 := s6;
    	cnt := cnt + 1;
    	ESR_Flag := TRUE;
    END_IF
    IF cnt < 4 AND s7 <> x7 AND ((s7 < 100) OR (s7 > 99 AND s7 < 200 AND Mode >= 2) OR (s7 > 199 AND Mode = 3)) THEN
    	STATUS_TO_ESR(s7, a7, DT_in, tx, retVal:=ESR_Out[cnt]);
    	x7 := s7;
    	cnt := cnt + 1;
    	ESR_Flag := TRUE;
    END_IF


    (* revision history
    hm	26. jan 2007		rev 1.0
    	original version

    hm	17. sep 2007	rev 1.1
    	replaced time() with T_PLC_MS() for compatibility reasons

    hm	1. dec. 2009	rev 1.2
    	changed ESR_Out to be I/O


    *)
END_FUNCTION_BLOCK
