FUNCTION_BLOCK STORE_8
    IF Rst OR Set THEN
    	Q0 := NOT Rst;
    	Q1 := Q0;
    	Q2 := Q0;
    	Q3 := Q0;
    	Q4 := Q0;
    	Q5 := Q0;
    	Q6 := Q0;
    	Q7 := Q0;
    ELSE
    	IF D0 THEN Q0 := TRUE; END_IF
    	IF D1 THEN Q1 := TRUE; END_IF
    	IF D2 THEN Q2 := TRUE; END_IF
    	IF D3 THEN Q3 := TRUE; END_IF
    	IF D4 THEN Q4 := TRUE; END_IF
    	IF D5 THEN Q5 := TRUE; END_IF
    	IF D6 THEN Q6 := TRUE; END_IF
    	IF D7 THEN Q7 := TRUE; END_IF

    	IF Clr AND NOT edge_ THEN
    		IF Q0 THEN Q0 := FALSE;
    		ELSIF Q1 THEN Q1 := FALSE;
    		ELSIF Q2 THEN Q2 := FALSE;
    		ELSIF Q3 THEN Q3 := FALSE;
    		ELSIF Q4 THEN Q4 := FALSE;
    		ELSIF Q5 THEN Q5 := FALSE;
    		ELSIF Q6 THEN Q6 := FALSE;
    		ELSE Q7 := FALSE;
    		END_IF
    	END_IF
    	edge_ := Clr;
    END_IF


    (* revision history
    hm	25.12.2007	rev 1.0
    	original version

    hm	30. oct. 2008	rev 1.1
    	optimized performance

    hm	14. mar. 2009	rev 1.2
    	removed double assignments

    *)


END_FUNCTION_BLOCK
