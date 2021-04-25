FUNCTION_BLOCK SIGNAL_4
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=469*)
    (* an alarm is present read system time first *)
    (* check if an alarm is present if yes set sig to the alarm pattern otherwise exit the routine *)
    IF in1 THEN
    	sig(in := TRUE, sig := s1, TS := TS);
    ELSIF in2 THEN
    	sig(in := TRUE, sig := s2, TS := TS);
    ELSIF in3 THEN
    	sig(in := TRUE, sig := s3, TS := TS);
    ELSIF in4 THEN
    	sig(in := TRUE, sig := s4, TS := TS);
    ELSE
    	sig(in := FALSE);
    END_IF;

    (* set the output *)
    Q := sig.Q;


    (* revision history
    hm	13.12.2007		rev 1.0
    	original version

    *)

END_FUNCTION_BLOCK
