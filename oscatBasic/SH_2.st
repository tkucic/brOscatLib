FUNCTION_BLOCK SH_2
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=301*)
    (* read system time *)
    tx := UDINT_TO_TIME(T_PLC_MS());
    d2 := SHR(DISC,1);

    IF tx - last >= PT THEN
    	last := tx;
    	TRIG := TRUE;

    	(* limit M to 0..16 *)
    	M := LIMIT(1,N,16);

    	(* edge detected lets take the sample *)
    	FOR i := M - 1 TO 1 BY -1 DO buf2[i] := buf2[i-1]; END_FOR
    	buf2[0] := IN;
    	OUT := IN;
    	buf := buf2;

    	(* sort the ARRAY lowest value AT 0 *)
    	FOR start := 0 TO M - 2 DO
    		FOR i := start+1 TO M - 1 DO
    			IF buf[start] > buf[i] THEN
    				temp := buf[start];
    				buf[start] := buf[i];
    				buf[i] := temp;
    			END_IF
    		END_FOR
    	END_FOR

    	(* any calculation with the samples is here *)
    	stop := M - 1 - d2;
    	start := d2;
    	IF NOT EVEN(DISC) THEN start := start + 1; END_IF
    	AVG := 0;
    	FOR i := start TO stop DO AVG := AVG + buf[i]; END_FOR
    	AVG := AVG / INT_TO_REAL(stop - start +1);
    	LOW := buf[start];
    	HIGH := buf[stop];
    ELSE
    	TRIG := FALSE;
    END_IF

    (* revision history
    hm 20. jan. 2007	rev 1.1
    	added input N to specify the amout of samples for average and HIGH LOW calculations
    	added TRIG output

    hm 10. sep. 2007 	rev 1.2
    	an error would be generated if N was set to 0, now N is forced to1 if set to 0.
    	index was OUT of array.

    hm	17. sep. 2007	rev 1.3
    	replaced time() with t_plc_ms() for compatibility reasons

    hm	6. jan. 2008	rev 1.4
    	improved performance

    hm	14. jun. 2008	rev 1.5
    	set default for input N = 16

    hm	10. mar. 2009	rev 1.6
    	added type conversion for compatibility reasons

    *)
END_FUNCTION_BLOCK
