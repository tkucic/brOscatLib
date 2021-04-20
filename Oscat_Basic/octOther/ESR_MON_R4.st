FUNCTION_BLOCK ESR_MON_R4
    (* read system timer *)
    tx := DWORD_TO_TIME(T_PLC_MS());
    p0 := ADR(R0);
    p1 := ADR(R1);
    p2 := ADR(R2);
    p3 := ADR(R3);

    ESR_Flag := FALSE;
    ESR_Out[3].TYP := 0;
    ESR_Out[2].TYP := 0;
    ESR_Out[1].TYP := 0;
    ESR_Out[0].TYP := 0;
    cnt := 0;

    (* check if inputs have chaged and fill buffer *)
    IF DIFFER(R0,  x0, s0) THEN
    	ESR_Out[cnt].TYP := 20;
    	ESR_Out[cnt].ADRESS := a0;
    	ESR_Out[cnt].DS := DT_in;
    	ESR_Out[cnt].TS := tx;
    	ESR_Out[cnt].DATA[0] := Byte_of_Dword(p0^,0);
    	ESR_Out[cnt].DATA[1] := Byte_of_Dword(p0^,1);
    	ESR_Out[cnt].DATA[2] := Byte_of_Dword(p0^,2);
    	ESR_Out[cnt].DATA[3] := Byte_of_Dword(p0^,3);
    	x0 := R0;
    	cnt := cnt + 1;
    	ESR_Flag := TRUE;
    END_IF
    IF DIFFER(R1,  x1, s1) THEN
    	ESR_Out[cnt].TYP := 20;
    	ESR_Out[cnt].ADRESS := a1;
    	ESR_Out[cnt].DS := DT_in;
    	ESR_Out[cnt].TS := tx;
    	ESR_Out[cnt].DATA[0] := Byte_of_Dword(p1^,0);
    	ESR_Out[cnt].DATA[1] := Byte_of_Dword(p1^,1);
    	ESR_Out[cnt].DATA[2] := Byte_of_Dword(p1^,2);
    	ESR_Out[cnt].DATA[3] := Byte_of_Dword(p1^,3);
    	x1 := R1;
    	cnt := cnt + 1;
    	ESR_Flag := TRUE;
    END_IF
    IF DIFFER(R2,  x2, s2) THEN
    	ESR_Out[cnt].TYP := 20;
    	ESR_Out[cnt].ADRESS := a2;
    	ESR_Out[cnt].DS := DT_in;
    	ESR_Out[cnt].TS := tx;
    	ESR_Out[cnt].DATA[0] := Byte_of_Dword(p2^,0);
    	ESR_Out[cnt].DATA[1] := Byte_of_Dword(p2^,1);
    	ESR_Out[cnt].DATA[2] := Byte_of_Dword(p2^,2);
    	ESR_Out[cnt].DATA[3] := Byte_of_Dword(p2^,3);
    	x2 := R2;
    	cnt := cnt + 1;
    	ESR_Flag := TRUE;
    END_IF
    IF DIFFER(R3,  x3, s3) THEN
    	ESR_Out[cnt].TYP := 20;
    	ESR_Out[cnt].ADRESS := a3;
    	ESR_Out[cnt].DS := DT_in;
    	ESR_Out[cnt].TS := tx;
    	ESR_Out[cnt].DATA[0] := Byte_of_Dword(p3^,0);
    	ESR_Out[cnt].DATA[1] := Byte_of_Dword(p3^,1);
    	ESR_Out[cnt].DATA[2] := Byte_of_Dword(p3^,2);
    	ESR_Out[cnt].DATA[3] := Byte_of_Dword(p3^,3);
    	x3 := R3;
    	cnt := cnt + 1;
    	ESR_Flag := TRUE;
    END_IF


    (* revision history
    hm	26. jan 2007	rev 1.0
    	original version

    hm	17. sep. 2007		rev 1.1
    	replaced time() with T_PLC_MS() for compatibility reasons

    hm	8. dec. 2007		rev 1.2
    	corrected an error while esr TYP would not be set

    hm	16. mar. 2008		rev 1.3
    	deleted wrong conversion real_to_dword

    hm	1. dec 2009		rev 1.4
    	changed ESR_Out to be I/O

    *)

END_FUNCTION_BLOCK
