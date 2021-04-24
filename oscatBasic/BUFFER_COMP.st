FUNCTION BUFFER_COMP
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=480*)
    (* search for first character match *)
    IF SIZE2 <= SIZE1 THEN
    	end := SIZE1 - SIZE2;
    	firstbyte := PT2^[0];
    	FOR i := START TO end DO
    		IF PT1^[i] = firstbyte THEN
    			(* first character matches, now compare rest of array *)
    			j := 1;
    			WHILE j < SIZE2 DO
    				IF PT2^[j] <> PT1^[j+i] THEN EXIT; END_IF
    				j := j + 1;
    			END_WHILE
    			(* when j > SIZE2 a match was found return the position i in buffer1 *)
    			IF j = SIZE2 THEN
    				BUFFER_COMP := i;
    				RETURN;
    			END_IF
    		END_IF
    	END_FOR
    END_IF
    BUFFER_COMP := -1;


    (*
    hm 14. nov. 2008	rev 1.0
    	original version

    hm	12. nov. 2009	rev 1.1
    	performance increase

    *)
END_FUNCTION
