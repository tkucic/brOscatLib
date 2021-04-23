FUNCTION TIMECHECK
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=141*)
    IF STOP < START THEN
    	TIMECHECK := START <= TD OR TD < STOP;
    ELSE
    	TIMECHECK := START <= TD AND TD < STOP;
    END_IF



    (* revision history
    hm 19. jul. 2009	rev 1.0
    	original release

    *)
END_FUNCTION
