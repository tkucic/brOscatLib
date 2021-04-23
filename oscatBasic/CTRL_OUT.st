FUNCTION_BLOCK CTRL_OUT
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=381*)
    Y := SEL(MANUAL, CI, MAN_IN) + OFFSET;

    (* LIMit the output *)
    IF Y > LIM_L AND Y < LIM_H THEN
    	LIM := FALSE;
    ELSE
    	Y := LIMIT(LIM_L, Y, LIM_H);
    	LIM := TRUE;
    END_IF



    (* revision history
    hm 	2. jun. 2008 	rev 1.0
    	original version

    hm	5. nov. 2008	rev 1.1
    	optimized code
    *)
END_FUNCTION_BLOCK
