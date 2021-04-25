FUNCTION V3_XPRO
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=112*)
    RETVAL.X := A.Y * B.Z - A.Z * B.Y;
    RETVAL.Y := A.Z * B.X - A.X * B.Z;
    RETVAL.Z := A.X * B.Y - A.Y * B.X;
    V3_XPRO:=TRUE;


    (* revision history
    hm		11 dec 2007	rev 1.0
    	original version

    *)
END_FUNCTION
