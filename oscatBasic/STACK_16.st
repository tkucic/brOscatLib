FUNCTION_BLOCK STACK_16
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=185*)
    IF RST THEN
    	(* asynchronous reset for the fifo *)
    	pt := 0;
    	EMPTY := TRUE;
    	FULL := FALSE;
    	Dout := 0;
    ELSIF E THEN
    	IF NOT EMPTY AND RD THEN
    		(* read one element *)
    		pt := pt - 1;
    		Dout := stack[pt];
    		EMPTY := pt = 0;
    		FULL := FALSE;
    	END_IF
    	IF NOT FULL AND WD THEN
    		(* write one element *)
    		stack[pt] := Din;
    		pt := pt + 1;
    		FULL := pt > n;
    		EMPTY := FALSE;
    	END_IF
    END_IF


    (* revision history
    hm	4. aug. 2006	rev 1.0
    	original version

    hm	19. feb 2008	rev 1.1
    	performance improvements

    hm	17. oct. 2008	rev 1.2
    	deleted unnecessary init with 0

    hm	27. oct. 2008	rev 1.3
    	optimized performance

    hm	25. jul 2009	rev 2.0
    	changed inputs to allow simultsaneous read and write
    *)


END_FUNCTION_BLOCK
