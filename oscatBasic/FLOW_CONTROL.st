FUNCTION_BLOCK FLOW_CONTROL
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=456*)
    STATUS := 100;
    IF RST THEN
    	Q := FALSE;
    	timer(RST := TRUE);
    	timer.RST := FALSE;
    	STATUS := 103;
    ELSIF ENQ THEN
    	IF IN THEN
    		STATUS := 101;
    	END_IF
    	IF REQ THEN
    		(* timer will generate a timed pulse after TP goes high *)
    		timer.PT1 := T_AUTO;
    		timer.PTD := T_DELAY;
    		timer.IN := TRUE;
    		STATUS := 102;
    	END_IF
    END_IF


    (* set output and run timer *)
    timer();
    timer.IN := FALSE;
    Q := (IN AND ENQ) OR timer.Q;



    (* revision history
    hm 	28. jun. 2008 	rev 1.0
    	origINal version

    *)
END_FUNCTION_BLOCK
