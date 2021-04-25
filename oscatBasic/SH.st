FUNCTION_BLOCK SH
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=299*)
    IF clk AND NOT edge THEN
    	out := in;
    	trig := TRUE;
    ELSE;
    	trig := FALSE;
    END_IF;
    edge := clk;

    (* revision history

    hm 16.1.2007	rev 1.1
    	added trig output

    *)
END_FUNCTION_BLOCK
