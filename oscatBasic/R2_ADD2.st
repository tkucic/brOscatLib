FUNCTION R2_ADD2
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=94*)
    RETVAL.R1 := X.R1 + Y.R1;
    RETVAL.RX := X.RX + Y.RX;
    R2_ADD2 := TRUE;

    (* revision history
    hm		20.3.2008	rev 1.0
    	original version

    *)
END_FUNCTION
