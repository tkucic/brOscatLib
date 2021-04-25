FUNCTION_BLOCK TN_SC_WRITE
    (*http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=192*)
    in_String_Length := LEN(IST_STRING);
    IF TN_SC_XY_ERROR(IIN_X + in_String_Length - 1,IIN_Y) THEN RETURN; END_IF
    XUS_TN_SCREEN.bya_Line_Update[IIN_Y] := TRUE; (* Zeile zum Updaten freigeben *)
    in_Offset := (IIN_Y * 80) + IIN_X; (* Offset des ersten Zeichen berechnen *)
    bo_Color := IBY_ATTR <> BYTE#00;

    (* Zeichen und Attribute des String kopieren *)
    FOR in_Char_Index := 1 TO in_String_Length DO
    	IF bo_Color THEN XUS_TN_SCREEN.bya_COLOR[in_Offset] := IBY_ATTR; END_IF
    	XUS_TN_SCREEN.bya_CHAR[in_Offset] := CODE(STR:=IST_STRING,POS:=in_Char_Index);
    	in_Offset := in_Offset + INT#1;
    END_FOR

    XUS_TN_SCREEN.in_EOS_Offset := in_Offset; (* End of String Offset sichern *)

    (* revision history
    ks	10. mai. 2010	rev 1.0
    	original version
    *)
END_FUNCTION_BLOCK
