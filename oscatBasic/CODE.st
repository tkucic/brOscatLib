FUNCTION CODE
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=149*)
    IF POS < 1 OR POS > LEN(STR) THEN
    	CODE := 0;
    	RETURN;
    ELSE
    	PT ACCESS (ADR(STR) + POS - 1);
    	CODE := PT;
    END_IF

    (* revision history
    hm	9. mar. 2008	rev 1.0
    	original version

    hm	29. mar. 2008	rev 1.1
    	changed STRING to STRING(STRING_LENGTH)
    *)
END_FUNCTION
