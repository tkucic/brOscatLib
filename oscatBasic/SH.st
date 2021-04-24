FUNCTION_BLOCK SH
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=299*)
    IF CLK AND NOT EDGE_ THEN
    	OUT := IN;
    	TRIG := TRUE;
    ELSE;
    	TRIG := FALSE;
    END_IF
    EDGE_ := CLK;

    (* revision history

    hm 16.1.2007	rev 1.1
    	added TRIG output

    *)
END_FUNCTION_BLOCK
