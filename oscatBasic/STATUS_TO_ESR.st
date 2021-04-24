FUNCTION STATUS_TO_ESR
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=38*)
    IF STATUS < 100 THEN
    	STATUS_TO_ESR.typ := 1;
    ELSIF STATUS < 200 THEN
    	STATUS_TO_ESR.typ := 2;
    ELSE
    	STATUS_TO_ESR.typ := 3;
    END_IF
    STATUS_TO_ESR.ADRESS:= ADRESS;
    STATUS_TO_ESR.DS := DT_IN;
    STATUS_TO_ESR.TS := TS;
    STATUS_TO_ESR.data[0] := STATUS;

END_FUNCTION
