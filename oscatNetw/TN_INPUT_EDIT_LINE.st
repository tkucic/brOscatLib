FUNCTION_BLOCK TN_INPUT_EDIT_LINE
    (*http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=174*)
    (* Cursorsteuerung rücksetzen *)
    in_CursorOffset := INT#0;

    IF XUS_TN_INPUT_CONTROL_DATA.bo_Focus = TRUE THEN

    	(* Texteingabe erkannt ? *)
    	IF XUS_TN_INPUT_CONTROL_DATA.by_Input_ASCII_Code > BYTE#0 THEN

    		IF (XUS_TN_INPUT_CONTROL_DATA.bo_Input_Only_Num = TRUE AND XUS_TN_INPUT_CONTROL_DATA.bo_Input_ASCII_IsNum = TRUE)
    			OR (XUS_TN_INPUT_CONTROL_DATA.bo_Input_Only_Num = FALSE) THEN

    			(* ASCII Wert in einen String wandeln *)
    			st_CHAR := CHR_TO_STRING(C:=XUS_TN_INPUT_CONTROL_DATA.by_Input_ASCII_Code);

    			(* Eingabe übernehmen *)
    			XUS_TN_INPUT_CONTROL_DATA.st_Input_Data := REPLACE(XUS_TN_INPUT_CONTROL_DATA.st_Input_Data,
    			st_CHAR,INT#1,XUS_TN_INPUT_CONTROL_DATA.in_Cursor_Pos);

    			in_CursorOffset := INT#1;
    			XUS_TN_INPUT_CONTROL_DATA.bo_Update_Input := TRUE;
    		END_IF
    	END_IF

    	CASE BYTE_TO_INT(XUS_TN_INPUT_CONTROL_DATA.by_Input_Exten_Code) OF

    	67: (* Cursor rechts gedrückt *)
    		in_CursorOffset := INT#1;

    	68: (* Cursor links gedrückt *)
    		in_CursorOffset := -1;

    	08: (* Backspace gedrückt *)
    		XUS_TN_INPUT_CONTROL_DATA.st_Input_Data := REPLACE(XUS_TN_INPUT_CONTROL_DATA.st_Input_Data, ' ', 1,XUS_TN_INPUT_CONTROL_DATA.in_Cursor_Pos);
    		XUS_TN_INPUT_CONTROL_DATA.bo_Update_Input := TRUE;
    		in_CursorOffset := -1;

    	13: (* Enter-Taste gedrückt *)
    		IF LEN(XUS_TN_INPUT_CONTROL_DATA.st_Input_Mask) > INT#00 THEN
    			(* Eingabestring übernehmen *)
    			XUS_TN_INPUT_CONTROL_DATA.st_Input_String := XUS_TN_INPUT_CONTROL_DATA.st_Input_Data;

    			(* Eingabestring -> links und rechts Leerzeichen entfernen *)
    			XUS_TN_INPUT_CONTROL_DATA.st_Input_String := TRIME(str:=XUS_TN_INPUT_CONTROL_DATA.st_Input_String);
    			XUS_TN_INPUT_CONTROL_DATA.bo_Input_Entered := TRUE;

    			(* neue Eingabe vorbereiten *)
    			XUS_TN_INPUT_CONTROL_DATA.st_Input_Data := XUS_TN_INPUT_CONTROL_DATA.st_Input_Mask;

    			XUS_TN_INPUT_CONTROL_DATA.in_Cursor_Pos := INT#1;
    			XUS_TN_INPUT_CONTROL_DATA.bo_Update_Input := TRUE;

    			(* suche erstes Position in Eingabemaske *)
    			st_CHAR := MID(XUS_TN_INPUT_CONTROL_DATA.st_Input_Mask,1,XUS_TN_INPUT_CONTROL_DATA.in_Cursor_Pos);
    			IF st_CHAR <> ' ' THEN
    				(* nächsten Eingabeposition suchen *)
    				in_CursorOffset := INT#1;
    			END_IF
    		END_IF
    	END_CASE
    END_IF

    (* Cursor richtung rechts bewegen                                   *)
    IF (in_CursorOffset > INT#0) OR (XUS_TN_INPUT_CONTROL_DATA.in_Cursor_Pos = INT#0) THEN
    	bo_Pos_Found := FALSE;

    	in_count := XUS_TN_INPUT_CONTROL_DATA.in_Cursor_Pos + INT#1;
    	in_Count_End := LEN(XUS_TN_INPUT_CONTROL_DATA.st_Input_Mask);

    	WHILE (in_count <= in_Count_End) AND (bo_Pos_Found = FALSE) DO

    		st_CHAR := MID(XUS_TN_INPUT_CONTROL_DATA.st_Input_Mask,1,in_count);
    		IF st_CHAR = ' ' THEN
    			XUS_TN_INPUT_CONTROL_DATA.in_Cursor_Pos := in_count;
    			XUS_TN_INPUT_CONTROL_DATA.bo_Update_Input := TRUE;
    			bo_Pos_Found := TRUE;
    		END_IF

    		in_count := in_count + INT#1;

    	END_WHILE
    END_IF

    (* Cursor richtung links bewegen *)
    IF in_CursorOffset < INT#0 THEN
    	bo_Pos_Found := FALSE;

    	in_count     := XUS_TN_INPUT_CONTROL_DATA.in_Cursor_Pos - INT#01;
    	in_Count_End := INT#1;

    	WHILE (in_count >= in_Count_End) AND (bo_Pos_Found = FALSE) DO

    		st_CHAR := MID(XUS_TN_INPUT_CONTROL_DATA.st_Input_Mask,1,in_count);
    		IF st_CHAR = ' ' THEN
    			XUS_TN_INPUT_CONTROL_DATA.in_Cursor_Pos := in_count;
    			XUS_TN_INPUT_CONTROL_DATA.bo_Update_Input := TRUE;
    			bo_Pos_Found := TRUE;
    		END_IF

    		in_count := in_count - INT#1;
    	END_WHILE
    END_IF

    (* maximale Cursorposition ? *)
    IF XUS_TN_INPUT_CONTROL_DATA.in_Cursor_Pos > LEN(XUS_TN_INPUT_CONTROL_DATA.st_Input_Data) THEN
    	XUS_TN_INPUT_CONTROL_DATA.in_Cursor_Pos := LEN(XUS_TN_INPUT_CONTROL_DATA.st_Input_Data);
    	XUS_TN_INPUT_CONTROL_DATA.bo_Update_Input := TRUE;
    END_IF

    (* minimale Cursorposition ? *)
    IF XUS_TN_INPUT_CONTROL_DATA.in_Cursor_Pos < INT#1 THEN
    	XUS_TN_INPUT_CONTROL_DATA.in_Cursor_Pos := INT#1;
    	XUS_TN_INPUT_CONTROL_DATA.bo_Update_Input := TRUE;
    END_IF

    (* Aktualisierung der Anzeige *)
    IF (XUS_TN_INPUT_CONTROL_DATA.bo_Update_Input = TRUE) OR (XUS_TN_INPUT_CONTROL_DATA.bo_Update_All = TRUE) THEN

    	(* Title-Text ausgeben *)
    	IF (XUS_TN_INPUT_CONTROL_DATA.bo_Update_All = TRUE) THEN

    		IF (XUS_TN_INPUT_CONTROL_DATA.in_Title_X_Offset = INT#00) AND (XUS_TN_INPUT_CONTROL_DATA.in_Title_Y_Offset = INT#00) THEN
    			(* wenn Offset X,Y =0 dann Titlestring links vom Element positionieren *)
    			FB_TN_SC_WRITE.Iin_Y := XUS_TN_INPUT_CONTROL_DATA.in_Y;
    			FB_TN_SC_WRITE.Iin_X := XUS_TN_INPUT_CONTROL_DATA.in_X - LEN(XUS_TN_INPUT_CONTROL_DATA.st_Title_String);
    		ELSE
    			(* Title-Text durch Row, Color-Offset ausgeben *)
    			FB_TN_SC_WRITE.Iin_Y := XUS_TN_INPUT_CONTROL_DATA.in_Y + XUS_TN_INPUT_CONTROL_DATA.in_Title_Y_Offset;
    			FB_TN_SC_WRITE.Iin_X := XUS_TN_INPUT_CONTROL_DATA.in_X + XUS_TN_INPUT_CONTROL_DATA.in_Title_X_Offset;
    		END_IF

    		(* Title-Text durch Row, Color-Offset ausgeben *)
    		FB_TN_SC_WRITE(	Iby_ATTR := XUS_TN_INPUT_CONTROL_DATA.by_Title_Attr,
    						Ist_STRING := XUS_TN_INPUT_CONTROL_DATA.st_Title_String,
    						XUS_TN_SCREEN := XUS_TN_SCREEN);
    	END_IF

    	(* Eingabetext ausgeben *)
    	IF (XUS_TN_INPUT_CONTROL_DATA.bo_Input_Hidden = TRUE) THEN

    		st_String := '';

    		IF LEN(XUS_TN_INPUT_CONTROL_DATA.st_Input_Data) = LEN(XUS_TN_INPUT_CONTROL_DATA.st_Input_Mask) THEN
    			(* Eingabemodus: HIDDEN *)
    			FOR in_count := 1 TO LEN(XUS_TN_INPUT_CONTROL_DATA.st_Input_Data) DO

    				(* Zeichen aus Eingabemaske lesen *)
    				st_CHAR := MID(XUS_TN_INPUT_CONTROL_DATA.st_Input_Mask,1,in_count);

    				(* Eingabe oder Maskenzeichen ausgeben *)
    				IF st_CHAR = ' ' THEN

    					(* Zeichen aus Eingabedata lesen *)
    					st_CHAR := MID(XUS_TN_INPUT_CONTROL_DATA.st_Input_Data,1,in_count);

    					IF st_CHAR = ' ' THEN
    						(* Leerzeichen ausgeben *)
    						st_String := CONCAT(st_String, ' ');

    					ELSE
    						(* verdecktes Zeichen ausgeben *)
    						st_String := CONCAT(st_String, '*');

    					END_IF

    				ELSE
    					(* Zeichen aus Eingabemaske übernehmen *)
    					st_CHAR := MID(XUS_TN_INPUT_CONTROL_DATA.st_Input_Data,1,in_count);
    					st_String := CONCAT(st_String,st_CHAR);

    				END_IF
    			END_FOR
    		END_IF
    	ELSE

    		(* Eingabemodus: NORMAL *)
    		st_String := XUS_TN_INPUT_CONTROL_DATA.st_Input_Data;

    	END_IF

    	(* String ausgeben *)

    	IF XUS_TN_INPUT_CONTROL_DATA.bo_Focus = TRUE THEN
    		by_Attr := XUS_TN_INPUT_CONTROL_DATA.by_Attr_mF;
    	ELSE
    		by_Attr := XUS_TN_INPUT_CONTROL_DATA.by_Attr_oF;
    	END_IF

    	FB_TN_SC_WRITE(	Iin_Y := XUS_TN_INPUT_CONTROL_DATA.in_Y,
    					Iin_X := XUS_TN_INPUT_CONTROL_DATA.in_X,
    					Iby_ATTR := by_Attr,
    					Ist_STRING := st_String,
    					XUS_TN_SCREEN := XUS_TN_SCREEN);

    	(* Cursor auf aktuelle Position setzen *)
    	XUS_TN_INPUT_CONTROL_DATA.in_Cursor_Y := XUS_TN_INPUT_CONTROL_DATA.in_Y;
    	XUS_TN_INPUT_CONTROL_DATA.in_Cursor_X := XUS_TN_INPUT_CONTROL_DATA.in_X + XUS_TN_INPUT_CONTROL_DATA.in_Cursor_Pos - INT#1;

    	in_old_charpos := INT#0;

    	(* Update-Flag's rücksetzen *)
    	XUS_TN_INPUT_CONTROL_DATA.bo_Update_All := FALSE;
    	XUS_TN_INPUT_CONTROL_DATA.bo_Update_Input := FALSE;
    END_IF

    (* revision history
    ks	10. mai. 2010	rev 1.0
    	original version
    *)
END_FUNCTION_BLOCK
