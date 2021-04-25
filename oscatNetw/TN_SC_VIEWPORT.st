FUNCTION_BLOCK TN_SC_VIEWPORT
    (*http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=191*)
    (* LOG-Messages ausgeben *)

    IF XUS_LOG_VIEWPORT.UPDATE AND FB_TON.Q THEN (* Update gewünscht und Verzögerungszeit abgelaufen *)
    	XUS_LOG_VIEWPORT.UPDATE := FALSE;
    	FOR in_count := 1 TO XUS_LOG_VIEWPORT.COUNT DO (* Alle Viewport-Zeilen abarbeiten *)
    		in_index := XUS_LOG_VIEWPORT.LINE_ARRAY[in_count];
    		(* Farbe aus den Option-Parameter auslesen >0,Level,Back,Front< *)
    		in_Color := DWORD_TO_INT(XUS_LOG_CONTROL.MSG_OPTION[in_index] AND DWORD#2#1111);

    		CASE in_Color OF
    		0..3: by_Attr := BYTE_OF_DWORD(IDW_ATTR_1,INT_TO_BYTE(in_Color));
    		4..7: by_Attr := BYTE_OF_DWORD(IDW_ATTR_2,INT_TO_BYTE(in_Color));
    		ELSE
    			by_Attr := BYTE_OF_DWORD(IDW_ATTR_1,BYTE#0);
    		END_CASE

    		(* Message (Text + Farbe) ausgeben *)
    		FB_TN_SC_WRITE(	IIN_Y := IIN_Y + in_count - INT#01,
    						IIN_X := IIN_X,
    						Iby_ATTR := by_Attr,
    						Ist_STRING := FIX(str := XUS_LOG_CONTROL.MSG[in_index], L := IIN_WIDTH, C := BYTE#32, M := INT#00), (* String rechts ergänzen bzw. kürzen *)
    						XUS_TN_SCREEN := XUS_TN_SCREEN);

    	END_FOR

    	(* Timer stoppen/rücksetzen *)
    	FB_TON.IN := FALSE;
    	FB_TON.PT := ITI_TIME;
    	FB_TON();

    END_IF

    (* Update-Zeitverzoegerung *)
    FB_TON.IN := TRUE;
    FB_TON.PT := ITI_TIME;
    FB_TON();

    (* revision history
    ks	10. mai. 2010	rev 1.0
    	original version
    *)
END_FUNCTION_BLOCK
