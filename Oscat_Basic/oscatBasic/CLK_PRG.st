FUNCTION_BLOCK CLK_PRG
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=192*)
    (* read system time *)
    tx := DWORD_TO_TIME(T_PLC_MS());

    (* initialize on startup *)
    IF NOT init THEN
    	init := TRUE;
    	last := tx - pt;
    END_IF

    (* generate output pulse when next_pulse is reached *)
    Q := tx - last >= pt;
    IF Q THEN last := tx; END_IF


    (* revision hiostory

    hm 25 feb 2007	rev 1.1
    	rewritten code for higher performance
    	pt can now be changed during runtime

    hm	17. sep 2007	rev 1.2
    	replaced time() with t_plc_ms() for compatibility reasons

    hm	25. oct. 2008	rev 1.3
    	optimized code

    *)
END_FUNCTION_BLOCK