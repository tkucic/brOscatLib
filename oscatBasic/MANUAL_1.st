FUNCTION_BLOCK MANUAL_1
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=464*)
    IF NOT MAN THEN
    	Q := IN;
    	STATUS := 100;
    	EDGE_ := FALSE;
    ELSIF NOT S_edge AND SET THEN
    	Q := TRUE;
    	EDGE_ := TRUE;
    	STATUS := 101;
    ELSIF NOT r_edge AND RST THEN
    	Q := FALSE;
    	EDGE_ := TRUE;
    	STATUS := 102;
    ELSIF NOT EDGE_ THEN
    	Q := M_I;
    	STATUS := 103;
    END_IF

    (* remember levels of manual signals *)
    S_edge := SET;
    r_edge := RST;



    (* revision history
    hm	17. jun 2008	rev 1.0
    	original version

    hm	17. oct 2008	rev 1.1
    	deleted unnecessary variable m_edge

    hm	14. mar. 2009	rev 1.2
    	replaced double assignments

    *)
END_FUNCTION_BLOCK
