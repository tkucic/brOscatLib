FUNCTION_BLOCK FILTER_MAV_DW
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=278*)
    (* limit N to size of buffer *)
    N := MIN(N, 32);

    (* startup initialisation *)
    IF NOT init OR RST OR N = 0 THEN
    	init := TRUE;
    	tmp := UINT_TO_INT(N)-1;
    	FOR i := 0 TO tmp DO
    		buffer[i] := DWORD_TO_UDINT(X);
    	END_FOR
    	Y := X;
    ELSE
    	tmp := UINT_TO_INT(N);
    	i := INC1(i, tmp);
    	Y := UDINT_TO_DWORD(DWORD_TO_UDINT(Y) + (DWORD_TO_UDINT(X) - buffer[i]) / N);
    	buffer[i] := DWORD_TO_UDINT(X);
    END_IF




    (*
    hm 13. oct. 2008	rev 1.0
    	original version

    hm	27. oct. 2008	rev 1.1
    	added typecast to avoid warnings

    hm	24. nov. 2008	rev 1.2
    	added typecasts to avoid warnings
    	avoid divide by 0 if N = 0

    hm	23. feb. 2009	rev 1.3
    	limit N to max array size

    *)
END_FUNCTION_BLOCK
