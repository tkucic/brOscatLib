FUNCTION TN_SC_SHADOW_ATTR
    (*http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=191*)
    (* Background Farbe auf Schwarz ändern      *)
    (* und dunkle Fordergrundfarben einschalten *)  
    TN_SC_SHADOW_ATTR := ((Iby_ATTR AND BYTE#2#11110000) OR BYTE#2#00001000);

    (* revision history
    ks	10. mai. 2010	rev 1.0
    	original version
    *)
END_FUNCTION
