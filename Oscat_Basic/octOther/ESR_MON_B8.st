FUNCTION_BLOCK ESR_MON_B8
    (* read system timer *)
    tx := DWORD_TO_TIME(T_PLC_MS());

    ESR_Flag := FALSE;
    ESR_Out[3].TYP := 0;
    ESR_Out[2].TYP := 0;
    ESR_Out[1].TYP := 0;
    ESR_Out[0].TYP := 0;
    cnt := 0;


    (* check if inputs have chaged and fill buffer *)
    IF s0 <> x0 THEN
    	ESR_Out[cnt].TYP := 10;
        ESR_Out[cnt].TYP.0 := s0;
    	ESR_Out[cnt].ADRESS := a0;
    	ESR_Out[cnt].DS := DT_in;
    	ESR_Out[cnt].TS := tx;
    	x0 := s0;
    	cnt := cnt + 1;
    	ESR_Flag := TRUE;
    END_IF
    IF s1 <> x1 THEN
    	ESR_Out[cnt].TYP := 10;
        ESR_Out[cnt].TYP.0 := s1;
    	ESR_Out[cnt].ADRESS := a1;
    	ESR_Out[cnt].DS := DT_in;
    	ESR_Out[cnt].TS := tx;
    	x1 := s1;
    	cnt := cnt + 1;
    	ESR_Flag := TRUE;
    END_IF
    IF s2 <> x2 THEN
    	ESR_Out[cnt].TYP := 10;
        ESR_Out[cnt].TYP.0 := s2;
    	ESR_Out[cnt].ADRESS := a2;
    	ESR_Out[cnt].DS := DT_in;
    	ESR_Out[cnt].TS := tx;
    	x2 := s2;
    	cnt := cnt + 1;
    	ESR_Flag := TRUE;
    END_IF
    IF s3 <> x3 THEN
    	ESR_Out[cnt].TYP := 10;
        ESR_Out[cnt].TYP.0 := s3;
    	ESR_Out[cnt].ADRESS := a3;
    	ESR_Out[cnt].DS := DT_in;
    	ESR_Out[cnt].TS := tx;
    	x3 := s3;
    	cnt := cnt + 1;
    	ESR_Flag := TRUE;
    END_IF
    IF s4 <> x4 AND cnt < 4 THEN
    	ESR_Out[cnt].TYP := 10;
        ESR_Out[cnt].TYP.0 := s4;
    	ESR_Out[cnt].ADRESS := a4;
    	ESR_Out[cnt].DS := DT_in;
    	ESR_Out[cnt].TS := tx;
    	x4 := s4;
    	cnt := cnt + 1;
    	ESR_Flag := TRUE;
    END_IF
    IF s5 <> x5  AND cnt < 4 THEN
    	ESR_Out[cnt].TYP := 10;
        ESR_Out[cnt].TYP.0 := s5;
    	ESR_Out[cnt].ADRESS := a5;
    	ESR_Out[cnt].DS := DT_in;
    	ESR_Out[cnt].TS := tx;
    	x5 := s5;
    	cnt := cnt + 1;
    	ESR_Flag := TRUE;
    END_IF
    IF s6 <> x6  AND cnt < 4 THEN
    	ESR_Out[cnt].TYP := 10;
        ESR_Out[cnt].TYP.0 := s6;
    	ESR_Out[cnt].ADRESS := a6;
    	ESR_Out[cnt].DS := DT_in;
    	ESR_Out[cnt].TS := tx;
    	x6 := s6;
    	cnt := cnt + 1;
    	ESR_Flag := TRUE;
    END_IF
    IF s7 <> x7  AND cnt < 4 THEN
    	ESR_Out[cnt].TYP := 10;
        ESR_Out[cnt].TYP.0 := s7;
    	ESR_Out[cnt].ADRESS := a7;
    	ESR_Out[cnt].DS := DT_in;
    	ESR_Out[cnt].TS := tx;
    	x7 := s7;
    	cnt := cnt + 1;
    	ESR_Flag := TRUE;
    END_IF

    (* revision history
    hm	26. jan 2007	rev 1.0
    	original version

    hm	17. sep 2007	rev 1.1
    	replaced time() with T_PLC_MS() for compatibility reasons

    hm	22. oct. 2008	rev 1.2
    	optimized code

    hm	1.dec. 2009	rev 1.3
    	changed ESR_Out to be I/O

    *)
END_FUNCTION_BLOCK
