FUNCTION_BLOCK DEC_8
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=223*)
    X.0 := A0; X.1 := A1; X.2 := A2;

    Q0 := FALSE;
    Q1 := FALSE;
    Q2 := FALSE;
    Q3 := FALSE;
    Q4 := FALSE;
    Q5 := FALSE;
    Q6 := FALSE;
    Q7 := FALSE;

    CASE X OF
    	0 : Q0 := D;
    	1 : Q1 := D;
    	2 : Q2 := D;
    	3 : Q3 := D;
    	4 : Q4 := D;
    	5 : Q5 := D;
    	6 : Q6 := D;
    	7 : Q7 := D;
    END_CASE;



    (* revision history
    hm 3. mar. 2007	rev 1.1
    	rewritten in ST for better compatibility

    hm	26. oct. 2008	rev 1.2
    	code optimized

    hm	28. mar. 2009	rev 1.3
    	replaced multiple assignments
    *)
END_FUNCTION_BLOCK
