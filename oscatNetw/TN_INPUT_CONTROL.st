FUNCTION_BLOCK TN_INPUT_CONTROL
    (*http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=174*)
    (* Bearbeitung freigegeben ? *)
    IF (XUS_TN_INPUT_CONTROL.bo_Enable = FALSE) OR (XUS_TN_SCREEN.bo_Menue_Bar_Dialog = TRUE) THEN
    	RETURN;
    END_IF

    (* Fokus Reset durchführen *)
    IF (XUS_TN_INPUT_CONTROL.bo_Reset_Fokus = TRUE) THEN
    	XUS_TN_INPUT_CONTROL.bo_Reset_Fokus := FALSE;

    	FOR in_index := INT#01 TO XUS_TN_INPUT_CONTROL.in_Count DO
    		XUS_TN_INPUT_CONTROL.usa_TN_INPUT_CONTROL_DATA[in_index].bo_Focus := FALSE;
    	END_FOR

    	IF (XUS_TN_INPUT_CONTROL.in_Count >= INT#01) THEN
    		XUS_TN_INPUT_CONTROL.usa_TN_INPUT_CONTROL_DATA[1].bo_Focus := TRUE;
    		XUS_TN_INPUT_CONTROL.in_Focus_at := INT#01;
    	END_IF

    	XUS_TN_INPUT_CONTROL.bo_Update_all := TRUE;
    END_IF

    IF (XUS_TN_SCREEN.bo_Modal_Dialog = FALSE) THEN
    	(* TAB-Taste für Control-element wechsel auswerten *)
    	IF (XUS_TN_SCREEN.by_Input_Exten_Code = BYTE#09) THEN

    		in_Scroll_Offset := INT#01;

    		(* Cursor-Oben Taste *)
    	ELSIF (XUS_TN_SCREEN.by_Input_Exten_Code = BYTE#65) THEN

    		in_Scroll_Offset := -1;

    		(* Cursor-unten Taste *)
    	ELSIF (XUS_TN_SCREEN.by_Input_Exten_Code = BYTE#66) THEN

    		in_Scroll_Offset := INT#01;

    	END_IF
    END_IF

    IF (in_Scroll_Offset <> INT#00) THEN  
    	(* Grenzwerte überprüfen                                            *)

    	XUS_TN_INPUT_CONTROL.in_Focus_at:=LIMIT(INT#01,XUS_TN_INPUT_CONTROL.in_Focus_at,XUS_TN_INPUT_CONTROL.in_Count);

    	in_Focus_new := XUS_TN_INPUT_CONTROL.in_Focus_at + in_Scroll_Offset;

    	IF (in_Focus_new > XUS_TN_INPUT_CONTROL.in_Count) THEN
    		in_Focus_new := INT#1;
    	END_IF

    	IF (in_Focus_new < INT#01) THEN
    		in_Focus_new := XUS_TN_INPUT_CONTROL.in_Count;
    	END_IF

    	in_Focus_alt := XUS_TN_INPUT_CONTROL.in_Focus_at;

    	(* aktuellen Element den Fokus entziehen *)
    	XUS_TN_INPUT_CONTROL.usa_TN_INPUT_CONTROL_DATA[in_Focus_alt].bo_Focus := FALSE;
    	XUS_TN_INPUT_CONTROL.usa_TN_INPUT_CONTROL_DATA[in_Focus_alt].bo_Update_Input := TRUE;

    	(* neuem Element den Fokus geben *)
    	XUS_TN_INPUT_CONTROL.usa_TN_INPUT_CONTROL_DATA[in_Focus_new].bo_Focus  := TRUE;
    	XUS_TN_INPUT_CONTROL.usa_TN_INPUT_CONTROL_DATA[in_Focus_new].bo_Update_Input := TRUE;

    	XUS_TN_INPUT_CONTROL.in_Focus_at := in_Focus_new;

    	bo_Tool_Tip_Update := TRUE;
    	in_Scroll_Offset := INT#00;

    END_IF

    (* Alle Elemente updaten ? *)
    IF (XUS_TN_INPUT_CONTROL.bo_Update_all = TRUE) THEN
    	FOR in_index := 1 TO XUS_TN_INPUT_CONTROL.in_Count DO
    		XUS_TN_INPUT_CONTROL.usa_TN_INPUT_CONTROL_DATA[in_index].bo_Update_All := TRUE;
    	END_FOR
    	XUS_TN_INPUT_CONTROL.bo_Update_all := FALSE;
    	bo_Tool_Tip_Update := TRUE;
    END_IF

    FOR in_index := 1 TO XUS_TN_INPUT_CONTROL.in_Count DO

    	IF (XUS_TN_INPUT_CONTROL.usa_TN_INPUT_CONTROL_DATA[in_index].in_Type > INT#00) THEN

    		IF (XUS_TN_INPUT_CONTROL.usa_TN_INPUT_CONTROL_DATA[in_index].bo_Focus = TRUE) THEN

    			XUS_TN_INPUT_CONTROL.usa_TN_INPUT_CONTROL_DATA[in_index].by_Input_ASCII_Code  := XUS_TN_SCREEN.by_Input_ASCII_Code;
    			XUS_TN_INPUT_CONTROL.usa_TN_INPUT_CONTROL_DATA[in_index].by_Input_Exten_Code  := XUS_TN_SCREEN.by_Input_Exten_Code;
    			XUS_TN_INPUT_CONTROL.usa_TN_INPUT_CONTROL_DATA[in_index].bo_Input_ASCII_IsNum := XUS_TN_SCREEN.bo_Input_ASCII_IsNum;

    			(* Tool-Tip Text ausgeben *)
    			IF (bo_Tool_Tip_Update = TRUE) THEN

    				FB_TN_SC_WRITE_C(	Iin_Y := XUS_TN_INPUT_CONTROL.in_ToolTip_Y,
    									Iin_X := XUS_TN_INPUT_CONTROL.in_ToolTip_X,
    									Iby_ATTR := XUS_TN_INPUT_CONTROL.by_ToolTip_Attr,
    									Iin_OPTION := INT#02, (* Center-String *)
    									Iin_LENGTH := XUS_TN_INPUT_CONTROL.in_ToolTip_Size,
    									Ist_STRING := XUS_TN_INPUT_CONTROL.usa_TN_INPUT_CONTROL_DATA[in_index].st_Input_ToolTip,
    									XUS_TN_SCREEN := XUS_TN_SCREEN);

    				(* Flag rücksetzen *)
    				bo_Tool_Tip_Update := FALSE;
    			END_IF
    		END_IF

    		CASE XUS_TN_INPUT_CONTROL.usa_TN_INPUT_CONTROL_DATA[in_index].in_Type OF
    		1:
    			(* Edit-Line bearbeiten *)
    			FB_TN_INPUT_EDIT_LINE(	Xus_TN_INPUT_CONTROL_DATA := XUS_TN_INPUT_CONTROL.usa_TN_INPUT_CONTROL_DATA[in_index],
    									XUS_TN_SCREEN := XUS_TN_SCREEN);
    		2:
    			(* Select-Text bearbeiten *)
    			FB_TN_INPUT_SELECT_TEXT(	Xus_TN_INPUT_CONTROL_DATA := XUS_TN_INPUT_CONTROL.usa_TN_INPUT_CONTROL_DATA[in_index],
    										XUS_TN_SCREEN := XUS_TN_SCREEN);
    		3:
    			(* Select-Popup bearbeiten *)
    			FB_TN_INPUT_SELECT_POPUP(	Xus_TN_INPUT_CONTROL_DATA := XUS_TN_INPUT_CONTROL.usa_TN_INPUT_CONTROL_DATA[in_index],
    										XUS_TN_SCREEN := XUS_TN_SCREEN);
    		END_CASE

    		IF (XUS_TN_INPUT_CONTROL.usa_TN_INPUT_CONTROL_DATA[in_index].bo_Focus = TRUE) THEN

    			(* Cursor position von Element auf Screen übertragen *)
    			XUS_TN_SCREEN.in_Cursor_X := XUS_TN_INPUT_CONTROL.usa_TN_INPUT_CONTROL_DATA[in_index].in_Cursor_X;
    			XUS_TN_SCREEN.in_Cursor_Y := XUS_TN_INPUT_CONTROL.usa_TN_INPUT_CONTROL_DATA[in_index].in_Cursor_Y;

    		END_IF
    	END_IF
    END_FOR

    (* revision history
    ks	10. mai. 2010	rev 1.0
    	original version
    *)
END_FUNCTION_BLOCK
