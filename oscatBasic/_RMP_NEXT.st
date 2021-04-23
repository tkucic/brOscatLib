FUNCTION_BLOCK _RMP_NEXT
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=255*)
    DIRx(X := IN);

    t_lock(IN := FALSE, pt := TL);

    IF DIRx.TU AND (OUT < IN) THEN
    	IF NOT xDIR AND xen THEN t_lock(IN := TRUE); END_IF
    	xen := TRUE;
    	xDIR := TRUE;
    ELSIF DIRx.TD AND (OUT > IN) THEN
    	IF xDIR AND xen THEN t_lock(IN := TRUE); END_IF
    	xen := TRUE;
    	xDIR := FALSE;
    ELSIF xen THEN
    	IF (xDIR AND (OUT >= IN)) OR (NOT xDIR AND (OUT <= IN)) THEN
    		xen := FALSE;
    		IF TL > t#0s THEN t_lock(IN := TRUE); END_IF
    	END_IF
    END_IF

    IF NOT t_lock.Q AND xen THEN
    		UP := XDIR;
    		DIR := XDIR;
    		DN := NOT XDIR;
    ELSE
    	UP := FALSE;
    	DN := FALSE;
    END_IF

    rmx(rmp := OUT, E := E AND (UP OR DN) , DIR := DIR, TR := SEL(DIR, TF, TR));


    (* revison history
    hm	23. nov. 2008	rev 1.0
    	origINal version

    hm	24. jan. 2009	rev 1.1
    	deleted unused vars tmp1, tmp2

    hm	20. feb. 2009	rev 1.2
    	improved algorithm
    	added TL

    hm	9. mar. 2009	rev 1.3
    	INput E was ignored
    	removed double assignments

    hm	18. jul. 2009	rev 1.4
    	improved performance

    *)
END_FUNCTION_BLOCK
