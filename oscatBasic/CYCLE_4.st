FUNCTION_BLOCK CYCLE_4
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=194*)
    (* read system timer *)
    tx := UDINT_TO_TIME(T_PLC_MS());
    (* init on first cycle *)
    IF NOT init THEN
    	init := TRUE;
    	last := tx;
    END_IF

    IF E THEN
    	IF SL THEN
    		(* when SX > 0 then the STATE SX is forced to start *)
    		STATE:= LIMIT(0,SX,3);
    		last := tx;
    		(* this is to avoid to reset SX from the calling programm it does work fine on codesys but i am not sure about other systems, because we are writing to an input *)
    		SL := FALSE;
    	ELSE
    		CASE STATE OF
    			0 :	(* wait for T0 and switch to next cycle *)
    				IF tx - last >= T0 THEN
    					STATE := 1;
    					last := tx;
    				END_IF
    			1 : (* wait for T1 over 1st cycle *)
    				IF tx - last >= T1 THEN
    					STATE := 2;
    					last := tx;
    				END_IF
    			2 : (* wait for T1 over 1st cycle *)
    				IF tx - last >= T2 THEN
    					STATE := 3;
    					last := tx;
    				END_IF
    			3 : (* wait for T2 over 2nd cycle *)
    				IF tx - last >= T3 THEN
    					IF S0 THEN STATE := 0; END_IF (* if S0 is false, the sequence stops at STATE 3 *)
    					last := tx;
    				END_IF
    		END_CASE
    	END_IF
    ELSE
    	STATE := 0;
    	last := tx;
    END_IF



    (*
    hm	3. nov. 2008	rev 1.0
    	original version

    *)
END_FUNCTION_BLOCK
