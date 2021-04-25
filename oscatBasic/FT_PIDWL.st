FUNCTION_BLOCK FT_PIDWL
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=409*)
    (* if RST then *)
    IF RST THEN
    	piwl(RST := TRUE);
    	piwl.RST := FALSE;
    ELSE
    	(* run piwl controller first *)
    	(* we need to check if TN = 0 and do alternative calls *)
    	IF TN = 0.0 THEN
    		piwl(IN := IN * KP, KP := 1.0, KI := 0.0, LIM_L := LIM_L, LIM_H := LIM_H);
    	ELSE
    		piwl(IN := IN * KP, KP := 1.0, KI := 1.0 / TN, LIM_L := LIM_L, LIM_H := LIM_H);
    	END_IF

    	(* run differentiator and add_to_output *)
    	diff(IN := IN, K := KP * TV);
    	Y := piwl.Y + diff.OUT;

    	(* limit the output *)
    	IF Y < LIM_L THEN
    		LIM := TRUE;
    		Y := LIM_L;
    	ELSIF Y > LIM_H THEN
    		LIM := TRUE;
    		Y := LIM_H;
    	ELSE
    		LIM := FALSE;
    	END_IF
    END_IF



    (* revision history
    hm 13. jun. 2008 	rev 1.0
    	original version

    hm	25. jan 2008	rev 1.1
    	multiply differential part with KP

    hm	11. mar. 2009	rev 1.2
    	real constants updated to new systax using dot

    hm	13. nov. 2009	rev 1.3
    	fixed code for negative KP

    *)
END_FUNCTION_BLOCK
