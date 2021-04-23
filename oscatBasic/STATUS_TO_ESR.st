FUNCTION STATUS_TO_ESR
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=38*)
    IF status < 100 THEN
    	status_to_ESR.typ := 1;
    ELSIF status < 200 THEN
    	status_to_ESR.typ := 2;
    ELSE
    	status_to_ESR.typ := 3;
    END_IF
    status_to_ESR.adress:= adress;
    status_to_ESR.DS := DT_in;
    status_to_ESR.TS := TS;
    status_to_ESR.data[0] := status;

END_FUNCTION
