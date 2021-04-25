FUNCTION R2_ABS
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=93*)
    IF X.RX >= 0.0 THEN
    	RETVAL.RX := X.RX;
    	RETVAL.R1 := X.R1;
    ELSE
    	RETVAL.RX := -X.RX;
    	RETVAL.R1 := -X.R1;
    END_IF
    R2_ABS:=TRUE;

    (* revision history
    hm	21. mar. 2008	rev 1.0
    	original version

    hm	10. mar. 2009 rev 1.1
    	real constants updated to new systax using dot

    *)
END_FUNCTION
