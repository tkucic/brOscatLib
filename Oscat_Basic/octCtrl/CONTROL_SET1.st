FUNCTION_BLOCK CONTROL_SET1
    IF pi AND PID THEN
    	KP := 0.0;
    	TN := 0.0;
    	TV := 0.0;
    ELSIF PID THEN
    	KP := PID_K * Kt;
    	TN := PID_TN * Tt;
    	TV := PID_TV * Tt;
    ELSIF PI THEN
    	KP := PI_K * Kt;
    	TN := PI_TN * Tt;
    ELSE
    	KP := P_K * Kt;
    END_IF

    (* KI and KD are calculated *)
    IF tn > 0.0 THEN KI := KP / TN; ELSE KI := 0.0; END_IF
    KD := KP * TV;

    (* revision history
    hm	4. nov 2007	rev 1.0
    	original version

    hm	11. mar. 2009	rev 1.1
    	real constants updated to new systax using dot																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																											

    *)
END_FUNCTION_BLOCK
