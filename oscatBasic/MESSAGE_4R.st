FUNCTION_BLOCK MESSAGE_4R
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=173*)
    (* check for rising edge_ on EN *)
    TR := FALSE;
    IF ENQ THEN
    	IF (NOT edge_ AND CLK) OR timer.Q THEN
    			MN := INC1(MN, MM);
    			TR := TRUE;
    			timer(IN := FALSE);
    			CASE MN OF
    				0 : MX := M0;
    				1 : MX := M1;
    				2 : MX := M2;
    				3 : MX := M3;
    			END_CASE
    	END_IF
    	edge_ := CLK;
    	timer( IN := CLK, PT := T1);
    ELSE
    	MX := '';
    	MN := 0;
    END_IF




    (* revision history
    hm	8. oct. 2008	rev 1.0
    	original version

    hm	27. oct. 2008	rev 1.1
    	changed _INC to INC1

    *)

END_FUNCTION_BLOCK
