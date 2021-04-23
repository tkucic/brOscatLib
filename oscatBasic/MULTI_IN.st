FUNCTION MULTI_IN
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=317*)
    F1 :=  IN_1 > IN_MIN AND IN_1 < IN_MAX;
    F2 :=  IN_2 > IN_MIN AND IN_2 < IN_MAX;
    F3 :=  IN_3 > IN_MIN AND IN_3 < IN_MAX;

    CASE MODE OF
    0:	count := 0;
    	IF F1 THEN
    		count := count + 1;
    		MULTI_IN := IN_1;
    	ELSE
    		MULTI_IN := 0.0;
    	END_IF
    	IF F2 THEN
    		count := count + 1;
    		MULTI_IN := MULTI_IN + IN_2;
    	END_IF
    	IF F3 THEN
    		count := count + 1;
    		MULTI_IN := MULTI_IN + IN_3;
    	END_IF
    	MULTI_IN := SEL(count = 0, MULTI_IN / INT_TO_REAL(count), DEFAULT);

    1:	MULTI_IN := SEL(F1, DEFAULT, IN_1);

    2:	MULTI_IN := SEL(F2, DEFAULT, IN_2);

    3:	MULTI_IN := SEL(F3, DEFAULT, IN_3);

    4:	MULTI_IN := DEFAULT;

    5:	MULTI_IN := SEL(F1, IN_MAX, IN_1);
    	IF F2 AND IN_2 < MULTI_IN THEN MULTI_IN := IN_2; END_IF
    	IF F3 AND IN_3 < MULTI_IN THEN MULTI_IN := IN_3; END_IF
    	IF MULTI_IN = IN_MAX THEN MULTI_IN := DEFAULT; END_IF

    6:	MULTI_IN := SEL(F1, IN_MIN, IN_1);
    	IF F2 AND IN_2 > MULTI_IN THEN MULTI_IN := IN_2; END_IF
    	IF F3 AND IN_3 > MULTI_IN THEN MULTI_IN := IN_3; END_IF
    	IF MULTI_IN = IN_MIN THEN MULTI_IN := DEFAULT; END_IF

    7:	IF F1 AND F2 AND F3 THEN MULTI_IN := MID3(IN_1, IN_2, IN_3);
    	ELSIF F1 AND F2 THEN MULTI_IN := MIN(IN_1, IN_2);
    	ELSIF F1 AND F3 THEN MULTI_IN := MIN(IN_1, IN_3);
    	ELSIF F2 AND F3 THEN MULTI_IN := MIN(IN_2, IN_3);
    	ELSIF F1 THEN MULTI_IN := IN_1;
    	ELSIF F2 THEN MULTI_IN := IN_2;
    	ELSIF F3 THEN MULTI_IN := IN_3;
    	ELSE MULTI_IN := DEFAULT;
    	END_IF

    END_CASE

    (*
    hm 1.1.2007		rev 1.1
    	changed midr to mid3 function

    hm	14. 10. 2008	rev 1.2
    	corrected an error for IN_3 overrange detection
    	improved performance

    hm	11. mar. 2009	rev 1.3
    	changed real constants to use dot syntax

    hm	18. jul. 2009	rev 1.4
    	improved performance
    *)
END_FUNCTION
