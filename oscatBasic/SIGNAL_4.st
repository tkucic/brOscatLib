FUNCTION_BLOCK SIGNAL_4
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=469*)
    (* an alarm is present read system time first *)
    (* check if an alarm is present if yes set sig to the alarm pattern otherwise exit the routine *)
    IF IN1 THEN
    	sig(IN := TRUE, SIG := S1, TS := TS);
    ELSIF IN2 THEN
    	sig(IN := TRUE, SIG := S2, TS := TS);
    ELSIF IN3 THEN
    	sig(IN := TRUE, SIG := S3, TS := TS);
    ELSIF IN4 THEN
    	sig(IN := TRUE, SIG := S4, TS := TS);
    ELSE
    	sig(IN := FALSE);
    END_IF

    (* set the output *)
    Q := sig.Q;


    (* revision history
    hm	13.12.2007		rev 1.0
    	original version

    *)

END_FUNCTION_BLOCK
