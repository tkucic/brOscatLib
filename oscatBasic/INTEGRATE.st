FUNCTION_BLOCK INTEGRATE
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=426*)
    (*read system time *)
    tx := T_PLC_MS();

    IF NOT init THEN
    	init := TRUE;
    	X_last := X;
    ELSIF E THEN
    	Y := (X + X_last) * 0.5E-3 * UDINT_TO_REAL(tx-last) * K + Y;
    	X_last := X;
    END_IF
    last := tx;



    (*
    hm 3. nov. 2008	rev 1.0
    original version
    	
    *)

END_FUNCTION_BLOCK
