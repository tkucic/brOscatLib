FUNCTION_BLOCK ESR_MON_B8
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=35*)
    (* read system timer *)
    tx := DWORD_TO_TIME(T_PLC_MS());

    ESR_Flag := FALSE;
    ESR_OUT[3].typ := 0;
    ESR_OUT[2].typ := 0;
    ESR_OUT[1].typ := 0;
    ESR_OUT[0].typ := 0;
    cnt := 0;


    (* check if inputs have chaged and fill buffer *)
    IF S0 <> X0 THEN
    	ESR_OUT[cnt].typ := 10 + BOOL_TO_BYTE(S0);
    	ESR_OUT[cnt].adress := A0;
    	ESR_OUT[cnt].DS := DT_in;
    	ESR_OUT[cnt].TS := TX;
    	X0 := S0;
    	cnt := cnt + 1;
    	ESR_FLAG := TRUE;
    END_IF
    IF S1 <> X1 THEN
    	ESR_OUT[cnt].typ := 10 + BOOL_TO_BYTE(S1);
    	ESR_OUT[cnt].adress := A1;
    	ESR_OUT[cnt].DS := DT_in;
    	ESR_OUT[cnt].TS := TX;
    	X1 := S1;
    	cnt := cnt + 1;
    	ESR_FLAG := TRUE;
    END_IF
    IF S2 <> X2 THEN
    	ESR_OUT[cnt].typ := 10 + BOOL_TO_BYTE(S2);
    	ESR_OUT[cnt].adress := A2;
    	ESR_OUT[cnt].DS := DT_in;
    	ESR_OUT[cnt].TS := TX;
    	X2 := S2;
    	cnt := cnt + 1;
    	ESR_FLAG := TRUE;
    END_IF
    IF S3 <> X3 THEN
    	ESR_OUT[cnt].typ := 10 + BOOL_TO_BYTE(S3);
    	ESR_OUT[cnt].adress := A3;
    	ESR_OUT[cnt].DS := DT_in;
    	ESR_OUT[cnt].TS := TX;
    	X3 := S3;
    	cnt := cnt + 1;
    	ESR_FLAG := TRUE;
    END_IF
    IF S4 <> X4 AND cnt < 4 THEN
    	ESR_OUT[cnt].typ := 10 + BOOL_TO_BYTE(S4);
    	ESR_OUT[cnt].adress := A4;
    	ESR_OUT[cnt].DS := DT_in;
    	ESR_OUT[cnt].TS := TX;
    	X4 := S4;
    	cnt := cnt + 1;
    	ESR_FLAG := TRUE;
    END_IF
    IF S5 <> X5  AND cnt < 4 THEN
    	ESR_OUT[cnt].typ := 10 + BOOL_TO_BYTE(S5);
    	ESR_OUT[cnt].adress := A5;
    	ESR_OUT[cnt].DS := DT_in;
    	ESR_OUT[cnt].TS := TX;
    	X5 := S5;
    	cnt := cnt + 1;
    	ESR_FLAG := TRUE;
    END_IF
    IF S6 <> X6  AND cnt < 4 THEN
    	ESR_OUT[cnt].typ := 10 + BOOL_TO_BYTE(S6);
    	ESR_OUT[cnt].adress := A6;
    	ESR_OUT[cnt].DS := DT_in;
    	ESR_OUT[cnt].TS := TX;
    	X6 := S6;
    	cnt := cnt + 1;
    	ESR_FLAG := TRUE;
    END_IF
    IF S7 <> X7  AND cnt < 4 THEN
    	ESR_OUT[cnt].typ := 10 + BOOL_TO_BYTE(S7);
    	ESR_OUT[cnt].adress := A7;
    	ESR_OUT[cnt].DS := DT_in;
    	ESR_OUT[cnt].TS := TX;
    	X7 := S7;
    	cnt := cnt + 1;
    	ESR_FLAG := TRUE;
    END_IF

    (* revision history
    hm	26. jan 2007	rev 1.0
    	original version

    hm	17. sep 2007	rev 1.1
    	replaced time() with T_PLC_MS() for compatibility reasons

    hm	22. oct. 2008	rev 1.2
    	optimized code

    hm	1.dec. 2009	rev 1.3
    	changed ESR_OUT to be I/O

    *)
END_FUNCTION_BLOCK
