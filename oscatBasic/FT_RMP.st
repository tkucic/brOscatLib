FUNCTION_BLOCK FT_RMP
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=100*)
    (* read system time *)
    tx := UDINT_TO_TIME(T_PLC_MS()) - last;

    IF NOT init THEN
    	init := TRUE;
    	last := tx;
    	tx := t#0s;
    	OUT := IN;
    END_IF
    IF NOT RMP THEN
    	OUT := IN;
    	BUSY := FALSE;
    ELSIF OUT > IN THEN
    	(* ramp down *)
    	OUT := OUT - TIME_TO_REAL(tx) * 0.001 * KF;
    	OUT := MAX(IN, OUT);
    ELSIF OUT < IN THEN
    	(* ramp up *)
    	OUT := OUT + TIME_TO_REAL(tx) * 0.001 * KR;
    	OUT := MIN(IN, OUT);
    END_IF

    (* set BUSY and dir flags *)
    IF OUT < IN THEN
    	BUSY := TRUE;
    	UD := TRUE;
    ELSIF OUT > IN THEN
    	BUSY := TRUE;
    	UD := FALSE;
    ELSE
    	BUSY := FALSE;
    END_IF
    last := last + tx;


    (* revision history:

    hm 8.10.2006			rev 1.1
    	added UD output

    hm 12. feb 2007		rev 1.2
    	added init variable and corrected a possible startup problem

    hm	17. sep 2007	rev 1.3
    	replaced time() with t_plc_ms() for compatibility reasons

    hm	25. jan 2008	rev 1.4
    	performance improvements
    	allow KR and KF to be 0
    *)
END_FUNCTION_BLOCK
