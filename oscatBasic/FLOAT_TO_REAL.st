FUNCTION FLOAT_TO_REAL
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=160*)
    pt ACCESS ADR(FLT);
    stop := LEN(FLT);

    (* we first check for sign and exit if first number or dot is reached *)
    FOR i := 1 TO stop DO
    	X := pt[i];
        intX := BYTE_TO_USINT(X);
    	IF intX > 47 AND intX < 58 OR intX = 46 THEN
    		EXIT;
    	ELSIF intX = 45 THEN
    		(* code 45 is sign *)
    		sign := -1;
    	END_IF
    END_FOR

    (* now we scan numbers till end or dot or E is reached *)
    FOR i := i TO stop DO
    	X := pt[i];
        intX := BYTE_TO_USINT(X);
    	IF intX = 44 OR intX = 46 OR intX = 69 OR intX = 101 THEN
    		EXIT;
    	(* calculate the value of the digit *)
    	ELSIF intX > 47 AND intX < 58 THEN
    		tmp := tmp * 10 + intX - 48;
    	END_IF
    END_FOR

    (* process the portion after the comma if comma or dot is reached exit if exponent starts *)
    IF X = 44 OR X = 46 THEN
    	FOR i := i + 1 TO stop DO
    		X := pt[i];
            intX := BYTE_TO_USINT(X);
    		IF intX = 69 OR intX = 101 THEN
    			EXIT;
    		ELSIF intX > 47 AND intX < 58 THEN
    			tmp := tmp * 10 + intX - 48;
    			d := d - 1;
    		END_IF
    	END_FOR
    END_IF

    (* process exponent if present *)
    IF intX = 69 OR intX = 101 THEN
    	d := d + DEC_TO_INT(RIGHT(FLT, stop - i));
    END_IF

    FLOAT_TO_REAL :=  EXPN(10, d) * DINT_TO_REAL(tmp * sign);




    (* revision histroy
    hm	22. jun. 2008	rev 1.0
    	original release

    hm	2. oct. 2008	rev 1.1
    	fixed an error, characters 8 and 9 would not be converted

    hm	22. oct. 2008	rev 1.2
    	last fix was not done correctly

    hm	23. oct. 2008	rev 1.3
    	optimzed code
    *)	

END_FUNCTION
