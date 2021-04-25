FUNCTION_BLOCK TN_INPUT_SELECT_POPUP
    (*http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=178*)
    (* Benutzereingabe auswerten -> Selektion Text n *)
    IF (XUS_TN_INPUT_CONTROL_DATA.bo_Focus = TRUE) THEN

    	by_Cur_Key := XUS_TN_INPUT_CONTROL_DATA.by_Input_Exten_Code;

    	IF (us_TN_MENU_POPUP.bo_Activ = FALSE) THEN
    		us_TN_MENU_POPUP.by_Input_Exten_Code := BYTE#00;

    		(* Return-Taste auswerten *)
    		IF (by_Cur_Key = BYTE#13) THEN
    			(* Popup-Menu parameter übergeben *)
    			us_TN_MENU_POPUP.in_Y := XUS_TN_INPUT_CONTROL_DATA.in_Y;
    			us_TN_MENU_POPUP.in_X := XUS_TN_INPUT_CONTROL_DATA.in_X;
    			us_TN_MENU_POPUP.by_Attr_mF := XUS_TN_INPUT_CONTROL_DATA.by_Attr_mF;
    			us_TN_MENU_POPUP.by_Attr_oF := XUS_TN_INPUT_CONTROL_DATA.by_Attr_oF;
    			us_TN_MENU_POPUP.st_Menu_Text := XUS_TN_INPUT_CONTROL_DATA.st_Input_Data;
    			us_TN_MENU_POPUP.bo_Create := TRUE;
    			us_TN_MENU_POPUP.in_Cur_Item := INT#00;
    		END_IF

    		IF (us_TN_MENU_POPUP.in_Cur_Item > INT#00) THEN
    			XUS_TN_INPUT_CONTROL_DATA.in_selected := us_TN_MENU_POPUP.in_Cur_Item;
    			XUS_TN_INPUT_CONTROL_DATA.bo_Input_Entered := TRUE;
    			XUS_TN_INPUT_CONTROL_DATA.bo_Update_Input := TRUE;
    			us_TN_MENU_POPUP.in_Cur_Item := INT#00;
    		END_IF

    	ELSE
    		us_TN_MENU_POPUP.by_Input_Exten_Code := by_Cur_Key;
    	END_IF

    	(* Popup-Menu zyklisch aufrufen *)
    	FB_TN_INPUT_MENU_POPUP(Xus_TN_MENU_POPUP := us_TN_MENU_POPUP, XUS_TN_SCREEN := XUS_TN_SCREEN);

    END_IF

    (* Aktualisierung der Anzeige *)
    IF (XUS_TN_INPUT_CONTROL_DATA.bo_Update_Input = TRUE) OR (XUS_TN_INPUT_CONTROL_DATA.bo_Update_All = TRUE) THEN

    	(* Title-Text ausgeben *)
    	IF XUS_TN_INPUT_CONTROL_DATA.bo_Update_All = TRUE THEN

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

    	in_Element_Count := ELEMENT_COUNT(SEP:=BYTE#35,ELEMENT:=XUS_TN_INPUT_CONTROL_DATA.st_Input_Data);

    	IF in_Element_Count > INT#00 THEN

    		XUS_TN_INPUT_CONTROL_DATA.in_selected:=LIMIT(1,XUS_TN_INPUT_CONTROL_DATA.in_selected,in_Element_Count);

    		in_index := XUS_TN_INPUT_CONTROL_DATA.in_selected;

    		st_String := ELEMENT_GET(SEP:=BYTE#35,POS:=in_index - 1,ELEMENT:=XUS_TN_INPUT_CONTROL_DATA.st_Input_Data);

    		st_String:= FIX(str:=st_String,
    						L:=LEN(XUS_TN_INPUT_CONTROL_DATA.st_Input_Mask),
    						C:=BYTE#32,
    						M:=XUS_TN_INPUT_CONTROL_DATA.in_Input_Option);


    		XUS_TN_INPUT_CONTROL_DATA.st_Input_String := st_String;

    		IF XUS_TN_INPUT_CONTROL_DATA.bo_Focus = TRUE THEN
    			by_Attr := XUS_TN_INPUT_CONTROL_DATA.by_Attr_mF;
    		ELSE
    			by_Attr := XUS_TN_INPUT_CONTROL_DATA.by_Attr_oF;
    		END_IF

    		FB_TN_SC_WRITE(	Iin_X := XUS_TN_INPUT_CONTROL_DATA.in_X,
    								Iin_Y := XUS_TN_INPUT_CONTROL_DATA.in_Y,
    								Iby_ATTR := by_Attr,
    								Ist_STRING := st_String,
    								XUS_TN_SCREEN := XUS_TN_SCREEN );
    	END_IF

    	(* Cursor auf aktuelle Position setzen *)
    	XUS_TN_INPUT_CONTROL_DATA.in_Cursor_X := XUS_TN_INPUT_CONTROL_DATA.in_X;
    	XUS_TN_INPUT_CONTROL_DATA.in_Cursor_Y := XUS_TN_INPUT_CONTROL_DATA.in_Y;

    	(* Update-Flag's rücksetzen *)
    	XUS_TN_INPUT_CONTROL_DATA.bo_Update_All   := FALSE;
    	XUS_TN_INPUT_CONTROL_DATA.bo_Update_Input := FALSE;

    END_IF

    (* revision history

    ks	06. apr. 2011	rev 1.1
    	list_len und list_get durch element_count und element_get ersetzt

    ks	10. mai. 2010	rev 1.0
    	original version
    *)
END_FUNCTION_BLOCK
