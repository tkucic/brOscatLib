TYPE
    us_TN_INPUT_CONTROL :    STRUCT
        bo_Enable : BOOL; (* Bearbeitung freigeben/sperren *)
        bo_Update_all : BOOL; (* All Elemente neu zeichnen *)
        bo_Reset_Fokus : BOOL; (* Fokus auf 1. Element setzen *)
        in_Focus_at : INT; (* Controlelement mit aktivem Fokus *)
        in_Count : INT; (* Anzahl der benutzen Control-Elemente *)
        in_ToolTip_X : INT; (* Tooltip Text X-Offset *)
        in_ToolTip_Y : INT; (* Tooltip Text Y-Offset *)
        by_ToolTip_Attr : BYTE; (* Tooltip Text Attribute *)
        in_ToolTip_Size : INT; (* Tooltip Text länge *)
        usa_TN_INPUT_CONTROL_DATA : ARRAY[1..20] OF us_TN_INPUT_CONTROL_DATA;
    END_STRUCT;
    us_TN_INPUT_CONTROL_DATA :    STRUCT
        by_Input_Exten_Code : BYTE;
        by_Input_ASCII_Code : BYTE;
        bo_Input_ASCII_IsNum : BOOL;
        in_Title_X_Offset : INT; (* Title Text X-Offset *)
        in_Title_Y_Offset : INT; (* Title Text Y-Offset *)
        by_Title_Attr : BYTE; (* Title Text Attribute *)
        st_Title_String : STRING[255]; (* Title Text String *)
        in_Cursor_X : INT; (* aktuelle Cursor X-Position *)
        in_Cursor_Y : INT; (* aktuelle Cursor Y-Position *)
        in_Type : INT; (* Type des Elements *)
        in_X : INT; (* Element X-Position *)
        in_Y : INT; (* Element Y-Position *)
        in_Cursor_Pos : INT; (* aktuelle Cursorposition *)
        by_Attr_mF : BYTE; (* Text Attribute mit Fokus *)
        by_Attr_oF : BYTE; (* Text Attribute ohne Fokus *)
        in_selected : INT; (* Text Item wurde ausgewählt *)
        st_Input_Mask : STRING[255]; (* Text Eingabemaske *)
        st_Input_Data : STRING[STRING_LENGTH]; (* Text aktuelle Eingabedaten *)
        st_Input_String : STRING[255]; (* Text Kopie nach Return-Taste *)
        st_Input_ToolTip : STRING[255]; (* Text ToolTip (Eingabeinformation) *)
        in_Input_Option : INT; (* Text Ausgabe-Optionen *)
        bo_Input_Entered : BOOL; (* RETURN-Taste wurde betätigt *)
        bo_Input_Hidden : BOOL; (* Text versteckete Eingabe mit '*' *)
        bo_Input_Only_Num : BOOL; (* Text nur Nummerneingabe zulassen *)
        bo_Focus : BOOL; (* Element besitzt den Fokus *)
        bo_Update_Input : BOOL; (* Element wegen Benutzereingabe neuzeichnen *)
        bo_Update_All : BOOL; (* Element komplett neuzeichnen *)
    END_STRUCT;
    us_TN_MENU :    STRUCT
        st_Menu_Text : STRING[STRING_LENGTH]; (* X Menue Texte *)
        in_Menu_E_Count : INT; (* Menue Elemente Anzahl *)
        in_Y : INT; (* Menue Zeilennummer  Y-Position *)
        in_X : INT; (* Menue Spaltennummer X-Position *)
        by_Attr_mF : BYTE; (* Text Attribute mit Fokus *)
        by_Attr_oF : BYTE; (* Text Attribute ohne Fokus *)
        in_X_SM_new : INT; (* neue Sub-Menu X-Position *)
        in_Y_SM_new : INT; (* neue Sub-Menu Y-Position *)
        in_X_SM_old : INT; (* alte Sub-Menu X-Position *)
        in_Y_SM_old : INT; (* alte Sub-Menu Y-Position *)
        in_Cur_Menu_Item : INT; (* aktuelles Haupt-Menue *)
        in_Cur_Sub_Item : INT; (* aktuelles Sub-Menue *)
        in_State : INT; (*   Menu status   *)
        in_Menu_Selected : INT; (* X Menu-Item mit Enter angewwählt *)
        bo_Create : BOOL; (* X Menu erzeugen *)
        bo_Destroy : BOOL; (* X Menu entfernen *)
        bo_Update : BOOL; (* X Menu updaten *)
    END_STRUCT;
    us_TN_MENU_POPUP :    STRUCT
        st_Menu_Text : STRING[STRING_LENGTH]; (* X Menue Texte *)
        in_Menu_E_Count : INT; (* Menue Elemente Anzahl *)
        in_X : INT; (* X Menue X-Position *)
        in_Y : INT; (* X Menue Y-Position *)
        in_Cols : INT; (* Menue Spaltenanzahl *)
        in_Rows : INT; (* Menue Zeilenanzahl *)
        in_Cur_Item : INT; (* X aktuelles Sub-Menue *)
        by_Attr_mF : BYTE; (* X Text Attribute mit Fokus	*)
        by_Attr_oF : BYTE; (* X Text Attribute ohne Fokus *)
        by_Input_Exten_Code : BYTE; (* X Tastencode: Sondertasten *)
        bo_Create : BOOL; (* X Popup-Menu erzeugen *)
        bo_Destroy : BOOL; (* X Popup-Menu entfernen *)
        bo_Update : BOOL; (* X Popup-Menu updaten *)
        bo_Activ : BOOL; (*   Popup-Menu ist aktiv *)
    END_STRUCT;
    us_TN_SCREEN :    STRUCT
        bya_CHAR : ARRAY[0..1919] OF BYTE;
        bya_COLOR : ARRAY[0..1919] OF BYTE;
        bya_BACKUP : ARRAY[0..1919] OF BYTE;
        bya_Line_Update : ARRAY[0..23] OF BOOL;
        by_Input_Exten_Code : BYTE;
        by_Input_ASCII_Code : BYTE;
        bo_Input_ASCII_IsNum : BOOL;
        in_Page_Number : INT; (* aktive Seiten-Nr. *)
        in_Cursor_X : INT; (* Cursor X-Position *)
        in_Cursor_Y : INT; (* Cursor Y-Position *)
        in_EOS_Offset : INT; (* End of String Offset *)
        by_Clear_Screen_Attr : BYTE; (* Clear-Screen Attr *)
        bo_Clear_Screen : BOOL; (* Clear-Screen auslösen *)
        bo_Modal_Dialog : BOOL; (* Modaler Dialog ist aktiv *)
        bo_Menue_Bar_Dialog : BOOL; (* Menue Dialog ist aktiv *)
    END_STRUCT;
END_TYPE