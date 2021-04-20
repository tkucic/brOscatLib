FUNCTION_BLOCK MATRIX
    TP := FALSE;
    code := 0;
    (* read scan lines *)
    X[line].0 := x1;
    X[line].1 := x2;
    X[line].2 := x3;
    X[line].3 := x4;
    X[line].4 := x5;

    (* compare for change *)
    FOR i := 0 TO 3 DO
    	IF X[i] <> L[i] THEN
    		(* scan line information has changed code need to be found and generated *)
    		temp := X[i] XOR L[i];
    		IF temp.0 THEN
    			code := 1;
    			code.7 := X[i].0;
    			L[i].0 := X[i].0;
    		ELSIF temp.1 THEN
    			code := 2;
    			code.7 := X[i].1;
    			L[i].1 := X[i].1;
    		ELSIF temp.2 THEN
    			code := 3;
    			code.7 := X[i].2;
    			L[i].2 := X[i].2;
    		ELSIF temp.3 THEN
    			code := 4;
    			code.7 := X[i].3;
    			L[i].3 := X[i].3;
    		ELSIF temp.4 THEN
    			code := 5;
    			code.7 := X[i].4;
    			L[i].4 := X[i].4;
    		END_IF
    		TP := TRUE;
    		code.4 := line.0;
    		code.5 := line.1;
    		code.6 := line.2;

    		(* check if release codes need to be killed *)
    		IF NOT Release AND code < 127 THEN
    			code := 0;
    			TP := FALSE;
    		END_IF
    		EXIT;
    	END_IF
    END_FOR

    (* increment scan line every cycle *)
    line := (line + 1) AND 2#0000_0011;
    temp := SHL(BYTE#1,line);
    y1 := temp.0;
    y2 := temp.1;
    y3 := temp.2;
    y4 := temp.3;




    (* revision history
    hm		10.6.2007	rev 1.0		
    	original version 


    hm		11.9.2007	rev 1.1		
    	deleted unused variables k and old_code

    hm		23.12.2007	rev 1.2
    	added exit statement in for loop instead of i:=5

    hm		26. oct. 2008	rev 1.3
    	code optimized

    *)

END_FUNCTION_BLOCK
