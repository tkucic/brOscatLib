FUNCTION_BLOCK FILTER_I
    (* read system time *)
    tx := T_PLC_MS();

    (* startup initialisation *)
    IF NOT init OR T = t#0s THEN
    	init := TRUE;
    	Yi := INT_TO_DINT(X) * 1000;
    ELSE
    	(* to increase accuracy of the filter we calculate internal Yi wich is Y * 1000 *)
    	Yi := Yi + INT_TO_DINT(X - Y) * DWORD_TO_DINT(tx - last) * 1000 / TIME_TO_DINT(T);
    END_IF
    last := tx;
    Y := DINT_TO_INT(yi / 1000);



    (*
    hm 8. nov. 2008	rev 1.0
    	original version

    *)
END_FUNCTION_BLOCK
