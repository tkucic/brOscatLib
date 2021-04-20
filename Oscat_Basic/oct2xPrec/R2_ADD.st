FUNCTION R2_ADD
    temp := X.RX;
    retVal.RX := Y + X.R1 + X.RX;
    retVal.R1 := temp - retVal.RX + Y + X.R1;
    R2_ADD := TRUE;

    (* revision history
    hm		20.3.2008	rev 1.0
    	original version

    *)
END_FUNCTION
