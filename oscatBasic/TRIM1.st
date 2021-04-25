FUNCTION TRIM1
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=181*)
    RETVAL := STR;
    REPEAT
    	pos := FIND(RETVAL,'  ');
    	IF pos > 0 THEN RETVAL := REPLACE(RETVAL,' ',2,pos); END_IF
    UNTIL pos = 0	END_REPEAT
    (* beginning and ending blanks need to be stripped off *)
    IF LEFT(RETVAL,1) = ' ' THEN RETVAL := DELETE(RETVAL,1,1); END_IF
    IF RIGHT(RETVAL,1) = ' ' THEN RETVAL := DELETE(RETVAL,1,LEN(RETVAL)); END_IF
    TRIM1 := TRUE;

    (* revision histroy
    hm	4. feb. 2008    rev 1.0
    	original release

    hm	20. mar. 2008	rev 1.1
    	avoid to call replace with pos = 0 because some systems will produce an error

    hm	29. mar. 2008	rev 1.2
    	changed STRING to STRING(STRING_LENGTH)
    *)
END_FUNCTION
