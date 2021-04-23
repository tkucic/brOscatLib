FUNCTION DWORD_TO_STRB
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=153*)
    (* poINter für die ausgabe ermitteln *)
    pt := ADR(DWORD_TO_STRB);
    (* die 8 ausgabecharacter ermitteln und schreiben *)
    FOR i := 1 TO 32 DO
    	pt^:= BOOL_TO_BYTE(IN.31) + 48;
    	IN := SHL(IN,1);
    	pt := pt + 1;
    END_FOR

    (* der ausgabestrINg muss nochg mit 0 abgeschlossen werden *)
    pt^ := 0;

    (* revision history
    hm		9.6.2007	rev 1.0		
    	origINal version

    hm		15.dec 2007	rev 1.1
    	changed code for better performance

    hm	29. mar. 2008	rev 1.2
    	changed STRING to STRING(32)

    hm	20. jun. 2008	rev 1.3
    	performance improvement

    *)

END_FUNCTION