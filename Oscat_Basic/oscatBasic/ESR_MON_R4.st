FUNCTION_BLOCK ESR_MON_R4
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=35*)
    (* read system timer *)
    tx := DWORD_TO_TIME(T_PLC_MS());
    P0 := ADR(R0);
    P1 := ADR(R1);
    P2 := ADR(R2);
    P3 := ADR(R3);

    ESR_Flag := FALSE;
    esr_out[3].typ := 0;
    esr_out[2].typ := 0;
    esr_out[1].typ := 0;
    esr_out[0].typ := 0;
    cnt := 0;

    (* check if inputs have chaged and fill buffer *)
    IF DIFFER(R0,  X0, S0) THEN
    	esr_out[cnt].typ := 20;
    	esr_out[cnt].adress := a0;
    	esr_out[cnt].DS := DT_in;
    	esr_out[cnt].TS := TX;
    	esr_out[cnt].data[0] := Byte_of_Dword(P0^,0);
    	esr_out[cnt].data[1] := Byte_of_Dword(P0^,1);
    	esr_out[cnt].data[2] := Byte_of_Dword(P0^,2);
    	esr_out[cnt].data[3] := Byte_of_Dword(P0^,3);
    	X0 := R0;
    	cnt := cnt + 1;
    	esr_flag := TRUE;
    END_IF
    IF differ(R1,  X1, S1) THEN
    	esr_out[cnt].typ := 20;
    	esr_out[cnt].adress := a1;
    	esr_out[cnt].DS := DT_in;
    	esr_out[cnt].TS := TX;
    	esr_out[cnt].data[0] := Byte_of_Dword(P1^,0);
    	esr_out[cnt].data[1] := Byte_of_Dword(P1^,1);
    	esr_out[cnt].data[2] := Byte_of_Dword(P1^,2);
    	esr_out[cnt].data[3] := Byte_of_Dword(P1^,3);
    	X1 := R1;
    	cnt := cnt + 1;
    	esr_flag := TRUE;
    END_IF
    IF differ(R2,  X2, S2) THEN
    	esr_out[cnt].typ := 20;
    	esr_out[cnt].adress := a2;
    	esr_out[cnt].DS := DT_in;
    	esr_out[cnt].TS := TX;
    	esr_out[cnt].data[0] := Byte_of_Dword(P2^,0);
    	esr_out[cnt].data[1] := Byte_of_Dword(P2^,1);
    	esr_out[cnt].data[2] := Byte_of_Dword(P2^,2);
    	esr_out[cnt].data[3] := Byte_of_Dword(P2^,3);
    	X2 := R2;
    	cnt := cnt + 1;
    	esr_flag := TRUE;
    END_IF
    IF DIFFER(R3,  X3, S3) THEN
    	esr_out[cnt].typ := 20;
    	esr_out[cnt].adress := a3;
    	esr_out[cnt].DS := DT_in;
    	esr_out[cnt].TS := TX;
    	esr_out[cnt].data[0] := Byte_of_Dword(P3^,0);
    	esr_out[cnt].data[1] := Byte_of_Dword(P3^,1);
    	esr_out[cnt].data[2] := Byte_of_Dword(P3^,2);
    	esr_out[cnt].data[3] := Byte_of_Dword(P3^,3);
    	X3 := R3;
    	cnt := cnt + 1;
    	esr_flag := TRUE;
    END_IF


    (* revision history
    hm	26. jan 2007	rev 1.0
    	original version

    hm	17. sep. 2007		rev 1.1
    	replaced time() with T_PLC_MS() for compatibility reasons

    hm	8. dec. 2007		rev 1.2
    	corrected an error while esr typ would not be set

    hm	16. mar. 2008		rev 1.3
    	deleted wrong conversion real_to_dword

    hm	1. dec 2009		rev 1.4
    	changed esr_out to be I/O

    *)

END_FUNCTION_BLOCK
