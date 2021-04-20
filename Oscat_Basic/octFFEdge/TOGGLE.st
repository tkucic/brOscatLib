FUNCTION_BLOCK TOGGLE
    IF RST THEN
    	Q := 0;
    ELSIF CLK AND NOT edge_ THEN
    	Q := NOT Q;
    END_IF
    edge_ := CLK;

    (* revision history

    hm	13.9.2007		rev 1.0
    	original version

    hm	30. oct. 2008	rev 1.1
    	deleted unnecessary init

    *)




END_FUNCTION_BLOCK
