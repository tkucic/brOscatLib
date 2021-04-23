FUNCTION ELEMENT_COUNT
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=34*)
    IF ELEMENT = '' THEN
    	ELEMENT_COUNT := 0;
    ELSE
    	PT := ADR(ELEMENT);
    	ELEMENT_COUNT := 1;
    	l := LEN(ELEMENT);
    	FOR pos := 1 TO l DO
    		IF pt^[pos] = SEP THEN ELEMENT_COUNT := ELEMENT_COUNT + 1; END_IF
    	END_FOR
    END_IF

    (* revision histroy
    ks	5. apr. 2011	rev 1.0
    	original release

    *)	
END_FUNCTION
