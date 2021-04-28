FUNCTION _ARRAY_MEDIAN
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=73*)
    _ARRAY_SORT(ADR(PT),SIZE);
    stop := SHR(SIZE,2)-1;
    IF EVEN(UINT_TO_INT(stop)) THEN
    	_ARRAY_MEDIAN := PT[SHR(stop,1)];
    ELSE
    	i := SHR(stop,1);
    	_ARRAY_MEDIAN := (PT[i] + PT[i+1]) * 0.5;
    END_IF

    (* old code
    stop := (SIZE - SIZEOF(PT)) / SIZEOF(PT);
    FOR i := 0 TO stop - 1 DO
    	FOR m := i + 1 TO stop DO
    		IF PT[i] > PT[m] THEN
    			temp := PT[i];
    			PT[i] := PT[m];
    			PT[m] := temp;
    		END_IF
    	END_FOR
    END_FOR
    IF even(stop) THEN
    	_ARRAY_MEDIAN := PT[stop/2];
    ELSE
    	i := stop/2;
    	_ARRAY_MEDIAN := (PT[i] + PT[i+1])/2;
    END_IF
    *)
    (* revision history
    hm 	3.3.2007		rev 1.1
    	corrected an error, changed the statement line 14	i := TRUNC(stop/2); to i := stop/2;

    hm		22. sep 2007	rev 1.2
    	changed algorithm to use _array_soft for performance reasons

    hm		8. oct 2007		rev 1.3
    	deleted unused variables m and temp

    hm		14. nov 2007	rev 1.4
    	corrected a problem with SIZE calculation

    hm		16.3. 2008		rev 1.5
    	changed type of input SIZE to uint
    	performance improvements
    *)
END_FUNCTION
