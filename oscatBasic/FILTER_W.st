FUNCTION_BLOCK FILTER_W
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=280*)
    (* read system time *)
    tx := T_PLC_MS();

    (* startup initialisation *)
    IF NOT init OR T = T#0s THEN
    	init := TRUE;
    	last := tx;
    	Y := X;
    ELSIF Y = X THEN
    	last := tx;
    ELSE
    	tmp :=  (WORD_TO_UINT(X) - WORD_TO_UINT(Y)) * (tx - last) / TIME_TO_UDINT(T);
    	IF tmp <> 0 THEN
    		Y := DINT_TO_WORD(WORD_TO_DINT(Y) + UDINT_TO_DINT(tmp));
    		last := tx;
    	END_IF
    END_IF

    (*
    hm 10. oct. 2008	rev 1.0
    	original version

    hm	3. nov. 2008	rev 1.1
    	fixed overflow problem in formula

    hm	25. jan. 2011	rev 1.2
    	fixed error in formula
    *)
END_FUNCTION_BLOCK
