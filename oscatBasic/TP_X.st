FUNCTION_BLOCK TP_X
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=208*)
    (* read system_time *)
    tx := DWORD_TO_TIME(T_PLC_MS());

    (* risINg edge trigger *)
    IF IN AND NOT edge THEN
    	start := tx;
    	Q := PT > t#0ms;
    ELSIF Q THEN
    	ET := tx - start;
    	IF ET >= PT THEN
    		Q := FALSE;
    		ET := t#0ms;
    	END_IF
    END_IF
    edge := IN;

    (* revision history
    hm	4. aug 2006		rev 1.0
    	origINal version

    hm	17. sep 2007	rev 1.1
    	replaced time() with T_PLC_MS() for compatibility reasons

    hm	19. oct. 2008	rev 1.2
    	renamed to TP_R to TP_X for compatibility reasons

    hm	17. dec. 2008	rev 1.3
    	code oPTimized

    *)
END_FUNCTION_BLOCK