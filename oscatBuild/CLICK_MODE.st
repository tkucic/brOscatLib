FUNCTION_BLOCK CLICK_MODE
    (*http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=49*)
    (* when INput goes high start the timer to decode pulses *)
    timer(IN := IN, PT := T_LONG);
    sINgle := FALSE;
    DOUBLE := FALSE;

    IF timer.Q THEN
    	(* decode pulses while the timer is active *)
    	IF NOT IN AND last THEN	cnt := cnt + 1; END_IF
    ELSE
    	CASE cnt OF
    		1 : sINgle := TRUE;
    		2 : DOUBLE := TRUE;
    	END_CASE
    	cnt := 0;
    END_IF
    last := IN;
    TP_LONG := NOT timer.Q AND (NOT LONG) AND IN;
    LONG := NOT timer.Q AND IN;




    (* revision history

    hm	13. nov. 2008	rev 1.0
    	origINal release

    *)
END_FUNCTION_BLOCK
