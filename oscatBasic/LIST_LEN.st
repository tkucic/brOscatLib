FUNCTION LIST_LEN
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=487*)
    pt ACCESS ADR(LIST);
    LIST_LEN := 0;
    REPEAT
    	c := pt[pos];
    	IF c = SEP THEN LIST_LEN := LIST_LEN + 1; END_IF
    	pos := pos + 1;
    UNTIL
    	c = 0 OR pos > LIST_LENGTH
    END_REPEAT



    (* revision histroy
    hm	25. jun. 2008	rev 1.0
    	original release

    hm	16. oct. 2008	rev 1.1
    	fixed a problem where LIST_LEN would only work up to LIST_LENGTH

    hm	19. jan. 2001	rev 1.2
    	changed string(255) to string(LIST_LENGTH)

    hm	21. mar. 2011	rev 2.0
    	all LIST elements start with SEP

    *)	

END_FUNCTION
