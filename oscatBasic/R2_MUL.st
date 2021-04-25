FUNCTION R2_MUL
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=94*)
    RETVAL.RX := X.RX * Y;
    RETVAL.R1 := X.R1 * Y;
    R2_MUL:=TRUE;

    (* revision history
    hm		20.3.2008	rev 1.0
    	original version

    *)
END_FUNCTION
