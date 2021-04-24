FUNCTION_BLOCK MATRIX
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=227*)
    TP := FALSE;
    CODE := 0;
    (* read scan lines *)
    X[line].0 := X1;
    X[line].1 := X2;
    X[line].2 := X3;
    X[line].3 := X4;
    X[line].4 := X5;

    (* compare for change *)
    FOR i := 0 TO 3 DO
    	IF X[i] <> L[i] THEN
    		(* scan line information has changed CODE need to be found and generated *)
    		temp := X[i] XOR L[i];
    		IF temp.0 THEN
    			CODE := 1;
    			CODE.7 := X[i].0;
    			L[i].0 := X[i].0;
    		ELSIF temp.1 THEN
    			CODE := 2;
    			CODE.7 := X[i].1;
    			L[i].1 := X[i].1;
    		ELSIF temp.2 THEN
    			CODE := 3;
    			CODE.7 := X[i].2;
    			L[i].2 := X[i].2;
    		ELSIF temp.3 THEN
    			CODE := 4;
    			CODE.7 := X[i].3;
    			L[i].3 := X[i].3;
    		ELSIF temp.4 THEN
    			CODE := 5;
    			CODE.7 := X[i].4;
    			L[i].4 := X[i].4;
    		END_IF
    		TP := TRUE;
    		CODE.4 := line.0;
    		CODE.5 := line.1;
    		CODE.6 := line.2;

    		(* check if RELEASE codes need to be killed *)
    		IF NOT RELEASE AND CODE < 127 THEN
    			CODE := 0;
    			TP := FALSE;
    		END_IF
    		EXIT;
    	END_IF
    END_FOR

    (* increment scan line every cycle *)
    line := (line + 1) AND 2#0000_0011;
    temp := SHL(BYTE#1,line);
    Y1 := temp.0;
    Y2 := temp.1;
    Y3 := temp.2;
    Y4 := temp.3;




    (* revision history
    hm		10.6.2007	rev 1.0		
    	original version 


    hm		11.9.2007	rev 1.1		
    	deleted unused variables k and old_code

    hm		23.12.2007	rev 1.2
    	added exit statement in for loop instead of i:=5

    hm		26. oct. 2008	rev 1.3
    	CODE optimized

    *)

END_FUNCTION_BLOCK
