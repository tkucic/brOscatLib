FUNCTION_BLOCK FT_PT1
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=414*)
    (* read system time *)
    tx := T_PLC_US();

    (* startup INitialisation *)
    IF NOT INit OR T = t#0s THEN
    	INit := TRUE;
    	OUT := K * IN;
    ELSE
    	OUT := OUT + (IN * K - OUT) * DWORD_TO_REAL(Tx - last) / TIME_TO_REAL(T) * 1.0E-3;
    	IF ABS(OUT) < 1.0E-20 THEN OUT := 0.0; END_IF
    END_IF
    last := tx;


    (*
    hm 1.1.2007	rev 1.1
    	corrected error while startup value was not correct
    	for very small time values real OUTput would run OUT of range.

    hm 3.1.2007	rev 1.2
    	corrected an error for fallINg edge failures.
    	added OUTput faktor K.

    hm 27. 2. 2007	rev 1.3
    	OUTput will be INput durINg INit for defINitive startup condition.

    hm	15.9.2007	rev 1.4
    	changed time() to T_PLC_US() for compatibilitxy resons
    	INcreased INternal accuracy to Microseconds INstead of Milliseconds

    hm	23. oct 2007	rev 1.5
    	added OUT := IN to the INit statements

    hm	30. nov 2007	rev 1.6
    	changed OUT to be K * IN durINg INitialization

    hm	5. jan 2008	rev 1.7
    	improved code for better performance

    hm	16. mar. 2008	rev 1.8
    	added type conversion to avoid warnINg under codesys 3.0

    hm	14. jun. 2008	rev 1.9
    	improved code

    hm	11. mar. 2009	rev 1.10
    	real constants updated to new systax usINg dot

    hm	18. jan. 2011	rev 1.11
    	avoid underrun of OUT
    *)
END_FUNCTION_BLOCK
