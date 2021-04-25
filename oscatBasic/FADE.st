FUNCTION_BLOCK FADE
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=276*)
    rmx(RST := RST AND NOT F, SET := RST AND F, PT := TF, UP := F);
    Y := (IN2 - IN1) / 65535.0 * WORD_TO_REAL(rmx.OUT) + IN1;


    (* code for rev 1.1
    IF RST THEN
    	rmx(set := F, RST := NOT F);
    ELSIF F AND (NOT rmx.high) THEN
    	rmx(PT := TF, UP := TRUE, e := TRUE, RST := FALSE, set := FALSE);
    ELSIF (NOT F) AND (NOT rmx.low) THEN
    	rmx(PT := TF, UP := FALSE, e := TRUE, RST := FALSE, set := FALSE);
    ELSE
    	rmx(e := FALSE, RST := FALSE, set := FALSE);
    END_IF
    Y := (WORD_TO_REAL(rmx.out) * IN1 + WORD_TO_REAL(FF - rmx.out) * IN2) / FF;
    *)


    (* revision history
    hm	26. dec 2007	rev 1.0
    	original version

    hm	18. oct. 2008	rev 1.1
    	improved performance
    	changed calls for rmp_w because rmp_w has chaged

    hm	17. dec. 2008	rev 1.2
    	function of input F was inverted

    hm	24. jan. 2009	rev 1.3
    	delted unused var FF
    *)
END_FUNCTION_BLOCK
