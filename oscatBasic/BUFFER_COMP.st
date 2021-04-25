FUNCTION BUFFER_COMP
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=480*)
    (* search for first character match *)
    IF size2 <= size1 THEN
    	end := size1 - size2;
    	firstbyte := PT2^[0];
    	FOR i := START TO end DO
    		IF PT1^[i] = firstbyte THEN
    			(* first character matches, now compare rest of array *)
    			j := 1;
    			WHILE j < size2 DO
    				IF pt2^[j] <> pt1^[j+i] THEN EXIT; END_IF;
    				j := j + 1;
    			END_WHILE;
    			(* when J > size2 a match was found return the position i in buffer1 *)
    			IF j = size2 THEN
    				BUFFER_COMP := i;
    				RETURN;
    			END_IF;
    		END_IF;
    	END_FOR;
    END_IF;
    BUFFER_COMP := -1;


    (*
    hm 14. nov. 2008	rev 1.0
    	original version

    hm	12. nov. 2009	rev 1.1
    	performance increase

    *)
END_FUNCTION
