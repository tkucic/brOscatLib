FUNCTION FACT
    IF X <= 5 THEN
    	FACT := 1;
    	FOR i := 2 TO x DO
    		FACT := FACT * i;
    	END_FOR
    ELSIF x <= 9 THEN
    	FACT := 720;
    	FOR i := 7 TO x DO
    		FACT := FACT * i;
    	END_FOR
    ELSIF x <= 13 THEN
    	FACT := 3628800;
    	FOR i := 11 TO x DO
    		FACT := FACT * i;
    	END_FOR
    ELSE
    	FACT := -1;
    END_IF




    (* revision history
    hm 4.3.2007		rev 1.1
    	changed a critical error where while loop was indefinite.

    hm	10.12.2007	rev 1.2
    	start value for i has changed to 2 for better performance

    hm	10. mar 2008	rev 1.3
    	changed output of fact to dint to allow bigger values

    hm	27. oct. 2008	rev 1.4
    	optimized code
    *)
END_FUNCTION
