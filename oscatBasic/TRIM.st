FUNCTION TRIM
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=181*)
    RETVAL := STR;
    REPEAT
    	pos := FIND(RETVAL,' ');
    	IF pos > 0 THEN RETVAL := REPLACE(RETVAL,'',1,pos); END_IF
    UNTIL pos = 0	END_REPEAT
    TRIM := TRUE;

    (* revision histroy
    hm	6.10.2006		rev 1.0
    	original release

    hm	20. mar. 2008	rev 1.1
    	avoid to call replace with pos = 0 because some systems will produce an error

    hm	29. mar. 2008	rev 1.2
    	changed STRING to STRING(STRING_LENGTH)
    *)
END_FUNCTION
