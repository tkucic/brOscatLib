FUNCTION_BLOCK TN_SC_BOX
    (*http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=186*)
    IF TN_SC_XY2_ERROR(Iin_X1,Iin_Y1,Iin_X2,Iin_Y2) THEN RETURN; END_IF

    (* Bordertype bestimmen *)
    CASE Iin_Border OF
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

    IF Iby_FILL > BYTE#0 THEN (* FILL Zeichen vorhanden ? -> Box zeichnen *)

    	(* Fill-Function um eine Zeichenreihe kleiner zeichnen *)
    	FB_TN_SC_FILL(	Iin_Y1 := Iin_Y1 + in_Border_Offset,
    					Iin_X1 := Iin_X1 + in_Border_Offset,
    					Iin_Y2 := Iin_Y2 - in_Border_Offset,
    					Iin_X2 := Iin_X2 - in_Border_Offset,
    					Iby_CHAR := Iby_FILL,
    					Iby_Attr := Iby_ATTR,
    					Xus_TN_SCREEN := Xus_TN_SCREEN);
    END_IF

    IF Iin_BORDER = 0 THEN RETURN; END_IF

    (* linken und rechten Rand ausgeben *)

    in_Offset_1 := (Iin_Y1 * 80) + Iin_X1;
    in_Offset_2 := (Iin_Y1 * 80) + Iin_X2;

    FOR in_Y := Iin_Y1 TO Iin_Y2 DO

    	(* Zeile zum Updaten freigeben *)
    	Xus_TN_SCREEN.bya_Line_Update[in_Y] := TRUE;

    	Xus_TN_SCREEN.bya_CHAR[in_Offset_1] := by_BorderChar_L;
    	Xus_TN_SCREEN.bya_COLOR[in_Offset_1] := Iby_Attr;

    	Xus_TN_SCREEN.bya_CHAR[in_Offset_2] := by_BorderChar_R;
    	Xus_TN_SCREEN.bya_COLOR[in_Offset_2] := Iby_Attr;

    	in_Offset_1 := in_Offset_1 + 80;
    	in_Offset_2 := in_Offset_2 + 80;

    END_FOR

    (* unteren und oberen Rand ausgeben *)
    in_Offset_1 := (Iin_Y1 * 80) + Iin_X1;
    in_Offset_2 := (Iin_Y2 * 80) + Iin_X1;

    FOR in_X := Iin_X1 TO Iin_X2 DO

    	Xus_TN_SCREEN.bya_CHAR[in_Offset_1] := by_BorderChar_T;
    	Xus_TN_SCREEN.bya_COLOR[in_Offset_1] := Iby_Attr;

    	Xus_TN_SCREEN.bya_CHAR[in_Offset_2] := by_BorderChar_B;
    	Xus_TN_SCREEN.bya_COLOR[in_Offset_2] := Iby_Attr;

    	in_Offset_1 := in_Offset_1 + INT#1;
    	in_Offset_2 := in_Offset_2 + INT#1;

    END_FOR

    (* linke obere Ecke ausgeben *)
    in_Offset_1 := (Iin_Y1 * 80) + Iin_X1;
    Xus_TN_SCREEN.bya_CHAR[in_Offset_1] := by_BorderChar_L_T;
    Xus_TN_SCREEN.bya_COLOR[in_Offset_1] := Iby_Attr;

    (* rechte obere Ecke ausgeben *)
    in_Offset_1 := (Iin_Y1 * 80) + Iin_X2;
    Xus_TN_SCREEN.bya_CHAR[in_Offset_1] := by_BorderChar_R_T;
    Xus_TN_SCREEN.bya_COLOR[in_Offset_1] := Iby_Attr;

    (* linke untere Ecke ausgeben *)
    in_Offset_1 := (Iin_Y2 * 80) + Iin_X1;
    Xus_TN_SCREEN.bya_CHAR[in_Offset_1] := by_BorderChar_R_B;
    Xus_TN_SCREEN.bya_COLOR[in_Offset_1] := Iby_Attr;

    (* rechte untere Ecke ausgeben *)
    in_Offset_1 := (Iin_Y2 * 80) + Iin_X2;
    Xus_TN_SCREEN.bya_CHAR[in_Offset_1] := by_BorderChar_L_B;
    Xus_TN_SCREEN.bya_COLOR[in_Offset_1] := Iby_Attr;

    (* revision history
    ks	10. mai. 2010	rev 1.0
    	original version
    *)
END_FUNCTION_BLOCK