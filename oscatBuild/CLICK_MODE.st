FUNCTION_BLOCK CLICK_MODE
    (*http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=49*)
    (* when input goes high start the Timer to decode pulses *)
    Timer(IN := IN, PT := T_LONG);
    SINGLE := FALSE;
    DOUBLE := FALSE;

    IF Timer.Q THEN
    	(* decode pulses while the Timer is active *)
    	IF NOT IN AND last THEN	cnt := cnt + 1; END_IF
    ELSE
    	CASE cnt OF
    		1 : SINGLE := TRUE;
    		2 : DOUBLE := TRUE;
    	END_CASE
    	cnt := 0;
    END_IF
    last := IN;
    TP_LONG := NOT Timer.Q AND (NOT LONG) AND IN;
    LONG := NOT Timer.Q AND IN;




    (* revision history

    hm	13. nov. 2008	rev 1.0
    	original release

    *)
END_FUNCTION_BLOCK
