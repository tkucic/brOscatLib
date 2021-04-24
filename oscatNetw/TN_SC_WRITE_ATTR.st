FUNCTION_BLOCK TN_SC_WRITE_ATTR
    (*http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=193*)
    IF TN_SC_XY_ERROR(IIN_X,IIN_Y) THEN RETURN; END_IF
    in_Offset := (IIN_Y * 80) + IIN_X;
    XUS_TN_SCREEN.bya_COLOR[in_Offset] := IBY_ATTR; (* Attribute schreiben *)

    (* revision history
    ks	10. mai. 2010	rev 1.0
    	original version
    *)
END_FUNCTION_BLOCK
