FUNCTION STATUS_TO_ESR
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=38*)
    IF STATUS < 100 THEN
    	RETVAL.TYP := 1;
    ELSIF STATUS < 200 THEN
    	RETVAL.TYP := 2;
    ELSE
    	RETVAL.TYP := 3;
    END_IF
    RETVAL.ADRESS:= ADRESS;
    RETVAL.DS := DT_IN;
    RETVAL.TS := TS;
    RETVAL.DATA[0] := STATUS;
    STATUS_TO_ESR:=TRUE;
END_FUNCTION
