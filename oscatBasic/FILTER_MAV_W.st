FUNCTION_BLOCK FILTER_MAV_W
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=279*)
    (* limit N to size of buffer *)
    N := MIN(N, 32);

    (* startup initialisation *)
    IF NOT init OR RST OR N = 0 THEN
    	init := TRUE;
    	tmp := UINT_TO_INT(N) - 1;
    	FOR i := 1 TO tmp DO
    		buffer[i] := WORD_TO_UINT(X);
    	END_FOR
    	sum := WORD_TO_UINT(Y) * N;
    	Y := X;
    ELSE
    	tmp := UINT_TO_INT(N);
    	i := INC1(i, tmp);
    	sum := sum + WORD_TO_UINT(X) - buffer[i];
    	Y := UDINT_TO_WORD(sum / N);
    	buffer[i] := WORD_TO_UINT(X);
    END_IF



    (*
    hm 13. oct. 2008	rev 1.0
    	original version

    hm	18. oct. 2008	rev 1.1
    	added typecast to avoid warnings

    hm	24. nov. 2008	rev 1.2
    	added typecasts to avoid warnings
    	avoid devide by 0 if N = 0

    hm	23. feb. 2009	rev 1.3
    	limit N to max array size

    hm	26. mar. 2011	rev 1.4
    	corrected error in calculation
    *)
END_FUNCTION_BLOCK
