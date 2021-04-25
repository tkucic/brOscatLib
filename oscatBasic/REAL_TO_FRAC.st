FUNCTION REAL_TO_FRAC
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=64*)
    IF X < 0.0 THEN
    	sign := TRUE;								(* Vorzeichen merken *)
    	X := ABS(X);								(* Absolutwert berechnen *)
    END_IF

    REPEAT
    	X_gerundet := REAL_TO_DINT(X);

    	(* Zaehler berechnen *)
    	temp := Numerator * X_gerundet + Numerator_old;		(* Zaehler um Vorkammawert erweitern *)
    	Numerator_old := Numerator;							(* Zaehler der letzten Berechnung speichern *)
    	Numerator := temp;									(* Zaehler dieser Berechnung speichern *)

    	(* Nenner berechnen *)
    	temp := Denominator * X_gerundet + Denominator_old;	(* Nenner um Vorkammawert erweitern *)
    	Denominator_old := Denominator;						(* Nenner der letzten Berechnung speichern *)
    	Denominator := temp;								(* Nenner dieser Berechnung speichern *)

    	(* Restwert berechnen *)
    	X_ohne_Nachkomma := DINT_TO_REAL(X_gerundet);
    	IF X = X_ohne_Nachkomma THEN						(* Bruch geht ohne Rest auf *)
    		IF ABS(Denominator) <= N THEN						(* kein Rundungsfehler *)
    			Numerator_old := Numerator;					(* Numerator_old wird von Funktion zurückgegeben *)
    			Denominator_old := Denominator;			(* Denominator_old wird von Funktion zurückgegeben *)
    		END_IF
    		EXIT;											(* keine weitere Berechnung notwendig *)
    	ELSE
    		X := 1.0 / (X - X_ohne_Nachkomma);				(* Kehrwert vom Rest -> Neuer Bruch *)
    	END_IF

    UNTIL
    	ABS(Denominator) > N
    END_REPEAT

    (* correct sign if X was negative *)
    IF sign THEN
    	RETVAL.NUMERATOR := -1 * ABS(DINT_TO_INT(Numerator_old));
    ELSE
    	RETVAL.NUMERATOR :=  ABS(DINT_TO_INT(Numerator_old));
    END_IF
    RETVAL.DENOMINATOR := ABS(DINT_TO_INT(Denominator_old));
    REAL_TO_FRAC:=TRUE;

    (* revision history
    hm		19. jan. 2011	rev 1.0
    	original version

    ad		06. apr. 2011	rev 1.1
    	optimized code
    *)
END_FUNCTION
