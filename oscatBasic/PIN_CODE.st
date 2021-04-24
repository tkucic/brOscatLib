FUNCTION_BLOCK PIN_CODE
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=231*)
    TP := FALSE;
    IF E THEN
    	IF CB = CODE(PIN, POS) THEN
    		POS := POS + 1;
    		IF POS > LEN(PIN) THEN
    			(* proper code is detected *)
    			TP := TRUE;
    			POS := 1;
    		END_IF
    	ELSE
    		POS := 1;
    	END_IF
    END_IF


    (* revision history
    hm	30. oct. 2008	rev 1.0		
    	original version 


    *)

END_FUNCTION_BLOCK
