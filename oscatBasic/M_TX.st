FUNCTION_BLOCK M_TX
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=342*)
    (* check FOR RST INput *)
    IF RST OR (ET >= TMAX) THEN
    	rise := FALSE;
    	fall := FALSE;
    	startup := FALSE;
    	TH := t#0ms;
    	TL := t#0ms;
    	DC := 0.0;
    	F := 0.0;
    	ET := t#0s;
    END_IF

    (* avoid timers to start when INput is true at startup *)
    IF NOT startup THEN
    	edge := IN;
    	startup := TRUE;
    END_IF

    (* read system timer *)
    tx := DWORD_TO_TIME(T_PLC_MS());

    (* edge trigger risINg and fallINg edge *)
    IF IN XOR edge THEN
    	edge := IN;
    	(* risINg edge starts measurement *)
    	IF IN THEN
    		start := Tx;
    		rise := TRUE;
    		IF fall THEN TL := start - stop; END_IF
    		IF TH > t#0ms AND TL > t#0ms THEN
    			DC := TIME_TO_REAL(TH) / TIME_TO_REAL(TH+TL);
    			f := 1000.0 / TIME_TO_REAL(TH + TL);
    		END_IF
    	(* fallINg edge starts second cycle measurement *)
    	ELSE
    		stop := Tx;
    		fall := TRUE;
    		IF rise THEN TH := stop - start; END_IF
    		IF TH > t#0ms AND TL > t#0ms THEN
    			DC := TIME_TO_REAL(TH) /  TIME_TO_REAL(TH+TL);
    			f := 1000.0 / TIME_TO_REAL(TH + TL);
    		END_IF
    	END_IF
    END_IF
    IF rise THEN ET := tx - start; END_IF

    (* revision history
    hm	4. aug. 2006	rev 1.0
    	origINal version

    hm	2. mai. 2007	rev 1.1
    	made sure THat no undefINed values would be measured at startup conditions
    	added output ET
    	added RST INput
    	added TMAX INput

    hm	16. sep. 2007	rev 1.2
    	changes time() to T_plc_ms() for compatibility reasons

    hm	27. feb. 2009	rev 1.3
    	delETed unnecessary INit wiTH 0

    hm	11. mar. 2009	rev 1.4
    	changed real constants to use dot syntax

    *)
END_FUNCTION_BLOCK