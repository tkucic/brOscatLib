FUNCTION_BLOCK FT_DERIV
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=396*)
    (* read system time *)
    tx := T_PLC_US();
    tc := DWORD_TO_REAL(tx - last);
    last := tx;

    (* INit on first startup *)
    IF NOT INit THEN
    	INit := TRUE;
    	old := IN;
    ELSIF RUN AND tc > 0.0 THEN
    	OUT := (IN - old) / tc * 1000000.0 * K;
    	old := IN;
    ELSE
    	OUT := 0.0;
    END_IF



    (*
    hm 3.1.2007			rev 1.1
    	added INit code for startup
    	set the default for K to 1

    hm	15. sep 2007	rev 1.2
    	replaced Time() with T_PLC_US for compatibility and performance reasons
    	INcreased accuracy and work IN microseconds INternally

    hm 29 oct 2007	rev 1.3
    	prohibit calculation when tx - last = 0 to avoid division by 0 and INcrease accuracy on fast systems

    hm	6. nov. 2008	rev 1.4
    	improved performance

    hm	11. mar. 2009	rev 1.5
    	INproved code
    *)
END_FUNCTION_BLOCK