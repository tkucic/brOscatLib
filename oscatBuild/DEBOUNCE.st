FUNCTION_BLOCK DEBOUNCE
    (*http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=49*)
    
    IF NOT deb.Q AND IN THEN
    	(* risINg edge on INput detetced a *)
    	Q := TRUE;
    ELSIF NOT PM THEN
    	Q := deb.Q;
    ELSE
    	Q := FALSE;
    END_IF

    (* run debounce timer *)
    deb(IN := IN, PT := TD);



    (*
    hm 22. sep. 2008	rev 1.0
    	origINal version

    *)
END_FUNCTION_BLOCK
