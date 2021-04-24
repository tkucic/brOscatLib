FUNCTION_BLOCK TN_SC_LINE
    (*http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=188*)
    IF TN_SC_XY2_ERROR(IIN_X1,IIN_Y1,IIN_X2,IIN_Y2) THEN RETURN; END_IF

    (* Bordertype bestimmen *)
    IF IBY_BORDER = BYTE#01 THEN (* Single Line *)
    	by_Connect_Top_Char := BYTE#16#C2;
    	by_Connect_Bottom_Char := BYTE#16#C1;
    	by_Connect_Left_Char := BYTE#16#C3;
    	by_Connect_Right_Char := BYTE#16#B4;
    	by_Horzontal_Line_Char := BYTE#16#C4;
    	by_Vertikal_Line_Char := BYTE#16#B3;
    	by_Connect_Cruz_Char := BYTE#16#C5;
    ELSIF IBY_BORDER = BYTE#02 THEN	(* Double Linie *)
    	by_Connect_Top_Char := BYTE#16#CB;
    	by_Connect_Bottom_Char := BYTE#16#CA;
    	by_Connect_Left_Char := BYTE#16#CC;
    	by_Connect_Right_Char := BYTE#16#B9;
    	by_Horzontal_Line_Char := BYTE#16#CD;
    	by_Vertikal_Line_Char := BYTE#16#BA;
    	by_Connect_Cruz_Char := BYTE#16#CE;
    ELSE (* Full Linie *)
    	by_Connect_Top_Char := IBY_BORDER;
    	by_Connect_Bottom_Char := IBY_BORDER;
    	by_Connect_Left_Char := IBY_BORDER;
    	by_Connect_Right_Char := IBY_BORDER;
    	by_Horzontal_Line_Char := IBY_BORDER;
    	by_Vertikal_Line_Char := IBY_BORDER;
    	by_Connect_Cruz_Char := IBY_BORDER;
    END_IF

    (* Vertikale Linie zeichnen *)
    IF IIN_X1 = IIN_X2 THEN
    	in_Offset_1 := (IIN_Y1 * 80) + IIN_X1;
    	FOR in_ROW_Index := IIN_Y1 TO IIN_Y2 DO
    		by_old_Char := XUS_TN_SCREEN.bya_CHAR[in_Offset_1]; (* bestehendes Zeichen auslesen *)
    		by_Char := by_Vertikal_Line_Char; (* Standardzeichen vorbelegen *)
    		IF by_old_Char = by_Horzontal_Line_Char THEN (* Schnittpunkt erkannt *)
    			IF in_ROW_Index = IIN_Y1 THEN (* Anfang der Linie behandeln *)
    				by_Char := by_Connect_Top_Char;
    			ELSIF in_ROW_Index = IIN_Y2 THEN (* Ende der Linie behandeln *)
    				by_Char := by_Connect_Bottom_Char;
    			ELSE (* Kreuzungspunkt behandeln *)
    				by_Char := by_Connect_Cruz_Char;
    			END_IF
    		END_IF
    		XUS_TN_SCREEN.bya_Line_Update[in_ROW_Index] := TRUE; (* Zeile zum Updaten freigeben *)
    		XUS_TN_SCREEN.bya_CHAR[in_Offset_1] := by_Char;
    		XUS_TN_SCREEN.bya_COLOR[in_Offset_1] := IBY_ATTR;
    		in_Offset_1 := in_Offset_1 + 80;
    	END_FOR

    ELSIF IIN_Y1 = IIN_Y2 THEN (* Horzontale Linie zeichnen *)
    	XUS_TN_SCREEN.bya_Line_Update[IIN_Y1] := TRUE; (* Zeile zum Updaten freigeben *)
    	in_Offset_1 := (IIN_Y1 * 80) + IIN_X1;
    	FOR in_COL_Index := IIN_X1 TO IIN_X2 DO
    		by_old_Char := XUS_TN_SCREEN.bya_CHAR[in_Offset_1]; (* bestehendes Zeichen auslesen *)
    		by_Char := by_Horzontal_Line_Char; (* Standardzeichen vorbelegen *)
    		IF by_old_Char = by_Vertikal_Line_Char THEN (* Schnittpunkt erkannt *)
    			IF in_COL_Index = IIN_X1 THEN (* Anfang der Linie behandeln *)
    				by_Char := by_Connect_Left_Char;
    			ELSIF in_COL_Index = IIN_X2 THEN (* Ende der Linie behandeln *)
    				by_Char := by_Connect_Right_Char;
    			ELSE (* Kreuzungspunkt behandeln *)
    				by_Char := by_Connect_Cruz_Char;
    			END_IF
    		END_IF
    		XUS_TN_SCREEN.bya_CHAR[in_Offset_1] := by_Char;
    		XUS_TN_SCREEN.bya_COLOR[in_Offset_1] := IBY_ATTR;
    		in_Offset_1 := in_Offset_1 + 1;
    	END_FOR
    END_IF

    (* revision history
    ks	10. mai. 2010	rev 1.0
    	original version
    *)
END_FUNCTION_BLOCK
