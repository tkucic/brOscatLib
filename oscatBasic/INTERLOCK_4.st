FUNCTION_BLOCK INTERLOCK_4
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=462*)
    (* check if enable is active *)
    IF E THEN
    (* reset all vars when there is a MODE change on thy fly *)
    	IF MODE <> lmode THEN
    		OUT := 0;
    		last := 0;
    		old := 0;
    		lmode := MODE;
    	END_IF
    	(* load inputs into in *)
    	in.0 := I0;
    	in.1 := I1;
    	in.2 := I2;
    	in.3 := I3;
    	(* only execute when there is any change *)
    	IF in <> last THEN
    		(* only execute when inputs have chages state *)
    		CASE MODE OF
    			0:	(* output directly display inputs as bits in byte OUT *)
    				OUT := in;

    			1:	(* the input with the highest number will be acepted *)
    				IF in.3 THEN OUT := 8;
    				ELSIF in.2 THEN OUT := 4;
    				ELSIF in.1 THEN OUT := 2;
    				ELSE OUT := in;
    				END_IF

    			2:	(* input last pressed will be displayed only *)
    				last := ((in XOR last) AND in);
    				IF last.3 THEN OUT := 8;
    				ELSIF last.2 THEN OUT := 4;
    				ELSIF last.1 THEN OUT := 2;
    				ELSE OUT := last;
    				END_IF

    			3:	(* any input active will disable all other inputs *)
    				IF (OUT AND in) = 0 THEN
    					IF in.3 THEN OUT := 8;
    					ELSIF in.2 THEN OUT := 4;
    					ELSIF in.1 THEN OUT := 2;
    					ELSE OUT := in;
    					END_IF
    				END_IF

    		END_CASE
    		last := in;
    	END_IF
    	TP := OUT <> old;
    	old := OUT;
    ELSE
    	OUT := 0;
    	last := 0;
    	old := 0;
    	lmode := 0;
    	TP := FALSE;
    END_IF


    (* revision history
    hm	24. oct 2008	rev 1.0
    	original version

    hm	14. mar. 2009	rev 1.1
    	replaced double assignments

    *)
END_FUNCTION_BLOCK
