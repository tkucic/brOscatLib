FUNCTION_BLOCK _RMP_B
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=255*)
    (* read system timer *)
    tx := UDINT_TO_TIME(T_PLC_MS());

    IF E AND init AND (DIR = last_dir) AND (BYTE_TO_USINT(RMP) <> SEL(DIR, 0, 255)) AND TR = tn THEN
    	RMP := FRMP_B(start, DIR, tx - tl, TR);
    ELSE
    	init := TRUE;
    	tl := tx;
    	tn := TR;
    	start := RMP;
    END_IF
    last_dir := DIR;



    (* revison history
    hm	22. oct. 2008	rev 1.0
    	original version

    hm	20. nov. 2008	rev 1.1
    	set default for E to be TRUE
    	added init

    hm	19. nov. 2011	rev 1.2
    	new code
    *)
END_FUNCTION_BLOCK
