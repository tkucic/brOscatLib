FUNCTION_BLOCK T_AVG24
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=446*)
    (* first filter the sensor readings *)
    ft1(X := TS, T := T_FILTER);

    IF RST OR NOT init THEN
    	init := TRUE;
    	IF T24 = -1000.0 THEN T24 := INT_TO_REAL(ft1.Y) * 0.1; END_IF
    	FOR pos := 0 TO 47 DO
    		samples[pos] := REAL_TO_INT(T24 * 10.0);
    	END_FOR
    	pos := 0;
    	sum := INT_TO_DINT(samples[0]) * 48;
    	(* calculate the output value *)
    	TA := (INT_TO_REAL(ft1.Y) * 0.1 + OFS) * SCALE;
    	T24 := (DINT_TO_REAL(sum) * 0.00208333333333 + OFS) * SCALE;
    	TP := TRUE;
    ELSIF DT_TO_UDINT(DTI) / 60 MOD 30 = 0 AND DTI > last THEN
    	(* make sure we onlyexecute once every 30 mins *)
    	last := DTI + T#1m;
    	(* sample the temperature every 30 mins and store in ring buffer samples *)
    	(* sum always holds the sum of the array *)
    	(* subtract the oldest sample from sum *)
    	sum := sum - INT_TO_DINT(samples[pos]);
    	(* strore the new sample *)
    	samples[pos] := ft1.Y;
    	(* add the new sample to sum *)
    	sum := sum + INT_TO_DINT(samples[pos]);
    	(* increment the counter for the next sample *)
    	pos := INC1(pos, 48);
    	(* calculate the output value *)
    	TA := (INT_TO_REAL(ft1.Y) * 0.1 + OFS) * SCALE;
    	T24 := (DINT_TO_REAL(sum) * 0.00208333333333 + OFS) * SCALE;
    	(* calculate the min and max over the last 24 hours *)
    	tmp_max := -32000;
    	tmp_min := 32000;
    	FOR i := 0 TO 47 DO
    		tmp_max := MAX(tmp_max, samples[i]);
    		tmp_min := MIN(tmp_min, samples[i]);
    	END_FOR
    	T24_MAX := (INT_TO_REAL(tmp_max) * 0.1 + OFS) * SCALE;
    	T24_MIN := (INT_TO_REAL(tmp_min) * 0.1 + OFS) * SCALE;
    	TP := TRUE;
    ELSE
    	TP := FALSE;
    END_IF





    (* revision history
    hm	3. nov. 2008	rev 1.0
    	original version

    hm	8. feb. 2009	rev 1.1
    	changes sign of OFS
    	added outputs T24_MIN and T24_MAX

    hm	13. mar. 2009	rev 1.2
    	improved code
    *)
END_FUNCTION_BLOCK
