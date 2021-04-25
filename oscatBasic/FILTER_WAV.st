FUNCTION_BLOCK FILTER_WAV
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=280*)
    (* startup initialisation *)
    IF NOT init OR rst THEN
    	init := TRUE;
    	FOR i := 0 TO 15 DO
    		buffer[i] := X;
    	END_FOR;
    	i := 15;
    	Y := X;
    ELSE
    	i := INC1(i, 16);
    	buffer[i] := X;
    END_IF;

    (* calculate the weighted average *)
    Y := 0.0;
    FOR n := 0 TO 15 DO
    	Y := buffer[i] * W[n] + Y;
    	i := DEC1(i, 16);
    END_FOR;


    (*
    hm 	14. oct. 2008	rev 1.0
    	original version

    hm	27. oct. 2008	rev 1.1
    	changed _DEC and _INC to DEC1 and INC1

    hm	10. mar. 2009	rev 1.2
    	real constants updated to new systax using dot

    *)

END_FUNCTION_BLOCK
