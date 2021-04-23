FUNCTION_BLOCK MESSAGE_8
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=173*)
    (* check if an alarm is present if yes set the output M otherwise clear M *)
    IF IN1 THEN
    	M := S1;
    ELSIF IN2 THEN
    	M := S2;
    ELSIF IN3 THEN
    	M := S3;
    ELSIF IN4 THEN
    	M := S4;
    ELSIF IN5 THEN
    	M := S5;
    ELSIF IN6 THEN
    	M := S6;
    ELSIF IN7 THEN
    	M := S7;
    ELSIF IN8 THEN
    	M := S8;
    ELSE
    	M := '';
    END_IF

    (* revision history
    hm	26.12.2007		rev 1.0
    	original version

    hm	29. mar. 2008	rev 1.1
    	changed STRING to STRING(STRING_LENGTH)
    *)

END_FUNCTION_BLOCK
