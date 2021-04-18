FUNCTION CODE
    IF pos < 1 OR pos > LEN(str) THEN
    	CODE := 0;
    	RETURN;
    ELSE
    	PT := ADR(STR) + INT_TO_DWORD(pos - 1);
    	CODE := pt^;
    END_IF

    (* revision history
    hm	9. mar. 2008	rev 1.0
    	original version

    hm	29. mar. 2008	rev 1.1
    	changed STRING to STRING(STRING_LENGTH)
    *)
END_FUNCTION
