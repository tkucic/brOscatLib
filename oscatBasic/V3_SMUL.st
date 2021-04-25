FUNCTION V3_SMUL
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=111*)
    RETVAL.X := A.X * M;
    RETVAL.Y := A.Y * M;
    RETVAL.Z := A.Z * M;
    V3_SMUL:=TRUE;


    (* revision history
    hm		11 dec 2007	rev 1.0
    	original version

    *)
END_FUNCTION
