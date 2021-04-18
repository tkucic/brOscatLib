FUNCTION_BLOCK TN_FRAMEWORK
    VAR_INPUT
        PORT : WORD; (**)
    END_VAR
    VAR_IN_OUT
        us_TN_INPUT_CONTROL : us_TN_INPUT_CONTROL; (**)
        us_TN_SCREEN : us_TN_SCREEN; (**)
        us_TN_MENU : us_TN_MENU; (**)
        S_BUF : NETWORK_BUFFER; (**)
        R_BUF : NETWORK_BUFFER; (**)
        IP_C : IP_C; (**)
    END_VAR
    VAR
        FB_IP_CONTROL : IP_CONTROL; (**)
        FB_TN_INPUT_CONTROL : TN_INPUT_CONTROL; (**)
        FB_TN_INPUT_MENU_BAR : TN_INPUT_MENU_BAR; (**)
        FB_TN_RECEIVE : TN_RECEIVE; (**)
        FB_TN_SEND_ROWS : TN_SEND_ROWS; (**)
        t : TON; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TN_INPUT_CONTROL
    VAR_IN_OUT
        Xus_TN_SCREEN : us_TN_SCREEN; (**)
        Xus_TN_INPUT_CONTROL : us_TN_INPUT_CONTROL; (**)
    END_VAR
    VAR
        FB_TN_INPUT_SELECT_POPUP : TN_INPUT_SELECT_POPUP; (**)
        FB_TN_INPUT_SELECT_TEXT : TN_INPUT_SELECT_TEXT; (**)
        FB_TN_SC_WRITE_C : TN_SC_WRITE_C; (**)
        FB_TN_INPUT_EDIT_LINE : TN_INPUT_EDIT_LINE; (**)
        in_index : INT; (**)
        in_Scroll_Offset : INT; (**)
        in_Focus_new : INT; (**)
        in_Focus_alt : INT; (**)
        bo_Tool_Tip_Update : BOOL; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TN_INPUT_EDIT_LINE
    VAR_IN_OUT
        Xus_TN_SCREEN : us_TN_SCREEN; (**)
        Xus_TN_INPUT_CONTROL_DATA : us_TN_INPUT_CONTROL_DATA; (**)
    END_VAR
    VAR
        in_count : INT; (**)
        in_Count_End : INT; (**)
        in_CursorOffset : INT; (**)
        by_Attr : BYTE; (**)
        st_String : STRING[255]; (**)
        bo_Pos_Found : BOOL; (**)
        st_CHAR : STRING[1]; (**)
        in_old_charpos : INT; (**)
        FB_TN_SC_WRITE : TN_SC_WRITE; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TN_INPUT_MENU_BAR
    VAR_IN_OUT
        Xus_TN_MENU : us_TN_MENU; (**)
        Xus_TN_SCREEN : us_TN_SCREEN; (**)
    END_VAR
    VAR
        FB_TN_INPUT_MENU_POPUP : TN_INPUT_MENU_POPUP; (**)
        us_TN_MENU_POPUP : us_TN_MENU_POPUP; (**)
        FB_TN_SC_WRITE_C : TN_SC_WRITE_C; (**)
        in_ROW : INT; (**)
        in_COL : INT; (**)
        in_TITLE_Length : INT; (**)
        st_MENU_BAR : STRING[OSCAT_BASIC.STRING_LENGTH]; (**)
        st_MENU_TITLE : STRING[255]; (**)
        in_Count : INT; (**)
        in_Index : INT; (**)
        by_New_KeyCode : BYTE; (**)
        in_Scroll_Offset : INT; (**)
        by_ATTR : BYTE; (**)
        bo_Reset_Position : BOOL; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TN_INPUT_MENU_POPUP
    VAR_IN_OUT
        Xus_TN_MENU_POPUP : us_TN_MENU_POPUP; (**)
        Xus_TN_SCREEN : us_TN_SCREEN; (**)
    END_VAR
    VAR
        FB_TN_SC_AREA_SAVE : TN_SC_AREA_SAVE; (**)
        FB_TN_SC_AREA_RESTORE : TN_SC_AREA_RESTORE; (**)
        FB_TN_SC_LINE : TN_SC_LINE; (**)
        FB_TN_SC_ADD_SHADOW : TN_SC_ADD_SHADOW; (**)
        FB_TN_SC_BOX : TN_SC_BOX; (**)
        FB_TN_SC_WRITE_C : TN_SC_WRITE_C; (**)
        in_ROW : INT; (**)
        in_ROWS : INT; (**)
        in_COL : INT; (**)
        in_COLS : INT; (**)
        in_index : INT; (**)
        in_Count : INT; (**)
        in_Scroll_Offset : INT; (**)
        by_ATTR : BYTE; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TN_INPUT_SELECT_POPUP
    VAR_IN_OUT
        Xus_TN_SCREEN : us_TN_SCREEN; (**)
        Xus_TN_INPUT_CONTROL_DATA : us_TN_INPUT_CONTROL_DATA; (**)
    END_VAR
    VAR
        in_index : INT; (**)
        in_Element_Count : INT; (**)
        by_Cur_Key : BYTE; (**)
        by_Attr : BYTE; (**)
        st_String : STRING[255]; (**)
        us_TN_MENU_POPUP : us_TN_MENU_POPUP; (**)
        FB_TN_INPUT_MENU_POPUP : TN_INPUT_MENU_POPUP; (**)
        FB_TN_SC_WRITE : TN_SC_WRITE; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TN_INPUT_SELECT_TEXT
    VAR_IN_OUT
        Xus_TN_SCREEN : us_TN_SCREEN; (**)
        Xus_TN_INPUT_CONTROL_DATA : us_TN_INPUT_CONTROL_DATA; (**)
    END_VAR
    VAR
        in_count : INT; (**)
        by_Attr : BYTE; (**)
        st_String : STRING[255]; (**)
        FB_TN_SC_WRITE : TN_SC_WRITE; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TN_RECEIVE
    VAR_IN_OUT
        R_BUF : NETWORK_BUFFER; (**)
        Xus_TN_SCREEN : us_TN_SCREEN; (**)
    END_VAR
    VAR
        REQ_Size : UINT; (**)
        REQ1 : BYTE; (**)
        REQ2 : BYTE; (**)
        REQ3 : BYTE; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TN_SC_ADD_SHADOW
    VAR_INPUT
        Iin_Y1 : INT; (**)
        Iin_X1 : INT; (**)
        Iin_Y2 : INT; (**)
        Iin_X2 : INT; (**)
        Iin_OPTION : INT; (**)
    END_VAR
    VAR_IN_OUT
        Xus_TN_SCREEN : us_TN_SCREEN; (**)
    END_VAR
    VAR
        in_Offset : INT; (**)
        in_X : INT; (**)
        in_Y : INT; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TN_SC_AREA_RESTORE
    VAR_IN_OUT
        Xus_TN_SCREEN : us_TN_SCREEN; (**)
    END_VAR
    VAR
        in_Offset_1 : INT; (**)
        in_Offset_2 : INT; (**)
        in_Y : INT; (**)
        in_X : INT; (**)
        in_Y1 : INT; (**)
        in_X1 : INT; (**)
        in_Y2 : INT; (**)
        in_X2 : INT; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TN_SC_AREA_SAVE
    VAR_INPUT
        Iin_Y1 : INT; (**)
        Iin_X1 : INT; (**)
        Iin_Y2 : INT; (**)
        Iin_X2 : INT; (**)
    END_VAR
    VAR_IN_OUT
        Xus_TN_SCREEN : us_TN_SCREEN; (**)
    END_VAR
    VAR
        in_Offset_1 : INT; (**)
        in_Offset_2 : INT; (**)
        in_Y : INT; (**)
        in_X : INT; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TN_SC_BOX
    VAR_INPUT
        Iin_Y1 : INT; (**)
        Iin_X1 : INT; (**)
        Iin_Y2 : INT; (**)
        Iin_X2 : INT; (**)
        Iby_FILL : BYTE; (**)
        Iby_ATTR : BYTE; (**)
        Iin_BORDER : INT; (**)
    END_VAR
    VAR_IN_OUT
        Xus_TN_SCREEN : us_TN_SCREEN; (**)
    END_VAR
    VAR
        FB_TN_SC_FILL : TN_SC_FILL; (**)
        by_BorderChar_L_T : BYTE; (**)
        by_BorderChar_T : BYTE; (**)
        by_BorderChar_B : BYTE; (**)
        by_BorderChar_R_T : BYTE; (**)
        by_BorderChar_L : BYTE; (**)
        by_BorderChar_R : BYTE; (**)
        by_BorderChar_L_B : BYTE; (**)
        by_BorderChar_R_B : BYTE; (**)
        in_Y : INT; (**)
        in_X : INT; (**)
        in_Border_Offset : INT; (**)
        in_Offset_1 : INT; (**)
        in_Offset_2 : INT; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TN_SC_FILL
    VAR_INPUT
        Iin_Y1 : INT; (**)
        Iin_X1 : INT; (**)
        Iin_Y2 : INT; (**)
        Iin_X2 : INT; (**)
        Iby_CHAR : BYTE; (**)
        Iby_Attr : BYTE; (**)
    END_VAR
    VAR_IN_OUT
        Xus_TN_SCREEN : us_TN_SCREEN; (**)
    END_VAR
    VAR
        in_X : INT; (**)
        in_Y : INT; (**)
        in_Offset : INT; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TN_SC_LINE
    VAR_INPUT
        Iin_X1 : INT; (**)
        Iin_Y1 : INT; (**)
        Iin_X2 : INT; (**)
        Iin_Y2 : INT; (**)
        Iby_ATTR : BYTE; (**)
        Iby_BORDER : BYTE; (**)
    END_VAR
    VAR_IN_OUT
        Xus_TN_SCREEN : us_TN_SCREEN; (**)
    END_VAR
    VAR
        by_Connect_Left_Char : BYTE; (**)
        by_Connect_Right_Char : BYTE; (**)
        by_Connect_Top_Char : BYTE; (**)
        by_Connect_Bottom_Char : BYTE; (**)
        by_Connect_Cruz_Char : BYTE; (**)
        by_Vertikal_Line_Char : BYTE; (**)
        by_Horzontal_Line_Char : BYTE; (**)
        by_old_Char : BYTE; (**)
        in_Offset_1 : INT; (**)
        in_ROW_Index : INT; (**)
        in_COL_Index : INT; (**)
        by_Char : BYTE; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TN_SC_READ_ATTR
    VAR_INPUT
        Iin_Y : INT; (**)
        Iin_X : INT; (**)
    END_VAR
    VAR_OUTPUT
        Oby_ATTR : BYTE; (**)
    END_VAR
    VAR_IN_OUT
        Xus_TN_SCREEN : us_TN_SCREEN; (**)
    END_VAR
    VAR
        in_Offset : INT; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TN_SC_READ_CHAR
    VAR_INPUT
        Iin_Y : INT; (**)
        Iin_X : INT; (**)
    END_VAR
    VAR_OUTPUT
        Oby_CHAR : BYTE; (**)
    END_VAR
    VAR_IN_OUT
        Xus_TN_SCREEN : us_TN_SCREEN; (**)
    END_VAR
    VAR
        in_Offset : INT; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION TN_SC_SHADOW_ATTR : BYTE
    VAR_INPUT
        Iby_ATTR : BYTE; (**)
    END_VAR
END_FUNCTION
FUNCTION_BLOCK TN_SC_VIEWPORT
    VAR_INPUT
        Iin_X : INT; (**)
        Iin_Y : INT; (**)
        Iin_Width : INT; (**)
        Idw_ATTR_1 : DWORD; (**)
        Idw_ATTR_2 : DWORD; (**)
        Iti_TIME : TIME; (**)
    END_VAR
    VAR_IN_OUT
        Xus_LOG_VIEWPORT : us_LOG_VIEWPORT; (**)
        Xus_LOG_CONTROL : LOG_CONTROL; (**)
        Xus_TN_SCREEN : us_TN_SCREEN; (**)
    END_VAR
    VAR
        FB_TN_SC_WRITE : TN_SC_WRITE; (**)
        FB_TON : TON; (**)
        in_index : INT; (**)
        in_Color : INT; (**)
        by_Attr : BYTE; (**)
        in_count : INT; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TN_SC_WRITE
    VAR_INPUT
        Iin_Y : INT; (**)
        Iin_X : INT; (**)
        Iby_ATTR : BYTE; (**)
        Ist_STRING : STRING[255]; (**)
    END_VAR
    VAR_IN_OUT
        Xus_TN_SCREEN : us_TN_SCREEN; (**)
    END_VAR
    VAR
        bo_Color : BOOL; (**)
        in_Offset : INT; (**)
        in_Char_Index : INT; (**)
        in_String_Length : INT; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TN_SC_WRITE_ATTR
    VAR_INPUT
        Iin_Y : INT; (**)
        Iin_X : INT; (**)
        Iby_ATTR : BYTE; (**)
    END_VAR
    VAR_IN_OUT
        Xus_TN_SCREEN : us_TN_SCREEN; (**)
    END_VAR
    VAR
        in_Offset : INT; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TN_SC_WRITE_C
    VAR_INPUT
        Iin_Y : INT; (**)
        Iin_X : INT; (**)
        Iby_ATTR : BYTE; (**)
        Ist_STRING : STRING[255]; (**)
        Iin_LENGTH : INT; (**)
        Iin_OPTION : INT; (**)
    END_VAR
    VAR_IN_OUT
        Xus_TN_SCREEN : us_TN_SCREEN; (**)
    END_VAR
    VAR
        FB_TN_SC_WRITE : TN_SC_WRITE; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TN_SC_WRITE_CHAR
    VAR_INPUT
        Iin_Y : INT; (**)
        Iin_X : INT; (**)
        Iby_CHAR : BYTE; (**)
    END_VAR
    VAR_IN_OUT
        Xus_TN_SCREEN : us_TN_SCREEN; (**)
    END_VAR
    VAR
        in_Offset : INT; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK TN_SC_WRITE_EOS
    VAR_INPUT
        Iby_ATTR : BYTE; (**)
        Ist_STRING : STRING[255]; (**)
    END_VAR
    VAR_IN_OUT
        Xus_TN_SCREEN : us_TN_SCREEN; (**)
    END_VAR
    VAR
        TN_SC_WRITE : TN_SC_WRITE; (**)
    END_VAR
END_FUNCTION_BLOCK
FUNCTION TN_SC_XY2_ERROR : BOOL
    VAR_INPUT
        X1 : INT; (**)
        Y1 : INT; (**)
        X2 : INT; (**)
        Y2 : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION TN_SC_XY_ERROR : BOOL
    VAR_INPUT
        X : INT; (**)
        Y : INT; (**)
    END_VAR
END_FUNCTION
FUNCTION_BLOCK TN_SEND_ROWS
    VAR_INPUT
        S_BUF_SIZE : INT; (**)
    END_VAR
    VAR_IN_OUT
        IP_C : IP_C; (**)
        S_BUF : NETWORK_BUFFER; (**)
        Xus_TN_SCREEN : us_TN_SCREEN; (**)
    END_VAR
    VAR
        in_Line_Count : INT; (*Zähler um max alle 24 Zeilen zu durchlaufen*)
        in_Col_Count : INT; (**)
        in_Last_Row_Index : INT; (**)
        bo_Break_Loop : BOOL; (**)
        in_Row_Count : INT; (**)
        in_Offset : INT; (**)
        in_Write_Index : INT; (**)
        in_Write_Index_Backup : INT; (**)
        by_Cur_Color : BYTE; (**)
        by_last_Color : BYTE; (**)
        in_Write_Stop : INT; (**)
    END_VAR
END_FUNCTION_BLOCK
