FUNCTION R2_ADD
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=93*)
    temp := X.RX;
    RETVAL.RX := Y + X.R1 + X.RX;
    RETVAL.R1 := temp - RETVAL.RX + Y + X.R1;
    R2_ADD:=TRUE;

    (* revision history
    hm		20.3.2008	rev 1.0
    	original version

    *)
END_FUNCTION
