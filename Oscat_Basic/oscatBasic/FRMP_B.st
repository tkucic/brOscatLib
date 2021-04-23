FUNCTION FRMP_B
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=98*)
    IF TD < TR THEN
    	FRMP_B := MIN(DWORD_TO_BYTE(SHL(TIME_TO_DWORD(TD), 8) / TIME_TO_DWORD(TR)), SEL(DIR, START, BYTE#255 - START));
    	IF DIR THEN
    		FRMP_B := START + FRMP_B;
    	ELSE
    		FRMP_B := START - FRMP_B;
    	END_IF
    ELSE
    	FRMP_B := SEL(DIR, 0, 255);
    END_IF


    (* revision history

    17. feb. 2011	rev 1.0
    	new module

    *)
END_FUNCTION