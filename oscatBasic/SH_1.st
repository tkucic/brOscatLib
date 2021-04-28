FUNCTION_BLOCK SH_1
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=300*)
    (* read system time *)
    tx := UDINT_TO_TIME(T_PLC_MS());

    IF tx - last >= PT THEN
    	last := tx;
    	OUT := IN;
    	TRIG := TRUE;
    ELSE
    	TRIG := FALSE;
    END_IF

    (* revision history

    HM	6.1.2007	rev 1.1
    	added TRIG output

    HM	17.9.2007	rev 1.2
    	replaced time() with T_PLC_MS() for compatibility reasons
    *)


END_FUNCTION_BLOCK
