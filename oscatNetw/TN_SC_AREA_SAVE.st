FUNCTION_BLOCK TN_SC_AREA_SAVE
    (*http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=185*)
    IF TN_SC_XY2_ERROR(IIN_X1,IIN_Y1,IIN_X2,IIN_Y2) THEN RETURN; END_IF

    (* Parameter ablegen *)
    XUS_TN_SCREEN.bya_BACKUP[0] := BYTE#1;
    XUS_TN_SCREEN.bya_BACKUP[1] := INT_TO_BYTE(IIN_X1);
    XUS_TN_SCREEN.bya_BACKUP[2] := INT_TO_BYTE(IIN_Y1); 
    XUS_TN_SCREEN.bya_BACKUP[3] := INT_TO_BYTE(IIN_X2);
    XUS_TN_SCREEN.bya_BACKUP[4] := INT_TO_BYTE(IIN_Y2);

    in_Offset_2 := 5;
    (* CHAR und COLOR in BUFFER sichern *)
    FOR in_Y := IIN_Y1 TO IIN_Y2 DO

    	in_Offset_1 := (in_Y * 80) + IIN_X1;
    	FOR in_X := IIN_X1 TO IIN_X2 DO
    		XUS_TN_SCREEN.bya_BACKUP[in_Offset_2] := XUS_TN_SCREEN.bya_CHAR[in_Offset_1];
    		in_Offset_2 := in_Offset_2 + INT#01;
    		XUS_TN_SCREEN.bya_BACKUP[in_Offset_2] := XUS_TN_SCREEN.bya_COLOR[in_Offset_1];
    		in_Offset_2 := in_Offset_2 + INT#01;
    		in_Offset_1 := in_Offset_1 + INT#01;
    	END_FOR
    END_FOR

    (* revision history
    ks	10. mai. 2010	rev 1.0
    	original version
    *)
END_FUNCTION_BLOCK
