FUNCTION_BLOCK M_D
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=341*)
    (* check for RST input *)
    IF RST OR ET >= TMAX THEN
    	PT := t#0ms;
    	ET := t#0ms;
    	startup := FALSE;
    	RUN := FALSE;
    END_IF

    (* avoid timers to START when input is true at startup *)
    IF NOT startup THEN
    	edge_ := START;
    	startup := TRUE;
    END_IF

    (* read system timer *)
    tx := UDINT_TO_TIME(T_PLC_MS());

    (* detect rising edge_ on START *)
    IF START AND NOT edge_ AND NOT STOP THEN
    	T0 := tx;
    	RUN := TRUE;
    	PT := t#0s;
    ELSIF STOP AND RUN THEN
    	PT := ET;
    	RUN := FALSE;
    END_IF
    edge_ := START;
    IF RUN THEN ET := tx - T0; END_IF

    (* revision history
    hm		2.5.2007	rev 1.0
    	original version

    hm		16.9.2007	rev 1.1
    	changes time() to T_plc_ms() for compatibility reasons

    hm	27. feb 2009	rev 1.2
    	deleted unnecessary init with 0
    *)

END_FUNCTION_BLOCK
