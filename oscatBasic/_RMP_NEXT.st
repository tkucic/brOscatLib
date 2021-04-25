FUNCTION_BLOCK _RMP_NEXT
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=255*)
    dirx(X := IN);

    t_lock(IN := FALSE, PT := TL);

    IF dirx.TU AND (OUT < IN) THEN
    	IF NOT xdir AND xen THEN t_lock(IN := TRUE); END_IF
    	xen := TRUE;
    	xdir := TRUE;
    ELSIF dirx.TD AND (OUT > IN) THEN
    	IF xdir AND xen THEN t_lock(IN := TRUE); END_IF
    	xen := TRUE;
    	xdir := FALSE;
    ELSIF xen THEN
    	IF (xdir AND (OUT >= IN)) OR (NOT xdir AND (OUT <= IN)) THEN
    		xen := FALSE;
    		IF TL > t#0s THEN t_lock(IN := TRUE); END_IF
    	END_IF
    END_IF

    IF NOT t_lock.Q AND xen THEN
    		UP := xdir;
    		DIR := xdir;
    		DN := NOT xdir;
    ELSE
    	UP := FALSE;
    	DN := FALSE;
    END_IF

    rmx(RMP := OUT, E := E AND (UP OR DN) , DIR := DIR, TR := SEL(DIR, TF, TR));


    (* revison history
    hm	23. nov. 2008	rev 1.0
    	original version

    hm	24. jan. 2009	rev 1.1
    	deleted unused vars tmp1, tmp2

    hm	20. feb. 2009	rev 1.2
    	improved algorithm
    	added TL

    hm	9. mar. 2009	rev 1.3
    	input E was ignored
    	removed double assignments

    hm	18. jul. 2009	rev 1.4
    	improved performance

    *)
END_FUNCTION_BLOCK
