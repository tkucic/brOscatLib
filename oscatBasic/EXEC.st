FUNCTION EXEC
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=155*)
    (* extract both numbers and operator *)
    TRIM(STR, temp);
    UPPERCASE(temp, RETVAL);

    pos := FINDB_NONUM(RETVAL);
    IF pos > 1 THEN R1 := STRING_TO_REAL(LEFT(RETVAL,pos-1)); END_IF
    R2 := STRING_TO_REAL(RIGHT(RETVAL,LEN(RETVAL)-pos));
    RETVAL := LEFT(RETVAL,pos);
    pos := FINDB_NUM(RETVAL);
    operator := RIGHT(RETVAL,LEN(RETVAL) - pos);
    IF operator = '' AND LEN(STR) = 0 THEN
    	RETVAL := '';
    	RETURN;
    ELSIF operator = '' THEN
    	RETVAL := STR;
    	RETURN;
    END_IF
    IF operator = '' THEN
    	RETVAL := REAL_TO_STRING(EXPT(R1, R2));
    ELSIF operator = 'SQRT' THEN
    	RETVAL := REAL_TO_STRING(SQRT(R2));
    ELSIF operator = 'SIN' THEN
    	RETVAL := REAL_TO_STRING(SIN(R2));
    ELSIF operator = 'COS' THEN
    	RETVAL := REAL_TO_STRING(COS(R2));
    ELSIF operator = 'TAN' THEN
    	RETVAL := REAL_TO_STRING(TAN(R2));
    ELSIF operator = '*' THEN
    	RETVAL := REAL_TO_STRING(R1 * R2);
    ELSIF operator = '/' THEN
    	IF R2 <> 0 THEN RETVAL := REAL_TO_STRING(R1 / R2); ELSE RETVAL := 'ERROR'; END_IF
    ELSIF operator = '+' THEN
    	RETVAL := REAL_TO_STRING(R1 + R2);
    ELSIF operator = '-' THEN
    	RETVAL := REAL_TO_STRING(R1 - R2);
    ELSE
    	RETVAL := 'ERROR';
    END_IF

    IF RETVAL = 'ERROR' THEN
        EXEC := FALSE;
    	RETURN;
    (* some systems deliver integer instead of real *)
    ELSIF FIND(RETVAL,'.') = 0 THEN
    	RETVAL := CONCAT(RETVAL, '.0');
    (* some systems deliver n. instead of n.0 ! *)
    ELSIF RIGHT(RETVAL,1) = '.' THEN
    	RETVAL := CONCAT(RETVAL,'0');
    END_IF
    EXEC := TRUE;

    (* revision history

    hm 	6.feb 2007		rev 1.1
    	cos has to be written in uppercase
    	divide by 0 will return an error

    hm	5. mar. 2008	rev 1.2
    	add a 0 to the string if a '.' is at the end of the string

    hm	20. mar. 2008	rev 1.3
    	make sure the function always returns a real value in the form of x.y

    hm	29. mar. 2008	rev 1.4
    	changed STRING to STRING(STRING_LENGTH)
    *)
END_FUNCTION
