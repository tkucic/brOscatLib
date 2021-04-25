FUNCTION_BLOCK FILTER_I
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=278*)
    (* read system time *)
    tx := T_PLC_MS();

    (* startup initialisation *)
    IF NOT init OR T = T#0s THEN
    	init := TRUE;
    	Yi := INT_TO_DINT(X) * 1000;
    ELSE
    	(* to increase accuracy of the filter we calculate internal Yi wich is Y * 1000 *)
    	Yi := Yi + INT_TO_DINT(X - Y) * UDINT_TO_DINT(tx - last) * 1000 / TIME_TO_DINT(T);
    END_IF
    last := tx;
    Y := DINT_TO_INT(Yi / 1000);



    (*
    hm 8. nov. 2008	rev 1.0
    	original version

    *)
END_FUNCTION_BLOCK
