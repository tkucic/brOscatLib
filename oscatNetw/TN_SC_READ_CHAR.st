FUNCTION_BLOCK TN_SC_READ_CHAR
    (*http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=190*)
    IF TN_SC_XY_ERROR(IIN_X,IIN_Y) THEN RETURN; END_IF
    in_Offset := (IIN_Y * 80) + IIN_X;
    OBY_CHAR := XUS_TN_SCREEN.bya_CHAR[in_Offset]; (* Charakter auslesen *)

    (* revision history
    ks	10. mai. 2010	rev 1.0
    	original version
    *)
END_FUNCTION_BLOCK
