FUNCTION FRMP_B
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=98*)
    IF TD < TR THEN
    	FRMP_B := USINT_TO_BYTE(MIN(UDINT_TO_USINT(SHL(TIME_TO_UDINT(TD), 8) / TIME_TO_UDINT(TR)), SEL(DIR, BYTE_TO_USINT(START), 255 - BYTE_TO_USINT(START))));
    	IF DIR THEN
    		FRMP_B := USINT_TO_BYTE(BYTE_TO_USINT(START) + BYTE_TO_USINT(FRMP_B));
    	ELSE
    		FRMP_B := USINT_TO_BYTE(BYTE_TO_USINT(START) - BYTE_TO_USINT(FRMP_B));
    	END_IF
    ELSE
    	FRMP_B := SEL(DIR, BYTE#0, BYTE#255);
    END_IF


    (* revision history

    17. feb. 2011	rev 1.0
    	new module

    *)
END_FUNCTION
