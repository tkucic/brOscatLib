FUNCTION_BLOCK TN_INPUT_MENU_POPUP
    (*http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=178*)
    (* sicherstellen das rechteck immer innerhalb screen positioniert wird *)

    IF (XUS_TN_MENU_POPUP.bo_Activ = FALSE) AND (XUS_TN_MENU_POPUP.bo_Create = TRUE) THEN
    	XUS_TN_MENU_POPUP.bo_Activ := TRUE;
    	XUS_TN_MENU_POPUP.bo_Create := FALSE;
    	XUS_TN_MENU_POPUP.bo_Destroy := FALSE;
    	XUS_TN_MENU_POPUP.bo_Update := TRUE;

      (* Sub-Menu-Texte *)

    	XUS_TN_MENU_POPUP.in_Menu_E_Count := ELEMENT_COUNT(SEP:=BYTE#35,ELEMENT:=XUS_TN_MENU_POPUP.st_Menu_Text);

    	(* Anzahl Zeilen (Sub-Menu-Texte) bestimmen *)
    	XUS_TN_MENU_POPUP.in_ROWS := XUS_TN_MENU_POPUP.in_Menu_E_Count;

    	(* längsten Sub-Menu-Text suchen *)
    	XUS_TN_MENU_POPUP.in_COLS := INT#00;

    	FOR in_Count := INT#01 TO XUS_TN_MENU_POPUP.in_ROWS DO;
    		XUS_TN_MENU_POPUP.in_COLS:=MAX(LEN(ELEMENT_GET(SEP:=BYTE#35,POS:=in_Count - 1,ELEMENT:=XUS_TN_MENU_POPUP.st_Menu_Text)),XUS_TN_MENU_POPUP.in_COLS);
    	END_FOR

    	(* Horizontale Position überprüfen und korrigieren *)
    	IF (XUS_TN_MENU_POPUP.in_X + XUS_TN_MENU_POPUP.in_COLS) > INT#75 THEN
    		XUS_TN_MENU_POPUP.in_X := INT#79 - XUS_TN_MENU_POPUP.in_COLS - INT#04;
    	END_IF

      (* Vertikale Position überprüfen und korrigieren *)
    	IF (XUS_TN_MENU_POPUP.in_Y + XUS_TN_MENU_POPUP.in_ROWS) > INT#21 THEN
    		XUS_TN_MENU_POPUP.in_Y := INT#23 - XUS_TN_MENU_POPUP.in_ROWS - INT#2;
    	END_IF

    	XUS_TN_SCREEN.bo_Modal_Dialog := TRUE;

    	(* Hintergrund sichern *)
    	FB_TN_SC_AREA_SAVE(	Iin_X1 := XUS_TN_MENU_POPUP.in_X,
    									Iin_Y1 := XUS_TN_MENU_POPUP.in_Y,
    									Iin_X2 := XUS_TN_MENU_POPUP.in_X + XUS_TN_MENU_POPUP.in_COLS + INT#04,
    									Iin_Y2 := XUS_TN_MENU_POPUP.in_Y + XUS_TN_MENU_POPUP.in_ROWS + INT#02,
    									XUS_TN_SCREEN := XUS_TN_SCREEN);

    	(* Rahmen für Submenu zeichnen *)
    	FB_TN_SC_BOX(	Iin_X1 := XUS_TN_MENU_POPUP.in_X,
    					Iin_Y1 := XUS_TN_MENU_POPUP.in_Y,
    					Iin_X2 := XUS_TN_MENU_POPUP.in_X + XUS_TN_MENU_POPUP.in_COLS + INT#03,
    					Iin_Y2 := XUS_TN_MENU_POPUP.in_Y + XUS_TN_MENU_POPUP.in_ROWS + INT#01,
    					Iby_FILL := BYTE#32, (* Füllung *)
    					Iin_BORDER := INT#01, (* Single-Line Border *)
    					Iby_ATTR := XUS_TN_MENU_POPUP.by_Attr_oF,
    					XUS_TN_SCREEN := XUS_TN_SCREEN);

    	(* Shadow für Submenu zeichnen *)
    	FB_TN_SC_ADD_SHADOW(Iin_X1 := XUS_TN_MENU_POPUP.in_X + INT#1,
    						Iin_Y1 := XUS_TN_MENU_POPUP.in_Y + INT#1,
    						Iin_X2 := XUS_TN_MENU_POPUP.in_X + XUS_TN_MENU_POPUP.in_COLS + INT#04,
    						Iin_Y2 := XUS_TN_MENU_POPUP.in_Y + XUS_TN_MENU_POPUP.in_ROWS + INT#02,
    						Iin_OPTION := INT#00,
    						XUS_TN_SCREEN := XUS_TN_SCREEN);

    	(* Parameter laden *)
    	in_COL := XUS_TN_MENU_POPUP.in_X;
    	in_ROW := XUS_TN_MENU_POPUP.in_Y;
    	in_ROWS := XUS_TN_MENU_POPUP.in_ROWS;
    	in_COLS := XUS_TN_MENU_POPUP.in_COLS;

    	(* Trennlinien zeichnen *)
    	in_COLS := in_COLS + INT#02; (* Text um 2 Zeichen verlängern *)

    	FOR in_Count := INT#01 TO XUS_TN_MENU_POPUP.in_Menu_E_Count DO;
    		in_ROW := in_ROW + INT#01;

    		IF ELEMENT_GET(SEP:=BYTE#35,POS:=in_Count - 1,ELEMENT:=XUS_TN_MENU_POPUP.st_Menu_Text) = '-' THEN

    			FB_TN_SC_LINE(	Iin_Y1 := in_ROW,
    							Iin_X1 := in_COL,
    							Iin_Y2 := in_ROW,
    							Iin_X2 := in_COL + in_COLS + INT#01,
    							Iby_ATTR := XUS_TN_MENU_POPUP.by_Attr_oF,
    							Iby_BORDER := BYTE#01,
    							XUS_TN_SCREEN := XUS_TN_SCREEN);
    		END_IF
    	END_FOR
    END_IF

    IF (XUS_TN_MENU_POPUP.bo_Activ = TRUE) THEN

    	CASE BYTE_TO_INT(XUS_TN_MENU_POPUP.by_Input_Exten_Code) OF

    	65: (* Cursor oben *)
    		in_Scroll_Offset := -1;
    		XUS_TN_MENU_POPUP.bo_Update := TRUE;

    	66: (* Cursor unten *)
    		in_Scroll_Offset := 1;
    		XUS_TN_MENU_POPUP.bo_Update := TRUE;

    	13:  (* Enter *)
    		XUS_TN_MENU_POPUP.bo_Destroy := TRUE;

    	27:  (* Escape*)
    		XUS_TN_MENU_POPUP.bo_Destroy := TRUE;
    		XUS_TN_MENU_POPUP.in_Cur_Item := INT#00;

    	67..68: (* Cursor links oder rechts *)
    		XUS_TN_MENU_POPUP.bo_Destroy := TRUE;
    		XUS_TN_MENU_POPUP.in_Cur_Item := INT#00;

    	END_CASE
    END_IF

    (* POPUP-Menu updaten *)
    IF (XUS_TN_MENU_POPUP.bo_Activ = TRUE) AND (XUS_TN_MENU_POPUP.bo_Update = TRUE) THEN

    	XUS_TN_MENU_POPUP.bo_Update := FALSE;

    	(* überprüfung + nächstes anwählbares Sub-Menu suchen *)
    	in_index := XUS_TN_MENU_POPUP.in_Cur_Item;

    	IF (in_index < INT#01) OR (in_index > XUS_TN_MENU_POPUP.in_Menu_E_Count) THEN
    		in_Scroll_Offset := INT#01;
    		in_index := XUS_TN_MENU_POPUP.in_Menu_E_Count;
    	END_IF

    	(* aktueller Index steht auf Trennzeichen -> ändern *)
    	IF ELEMENT_GET(SEP:=BYTE#35,POS:=in_index-1,ELEMENT:=XUS_TN_MENU_POPUP.st_Menu_Text) = '-' THEN
    		in_Scroll_Offset := INT#01;
    	END_IF

    	(* Scroll-Offset *)
    	IF in_Scroll_Offset <> INT#00 THEN

    		FOR in_Count := INT#01 TO XUS_TN_MENU_POPUP.in_Menu_E_Count DO;

    			in_index:=INC2(in_index,in_Scroll_Offset,1,XUS_TN_MENU_POPUP.in_Menu_E_Count);

    			IF ELEMENT_GET(SEP:=BYTE#35,POS:=in_index - 1,ELEMENT:=XUS_TN_MENU_POPUP.st_Menu_Text) <> '-' THEN
    				EXIT;
    			END_IF

    		END_FOR
    	END_IF

    	XUS_TN_MENU_POPUP.in_Cur_Item := in_index;
    	in_Scroll_Offset := INT#00;

    	(* Parameter laden *)
    	in_COL  := XUS_TN_MENU_POPUP.in_X;
    	in_ROW  := XUS_TN_MENU_POPUP.in_Y;
    	in_ROWS := XUS_TN_MENU_POPUP.in_ROWS;
    	in_COLS := XUS_TN_MENU_POPUP.in_COLS;

    	(* SUB-MENU-Titel ausgeben *)
    	in_COLS := in_COLS + INT#02; (* Text um 2 Zeichen verlängern *)

    	FOR in_Count := INT#01 TO XUS_TN_MENU_POPUP.in_Menu_E_Count DO;

    		in_ROW := in_ROW + INT#01;

    		(* Zeichenfarbe bestimmen *)
    		IF in_Count = XUS_TN_MENU_POPUP.in_Cur_Item THEN
    			by_ATTR := XUS_TN_MENU_POPUP.by_Attr_mF;
    		ELSE
    			by_ATTR := XUS_TN_MENU_POPUP.by_Attr_oF;
    		END_IF

    		FB_TN_SC_WRITE_C.Ist_STRING := ELEMENT_GET(SEP:=BYTE#35,POS:=in_Count - 1,ELEMENT:=XUS_TN_MENU_POPUP.st_Menu_Text);

    		IF FB_TN_SC_WRITE_C.Ist_STRING <> '-' THEN

    			FB_TN_SC_WRITE_C(	Iin_Y := in_ROW,
    								Iin_X := in_COL + INT#01,
    								Iby_ATTR := by_ATTR,
    								Iin_LENGTH := in_COLS,
    								Iin_OPTION := INT#02, (* Center *)
    								XUS_TN_SCREEN := XUS_TN_SCREEN);
    		END_IF
    	END_FOR
    END_IF

    (* POPUP-Menu entfernen (Destroy) *)
    IF (XUS_TN_MENU_POPUP.bo_Activ = TRUE) AND (XUS_TN_MENU_POPUP.bo_Destroy = TRUE) THEN

    	XUS_TN_MENU_POPUP.bo_Destroy := FALSE;
    	XUS_TN_MENU_POPUP.bo_Activ := FALSE;

    	(* alten Hintergrund aus Speicher wiederherstellen *)
    	FB_TN_SC_AREA_RESTORE(XUS_TN_SCREEN := XUS_TN_SCREEN);

    	XUS_TN_SCREEN.bo_Modal_Dialog := FALSE;
    END_IF

    (* revision history

    ks	06. apr. 2011	rev 1.1
    	list_len und list_get durch element_count und element_get ersetzt

    ks	10. mai. 2010	rev 1.0
    	original version
    *)
END_FUNCTION_BLOCK
