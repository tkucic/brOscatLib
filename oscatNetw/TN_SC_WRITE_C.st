FUNCTION_BLOCK TN_SC_WRITE_C
    (*http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=193*)
    (* Text ausgeben *)
    FB_TN_SC_WRITE( IIN_Y := IIN_Y,
    				IIN_X := IIN_X,
    				IBY_ATTR := IBY_ATTR,
    				IST_STRING := OSCAT_BASIC.FIX(str:=IST_STRING,L:=IIN_LENGTH,C:=BYTE#32,M:=IIN_OPTION),
    				XUS_TN_SCREEN := XUS_TN_SCREEN);

    (* revision history
    ks	10. mai. 2010	rev 1.0
    	original version
    *)
END_FUNCTION_BLOCK
