FUNCTION_BLOCK CONTROL_SET1
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=377*)
    IF PI AND PID THEN
    	KP := 0.0;
    	TN := 0.0;
    	TV := 0.0;
    ELSIF PID THEN
    	KP := PID_K * KT;
    	TN := PID_TN * TT;
    	TV := PID_TV * TT;
    ELSIF PI THEN
    	KP := PI_K * KT;
    	TN := PI_TN * TT;
    ELSE
    	KP := P_K * KT;
    END_IF

    (* KI and KD are calculated *)
    IF TN > 0.0 THEN KI := KP / TN; ELSE KI := 0.0; END_IF
    KD := KP * TV;

    (* revision history
    hm	4. nov 2007	rev 1.0
    	original version

    hm	11. mar. 2009	rev 1.1
    	real constants updated to new systax using dot																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																											

    *)
END_FUNCTION_BLOCK
