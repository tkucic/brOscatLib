FUNCTION LIST_SORT_L
    sepx := CHR_TO_STRING(sep);
    WHILE list <> '' DO
    	IF list = sepx THEN
    		LIST_SORT_L := CONCAT(sepx, LIST_SORT_L);
    		list := '';
    		RETURN;
    	ELSE
    		element := LIST_RETRIEVE_MIN(SEP,LIST);
    		LIST_SORT_L := CONCAT(LIST_SORT_L, element);
    		LIST_SORT_L := CONCAT(LIST_SORT_L, sepx);
    	END_IF
    END_WHILE
    (* delete the last separation character *)
    LIST_SORT_L := LEFT(LIST_SORT_L, LEN(LIST_SORT_L) - 1);


    (* revision histroy
    hm	23. oct. 2008	rev 1.0
    	original release

    hm	17. dec. 2008	rev 1.1
    	changes name of function chr to chr_to_string

    hm	19. jan. 2011	rev 1.2
    	changed string(255) to string(LIST_LENGTH)

    *)	

END_FUNCTION
