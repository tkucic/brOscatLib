FUNCTION TRIM1
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=181*)
    TRIM1 := STR;
    REPEAT
    	pos := FIND(TRIM1,'  ');
    	IF pos > 0 THEN TRIM1 := REPLACE(TRIM1,' ',2,pos); END_IF
    UNTIL pos = 0	END_REPEAT;
    (* beginning and ending blanks need to be stripped off *)
    IF LEFT(TRIM1,1) = ' ' THEN TRIM1 := DELETE(TRIM1,1,1); END_IF
    IF RIGHT(TRIM1,1) = ' ' THEN TRIM1 := DELETE(TRIM1,1,LEN(TRIM1)); END_IF


    (* revision histroy
    hm	4. feb. 2008    rev 1.0
    	original release

    hm	20. mar. 2008	rev 1.1
    	avoid to call replace with pos = 0 because some systems will produce an error

    hm	29. mar. 2008	rev 1.2
    	changed STRING to STRING(STRING_LENGTH)
    *)
END_FUNCTION
