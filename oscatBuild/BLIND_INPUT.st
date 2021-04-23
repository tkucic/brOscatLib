FUNCTION_BLOCK BLIND_INPUT
    (*http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=80*)
    (* read system timer *)
    tx := DWORD_TO_TIME(OSCAT_BASIC.T_PLC_MS());

    (* INputs S1 and S2 are debounced and then decoded for multiple clicks *)
    S1e(IN := S1, pt := DEBOUNCE_TIME);
    S2e(IN := S2, pt := DEBOUNCE_TIME);
    S1d(IN := (S1e.Q AND NOT SINGLE_SWITCH) OR (S1e.Q AND SINGLE_SWITCH AND dir), t_long := CLICK_TIME);
    S2d(IN := (S2e.Q AND NOT SINGLE_SWITCH) OR (S1e.Q AND SINGLE_SWITCH AND NOT dir), t_long := CLICK_TIME);

    (* if D1 and D2 are not toggle clear them to make sure they are only active for oINe cycle *)
    IF NOT D1_TOGGLE THEN D1 := FALSE; END_IF
    IF NOT D2_TOGGLE THEN D2 := FALSE; END_IF

    (* decode actions *)
    IF (S1d.LONG AND S2d.LONG) OR (STATUS = 139) THEN
       STATUS := 139;
       IF NOT (S1d.LONG OR S2d.LONG)  THEN STATUS := 130; END_IF
    ELSIF S1d.tp_LONG THEN
    	STATUS := 132;
    ELSIF S2d.tp_LONG THEN
    	STATUS := 133;
    ELSIF  S1d.SINGLE THEN
    	IF CLICK_EN THEN
    		(* if runnINg then we stop otherwise start new direction *)
    		IF QU XOR QD THEN
    			STATUS := 131;
    		ELSE
    			STATUS := 134;
    			last := tx;
    			dir := NOT dir;
    		END_IF
    	END_IF
    ELSIF  S2d.SINGLE THEN
    	IF CLICK_EN THEN
    		(* if runnINg then we stop otherwise start new direction *)
    		IF QU XOR QD THEN
    			STATUS := 131;
    		ELSE
    			STATUS := 135;
    			last := tx;
    			dir := NOT dir;
    		END_IF
    	END_IF
    ELSIF IN THEN
    	STATUS := 136;
    	last := tx;
    ELSIF S1d.DOUBLE THEN
    	IF DBL_CLK1 THEN
    		(* a POSition need to be set for a double click on S1 *)
    		STATUS := 137;
    		last := tx;
    	ELSE
    		(* toggle the output when DBL_CLK1 is not active *)
    		D1 := NOT D1;
    	END_IF
    ELSIF S2d.DOUBLE THEN
    	IF DBL_CLK2 THEN
    		(* a POSition need to be set for a double click on S2 *)
    		STATUS := 138;
    		last := tx;
    	ELSE
    		(* toggle the output when DBL_CLK2 is not active *)
    		(* IN sINgle switch mode we need to toggle D1 INstead of D2 *)
    		IF sINgle_switch THEN D1 := NOT D1; ELSE D2 := NOT D2; END_IF
    	END_IF
    END_IF


    (* state machINe *)
    CASE STATUS OF
    	0:		(* POwer up operation *)
    			STATUS := 130;

    	130:	(* automatic operation standby *)
    			IF NOT MASTER_MODE THEN
    				PO := POS;
    				AO := ANG;
    			END_IF
    			QU := TRUE;
    			QD := TRUE;

    	131:	(* manual operation standby *)
    			QU := FALSE;
    			QD := FALSE;
    			PO := POS;
    			AO := ANG;
    			(* manual mode will be ended when timeout is reached *)
    			IF tx - last >= MANUAL_TIMEOUT THEN
    				STATUS := 130;
    			END_IF

    	132:	(* manual operation up *)
    			QU := TRUE;
    			QD := FALSE;
    			PO := POS; AO := ANG;
    			last := tx;
    			IF NOT S1d.LONG THEN STATUS := 131; dir := NOT dir; END_IF

    	133:	(* manual operation down *)
    			QU := FALSE;
    			QD := TRUE;
    			PO := POS; AO := ANG;
    			last := tx;
    			IF NOT S2d.LONG THEN	STATUS := 131; dir := NOT dir; END_IF

    	134:	(* manual operation sINgle click up *)
    			QU := TRUE;
    			QD := FALSE;
    			PO := POS; AO := ANG;
    			IF tx - last >= MAX_RUNTIME THEN STATUS := 131; END_IF

    	135:	(* manual operation sINgle click dn *)
    			QU := FALSE;
    			QD := TRUE;
    			PO := POS; AO := ANG;
    			IF tx - last >= MAX_RUNTIME THEN STATUS := 131;	END_IF

    	136:	(* forced INput IN = true *)
    			QU := TRUE;
    			QD := TRUE;
    			PO := PI; AO := AI;
    			IF tx-last >= MAX_RUNTIME THEN STATUS := 130; END_IF

    	137:	(* double click1 POSition *)
    			QU := TRUE;
    			QD := TRUE;
    			PO := DBL_POS1;
    			AO := DBL_ANG1;
    			IF tx - last >= MAX_RUNTIME THEN STATUS := 131; END_IF

    	138:	(* double click2 POSition *)
    			QU := TRUE;
    			QD := TRUE;
    			PO := DBL_POS2;
    			AO := DBL_ANG2;
    			IF tx - last >= MAX_RUNTIME THEN STATUS := 131; END_IF

    	   139:   (* manual operation standby *)
    	         QU := FALSE;
    	         QD := FALSE;
    	         PO := POS;
    	         AO := ANG;

    END_CASE


    (* revision history
    hm	29. sep 2007	rev 1.0
    	origINal release

    hm	6. oct 2007		rev 1.1
    	renamed ps and as to PO and AO

    hm	30. dec 2007	rev 1.2
    	added CLICK_TIMEout variable and function

    hm	16. jul. 2008	rev 1.3
    	rewirtten code to allow for more functionality
    	added sINgle click mode with sINgle_switch.
    	added Debounce for INputs S1 and S2
    	added double_click functionality

    hm	26. sep. 2008	rev 1.4
    	corrected an error while POS and ANG was transferred to outputs PO and AO durINg automatic modes

    hm	22. jan 2009	rev 1.5
    	added pulse mode for double click outputs
    	added automatic mode for IN

    hm	27. jul 2009	rev 1.6
    	chANGed STATUS 0 to 130

    HF	12. nov. 2009	rev 1.7
    	added state 139
    	set defaults for QU, QD, PO

    *)
END_FUNCTION_BLOCK
