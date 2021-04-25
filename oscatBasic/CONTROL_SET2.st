FUNCTION_BLOCK CONTROL_SET2
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=379*)
    IF TU > 0.0 AND KS > 0.0 THEN TX := TG / TU / KS; END_IF;
    IF pi AND PID THEN
    	KP := 0.0;
    	TN := 0.0;
    	TV := 0.0;
    ELSIF PID THEN
    	KP := PID_K * TX;
    	TN := PID_TN * TU;
    	TV := PID_TV * TU;
    ELSIF PI THEN
    	KP := PI_K * TX;
    	TN := PI_TN * TU;
    ELSE
    	KP := P_K * TX;
    END_IF;

    (* KI and KD are calculated *)
    IF TN > 0.0 THEN KI := KP / TN; ELSE KI := 0.0; END_IF;
    KD := KP * TV;

    (* revision history
    hm	4. nov 2007	rev 1.0
    	original version

    hm	11. mar. 2009	rev 1.1
    	real constants updated to new systax using dot																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																											

    *)
END_FUNCTION_BLOCK
