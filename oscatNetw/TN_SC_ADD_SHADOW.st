FUNCTION_BLOCK TN_SC_ADD_SHADOW
    (*http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=184*)
    IF TN_SC_XY2_ERROR(IIN_X1,IIN_Y1,IIN_X2,IIN_Y2) THEN RETURN; END_IF

    IF IIN_Y1 < 0 OR IIN_X1 < 0 OR IIN_Y2 < 0 OR IIN_X2 < 0 THEN RETURN; END_IF (* min werte prüfen *)
    IF IIN_Y1 > 23 OR IIN_X1 > 79 OR IIN_Y2 > 23 OR IIN_X2 > 79 THEN RETURN; END_IF (* max werte prüfen *)

    in_Offset := (IIN_Y1 * 80) + IIN_X2;

    IF IIN_OPTION = INT#00 THEN
    	(* Schatten durch Farbanpassung erzeugen *)
    	FOR in_Y := IIN_Y1 TO IIN_Y2 DO
    		XUS_TN_SCREEN.bya_COLOR[in_Offset] := TN_SC_SHADOW_ATTR(XUS_TN_SCREEN.bya_COLOR[in_Offset]);
    		in_Offset := in_Offset + 80;
    		XUS_TN_SCREEN.bya_Line_Update[in_Y] := TRUE; (* Zeile für Update eintragen *)
    	END_FOR
    ELSE
    	(* Schatten durch Farbe Schwarz und Leerzeichen erzeugen *)
    	FOR in_Y := IIN_Y1 TO IIN_Y2 DO
    		XUS_TN_SCREEN.bya_COLOR[in_Offset] := BYTE#00;
    		XUS_TN_SCREEN.bya_CHAR[in_Offset] := BYTE#32;
    		in_Offset := in_Offset + 80;
    		XUS_TN_SCREEN.bya_Line_Update[in_Y] := TRUE; (* Zeile für Update eintragen *)
    	END_FOR
    END_IF

    in_Offset := (IIN_Y2 * 80) + IIN_X1;

    IF IIN_OPTION = INT#00 THEN
    	(* Schatten durch Farbanpassung erzeugen *)
    	FOR in_X  := IIN_X1 TO IIN_X2 DO
    		XUS_TN_SCREEN.bya_COLOR[in_Offset] := TN_SC_SHADOW_ATTR(XUS_TN_SCREEN.bya_COLOR[in_Offset]);
    		in_Offset := in_Offset + 1;
    	END_FOR
    ELSE
    	(* Schatten durch Farbe Schwarz und Leerzeichen erzeugen *)
    	FOR in_X  := IIN_X1 TO IIN_X2 DO
    		XUS_TN_SCREEN.bya_COLOR[in_Offset] := BYTE#00;
    		XUS_TN_SCREEN.bya_CHAR[in_Offset] := BYTE#32;
    		in_Offset := in_Offset + 1;
    	END_FOR
    END_IF

    (* revision history
    ks	10. mai. 2010	rev 1.0
    	original version
    *)
END_FUNCTION_BLOCK
