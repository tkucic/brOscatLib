FUNCTION_BLOCK SELECT_8
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=247*)
    IF RST THEN
    	STATE := 0;
    ELSIF SET THEN
    	STATE := IN;
    ELSIF UP AND NOT last_UP THEN
    	STATE := INc(STATE,1,7);
    ELSIF DN AND NOT last_DN THEN
    	STATE := INc(STATE,-1,7);
    END_IF
    last_UP := UP;
    last_DN := DN;

    Q0 := FALSE;
    Q1 := FALSE;
    Q2 := FALSE;
    Q3 := FALSE;
    Q4 := FALSE;
    Q5 := FALSE;
    Q6 := FALSE;
    Q7 := FALSE;

    IF E THEN
    	CASE STATE OF
    		0: Q0 := TRUE;
    		1: Q1 := TRUE;
    		2: Q2 := TRUE;
    		3: Q3 := TRUE;
    		4: Q4 := TRUE;
    		5: Q5 := TRUE;
    		6: Q6 := TRUE;
    		7: Q7 := TRUE;
    	END_CASE
    END_IF

    (* revision history
    hm	16. jan 2008	rev 1.0
    	origINal version

    hm	27. feb. 2009	rev 1.1
    	renamed INput en to e
    *)
END_FUNCTION_BLOCK