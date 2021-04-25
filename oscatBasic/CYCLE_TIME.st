FUNCTION_BLOCK CYCLE_TIME
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=338*)
    tx := UDINT_TO_TIME(T_PLC_MS()) - last_cycle;
    IF RST THEN
    	CT_MIN := t#10h;
    	CT_MAX := t#0ms;
    	CYCLES := 0;
    ELSIF last_cycle > t#0s THEN
    	IF tx < CT_MIN THEN CT_MIN := tx;
    	ELSIF tx > CT_MAX THEN CT_MAX := tx;
    	END_IF
    	CT_LAST := tx;
    ELSIF CT_MIN = t#0s THEN
    	CT_MIN := t#0s - t#1ms;
    END_IF
    IF init THEN
    	SYSTIME := SYSTIME + tx;
    		IF SYSTIME >= t#1d THEN
    			SYSTIME := SYSTIME - t#1d;
    			SYSDAYS := SYSDAYS + 1;
    		END_IF
    END_IF
    init := TRUE;
    last_cycle := last_cycle + tx;
    CYCLES := CYCLES + 1;

    (*	revision history
    hm 12.12.2006		rev 1.1
    	added CYCLES output, a UDINT cycle counter.
    hm 10.3.2007			rev 1.2
    	changed initialization of CT_MIN to t#10h for compatibility with siemens s7

    hm	16.9.2007		rev 1.2
    	changed Time() in T_PLC_MS() for compatibility resons

    *)
END_FUNCTION_BLOCK
