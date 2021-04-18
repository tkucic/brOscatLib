FUNCTION R2_ABS
    IF X.RX >= 0.0 THEN
    	R2_ABS.RX := X.RX;
    	R2_ABS.R1 := X.R1;
    ELSE
    	R2_ABS.RX := -X.RX;
    	R2_ABS.R1 := -X.R1;
    END_IF


    (* revision history
    hm	21. mar. 2008	rev 1.0
    	original version

    hm	10. mar. 2009 rev 1.1
    	real constants updated to new systax using dot

    *)
END_FUNCTION