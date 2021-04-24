FUNCTION_BLOCK TN_SC_BOX
    (*http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=186*)
    IF TN_SC_XY2_ERROR(IIN_X1,IIN_Y1,IIN_X2,IIN_Y2) THEN RETURN; END_IF

    (* Bordertype bestimmen *)
    CASE IIN_BORDER OF
    0:
    	in_Border_Offset := 0;
    1:
    	by_BorderChar_L_T := BYTE#218; (* links oben *)
    	by_BorderChar_T := BYTE#196; (* oben *)
    	by_BorderChar_R_T := BYTE#191; (* rechts oben *)
    	by_BorderChar_L := BYTE#179; (* links *)
    	by_BorderChar_R := BYTE#179; (* rechts *)
    	by_BorderChar_B := BYTE#196; (* unten *)
    	by_BorderChar_L_B := BYTE#217; (* links unten *)
    	by_BorderChar_R_B := BYTE#192; (* rechts unten *)
    	in_Border_Offset := 1;
     2:
    	by_BorderChar_L_T := BYTE#201;
    	by_BorderChar_T := BYTE#205;
    	by_BorderChar_R_T := BYTE#187;
    	by_BorderChar_L := BYTE#186;
    	by_BorderChar_R := BYTE#186;
    	by_BorderChar_B := BYTE#205;
    	by_BorderChar_L_B := BYTE#188;
    	by_BorderChar_R_B := BYTE#200;
    	in_Border_Offset := 1;
    ELSE
    	by_BorderChar_L_T := BYTE#32;
    	by_BorderChar_T := BYTE#32;
    	by_BorderChar_R_T := BYTE#32;
    	by_BorderChar_L := BYTE#32;
    	by_BorderChar_R := BYTE#32;
    	by_BorderChar_B := BYTE#32;
    	by_BorderChar_L_B := BYTE#32;
    	by_BorderChar_R_B := BYTE#32;
    	in_Border_Offset := 1;

    END_CASE

    IF IBY_FILL > BYTE#0 THEN (* FILL Zeichen vorhanden ? -> Box zeichnen *)

    	(* Fill-Function um eine Zeichenreihe kleiner zeichnen *)
    	FB_TN_SC_FILL(	IIN_Y1 := IIN_Y1 + in_Border_Offset,
    					IIN_X1 := IIN_X1 + in_Border_Offset,
    					IIN_Y2 := IIN_Y2 - in_Border_Offset,
    					IIN_X2 := IIN_X2 - in_Border_Offset,
    					Iby_CHAR := IBY_FILL,
    					IBY_ATTR := IBY_ATTR,
    					XUS_TN_SCREEN := XUS_TN_SCREEN);
    END_IF

    IF IIN_BORDER = 0 THEN RETURN; END_IF

    (* linken und rechten Rand ausgeben *)

    in_Offset_1 := (IIN_Y1 * 80) + IIN_X1;
    in_Offset_2 := (IIN_Y1 * 80) + IIN_X2;

    FOR in_Y := IIN_Y1 TO IIN_Y2 DO

    	(* Zeile zum Updaten freigeben *)
    	XUS_TN_SCREEN.bya_Line_Update[in_Y] := TRUE;

    	XUS_TN_SCREEN.bya_CHAR[in_Offset_1] := by_BorderChar_L;
    	XUS_TN_SCREEN.bya_COLOR[in_Offset_1] := IBY_ATTR;

    	XUS_TN_SCREEN.bya_CHAR[in_Offset_2] := by_BorderChar_R;
    	XUS_TN_SCREEN.bya_COLOR[in_Offset_2] := IBY_ATTR;

    	in_Offset_1 := in_Offset_1 + 80;
    	in_Offset_2 := in_Offset_2 + 80;

    END_FOR

    (* unteren und oberen Rand ausgeben *)
    in_Offset_1 := (IIN_Y1 * 80) + IIN_X1;
    in_Offset_2 := (IIN_Y2 * 80) + IIN_X1;

    FOR in_X := IIN_X1 TO IIN_X2 DO

    	XUS_TN_SCREEN.bya_CHAR[in_Offset_1] := by_BorderChar_T;
    	XUS_TN_SCREEN.bya_COLOR[in_Offset_1] := IBY_ATTR;

    	XUS_TN_SCREEN.bya_CHAR[in_Offset_2] := by_BorderChar_B;
    	XUS_TN_SCREEN.bya_COLOR[in_Offset_2] := IBY_ATTR;

    	in_Offset_1 := in_Offset_1 + INT#1;
    	in_Offset_2 := in_Offset_2 + INT#1;

    END_FOR

    (* linke obere Ecke ausgeben *)
    in_Offset_1 := (IIN_Y1 * 80) + IIN_X1;
    XUS_TN_SCREEN.bya_CHAR[in_Offset_1] := by_BorderChar_L_T;
    XUS_TN_SCREEN.bya_COLOR[in_Offset_1] := IBY_ATTR;

    (* rechte obere Ecke ausgeben *)
    in_Offset_1 := (IIN_Y1 * 80) + IIN_X2;
    XUS_TN_SCREEN.bya_CHAR[in_Offset_1] := by_BorderChar_R_T;
    XUS_TN_SCREEN.bya_COLOR[in_Offset_1] := IBY_ATTR;

    (* linke untere Ecke ausgeben *)
    in_Offset_1 := (IIN_Y2 * 80) + IIN_X1;
    XUS_TN_SCREEN.bya_CHAR[in_Offset_1] := by_BorderChar_R_B;
    XUS_TN_SCREEN.bya_COLOR[in_Offset_1] := IBY_ATTR;

    (* rechte untere Ecke ausgeben *)
    in_Offset_1 := (IIN_Y2 * 80) + IIN_X2;
    XUS_TN_SCREEN.bya_CHAR[in_Offset_1] := by_BorderChar_L_B;
    XUS_TN_SCREEN.bya_COLOR[in_Offset_1] := IBY_ATTR;

    (* revision history
    ks	10. mai. 2010	rev 1.0
    	original version
    *)
END_FUNCTION_BLOCK
