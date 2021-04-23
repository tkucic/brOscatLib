FUNCTION_BLOCK MANUAL_1
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=464*)
    IF NOT MAN THEN
    	Q := IN;
    	STATUS := 100;
    	edge := FALSE;
    ELSIF NOT s_edge AND SET THEN
    	Q := TRUE;
    	edge := TRUE;
    	STATUS := 101;
    ELSIF NOT r_edge AND RST THEN
    	Q := FALSE;
    	edge := TRUE;
    	STATUS := 102;
    ELSIF NOT edge THEN
    	Q := M_I;
    	STATUS := 103;
    END_IF

    (* remember levels of MANual signals *)
    s_edge := SET;
    r_edge := RST;



    (* revision history
    hm	17. jun 2008	rev 1.0
    	origINal version

    hm	17. oct 2008	rev 1.1
    	deleted unnecessary variable m_edge

    hm	14. mar. 2009	rev 1.2
    	replaced double assignments

    *)
END_FUNCTION_BLOCK
