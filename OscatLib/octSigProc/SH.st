FUNCTION_BLOCK SH
    IF clk AND NOT edge THEN
    	out := in;
    	trig := TRUE;
    ELSE;
    	trig := FALSE;
    END_IF
    edge := clk;

    (* revision history

    hm 16.1.2007	rev 1.1
    	added trig output

    *)
END_FUNCTION_BLOCK
