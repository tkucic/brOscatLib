FUNCTION TN_SC_XY_ERROR
    (*http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=195*)
    (* min und max werte prüfen *)
    TN_SC_XY_ERROR := Y < 0 OR X < 0 OR Y > 23 OR X > 79;

    (* revision history
    ks	10. mai. 2010	rev 1.0
    	original version
    *)
END_FUNCTION
