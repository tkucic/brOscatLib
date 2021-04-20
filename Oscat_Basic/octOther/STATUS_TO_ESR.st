FUNCTION STATUS_TO_ESR
    IF status < 100 THEN
    	retVal.TYP := 1;
    ELSIF status < 200 THEN
    	retVal.TYP := 2;
    ELSE
    	retVal.TYP := 3;
    END_IF
    retVal.ADRESS:= adress;
    retVal.DS := DT_in;
    retVal.TS := TS;
    retVal.DATA[0] := status;
    STATUS_TO_ESR := TRUE;

END_FUNCTION
