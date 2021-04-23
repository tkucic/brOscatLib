FUNCTION_BLOCK ESR_MON_X8
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=36*)
    (* read system timer *)
    tx := DWORD_TO_TIME(T_PLC_MS());

    ESR_Flag := FALSE;
    ESR_OUT[3].typ := 0;
    ESR_OUT[2].typ := 0;
    ESR_OUT[1].typ := 0;
    ESR_OUT[0].typ := 0;
    cnt := 0;


    (* check if inputs have chaged and fill buffer *)
    IF S0 <> X0 AND ((S0 < 100) OR (S0 > 99 AND S0 < 200 AND MODE >= 2) OR (S0 > 199 AND MODE = 3)) THEN
    	ESR_OUT[cnt] := status_to_ESR(S0, A0, DT_in, TX);
    	X0 := S0;
    	cnt := cnt + 1;
    	ESR_FLAG := TRUE;
    END_IF
    IF S1 <> X1 AND ((S1 < 100) OR (S1 > 99 AND S1 < 200 AND MODE >= 2) OR (S1 > 199 AND MODE = 3)) THEN
    	ESR_OUT[cnt] := status_to_ESR(S1, A1, DT_in, TX);
    	X1 := S1;
    	cnt := cnt + 1;
    	ESR_FLAG := TRUE;
    END_IF
    IF S2 <> X2 AND ((S2 < 100) OR (S2 > 99 AND S2 < 200 AND MODE >= 2) OR (S2 > 199 AND MODE = 3)) THEN
    	ESR_OUT[cnt] := status_to_ESR(S2, A2, DT_in, TX);
    	X2 := S2;
    	cnt := cnt + 1;
    	ESR_FLAG := TRUE;
    END_IF
    IF S3 <> X3 AND ((S3 < 100) OR (S3 > 99 AND S3 < 200 AND MODE >= 2) OR (S3 > 199 AND MODE = 3)) THEN
    	ESR_OUT[cnt] := status_to_ESR(S3, A3, DT_in, TX);
    	X3 := S3;
    	cnt := cnt + 1;
    	ESR_FLAG := TRUE;
    END_IF
    IF cnt < 4 AND S4 <> X4 AND ((S4 < 100) OR (S4 > 99 AND S4 < 200 AND MODE >= 2) OR (S4 > 199 AND MODE = 3)) THEN
    	ESR_OUT[cnt] := status_to_ESR(S4, A4, DT_in, TX);
    	X4 := S4;
    	cnt := cnt + 1;
    	ESR_FLAG := TRUE;
    END_IF
    IF cnt < 4 AND S5 <> X5 AND ((S5 < 100) OR (S5 > 99 AND S5 < 200 AND MODE >= 2) OR (S5 > 199 AND MODE = 3)) THEN
    	ESR_OUT[cnt] := status_to_ESR(S5, A5, DT_in, TX);
    	X5 := S5;
    	cnt := cnt + 1;
    	ESR_FLAG := TRUE;
    END_IF
    IF cnt < 4 AND S6 <> X6 AND ((S6 < 100) OR (S6 > 99 AND S6 < 200 AND MODE >= 2) OR (S6 > 199 AND MODE = 3)) THEN
    	ESR_OUT[cnt] := status_to_ESR(S6, A6, DT_in, TX);
    	X6 := S6;
    	cnt := cnt + 1;
    	ESR_FLAG := TRUE;
    END_IF
    IF cnt < 4 AND S7 <> X7 AND ((S7 < 100) OR (S7 > 99 AND S7 < 200 AND MODE >= 2) OR (S7 > 199 AND MODE = 3)) THEN
    	ESR_OUT[cnt] := status_to_ESR(S7, A7, DT_in, TX);
    	X7 := S7;
    	cnt := cnt + 1;
    	ESR_FLAG := TRUE;
    END_IF


    (* revision history
    hm	26. jan 2007		rev 1.0
    	original version

    hm	17. sep 2007	rev 1.1
    	replaced time() with T_PLC_MS() for compatibility reasons

    hm	1. dec. 2009	rev 1.2
    	changed ESR_OUT to be I/O


    *)
END_FUNCTION_BLOCK
