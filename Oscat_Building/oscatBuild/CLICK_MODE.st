FUNCTION_BLOCK CLICK_MODE
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=49*)
    (* when input goes high start the timer to decode pulses *)
    timer(in := IN, PT := T_LONG);
    single := FALSE;
    double := FALSE;

    IF timer.Q THEN
    	(* decode pulses while the timer is active *)
    	IF NOT in AND last THEN	cnt := cnt + 1; END_IF
    ELSE
    	CASE cnt OF
    		1 : single := TRUE;
    		2 : double := TRUE;
    	END_CASE
    	cnt := 0;
    END_IF
    last := in;
    TP_LONG := NOT timer.Q AND (NOT LONG) AND IN;
    LONG := NOT timer.Q AND in;




    (* revision history

    hm	13. nov. 2008	rev 1.0
    	original release

    *)
END_FUNCTION_BLOCK
