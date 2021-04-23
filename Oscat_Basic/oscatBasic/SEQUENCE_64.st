FUNCTION_BLOCK SEQUENCE_64
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=202*)
    (* read system timer *)
    tx := DWORD_TO_TIME(T_PLC_MS());
    TRIG := FALSE;

    IF RST THEN
    	STATE := -1;

    (* start sequence *)
    ELSIF START AND NOT edge THEN
    	STATE := 0;
    	last := tx;
    	TRIG := TRUE;

    (* sequence generator *)
    ELSIF (STATE >= 0) THEN
    	IF (tx - last) >= PROG[STATE] THEN
    		STATE := INC2(STATE, 1, -1, SMAX);
    		last := tx;
    		TRIG := TRUE;
    	END_IF
    END_IF

    edge := START;



    (* revision history
    hm	29. jun. 2008
    	original version

    *)
END_FUNCTION_BLOCK