FUNCTION_BLOCK MANUAL_4
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=465*)
    IF man THEN
    	IF NOT TOG THEN
    		Q0 := M0;
    		Q1 := M1;
    		Q2 := M2;
    		Q3 := M3;
    		STATUS := 101;
    	END_IF
    	IF STP AND NOT edge THEN
    		tog := TRUE;
    		CASE pos OF
    			0:	Q0 := TRUE;
    				Q1 := FALSE;
    				Q2 := FALSE;
    				Q3 := FALSE;
    				STATUS := 110;
    			1:	Q0 := FALSE;
    				Q1 := TRUE;
    				Q2 := FALSE;
    				Q3 := FALSE;
    				STATUS := 111;
    			2:	Q0 := FALSE;
    				Q1 := FALSE;
    				Q2 := TRUE;
    				Q3 := FALSE;
    				STATUS := 112;
    			3:	Q0 := FALSE;
    				Q1 := FALSE;
    				Q2 := FALSE;
    				Q3 := TRUE;
    				STATUS := 113;
    		END_CASE
    		pos := INC(pos,1,3);
    	END_IF
    ELSE
    	Q0 := I0;
    	Q1 := I1;
    	Q2 := I2;
    	Q3 := I3;
    	STATUS := 100;
    	tog := FALSE;
    	pos := 0;
    END_IF

    (* remember status of stp *)
    edge := STP;



    (* revision history
    hm	17. jun 2008		rev 1.0
    	original version

    *)
END_FUNCTION_BLOCK
