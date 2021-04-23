FUNCTION TN_SC_XY2_ERROR
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=196*)
    (* min und max werte prüfen *)
    TN_SC_XY2_ERROR := Y1 < 0 OR X1 < 0 OR Y2 < 0 OR X2 < 0 OR Y1 > 23 OR X1 > 79 OR Y2 > 23 OR X2 > 79;

    (* revision history
    ks	10. mai. 2010	rev 1.0
    	original version
    *)
END_FUNCTION
