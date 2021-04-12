FUNCTION REAL_TO_FRAC
    m[0,0] := 1;
    m[1,0] := 0;
    m[0,1] := 0;
    m[1,1] := 1;

    sign := SIGN_R(X);
    X := ABS(X);
    WHILE ABS(m[1,0]) <= N AND ABS(m[1,1]) <= N DO
    	ai := REAL_TO_DINT(x);
    	t := m[0,0] * ai + m[0,1];
    	m[0,1] := m[0,0];
    	m[0,0] := t;
    	t := m[1,0] * ai + m[1,1];
    	m[1,1] := m[1,0];
    	m[1,0] := t;
    	IF X = DINT_TO_REAL(ai) THEN EXIT; ELSE X := 1.0 / (x - DINT_TO_REAL(ai)); END_IF
    END_WHILE

    (* choose the correct duplet from matrix *)
    IF ABS(m[1,0]) > N THEN
    	REAL_TO_FRAC.NUMERATOR := DINT_TO_INT(ABS(m[0,1]));
    	REAL_TO_FRAC.DENOMINATOR := DINT_TO_INT(ABS(m[1,1]));
    ELSE
    	REAL_TO_FRAC.NUMERATOR := DINT_TO_INT(ABS(m[0,0]));
    	REAL_TO_FRAC.DENOMINATOR := DINT_TO_INT(ABS(m[1,0]));
    END_IF

    (* correct sign if X was negative *)
    IF sign THEN REAL_TO_FRAC.NUMERATOR := -REAL_TO_FRAC.numerator; END_IF

    (*
        }
        startx = x = atof(av[1]);
        maxden = atoi(av[2]);

        /* initialize matrix */
        m[0][0] = m[1][1] = 1;
        m[0][1] = m[1][0] = 0;

        /* loop finding terms until denom gets too big */
        while (m[1][0] *  ( ai = (long)x ) + m[1][1] <= maxden) {
    	long t;
    	t = m[0][0] * ai + m[0][1];
    	m[0][1] = m[0][0];
    	m[0][0] = t;
    	t = m[1][0] * ai + m[1][1];
    	m[1][1] = m[1][0];
    	m[1][0] = t;
            if(x==(double)ai) break;     // AF: division by zero
    	x = 1/(x - (double) ai);
            if(x>(double)0x7FFFFFFF) break;  // AF: representation failure
        } 

        /* now remaining x is between 0 and 1/ai */
        /* approx as either 0 or 1/m where m is max that will fit in maxden */
        /* first try zero */
        printf("%ld/%ld, error = %e\n", m[0][0], m[1][0],
    	   startx - ((double) m[0][0] / (double) m[1][0]));

        /* now try other possibility */
        ai = (maxden - m[1][1]) / m[1][0];
        m[0][0] = m[0][0] * ai + m[0][1];
        m[1][0] = m[1][0] * ai + m[1][1];
        printf("%ld/%ld, error = %e\n", m[0][0], m[1][0],
    	   startx - ((double) m[0][0] / (double) m[1][0]));
    }




    *)

    (* revision history
    hm		19. jan. 2011	rev 1.0
    	original version

    *)
END_FUNCTION
