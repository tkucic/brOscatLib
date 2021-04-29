FUNCTION BYTE_TO_STRH
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=146*)
    (* read pointer to output string *)
    PT ACCESS ADR(RETVAL);
    (* calculate high order hex value *)
    temp := SHR(IN,4);
    intTemp := BYTE_TO_USINT(temp);
    (* convert value to hex character *)
    IF intTemp <= 9 THEN temp := USINT_TO_BYTE(intTemp + 48); ELSE temp := USINT_TO_BYTE(intTemp + 55); END_IF
    (* write friat character to output string *)
    PT := temp;
    (* calculate low order hex value *)
    temp := IN AND 2#00001111;
    intTemp := BYTE_TO_USINT(temp);
    IF intTemp <= 9 THEN temp := USINT_TO_BYTE(intTemp + 48); ELSE temp := USINT_TO_BYTE(intTemp + 55); END_IF
    (* increment pointer and wirte low order character *)
    PT ACCESS (ADR(PT) + 1);
    PT := temp;
    (* set pointer at the end of the output string and close the string with 0 *)
    PT ACCESS (ADR(PT) + 1);
    PT:= 0;
    BYTE_TO_STRH := TRUE;
    (* code before rev 1.2
    FOR i := 1 TO 2 DO
    	X := IN AND 2#1111;
    	IF X <= 9 THEN X := X + 48; ELSE X := X + 55; END_IF
    	Cx := CHR(X);
    	temp := CONCAT(Cx, temp);
    	IN := SHR(IN,4);
    END_FOR
    BYTE_TO_STRH := temp;
    *)

    (* revision history

    hm	9.6.2007		rev 1.0		
    	original version 

    hm	11.9.2007		rev 1.1		
    	changed coding for compatibility with twincat, under twincat concat cannot have a function as argument.	

    hm	15 dec 2007		REV 1.2
    	changed code for higher performance

    hm	29. mar. 2008	rev 1.3
    	changed STRING to STRING(2)
    *)
END_FUNCTION
