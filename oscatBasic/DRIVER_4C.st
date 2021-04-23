FUNCTION_BLOCK DRIVER_4C
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=455*)
    IF RST OR off.Q THEN
    	SN := 0;
    ELSIF IN AND NOT EDGE_ THEN
    	SN := SN + 1;
    	IF SN > 7 OR SX[SN] = 0 THEN SN := 0; END_IF
    END_IF
    EDGE_ := IN;
    IF SN > 0 THEN
    	Q0 := SX[SN].0;
    	Q1 := SX[SN].1;
    	Q2 := SX[SN].2;
    	Q3 := SX[SN].3;
    ELSE
    	Q0 := FALSE;
    	Q1 := FALSE;
    	Q2 := FALSE;
    	Q3 := FALSE;
    END_IF

    (* maximaum TIMEOUT *)
    IF TIMEOUT > t#0s THEN off(IN := SN > 0, PT := TIMEOUT); END_IF


    (* revision history
    hm	23. mar. 2009	rev 1.0
    	origINal version

    *)
END_FUNCTION_BLOCK
