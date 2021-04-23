FUNCTION_BLOCK BLIND_SET
    (*http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=91*)
    (* read system time *)
    tx := DWORD_TO_TIME(OSCAT_BASIC.T_PLC_MS());

    (* check INputs *)
    IF IN THEN
    	IF OVERRIDE_MANUAL OR (UP AND DN) THEN
    		STATUS := 178;
    	END_IF
    END_IF

    (* state machINe *)
    CASE STATUS OF
    	0: (* POwer on state *)
    		STATUS := S_IN;

    	178: (* force values from PX and AX *)
    		PO := PX;
    		AO := AX;
    		QU := TRUE;
    		QD := TRUE;
    		(* check for end of forced POsition *)
    		IF NOT IN THEN
    			STATUS := SEL(RESTORE_POSITION, S_IN, 179);
    			last := tx;
    		END_IF

    	179: (* restore previous POsition *)
    		PO := ps;
    		AO := as;
    		IF ((PO = PI) AND (AO = AI))  OR tx - last >= RESTORE_TIME THEN
    			STATUS := S_IN;
    		END_IF

    ELSE
    	(* no operation transfer INputs to outputs *)
    	PO := PI;
    	ps := PI;
    	AO := AI;
    	as := AI;
    	STATUS := S_IN;
    	QU := UP;
    	QD := DN;
    END_CASE


    (* revision history
    hm	27. jul 2009	rev 1.0
    	origINal release

    *)
END_FUNCTION_BLOCK