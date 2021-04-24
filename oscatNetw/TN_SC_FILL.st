FUNCTION_BLOCK TN_SC_FILL
    (*http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=187*)
    IF TN_SC_XY2_ERROR(IIN_X1,IIN_Y1,IIN_X2,IIN_Y2) THEN RETURN; END_IF

    FOR in_Y := IIN_Y1 TO IIN_Y2 DO
    	XUS_TN_SCREEN.bya_Line_Update[in_Y] := TRUE; (* Zeile zum Updaten freigeben *)
    	in_Offset := (in_Y * 80) + IIN_X1;
    	FOR in_X := IIN_X1 TO IIN_X2 DO
    		XUS_TN_SCREEN.bya_CHAR[in_Offset]  := IBY_CHAR; (* Zeichen eintragen *)
    		XUS_TN_SCREEN.bya_COLOR[in_Offset] := IBY_ATTR; (* Farbe eintragen *)
    		in_Offset := in_Offset + 1;
    	END_FOR
    END_FOR

    (* revision history
    ks	10. mai. 2010	rev 1.0
    	original version
    *)
END_FUNCTION_BLOCK
