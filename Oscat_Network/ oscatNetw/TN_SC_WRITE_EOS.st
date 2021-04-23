FUNCTION_BLOCK TN_SC_WRITE_EOS
    (*http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=195*)
    TN_SC_WRITE(Iin_Y := Xus_TN_SCREEN.in_EOS_Offset / 80, (* aktuelle Zeile ausrechnen *)
    			Iin_X := Xus_TN_SCREEN.in_EOS_Offset MOD 80, (* aktuelle Spalte ausrechnen *)
    			Iby_ATTR := Iby_ATTR,
    			Ist_STRING := Ist_STRING,
    			Xus_TN_SCREEN := Xus_TN_SCREEN);

    (* revision history
    ks	10. mai. 2010	rev 1.0
    	original version
    *)
END_FUNCTION_BLOCK