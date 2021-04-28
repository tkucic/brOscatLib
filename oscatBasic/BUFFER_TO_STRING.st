FUNCTION BUFFER_TO_STRING
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=482*)
    ps ACCESS ADR(RETVAL);
    IF SIZE = 0 THEN RETURN; END_IF
    sta := MIN(START, SIZE -1);
    stp := MIN(STOP, SIZE -1);

    (* check for maximum string_length *)
    IF UINT_TO_INT(stp - sta + 1) >= STRING_LENGTH THEN
    	stp := sta + INT_TO_UINT(STRING_LENGTH) - 1;
    END_IF

    FOR i := sta TO stp DO
    	ps := PT[i];
    	ps ACCESS (ADR(ps) + 1);
    END_FOR

    (* terminate the string *)

    ps := 0;
    BUFFER_TO_STRING := TRUE;
    


    (* revision History
    hm 	5. mar. 2008	rev 1.0
    	original version

    hm	16. mar. 2008	rev 1.1
    	changed type of input SIZE to uint

    hm	13. may. 2008	rev 1.2
    	changed type of pointer to array[0..32767]
    	changed SIZE of string to STRING_LENGTH

    hm	12. jun. 2008	rev 1.3
    	check for pointer overrun
    	change input START and STOP to uint
    	added type conversions to avoid warnings under codesys 3.0

    hm	23. mar. 2009	rev 1.4
    	avoid writing to input STOP

    hm	12. nov. 2009 rev 1.5
    	limit START and STOP to SIZE -1

    *)
END_FUNCTION
