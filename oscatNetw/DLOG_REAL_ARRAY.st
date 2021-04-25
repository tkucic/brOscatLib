FUNCTION_BLOCK DLOG_REAL_ARRAY
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=46*)
    FOR idx := 1 TO R_COUNT DO

    	CASE x.ADD_COM OF

    	01:	(* ADD INFO *)
    		X.ID_MAX := X.ID_MAX + USINT#1;
    		id := WORD#16#0201; (* Quelltype REAL , Zieltype STRING *)
    		(* automatisch Namen vergeben *)
    		IF LEN(R_ARRAY[idx].COLUMN) = 0 THEN
    			R_ARRAY[idx].COLUMN := CONCAT('Spalte_',USINT_TO_STRING(X.ID_MAX));
    		END_IF;
    	02:	(* ADD HEADER *)
    		X.UCB.D_STRING := R_ARRAY[idx].COLUMN;
    		X.UCB.D_HEAD := id;
    		X.UCB.D_MODE := 1;
    		UCB(DATA:=X.UCB); (* Daten eintragen *)
    	03:	(* ADD DATA *)
    		X.UCB.D_STRING := OSCAT_BASIC.REAL_TO_STRF(IN:=R_ARRAY[idx]._value_last,N:=N,D:=D);
    		X.UCB.D_HEAD := id;
    		X.UCB.D_MODE := 1;
    		UCB(DATA:=X.UCB); (* Daten eintragen *)
    		R_ARRAY[idx]._delta_last := R_ARRAY[idx]._value_last;
    	04:	(* ADD DATA REQ *)
    		IF R_ARRAY[idx].DELTA <> 0.0 THEN
    			IF R_ARRAY[idx].VALUE <= (R_ARRAY[idx]._delta_last - R_ARRAY[idx].DELTA) OR R_ARRAY[idx].VALUE >= (R_ARRAY[idx]._delta_last + R_ARRAY[idx].DELTA) THEN
    				X.ADD_DATA_REQ := TRUE;
    				R_ARRAY[idx]._delta_last := R_ARRAY[idx].VALUE;
    			END_IF;
    		END_IF;
    	END_CASE;
    	R_ARRAY[idx]._value_last := R_ARRAY[idx].VALUE;

    END_FOR;

    (* revision history
    ks	03. mar. 2016	rev 1.0
    	original version

    *)
END_FUNCTION_BLOCK
