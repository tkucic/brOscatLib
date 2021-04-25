FUNCTION_BLOCK TN_INPUT_MENU_BAR
    (*http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=176*)
    (* sicherstellen das rechteck immer innerhalb screen positioniert wird *)

    IF (XUS_TN_MENU.in_State = INT#00) AND (XUS_TN_MENU.bo_Create = TRUE) THEN
    	XUS_TN_MENU.in_State := INT#01;
    	XUS_TN_MENU.bo_Create := FALSE;
    	XUS_TN_MENU.in_Menu_Selected := INT#00;
    	XUS_TN_MENU.bo_Update := TRUE;
    	bo_Reset_Position := TRUE;

    	(* Menu-Bar - Hauptmenue *)
    	st_MENU_BAR := ELEMENT_GET(SEP:=BYTE#37,POS:=0,ELEMENT:=XUS_TN_MENU.st_MENU_TEXT);

    	(* Menu-Bar - Anzahl der Elemente bestimmen *)
    	XUS_TN_MENU.in_Menu_E_Count := ELEMENT_COUNT(SEP:=BYTE#35,ELEMENT:=st_MENU_BAR);

    END_IF

    (* Keycode ablegen *)
    by_New_KeyCode := XUS_TN_SCREEN.by_Input_Exten_Code;

    (* Popup-Menu Tastensteuerung (nur Cursor oben + unten zulassen *)
    IF (by_New_KeyCode = BYTE#65) OR (by_New_KeyCode = BYTE#66) THEN
    	us_TN_MENU_POPUP.by_Input_Exten_Code := by_New_KeyCode;
    ELSE
    	us_TN_MENU_POPUP.by_Input_Exten_Code := BYTE#00;
    END_IF

    (* Escape *)
    IF (by_New_KeyCode = BYTE#27) THEN
    	(* Menu war inaktiv -> Escape -> Menu aktivieren *)
    	IF (XUS_TN_MENU.in_State = INT#01) AND (XUS_TN_SCREEN.bo_Modal_Dialog = FALSE) THEN
    		XUS_TN_MENU.in_State := INT#02;
    		XUS_TN_MENU.bo_Update := TRUE;
    		XUS_TN_MENU.in_Menu_Selected := INT#00;

    		XUS_TN_SCREEN.bo_Menue_Bar_Dialog := TRUE;

    		(* Menu war aktiv -> Escape -> Menu deaktivieren *)
    	ELSIF (XUS_TN_MENU.in_State = INT#02) THEN
    		us_TN_MENU_POPUP.bo_Destroy := TRUE;
    		XUS_TN_MENU.bo_Update := TRUE;
    		XUS_TN_MENU.in_State := INT#01;
    		bo_Reset_Position := TRUE;

    		XUS_TN_SCREEN.bo_Menue_Bar_Dialog := FALSE;
    	END_IF
    END_IF

    (* Menu aktiv *)
    IF (XUS_TN_MENU.in_State = INT#02) THEN

    	(* Return *)
    	IF (by_New_KeyCode = BYTE#13)  THEN
    		us_TN_MENU_POPUP.bo_Destroy := TRUE;
    		XUS_TN_MENU.bo_Update := TRUE;
    		XUS_TN_MENU.in_State := INT#01;
    		bo_Reset_Position := TRUE;
    		XUS_TN_MENU.in_Menu_Selected := (XUS_TN_MENU.in_Cur_Menu_Item * INT#10) + XUS_TN_MENU.in_Cur_Sub_Item;
    		XUS_TN_SCREEN.by_Input_Exten_Code := BYTE#00;

    		XUS_TN_SCREEN.bo_Menue_Bar_Dialog := FALSE;

    		(* Destroy-Befehl -> Popup-Menu beenden *)
    	ELSIF (XUS_TN_MENU.bo_Destroy = TRUE) THEN
    		us_TN_MENU_POPUP.bo_Destroy := TRUE;
    		XUS_TN_MENU.bo_Update := TRUE;
    		XUS_TN_MENU.in_State := INT#01;
    		bo_Reset_Position := TRUE;
    		XUS_TN_MENU.in_Menu_Selected := INT#00;
    		XUS_TN_SCREEN.by_Input_Exten_Code := BYTE#00;

    		XUS_TN_SCREEN.bo_Menue_Bar_Dialog := FALSE;

    	END_IF

    	IF (by_New_KeyCode = BYTE#67) THEN (* Cursor rechts *)
    		in_Scroll_Offset := INT#1;
    		XUS_TN_MENU.bo_Update := TRUE;
    		XUS_TN_SCREEN.by_Input_Exten_Code := BYTE#00;

    	ELSIF (by_New_KeyCode = BYTE#68) THEN (* Cursor links *)
    		in_Scroll_Offset := -1;
    		XUS_TN_MENU.bo_Update := TRUE;
    		XUS_TN_SCREEN.by_Input_Exten_Code := BYTE#00;
    	END_IF
    END_IF

    IF bo_Reset_Position = TRUE THEN
    	bo_Reset_Position := FALSE;
    	XUS_TN_MENU.in_X_SM_old := -1;
    	XUS_TN_MENU.in_Y_SM_old := -1;
    	XUS_TN_MENU.in_X_SM_new := -1;
    	XUS_TN_MENU.in_Y_SM_new := -1;
    END_IF

    (* POPUP-Menu updaten *)
    IF (XUS_TN_MENU.in_State > INT#00) AND (XUS_TN_MENU.bo_Update = TRUE) THEN

    	XUS_TN_MENU.bo_Update := FALSE; 

    	in_ROW := XUS_TN_MENU.in_Y;
    	in_COL := XUS_TN_MENU.in_X;

    	(* Scrolloffset *)
    	IF in_Scroll_Offset <> INT#00 THEN
    		XUS_TN_MENU.in_Cur_Menu_Item := INC2(XUS_TN_MENU.in_Cur_Menu_Item,in_Scroll_Offset,1,XUS_TN_MENU.in_Menu_E_Count);
    		in_Scroll_Offset := INT#00;
    	ELSE
    		(* Item = 0 und kein Scrolloffset *)
    		IF (XUS_TN_MENU.in_Cur_Menu_Item = INT#00) THEN
    			XUS_TN_MENU.in_Cur_Menu_Item := INT#01;
    		END_IF
    	END_IF

    	(* alle Menutext zeichnen *)
    	FOR in_Count := INT#01 TO XUS_TN_MENU.in_Menu_E_Count DO;

    		(* Zeichenfarbe bestimmen *)
    		IF (in_Count = XUS_TN_MENU.in_Cur_Menu_Item) AND (XUS_TN_MENU.in_State > INT#01 ) THEN
    			by_ATTR := XUS_TN_MENU.by_Attr_mF;

    			XUS_TN_MENU.in_Y_SM_new := in_ROW + INT#01;
    			XUS_TN_MENU.in_X_SM_new := in_COL;

    		ELSE
    			by_ATTR := XUS_TN_MENU.by_Attr_oF;
    		END_IF

    		st_MENU_TITLE := ELEMENT_GET(SEP:=BYTE#35,POS:=in_Count - 1,ELEMENT:=st_MENU_BAR);

    		in_TITLE_Length := LEN(st_MENU_TITLE) + INT#02;

    		FB_TN_SC_WRITE_C(	Iin_Y := in_ROW,
    							Iin_X := in_COL,
    							Iby_ATTR := by_ATTR,
    							Iin_LENGTH := in_TITLE_Length,
    							Iin_OPTION := INT#02,
    							Ist_STRING := st_MENU_TITLE,
    							XUS_TN_SCREEN := XUS_TN_SCREEN);

    		in_COL := in_COL + in_TITLE_Length;

    	END_FOR
    END_IF

    IF XUS_TN_MENU.in_X_SM_new <> XUS_TN_MENU.in_X_SM_old THEN

    	(* SubMenu ist aktiv -> beenden                                     *)
    	IF us_TN_MENU_POPUP.bo_Activ = TRUE THEN
    		us_TN_MENU_POPUP.bo_Destroy := TRUE;

    		(* Sub-Menu bearbeiten *)
    		FB_TN_INPUT_MENU_POPUP(	Xus_TN_MENU_POPUP := us_TN_MENU_POPUP,
    								XUS_TN_SCREEN := XUS_TN_SCREEN);
    	END_IF

    	IF us_TN_MENU_POPUP.bo_Activ = FALSE THEN
    		(* Popup-Menu zu aktuellen Menu parametrieren und ausführen         *)
    		in_Index := XUS_TN_MENU.in_Cur_Menu_Item;

    		us_TN_MENU_POPUP.in_Y := XUS_TN_MENU.in_Y_SM_new;
    		us_TN_MENU_POPUP.in_X := XUS_TN_MENU.in_X_SM_new;
    		us_TN_MENU_POPUP.by_Attr_mF := XUS_TN_MENU.by_Attr_mF;
    		us_TN_MENU_POPUP.by_Attr_oF := XUS_TN_MENU.by_Attr_oF;
    		us_TN_MENU_POPUP.st_Menu_Text := ELEMENT_GET(SEP:=BYTE#37,POS:=in_Index,ELEMENT:=XUS_TN_MENU.st_MENU_TEXT);
    		us_TN_MENU_POPUP.bo_Create := TRUE;

    		XUS_TN_MENU.in_X_SM_old := XUS_TN_MENU.in_X_SM_new;
    		XUS_TN_MENU.in_Y_SM_old := XUS_TN_MENU.in_Y_SM_new;

    	END_IF
    END_IF

    (* Popup-Menu zyklisch aufrufen *)
    FB_TN_INPUT_MENU_POPUP(	Xus_TN_MENU_POPUP := us_TN_MENU_POPUP,
    						XUS_TN_SCREEN := XUS_TN_SCREEN);

    (* aktuelles Item vom Popup-Menu kopieren *)
    XUS_TN_MENU.in_Cur_Sub_Item := us_TN_MENU_POPUP.in_Cur_Item;

    (* Destroy-Befehl *)
    IF (XUS_TN_MENU.in_State = INT#01) THEN
    	IF (XUS_TN_MENU.bo_Destroy = TRUE) THEN
    		XUS_TN_MENU.in_State := INT#00;
    		XUS_TN_MENU.bo_Destroy := FALSE;
    		XUS_TN_MENU.in_Cur_Menu_Item := INT#00;
    		XUS_TN_MENU.in_Cur_Sub_Item := INT#00;
    	END_IF
    END_IF

    (* revision history
    ks	06. apr. 2011	rev 1.1
    	list_len und list_get durch element_count und element_get ersetzt

    ks	10. mai. 2010	rev 1.0
    	original version
    *)
END_FUNCTION_BLOCK
