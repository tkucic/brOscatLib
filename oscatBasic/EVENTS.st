FUNCTION_BLOCK EVENTS
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=122*)
    (* for performance reasons only activate once a day *)
    IF last_active <> DATE_IN THEN
    	last_active := DATE_IN;
    	y_int := FALSE;
    	name_int := '';
    	day_in := DAY_OF_DATE(DATE_IN);
    	cyr := YEAR_OF_DATE(DATE_IN);

    	(* search list for events *)
    	FOR i := 0 TO size DO
    		check := ELIST[i];
    		lday := DAY_OF_DATE(SET_DATE(cyr,check.MONTH, check.DAY));
    		IF day_in >= lday AND day_in <= lday + check.USE - 1 THEN
    			y_int := TRUE;
    			name_int := check.NAME;
    			EXIT;
    		END_IF
    	END_FOR
    END_IF

    IF ENA THEN
    	Y := y_int;
    	NAME := name_int;
    ELSE
    	Y := FALSE;
    	NAME := '';
    END_IF

    (* revision history
    hm  18. jan. 2011	rev 1.0
    	new module

    *)


END_FUNCTION_BLOCK
