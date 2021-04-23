FUNCTION BYTE_TO_STRH
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=146*)
    (* read poINter to output strINg *)
    PT := ADR(BYTE_TO_STRH);
    (* calculate high order hex value *)
    temp := SHR(IN,4);
    (* convert value to hex character *)
    IF temp <= 9 THEN temp := temp + 48; ELSE temp := temp + 55; END_IF
    (* write friat character to output strINg *)
    PT^ := temp;
    (* calculate low order hex value *)
    temp := IN AND 2#00001111;
    IF temp <= 9 THEN temp := temp + 48; ELSE temp := temp + 55; END_IF
    (* INcrement poINter and wirte low order character *)
    pt := pt + 1;
    pt^ := temp;
    (* set poINter at the end of the output strINg and close the strINg with 0 *)
    pt := pt + 1;
    pt^:= 0;


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
    	origINal version 

    hm	11.9.2007		rev 1.1		
    	changed codINg for compatibility with twINcat, under twINcat concat cannot have a function as argument.	

    hm	15 dec 2007		REV 1.2
    	changed code for higher performance

    hm	29. mar. 2008	rev 1.3
    	changed STRING to STRING(2)
    *)
END_FUNCTION
