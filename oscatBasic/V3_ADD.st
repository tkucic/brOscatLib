FUNCTION V3_ADD
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=108*)
    RETVAL.X := A.X + B.X;
    RETVAL.Y := A.Y + B.Y;
    RETVAL.Z := A.Z + B.Z;
    V3_ADD:=TRUE;


    (* revision history
    hm		11 dec 2007	rev 1.0
    	original version

    *)
END_FUNCTION
