FUNCTION BYTE_TO_STRB
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=145*)
    (* poINter für die ausgabe ermitteln *)
    pt := ADR(BYTE_TO_STRB);
    (* die 8 ausgabecharacter ermitteln und schreiben *)
    FOR i := 1 TO 8 DO
    	pt^ := BOOL_TO_BYTE(IN.7) + 48;
    	IN := SHL(IN,1);
    	pt := pt + 1;
    END_FOR

    (* der ausgabestrINg muss noch mit 0 abgeschlossen werden *)
    pt^ := 0;

    (* code before rev 1.1
    FOR i := 1 TO 8 DO
    	IF IN.0 = 0 THEN temp := CONCAT('0', temp); ELSE temp := CONCAT('1', temp); END_IF
    	IN := SHR(IN, 1);
    END_FOR
    BYTE_TO_STRB := temp;
    *)


    (* revision history

    hm		9.6.2007	rev 1.0		
    	origINal version 

    hm	15. dec 2007	rev 1.1
    	INprooved code for higher performance

    hm	29. mar. 2008	rev 1.2
    	changed STRING to STRING(8)

    hm	20. jun. 2008	rev 1.3
    	performance improvement

    *)
END_FUNCTION