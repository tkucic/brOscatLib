FUNCTION_BLOCK PIN_CODE
    tp := FALSE;
    IF e THEN
    	IF CB = CODE(pin, pos) THEN
    		pos := pos + 1;
    		IF pos > LEN(PIN) THEN
    			(* proper code is detected *)
    			TP := TRUE;
    			pos := 1;
    		END_IF
    	ELSE
    		pos := 1;
    	END_IF
    END_IF


    (* revision history
    hm	30. oct. 2008	rev 1.0		
    	original version 


    *)

END_FUNCTION_BLOCK
