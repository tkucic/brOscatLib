FUNCTION_BLOCK DRIVER_1
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=454*)
    IF off.Q THEN Q := FALSE; END_IF
    IF RST THEN
    	Q := FALSE;
    ELSIF SET THEN
    	Q := TRUE;
    ELSIF IN AND NOT EDGE_ THEN
    	IF TOGGLE_MODE THEN q := NOT Q; ELSE q := TRUE; END_IF
    END_IF
    EDGE_ := IN;
    IF TIMEOUT > t#0s THEN off(IN := Q, PT := TIMEOUT); END_IF


    (* revision history
    hm	2. jan 2008		rev 1.0
    	origINal version

    *)
END_FUNCTION_BLOCK
