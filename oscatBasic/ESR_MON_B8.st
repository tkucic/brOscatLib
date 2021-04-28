FUNCTION_BLOCK ESR_MON_B8
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=35*)
    (* read system timer *)
    tx := UDINT_TO_TIME(T_PLC_MS());

    ESR_FLAG := FALSE;
    ESR_OUT[3].TYP := 0;
    ESR_OUT[2].TYP := 0;
    ESR_OUT[1].TYP := 0;
    ESR_OUT[0].TYP := 0;
    cnt := 0;


    (* check if inputs have chaged and fill buffer *)
    IF S0 <> x0 THEN
    	ESR_OUT[cnt].TYP := 10;
        ESR_OUT[cnt].TYP.0 := S0;
    	ESR_OUT[cnt].ADRESS := A0;
    	ESR_OUT[cnt].DS := DT_IN;
    	ESR_OUT[cnt].TS := tx;
    	x0 := S0;
    	cnt := cnt + 1;
    	ESR_FLAG := TRUE;
    END_IF
    IF S1 <> x1 THEN
    	ESR_OUT[cnt].TYP := 10;
        ESR_OUT[cnt].TYP.0 := S1;
    	ESR_OUT[cnt].ADRESS := A1;
    	ESR_OUT[cnt].DS := DT_IN;
    	ESR_OUT[cnt].TS := tx;
    	x1 := S1;
    	cnt := cnt + 1;
    	ESR_FLAG := TRUE;
    END_IF
    IF S2 <> x2 THEN
    	ESR_OUT[cnt].TYP := 10;
        ESR_OUT[cnt].TYP.0 := S2;
    	ESR_OUT[cnt].ADRESS := A2;
    	ESR_OUT[cnt].DS := DT_IN;
    	ESR_OUT[cnt].TS := tx;
    	x2 := S2;
    	cnt := cnt + 1;
    	ESR_FLAG := TRUE;
    END_IF
    IF S3 <> x3 THEN
    	ESR_OUT[cnt].TYP := 10;
        ESR_OUT[cnt].TYP.0 := S3;
    	ESR_OUT[cnt].ADRESS := A3;
    	ESR_OUT[cnt].DS := DT_IN;
    	ESR_OUT[cnt].TS := tx;
    	x3 := S3;
    	cnt := cnt + 1;
    	ESR_FLAG := TRUE;
    END_IF
    IF S4 <> x4 AND cnt < 4 THEN
    	ESR_OUT[cnt].TYP := 10;
        ESR_OUT[cnt].TYP.0 := S4;
    	ESR_OUT[cnt].ADRESS := A4;
    	ESR_OUT[cnt].DS := DT_IN;
    	ESR_OUT[cnt].TS := tx;
    	x4 := S4;
    	cnt := cnt + 1;
    	ESR_FLAG := TRUE;
    END_IF
    IF S5 <> x5  AND cnt < 4 THEN
    	ESR_OUT[cnt].TYP := 10;
        ESR_OUT[cnt].TYP.0 := S5;
    	ESR_OUT[cnt].ADRESS := A5;
    	ESR_OUT[cnt].DS := DT_IN;
    	ESR_OUT[cnt].TS := tx;
    	x5 := S5;
    	cnt := cnt + 1;
    	ESR_FLAG := TRUE;
    END_IF
    IF S6 <> x6  AND cnt < 4 THEN
    	ESR_OUT[cnt].TYP := 10;
        ESR_OUT[cnt].TYP.0 := S6;
    	ESR_OUT[cnt].ADRESS := A6;
    	ESR_OUT[cnt].DS := DT_IN;
    	ESR_OUT[cnt].TS := tx;
    	x6 := S6;
    	cnt := cnt + 1;
    	ESR_FLAG := TRUE;
    END_IF
    IF S7 <> x7  AND cnt < 4 THEN
    	ESR_OUT[cnt].TYP := 10;
        ESR_OUT[cnt].TYP.0 := S7;
    	ESR_OUT[cnt].ADRESS := A7;
    	ESR_OUT[cnt].DS := DT_IN;
    	ESR_OUT[cnt].TS := tx;
    	x7 := S7;
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
