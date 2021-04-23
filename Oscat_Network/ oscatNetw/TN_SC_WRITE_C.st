FUNCTION_BLOCK TN_SC_WRITE_C
    (*http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=193*)
    (* Text ausgeben *)
    FB_TN_SC_WRITE( Iin_Y := Iin_Y,
    				Iin_X := Iin_X,
    				Iby_ATTR := Iby_ATTR,
    				Ist_STRING := OSCAT_BASIC.FIX(str:=Ist_STRING,L:=Iin_LENGTH,C:=BYTE#32,M:=Iin_OPTION),
    				Xus_TN_SCREEN := Xus_TN_SCREEN);

    (* revision history
    ks	10. mai. 2010	rev 1.0
    	original version
    *)
END_FUNCTION_BLOCK
