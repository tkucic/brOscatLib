FUNCTION STATUS_TO_ESR
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=38*)
    IF STATUS < 100 THEN
    	STATUS_to_ESR.typ := 1;
    ELSIF STATUS < 200 THEN
    	STATUS_to_ESR.typ := 2;
    ELSE
    	STATUS_to_ESR.typ := 3;
    END_IF
    STATUS_to_ESR.ADRESS:= ADRESS;
    STATUS_to_ESR.DS := DT_in;
    STATUS_to_ESR.TS := TS;
    STATUS_to_ESR.data[0] := STATUS;

END_FUNCTION
