FUNCTION R2_ABS
    IF X.RX >= 0.0 THEN
    	retVal.RX := X.RX;
    	retVal.R1 := X.R1;
    ELSE
    	retVal.RX := -X.RX;
    	retVal.R1 := -X.R1;
    END_IF
    R2_ABS := TRUE;


    (* revision history
    hm	21. mar. 2008	rev 1.0
    	original version

    hm	10. mar. 2009 rev 1.1
    	real constants updated to new systax using dot

    *)
END_FUNCTION
